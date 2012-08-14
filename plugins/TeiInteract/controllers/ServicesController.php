<?php
/**
 * @package TeiInteract 
 * This class encapsulates functionality for responding to AJAX-type requests from the user
 */
class TeiInteract_ServicesController extends Omeka_Controller_Action {

    /**
     * Find all matches in the DB for the request query string param 'hover'.
     * Pass those to the view, which feeds some jQuery listeners in the client page
     */
    public function namesAction() {
        $searchStr = $this->getRequest()->getParam('hover');

        $this->view->hello = "Hello World!";

        $db = get_db();
        $namesTable = $db->getTable('TeiInteractName');

        $occurrences = array();
        $result = $namesTable->findSimilarNames($searchStr);
        if ($result) {
            $i=0;
            foreach ($result as $name) {
                $fid = (string) $name->file_id;
                debug("\$fid = ".$fid);
                if (!array_key_exists($fid, $occurrences)) {
                    $occurrences[$fid] = array('count' => 1);
                    debug('adding count for ' . $name->file_id.", \$occurrences count = ".$occurrences[$fid]['count']);
//                    debug(print_r($i.$occurrences)."<br/>");
                } else {
                    $occurrences[$fid]['count']++;
                    debug('incrementing count for ' . $name->file_id);
                }
                $i++;
            }
            debug("looped ".$i." times...");
        }


        $this->view->occurrences = $occurrences;
        $this->view->searchStr = $searchStr;
    }

}

?>
