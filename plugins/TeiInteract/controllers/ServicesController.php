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
        
        debug('calling new static help for triple');
        $this->view->tripleSet = TeiInteract_TripleSet::getTriplesSetForTitle($searchStr);
        
    }
}

?>
