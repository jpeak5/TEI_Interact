<?php
/**
 * This class encapsulates functionality for responding to AJAX-type requests from the user
 * @package TeiInteract 
 * 
 */
class TeiInteract_ServicesController extends Omeka_Controller_Action {

    public function lookupAction(){
        $searchStr = teiInteract_normalizeText($this->getRequest()->getParam('hover'));
        debug(sprintf("user mouse is hovering over TEI tag with value %s", $searchStr));
        $el = $this->getRequest()->getParam('element');
        $this->view->search = $searchStr;
        $this->view->element = $el;
        $this->view->type = $this->getRequest()->getParam('type');
        
        
        $items = teiInteract_getItemByDCTitle($searchStr);
        debug(sprintf("lookupAction() - found %d matches; first found match ID = %d",count($items),$items[0]->id));
        
        $tbl = new ItemRelationsItemRelationTable('ItemRelationsItemRelation',$this->getDb());
        
        $subjects = array(); //where the searchStr item is subject
        $objects = array(); //where the searchStr item is object
        
        foreach($items as $item){ //ElementText
            $subjects = array_merge($subjects, $tbl->findBySubjectItemId($item->record_id));
            $objects = array_merge($objects, $tbl->findByObjectItemId($item->record_id));
            
            debug(sprintf("found %d matches in the relations table for item id = %d",count($subjects)+count($objects),$item->record_id));
        }
        
        $related = array(
            'object' => array(),
            'subject' => array()
        );
        
        $itemTable = $this->getDb()->getTable('Item');
        $irpTable = $this->getDb()->getTable('ItemRelationsProperty');
        
        foreach($objects as $object){//ItemRelations
            $item = $itemTable->find($object->subject_item_id);
            $relation = $irpTable->find($object->property_id)->label;
            $related['subject'] = array($relation => $item);
        }
        foreach($subjects as $subject){//ItemRelations
            $item = $itemTable->find($subject->object_item_id);
            $relation = $irpTable->find($subject->property_id)->label;
            $related['object'] = array($relation => $item);
        }
        
        $this->view->related = $related;
        
        
        
        
        
    }
}

?>
