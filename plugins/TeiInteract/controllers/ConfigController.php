<?php

/**
 * Main front-most controller for the TeiInteract plugin
 * @package TeiInteract
 * 
 */
class TeiInteract_ConfigController extends Omeka_Controller_Action {

    /**
     * User has requested to browse the available TEI files on the system.
     * Get them and pass them to the view.
     */
    public function browseAction() {
        $results = array();
        $db = $this->getDb();
        $teiStuff = $db->getTable('TeiInteractCleanup')->findAll();
        foreach($teiStuff as $ts){
            
                $next = $db->getTable($ts->omeka_table_name)->find($ts->omeka_table_id);
//                $results[] = $next;
                if (!in_array($results, $ts->omeka_table_name)) {
                    $results[] = array($ts->omeka_table_name => array($next));
                } else {
                    $results[$ts->omeka_table_name][] = $next;
                }
            
        }
        
        $this->view->results = $results;
    }

//    public function deleteAction() {
//        $itemType->delete();
//        $elSet->delete();
//    }

    public function createElementSetsAction() {

        //playing around with getting an element set...
        $elSets = array("TEI Interact");
        $tbl = $this->getDb()->getTable('ElementSet');
        $elSet = null;
        $alreadyCreated = 4;
        foreach ($elSets as $es) {
            if (($elSet = $tbl->findByName($es)) == null) {
                $elSet = insert_element_set($es);
                $elSet->record_type_id = 2;
                $elSet->description = "Elements used to describe items auto-created by the TEI Interact plugin";
                $elSet->save();
                _log("browsing for element set id... " . $elSet->id);
                $alreadyCreated = 1;
                
                TeiInteract_ConfigController::saveCleanupData('ElementSet', $elSet->id);

            }
        }
        
        $result = $this->createElements($elSet->id);
        
        $message = $alreadyCreated == 4 ? " already exists in the DB!" : " created in the DB";
        $this->flash($result." Element set '" . $es . "', with ID ". $elSet->id . $message, $alreadyCreated);
        /**
         * @TODO this is a hack; check the docs for a cleaner solution
         * http://framework.zend.com/manual/en/zend.controller.actionhelpers.html
         */
        $this->redirect->gotoURL('tei-interact/config');
    }

    public function createElements($elementSet) {
        $tbl = $this->getDb()->getTable('Element');
        $elements = array(
                        array(
                            "name" => 'tei-type',
                            "description" => 'TEI type element',
                            "record_type_id" => 2,
                            "data_type_id" => 1,
                            "element_set_id" => $elementSet
                            )
                        );
        foreach($elements as $element) {
            $el = null;
            if (($el = $tbl->findBySql("'name' = ?", 
                                    array(
                                        $element['name'], 
//                                        $element['description']
                                        )
                                    )==null)){
                $el = new Element();
                _log("creating new element");
                $el->record_type_id = $element["record_type_id"];
                $el->data_type_id = $element["data_type_id"];
                $el->name = $element["name"];
                $el->description = $element["description"];
                $el->element_set_id = $element["element_set_id"];
                $el->save();

                $this->view->el = $el;
//                debug('type of el = '.  gettype($el));
//                debug('name '.$el->name);
//                debug('description '.$el->description);
//                debug('id '.$el->id);
//                debug('exists ? '.$el->exists());
//                debug("just finished save, insert id = ".$el->id);

                TeiInteract_ConfigController::saveCleanupData('Element', $el->id);
            }
        }
        
        return "Elements saved";
    }

    public function createItemsAction() {
        $item = insert_item(array(
            'public' => true,
            'item_type_id' => 16
                ), array(
            'Dublin Core' => array(
                'Title' => array(
                    array('text' => 'My TEI Test Item', 'html' => 'false')
                )
            ),
            'TEI Interact' => array(
                'tei-type' => array(
                    array('text' => 'testing123', 'html' => 'false')
                )
            )
                )
        );
        
        TeiInteract_ConfigController::saveCleanupData('Item', $item->id);
                /**
         * @TODO this is a hack; check the docs for a cleaner solution
         * http://framework.zend.com/manual/en/zend.controller.actionhelpers.html
         */
        $this->redirect->gotoURL('tei-interact/config');
    }

    public function buildItemTypeAction() {
        $itemType = insert_item_type(array('name'=>"TEI Auto",
                                    'description' => 'item created programmatically by the TEI Interact plugin' 
                                    )
                );
        
        
        debug('got here!');
        TeiInteract_ConfigController::saveCleanupData('ItemType', $itemType->id);
        /**
         * @TODO this is a hack; check the docs for a cleaner solution
         * http://framework.zend.com/manual/en/zend.controller.actionhelpers.html
         */
        $this->redirect->gotoURL('tei-interact/config');
    }

    public static function saveCleanupData($omeka_table_name, $omeka_table_id){
                        //store id for later cleanup 
                $cln = new TeiInteractCleanup();
                $cln->omeka_table_id = $omeka_table_id;
                $cln->omeka_table_name = $omeka_table_name;
                $cln->save();
                _log("storing cleanup data");
    }
    
    public function deleteAction(){
        $errors = array();
        $records = $this->getDb()->getTable('TeiInteractCleanup')->findAll();
        foreach($records as $record){
            $tbl = $this->getDb()->getTable($record->omeka_table_name);
            $toDelete = $tbl->find($record->omeka_table_id);
            if(empty($toDelete)){
                $errors[] = $record;
            }else{
            debug("Deleting from ".$record->omeka_table_name.", ID ".$record->omeka_table_id);
            
                $toDelete->delete();
                debug('delete success, now removing cleanup record, id '.$record->id);
                $record->delete();
            }
        }
//            $this->view->deleteErrors = $errors;
        $message ="";    
        if(count($errors) > 0) {
            foreach ($errors as $error) {
                $message.="Error processing cleanup record ".$error->id;
                $message.="<br/>    for Table ".$error->omeka_table_name.", ID ".$error->omeka_table_id;
                $message.="<br/>        **Will attempt to delete from cleanup table**";
                $error->delete();
                debug($message);
            }
            $this->flash($message, 5);
        } else {
            $this->flash("deletions successful", 1);
        }
            
         /**
         * @TODO this is a hack; check the docs for a cleaner solution
         * http://framework.zend.com/manual/en/zend.controller.actionhelpers.html
         */
        $this->redirect->gotoURL('tei-interact/config');
    }
    
}