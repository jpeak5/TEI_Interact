<?php

    function teiInteract_normalizeText($string){
        debug("begin normalizeText...". $string);
        $string = trim($string);
        $pattern = array("/'s/", "/\s\s/", "/\b\./", "/'\b/","/\b'/");
        $replace = array(""," ", '','','');
        debug(sprintf("cleaning string %s", $string));
        $new = preg_replace($pattern, $replace, $string);
        debug(sprintf("returning cleaned string %s", $new));
        return $new;
    }
    
    function teiInteract_getItemsByDCTitle($title){
        //@TODO replace hardcoded value 50 for a dynamic reference to DC title field
        
        $tbl = get_db()->getTable('ElementText');
        $matches = $tbl->findBySQL("`element_id` = 50 AND `text` = ?", array($title));
        debug(sprintf("found %d matches in element texts table for title '%s'", count($matches), $title));
        debug(sprintf("match id = %d", $matches[0]->id));
        
        $items = array();
        foreach($matches as $match){
            $items[] = get_db()->getTable('Item')->find($match->record_id);
        }
        return $items;
    }
    
    
?>
