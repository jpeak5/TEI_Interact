<?php

/**
 * This class let's us get the contents of the SET column more easily
 * @author jpeak5
 * @package TeiInteract 
 */
class TeiInteractConfigTable extends Omeka_Db_Table {

    public function createItems(){
        debug("hello from config table");
        return $this->findAll();
    }

    /**
     * Apply a set of filters to a Select object based on the parameters 
     * given.
     * 
     * This template method must be implemented by subclasses in order to define
     * search behaviors.
     * 
     * @param Omeka_Db_Select $select
     * @param array $params
     * @return void
     */
    public function applySearchFilters($select, $params) {
        _log('select= '.$select);
        $select->where("file_id = ?", $params);
        _log('select= '.$select);
    }

}

?>
