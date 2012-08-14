<?php
/**
 * @package TeiInteract 
 */
class TeiInteract_ConfigController extends Omeka_Controller_Action {

    public function browseAction() {
//        $db = get_db();
//        $currentPage = $this->_getParam('page', 1);
//    	$this->view->entries =  TeiDisplay_Config::getConfig($currentPage);
        $this->view->message = "hello World!";

//        $this->view->files = $this->getTeiFiles();
        $records = $this->getTeiFiles();
        debug("found ".count($records)." files");

        $this->view->records = $records;

//        /**
//         * Now process the pagination
//         * 
//         * */
//        $paginationUrl = $this->getRequest()->getBaseUrl() . '/config/browse/';
//
//        //Serve up the pagination
//        $pagination = array('page' => $currentPage,
//            'per_page' => 20,
//            'total_results' => $count,
//            'link' => $paginationUrl);
//
//        Zend_Registry::set('pagination', $pagination);
    }

    private function getTeiFiles() {
        $db = get_db();
        $files = $db->getTable('File')->findBySql('mime_browser = ?', array('application/xml'));
        if ($files) {
            return $files;
        } else {
            return false;
        }

//        $xp = new XsltProcessor();
//        $xp->registerPHPFunctions();
//        $xp->importStylesheet('libraries' . DIRECTORY_SEPARATOR . 'teiInteract_default.xsl');
//        if (file_put_contents('files' . DIRECTORY_SEPARATOR . 'output.txt', $xp->transformToXml($dom))) {
//            debug("file written");
//        } else {
//            debug('file write failure');
//        }
    }

}