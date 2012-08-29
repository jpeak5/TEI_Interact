


<?php
require_once("ConfigController.php");
/**
 * Main front-most controller for the TeiInteract plugin
 * @package TeiInteract
 *
 */
class TeiInteract_FilesController extends Omeka_Controller_Action {

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
     * User has requested to browse the available TEI files on the system.
     * Get them and pass them to the view.
     */
    public function browseAction() {

        $records = $this->_getFiles();
        $this->view->records = $records;
    }

    /**
     * Controller for the @link "http://literati.cct.lsu.edu/omeka/admin/tei-interact/tags/browse" action
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
            $nameObjs = $this->_parseNames($xml);
        }

        $this->view->tag = $tag;
        $this->view->tags = $tagElements;
        $this->view->types = $nameObjs;
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

    public function harvestAction() {
        //get the File from the db
        $db = get_db();
        $this->file_id = $this->_getParam('id');
        $file = $db->getTable('File')->find($this->file_id);
        $tagsWeCareAbout = array('//persName', '//geogName', "//name[@type='ship']", "//sourceDesc/bibl/publisher");
        _log("from harvest action handler, we are going to work with file id = " 
                . $this->file_id);


        $path = BASE_DIR . DIRECTORY_SEPARATOR . 'archive' . DIRECTORY_SEPARATOR 
                . $file->getStoragePath('archive');
        $xml = new SimpleXMLElement(file_get_contents($path));
        _log('loading xml from ' . $path);
       
        $uniqueResults = array();
        /**
         * @TODO: this is pretty sloppy and probably going to crash the webserver
         */
        foreach ($tagsWeCareAbout as $xpath) {
            $results = $xml->xpath($xpath);
            $found = array();
            
            //let's try to minimize duplicates everywhere we can
            for($i=0;$i<count($results);$i++){
                if(!in_array((string)$results[$i],$found)){
                    $found[] = (string)$results[$i];
                }else{
                    unset($results[$i]);
                }
            }
            
            foreach ($results as $r) {
                debug('calling _parse');
                $this->_parse($r);
            }
            debug(sprintf("Found %d instances for xpath %s", count($results), $xpath));
        }
//        $count = $this->_createNames($this->_parseNames($xml));
//        $count = $this->_createNames($this->_parseNames($xml));
//        _log("created " . $count . " records for file " . $this->file_id);
        /**
         * @TODO this is a hack; check the docs for a cleaner solution
         * http://framework.zend.com/manual/en/zend.controller.actionhelpers.html
         */
        $this->redirect->gotoURL('tei-interact/config/browse');
    }

    /**
     * Get TEI files from the files table by mime type.
     * @return File|boolean
     */
    private function _getFiles() {
        $db = get_db();
        $files = $db->getTable('File')->findBySql('mime_browser = ?', 
                                                    array('application/xml'));
        if ($files) {
            return $files;
        } else {
            return false;
        }
    }

    private function _normalizeText($string){
        debug("begin normalizeText...". $string);
        $pattern = array("/'s/", "/\s\s/", "/\b\./", "/'\b/","/\b'/");
        $replace = array(""," ", '','','');
        debug(sprintf("cleaning string %s", $string));
        $new = preg_replace($pattern, $replace, $string);
        debug(sprintf("returning cleaned string %s", $new));
        return $new;
    }
    
    private function _checkExists($itemTypeId, $title){
        debug("calling normalize text... for title ".$title);
        $title = $this->_normalizeText($title);
        $tbl = new ElementTable('Element', $this->getDb());
        $dcTitleElement = $tbl->findByElementSetNameAndElementName('Dublin Core', 'Title');
        
        $etTbl = new ElementTextTable('ElementText', $this->getDb());
        $found = $etTbl->findBySQL("element_id = ? AND text = ?", array($dcTitleElement->id, $title));
        debug(sprintf("looking for an element with id %d and text '%s'", $dcTitleElement->id, $title));
        if(!empty($found)){
            foreach($found as $f){
                debug(sprintf('found match for item type id (%d), title (%s) in Element text table id = %d, text = %s',$itemTypeId, $title,$f->id, $f->text));
                $item = $this->getDb()->getTable('Item')->find($f->record_id);
                if($item->item_type_id == $itemTypeId){
                    
                    return true;
                }
            }
        }else{
            return false;
        }
    }
    
    private function _buildRelationTriple($rel){
        
        $relTbl = new ItemRelationsPropertyTable('ItemRelationsProperty', $this->getDb());
        $tbl = $this->getDb()->getTable('ItemRelationsProperty');
        
        $prop = $tbl->findBySql('label = ?', array($rel[1]));
        
        $r = new ItemRelationsItemRelation();
        
        $r->subject_item_id = $rel[0];
        $r->property_id = $prop[0]->id;;
        $r->object_item_id = $rel[2];

        return $r;
    }
    
    /**
     * This method creates relationships for a predefined (hard-coded) set of tags
     * by first matching it against a number of cases.
     * Once the relationships are created, we, cleanup the input string (ie the value of the XML),
     * see if a similarly named item already exists, and if not, we save a new item for the 
     * XML text value
     * 
     * @param SimpleXMLElement $xml
     * @return boolean
     */
    private function _parse(SimpleXMLElement $xml) {
        $tagname = $xml->getName();
        if (!$tagname) {
            debug('FilesController::_parse() - arg \$xml is null, returning false');
            return false;
        }
        $tbl = new ItemTypeTable('ItemType', $this->getDb());
        $itemType = null;
        debug('FilesController::_parse() - entering multiway switch ');
        
        $file = $this->getDb()->getTable('File')->find($this->getRequest()->getParam('id'));
        $relations = array();
        
        switch ($xml->getName()) {
            
            case 'persName':
                $itemType = $tbl->findByName(TeiInteract::CHARACTER_TYPE);
                
                $relations[] = $this->_buildRelationTriple(
                    array($file->item_id,'Story has Character',null)
                        );
                $relations[] = $this->_buildRelationTriple(
                    array(null,'Character Belongs to Story',$file->item_id)
                        );
                break;

            case 'geogName':
                $itemType = $tbl->findByName(TeiInteract::PLACE_TYPE);
                
                $relations[] = $this->_buildRelationTriple(
                    array($file->item_id,'Has Setting',null)
                        );
                $relations[] = $this->_buildRelationTriple(
                    array(null,'is Setting Of',$file->item_id)
                        );
                break;
            
            
            /**
             * @TODO name is a really generic tag with many attributes 
             * and will likely require a dedicated method to oparse it
             */
            case 'name': 
                foreach ($xml[0]->attributes() as $key => $val) {
                    if ($key == 'type') {
                        if ($val == 'ship') {
                            $itemType = $tbl->findByName(TeiInteract::SHIP_TYPE);
                        }
                    }
                }
//                $itemTypeId = $tbl->findByName(TeiInteract::CHARACTER_TYPE);
                debug('FilesController::_parse() - multiway switch - case = name');
                break;
            
            case 'publisher':
                $itemType = $tbl->findByName(TeiInteract::PUBLISHER_TYPE);
                
                $relations[] = $this->_buildRelationTriple(
                    array(null,'Published',$file->item_id)
                        );
                $relations[] = $this->_buildRelationTriple(
                    array($file->item_id,'Publisher',null)
                        );

                break;

            default:
                debug('FilesController::_parse() - taking default case in mwy switch    ');
                break;


        }
                $title = $this->_normalizeText(trim((string) $xml[0]));
                
                //if the item exists, break out of here....
                if($this->_checkExists($itemType->id, $title)){
                    return;
                }
                
                $item = insert_item(array(
                    'public' => false,
                    'item_type_id' => $itemType->id
                        ), array(
                    'Dublin Core' => array(
                        'Title' => array(
                            array('text' => $title, 'html' => 'false')
                        )
                    ),
                    'TEI Interact' => array(
                        'TEI Tag' => array(
                            array('text' => $title, 'html' => 'false')
                        ),
                        'TEI Element' => array(
                            array('text' => $tagname, 'html' => 'false')
                        )
                    )
                        )
                );
                
                $this->_saveRelations($relations, $item);

                debug('FilesController::_parse() - leaving method       ');
                TeiInteract_ConfigController::saveCleanupData('Item', $item->id);

        return true;
    }

    /**
     * for each relation created in the _parse method, add a reference to the item in question 
     * in whichever field is empty (subject or object);
     * But First! check to see if a dupe exists
     * 
     * @param array $relations new relations objects
     * @param type $item the item to/from which we are creating a relation
     */
    private function _saveRelations($relations, $item) {
        foreach ($relations as $r) {
            
//            debug(sprintf("from _save, relation type is %s, obj_id = %d",
//                gettype($r), 
//                $r->object_item_id
//                )
//            );
            $tbl = new ItemRelationsItemRelationTable('ItemRelationsItemRelation', $this->getDb());
            if (is_null($r->object_item_id)) {
                $r->object_item_id = $item->id;
            } elseif (is_null($r->subject_item_id)) {
                $r->subject_item_id = $item->id;
            }

            $matches = $tbl->findByObjectItemId($r->object_item_id);
            $flag = false; //set to true if we find that an identical relationship already exists
            foreach ($matches as $match) {
                if ($match->subject_item_id == $r->subject_item_id) {
                    $flag = true; //duplicate found; exit;
                    break;
                }
            }
            if (!$flag) {
                $r->save();
                TeiInteract_ConfigController::saveCleanupData('ItemRelationsItemRelation', $r->id);
            }
        }
    }
    
    
    

    private function _createNames($names) {
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

    private static function _namesDiffer(TeiInteractName $n1, TeiInteractName $n2) {
        $mismatch = 0;
        $mismatch += $type = ($n1->type == $n2->type) ? 0 : 1;
        $mismatch += $teiHeader = ($n1->teiHeader == $n2->teiHeader) ? 0 : 1;
        $mismatch += $value = ($n1->value == $n2->value) ? 0 : 1;
        $mismatch += $file = ($n1->file_id == $n2->file_id) ? 0 : 1;
        return $mismatch;
    }

}