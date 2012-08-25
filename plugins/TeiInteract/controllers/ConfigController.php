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







    public static function saveCleanupData($omeka_table_name, $omeka_table_id){
                        //store id for later cleanup 
                $cln = new TeiInteractCleanup();
                $cln->omeka_table_id = $omeka_table_id;
                $cln->omeka_table_name = $omeka_table_name;
                $cln->save();
                _log("storing cleanup data");
    }
    

    
}