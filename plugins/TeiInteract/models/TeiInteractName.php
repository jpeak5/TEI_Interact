<?php

/**
 * Table mapping class for our names table
 *
 * @author jpeak5
 * @package TeiInteract 
 */
class TeiInteractName extends Omeka_Record {

    /**
     *
     * @var int obligatory; primary key
     */
    public $id;
    /**
     *
     * @var int id of a file in the files table
     */
    public $file_id;
    /**
     *
     * @var string this maps to the allowed values for TEI </name>
     */
    public $type;
    /**
     *
     * @var string
     * the textual value of the name tag
     */
    public $value;
    /**
     *
     * @var int
     * number of times this string has been tagged with the same type in this file
     */
    public $occurrenceCount=1;

    /**
     *
     * @var boolean true for header
     */
    public $teiHeader;
    
    /**
     * Make sure we submit legal values
     * @return boolean
     */
    public function _validate() {
        
        if (!is_numeric($this->file_id)) {
            debug("file id given is not numeric");
            return false;
        }if (strlen($this->type) == 0) {
            debug("no type given");
            return false;
        }if (strlen($this->value) == 0) {
            debug("no value given");
            return false;
        }
        
        return true;
    }

    /**
     * validate before save
     */
    protected function beforeSave() {
        debug("Is Valid?".$this->isValid());
        $this->validate();
        
    }
}

?>
