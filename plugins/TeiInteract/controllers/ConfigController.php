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

        $db = $this->getDb();
        $table = $db->getTable('TeiInteractConfig');
        $results = "";
        $results = $table->findAll();
        $this->view->results = $results;
    }

    public function deleteAction() {
        $itemType->delete();
        $elSet->delete();
    }

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
 
            if (($el = $tbl->findBySql("'name' = ? AND 'description' = ?", 
                                    array(
                                        $element['name'], 
                                        $element['description']
                                        )
                                    )==null)){
                $el = new Element();
                _log("creating new element");
                $el->record_type_id = $element["record_type_id"];
                $el->data_type_id = $element["data_type_id"];
                $el->name = $element["name"];
                $el->description = $element["description"];
                $el->element_set_id = $element["element_set_id"];

//        $el->element_set_id = $elSet->id;
                $el->save();
            }
        }
        return "Elements saved";
    }

    public function createItemsAction() {
        insert_item(array(
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
    }

    public function buildItemTypes() {
//        $itemType = insert_item_type("TEI Auto");
//        $itemType->description = "item created programmatically by the TEI Interact plugin";
//        $itemType->save();
    }

}