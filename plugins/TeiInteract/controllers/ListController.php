<?php
/**
 * @package TeiInteract 
 */
class TeiInteract_ListController extends Omeka_Controller_Action {

    public function inspectAction() {
//        $db = get_db();
//        $currentPage = $this->_getParam('page', 1);

        $db = get_db();
        $id = $this->_getParam('id');
        $file = $db->getTable('File')->find($id);
        $this->view->id = $file_id;



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