<?php

/**
 * holds TEI elements and the attributes for which we want to create new items
 *
 * @author jpeak5
 * @package TeiInteract 
 */
class TeiInteractConfig extends Omeka_Record {

    /**
     *
     * @var int obligatory; primary key
     */
    public $id;
    
    /**
     *
     * @var string the element name
     */
    public $tag_name;
   
    /**
     *
     * @var array stored as a MySQL SET data type, 
     * this is the attirbutes for which we will create items
     */
    public $create_item;
    
    public $create_tag;
    
   
}

?>
