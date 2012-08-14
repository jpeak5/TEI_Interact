<?php
/**
 * @package TeiInteract 
 */
class TeiInteract_ListController extends Omeka_Controller_Action {

    /**
     * This method probably does too much.
     * Gets a reference to an xml (presumably TEI) file and parses its tags
     * looking for something interesting.
     * Passes all found tags to the view.
     * 
     */
    public function inspectAction() {

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

    }
    
    /**
     * Get all records from the files db table where the mime_browser field = app/xml
     * @TODO This is duplicated in other controllers; perhaps it should be a utility method.
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