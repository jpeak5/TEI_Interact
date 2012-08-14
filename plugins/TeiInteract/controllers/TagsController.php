<?php

/**
 * lookup and display the text for tags categorized by type
 *
 * @author jpeak5
 * @package TeiInteract 
 */
class TeiInteract_TagsController extends Omeka_Controller_Action {

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
    public function browseAction() {

        //get the File from the db
        $db = get_db();
        $tag = $this->_getParam('tag');
        $this->file_id = $this->_getParam('id');
        $section = $this->_getParam('section');

        $file = $db->getTable('File')->find($this->file_id);
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
            $types = $this->getNames($xml);
        }

        $this->view->tag = $tag;
        $this->view->tags = $tagElements;
        $this->view->types = $types;
    }

    /**
     * 
     * @param SimpleXMLElement $xml
     * @return string
     */
    private function getNames(SimpleXMLElement $xml) {

        debug('begin getNames SimpleXML routine');
        $types = array('untyped' => array());
        $nameAncestors = array('text', 'teiHeader');

        foreach ($nameAncestors as $ancestor) {
            foreach ($xml->xpath("{$ancestor}//name") as $name) {
                if (strlen($name) > 0) {

                    if ($name['type']) {
                        $typeName = (String) $name['type'];

                        if (!array_key_exists($typeName, $types)) {

                            $types[$typeName] = array();
                        }
                    } else {
                        $typeName = 'untyped';
                    }
                    if (!array_key_exists((string) $name, $types[$typeName])) {
                        $types[$typeName][(string) $name] = array('count' => 1, 'ancestor' => $ancestor);
                    } else {
                        $types[$typeName][(string) $name]['count']++;
//                    if ($this->debug)debug("duplicate entry, updating the counter");
                    }
                }
            }




            foreach ($types as $type => $values) {
//                   if ($this->debug) debug("----Type = " . $type);


                foreach ($values as $name => $attrs) {

                    $record = new TeiInteractName();
                    $record->file_id = (int) $this->file_id;
                    $record->type = $type;
                    $record->value = $name;
                    if ($record->value == null) {
                        debug('yikes, no value here!');
                    }
                    $record->teiHeader = $attrs['ancestor'] == 'text' ? 0 : 1;
                    $record->occurrenceCount = $attrs['count'];
                    $record->_validate();
                    $db = get_db();
                    $table = $db->getTable('TeiInteractName');
                    $exists = $table->recordExists($record->file_id, $record->value, $record->type);
                    if (!$exists) {
//                        debug('record exists ?'.$exists);
//                if ($this->debug)debug("attempt to save record with values: " . $record->file_id . $record->type . $record->value . $record->teiHeader);
                        if ($record->save()) {
//                    if ($this->debug) debug("record save success");
                            $this->flashSuccess("name instances saved to db");
                        } else {
                            if ($record->hasErrors()) {
                                debug('record has ERRORS');
                            }

                            if ($this->debug)
                                debug("record save FAIL!");
                        }
                    }else {
//                        debug('record already exists(id=' . $exists->id . '): not saving duplicate record');
                    }
//                    if ($this->debug) debug("-----------" . $name . " count= " . $attrs['count']);
                }
            }
        }

        return $types;
    }

}

?>
