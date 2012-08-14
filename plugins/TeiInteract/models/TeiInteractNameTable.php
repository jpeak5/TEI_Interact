<?php

/**
 * subclassing Omeka_Db_Table in order
 *  to create som ecustom queries beyond those
 * available in the Omeka_Record
 *
 * @author jpeak5
 * @package TeiInteract 
 */
class TeiInteractNameTable extends Omeka_Db_Table {

    /**
     * when parsing a file, we don't want to insert duplicate entries in tha table
     * this utility method checks for the existence of an entity on a per-file basis
     * 
     * @param int $file_id id key for the files table
     * @param string $value value of the entry against which to match
     * @param string $type the type of the name; 
     * these correlate to the 'type' attribute values allowed for the <name/> element
     * @return boolean
     */
    public function recordExists($file_id, $value, $type) {
        $result = $this->findBySql("value = ? AND file_id = ? AND type = ?",array($value, $file_id, $type));
        if (count($result) == 1) {
            return array_shift($result);
        }
        return false;
    }
    
    
    /**
     * Search our names table for similar values
     * @param string $searchStr this will be compared against the 'value' field
     * @return TeiInteractName|boolean
     */
    public function findSimilarNames($searchStr){
        debug('begin findSimilarNames');
        $searchStr = "%".$searchStr."%";
        $result = $this->findBySQL("value like ?", array($searchStr));
        
        return !empty($result) ? $result : false;
    }
    
    

}

?>
