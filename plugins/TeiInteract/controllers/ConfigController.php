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
        $teiStuff = $db->getTable('TeiInteractCleanup')->findBySQL('omeka_table_name != ?', array('Item'));
        foreach($teiStuff as $ts){
            
                $next = $db->getTable($ts->omeka_table_name)->find($ts->omeka_table_id);
//                $results[] = $next;
                    if (!in_array($ts->omeka_table_name, $results)) {
                    $results[] = array($ts->omeka_table_name => array($next));
                } else {
                    $results[$ts->omeka_table_name][] = $next;
                }
            
        }
        
        $this->view->results = $results;
        
        $this->view->files = $this->_getFiles();
        if(empty($this->view->files)){
            debug('files array is EMTPY!!!!');
        }        
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
    

        /**
     * Get TEI files from the files table by mime type.
     * @return File|boolean
     */
    private function _getFiles() {
        
        $files = $this->getDb()->getTable('File')->findBySql('mime_browser = ?', array('application/xml'));
        if ($files) {
            debug(sprintf("returning %d files for config controller/browse", count($files)));
            return $files;
        } else {
            return false;
        }
    }
}