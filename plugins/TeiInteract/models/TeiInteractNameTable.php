<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TeiInteractNamesTable
 *
 * @author jpeak5
 */
class TeiInteractNameTable extends Omeka_Db_Table {

    public function recordExists($file_id, $value, $type) {
        $result = $this->findBySql("value = ? AND file_id = ? AND type = ?",array($value, $file_id, $type));
        if (count($result) == 1) {
            return array_shift($result);
        }
        return false;
    }

}

?>
