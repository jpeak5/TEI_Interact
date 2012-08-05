<?php

/**
 * Description of TagsController
 *
 * @author jpeak5
 */
class TeiInteract_TagsController extends Omeka_Controller_Action {
    //put your code here
    
    
    public function browseAction(){
        
        //get the File from the db
        $db = get_db();
        $tag = $this->_getParam('tag');
        $id = $this->_getParam('id');
        $section = $this->_getParam('section');
        
        $file = $db->getTable('File')->find($id);
        $this->view->id = $file_id;
        
        $tags = array();
        $xml = new DOMDocument();
        $path = BASE_DIR . DIRECTORY_SEPARATOR . 'archive' . DIRECTORY_SEPARATOR . $file->getStoragePath('archive');
        _log('attempting to load xml from ' . $path);
        $xml->loadXML(file_get_contents($path));
        $domSection = $xml->getElementsByTagName($section);
        $tagElements = $domSection->item(0)->getElementsByTagName($tag);
        
        $this->view->tag = $tag;
        $this->view->tags = $tagElements;
        
    }
}

?>
