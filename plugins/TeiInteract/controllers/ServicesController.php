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
        $this->view->result = "hello world";
    }
}

?>
