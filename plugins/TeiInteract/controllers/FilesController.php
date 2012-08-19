<?php

/**
 * Main front-most controller for the TeiInteract plugin
 * @package TeiInteract
 * 
 */
class TeiInteract_FilesController extends Omeka_Controller_Action {

    /**
     * User has requested to browse the available TEI files on the system.
     * Get them and pass them to the view.
     */
    public function browseAction() {

        $records = $this->getTeiFiles();
        debug("found " . count($records) . " files");

        $this->view->records = $records;
    }

    /**
     * Get TEI files from the files table by mime type.
     * @return File|boolean
     */
    private function getTeiFiles() {
        $db = get_db();
        $files = $db->getTable('File')->findBySql('mime_browser = ?', array('application/xml'));
        if ($files) {
            return $files;
        } else {
            return false;
        }
    }
    


    /**
     * 
     * @var boolean Whether or not to output debug messages from this class
     */
    private $debug = true;

    /**
     *
     * @var int id of a file in the files db table
     */
    public $file_id;

    /**
     * Cotnroller for the @link "http://literati.cct.lsu.edu/omeka/admin/tei-interact/tags/browse" action
     * required arguments in the query string are 
     * @var string $tag - the tag name that we are working with...name, for instance
     * @var int $id - the file id that we are concerned with; must correspond to a file in the files table
     * @var string $section - whether this is in the TEI Header or not
     */
    public function tagAction() {

        //get the File from the db
        $db = get_db();
        $this->file_id = $this->_getParam('id');
        $file = $db->getTable('File')->find($this->file_id);

        $tag = $this->_getParam('tag');
        $section = $this->_getParam('section');


        $this->view->file_id = $file_id;



        $tags = array();
        $xml = new DOMDocument();
        $path = BASE_DIR . DIRECTORY_SEPARATOR . 'archive' . DIRECTORY_SEPARATOR . $file->getStoragePath('archive');
        _log('loading xml from ' . $path);
        $xml->loadXML(file_get_contents($path));
        $domSection = $xml->getElementsByTagName($section);
        $tagElements = $domSection->item(0)->getElementsByTagName($tag);

        if ($tag == 'name') {
            $xml = new SimpleXMLElement(file_get_contents($path));
            $nameObjs = $this->parseNames($xml);
        }

        $this->view->tag = $tag;
        $this->view->tags = $tagElements;
        $this->view->types = $nameObjs;
    }

    /**
     * 
     * @param SimpleXMLElement $xml
     * @return TeiInteractName[]
     */
    private function parseNames(SimpleXMLElement $xml) {

        debug('begin getNames SimpleXML routine');
        $types = array('untyped' => array());
        $sections = array('text', 'teiHeader');
        $nameObjs = array();

        foreach ($sections as $section) {
            foreach ($xml->xpath("{$section}//name") as $name) {
                if (strlen($name) > 0) {
                    $nameObj = new TeiInteractName();
                    $nameObj->value = $name;
                    $nameObj->file_id = $this->file_id;
                    $nameObj->teiHeader = $section == 'teiHeader' ? 1 : 0;

                    if ($name['type']) {
                        $nameObj->type = (String) $name['type'];

                        if (!array_key_exists($nameObj->type, $types)) {

                            $types[$nameObj->type] = array();
                        }
                    } else {
                        $nameObj->type = 'untyped';
                    }
//clean up the text, accounting for possesive forms...
                    if (substr($nameObj->value, strlen($nameObj->value) - 2) == "'s") {
                        $clnName = substr($nameObj->value, 0, strlen($nameObj->value) - 2);
                        _log("cleaning " . $nameObj->value . " to " . $clnName);
                        $nameObj->value = $clnName;
                    }

                    if (!array_key_exists($nameObj->value, $types[$nameObj->type])) {
                        $nameObjs[] = $nameObj;
                    } else {
                        foreach ($nameObjs as $no) {
                            if (!namesDiffer($nameObj, $no)) {
                                $no->occurrenceCount++;
                            }
                        }

//                    if ($this->debug)debug("duplicate entry, updating the counter");
                    }
                }
            }
        }
        return $nameObjs;
    }

    private function createNames($names) {
        $db = get_db();
        $table = $db->getTable('TeiInteractName');
        $count = 0;

        foreach ($names as $name) {

            if ($name->value == null) {
                debug('yikes, no value here!');
            }

            $name->_validate();


            if (!$table->recordExists($name->file_id, $name->value, $name->type)) {
                if ($name->save()) {
                    $this->flashSuccess("name instances saved to db");
                    $count++;
                } else {
                    if ($name->hasErrors()) {
                        debug('record has ERRORS');
                    }

                    if ($this->debug)
                        debug("record save FAIL!");
                }
            }else {
//                        debug('record already exists(id=' . $exists->id . '): not saving duplicate record');
            }
        }
        return $count;
    }

    private static function namesDiffer(TeiInteractName $n1, TeiInteractName $n2) {
        $mismatch = 0;
        $mismatch += $type = ($n1->type == $n2->type) ? 0 : 1;
        $mismatch += $teiHeader = ($n1->teiHeader == $n2->teiHeader) ? 0 : 1;
        $mismatch += $value = ($n1->value == $n2->value) ? 0 : 1;
        $mismatch += $file = ($n1->file_id == $n2->file_id) ? 0 : 1;
        return $mismatch;
    }

    public function harvestAction() {
        //get the File from the db
        $db = get_db();
        $this->file_id = $this->_getParam('id');
        $file = $db->getTable('File')->find($this->file_id);
        _log("from harvest action handler, we are going to work with file id = " . $this->file_id);


        $path = BASE_DIR . DIRECTORY_SEPARATOR . 'archive' . DIRECTORY_SEPARATOR . $file->getStoragePath('archive');
        $xml = new SimpleXMLElement(file_get_contents($path));
        _log('loading xml from ' . $path);

        $count = $this->createNames($this->parseNames($xml));
        _log("created " . $count . " records for file " . $this->file_id);
        /**
         * @TODO this is a hack; check the docs for a cleaner solution
         * http://framework.zend.com/manual/en/zend.controller.actionhelpers.html
         */
        $this->redirect->gotoURL('tei-interact/list/inspect?id=' . $this->file_id);
    }

    /**
     * This method probably does too much.
     * Gets a reference to an xml (presumably TEI) file and parses its tags
     * looking for something interesting.
     * Passes all found tags to the view.
     * 
     */
    public function tagsAction() {

        $db = get_db();

        $id = $this->_getParam('id');
        $file = $db->getTable('File')->find($id);
        $this->view->id = $id;

        $table = $db->getTable('TeiInteractName');
        $this->view->dbCount = $table->fileRecordsExist($id);

        $tags = array();
        $xml = new DOMDocument();
        $path = BASE_DIR . DIRECTORY_SEPARATOR . 'archive' . DIRECTORY_SEPARATOR . $file->getStoragePath('archive');
        _log('attempting to load xml from ' . $path);
        $xml->loadXML(file_get_contents($path));
//            $elements = $xml->getElementsByTagName('*');
        $headList = $xml->getElementsByTagName('teiHeader');
        if ($headList->length !== 1) {
            debug("too many teiHeader nodes in the document");
        } else {
            $head = $headList->item(0);
            debug("shifting one node out of NodeList");
        }

        $textList = $xml->getElementsByTagName('text');
        if ($textList->length !== 1) {
            debug("too many teiHeader nodes in the document");
        } else {
            $text = $textList->item(0);
            debug("shifting one node out of NodeList");
            debug("\$text class is " . get_class($text));
        }

        $headElements = $head->getElementsByTagName('*');
        $textElements = $text->getElementsByTagName('*');

        $tags = array('head' => array(), 'text' => array());


        foreach ($headElements as $element) {
            if (!in_array($element->nodeName, $tags['head'])) {
                $tags['head'][] = $element->nodeName;
//                _log("found element " . $element->nodeName);
            }
        }
        foreach ($textElements as $element) {
            if (!in_array($element->nodeName, $tags['text'])) {
                $tags['text'][] = $element->nodeName;
//                _log("found element " . $element->nodeName);
            }
        }
        debug("text tags count = " . count($tags['text']));
        debug("head tags count = " . count($tags['head']));
        $record = array('file' => $file, 'tags' => $tags);

        $this->view->record = $record;
    }



}