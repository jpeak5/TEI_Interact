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

        $records = $this->getTeiFiles();
        debug("found ".count($records)." files");

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

}