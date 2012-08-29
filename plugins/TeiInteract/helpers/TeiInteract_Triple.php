<?php

/**
 * Description of TeiInteract_Triple
 *
 * @author jpeak5
 */
class TeiInteract_Triple {

    public $key;        //int id of the item we used to get all of this..
    public $keyTitle;   //this is the string upon which the triple is based
    public $subject;    //Item
    public $object;     //Item
    public $relation;   //ItemRelationsProperty
    public $irIR;       //record from the ItemRelationsItemRelations table
    public $irProp;     //the related IR Property table record

    public function __construct() {
        
    }

    public function dumpTriple(){
                        debug(sprintf("triple: 
                    %s => %d,
                    %s => %s,
                    %s => %s,
                    %s => %d,
                    %s => %d,
                    %s => %d", 
                        
                        '$key ->', $this->key, 
                        'title ->', $this->keyTitle, 
                        'property label -> ', $this->irProp->label, 
                        'relation id -> ', $this->irIR->id, 
                        'subj item id -> ', $this->subject->id, 
                        'obj item id -> ', $this->object->id
                        )
                );
    }

}

?>
