<?php

/**
 * Description of TeiInteract_hasNames
 *
 * @author jpeak5
 */
class TeiInteractName extends Omeka_Record {

    public $id;
    public $file_id;
    public $type;
    public $value;
    public $occurrenceCount=1;

    /**
     *
     * @var boolean true for header
     */
    public $teiHeader;
    
//    public function __construct(){
//        parent::__construct();
//        debug("creating new TEI INTERACT NAMES object");
//    }

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
        debug("returning from _validate()");
        return true;
    }

    protected function beforeSave() {
        debug("Is Valid?".$this->isValid());
        $this->validate();
        
    }
}

?>
