<?php

/**
 * Table mapping class for our cleanup table
 *
 * @author jpeak5
 * @package TeiInteract 
 */
class TeiInteractCleanup extends Omeka_Record {

    /**
     *
     * @var int obligatory; primary key
     */
    public $id;
    
    /**
     *
     * @var string - the name of the table where we have stored stuff
     */
    public $omeka_table_name;
    
    /**
     *
     * @var int
     */
    public $omeka_table_id;
    
}

?>
