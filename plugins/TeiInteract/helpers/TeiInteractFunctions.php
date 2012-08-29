<?php

    function teiInteract_normalizeText($string){
        debug("begin normalizeText...". $string);
        $pattern = array("/'s/", "/\s\s/", "/\b\./", "/'\b/","/\b'/");
        $replace = array(""," ", '','','');
        debug(sprintf("cleaning string %s", $string));
        $new = preg_replace($pattern, $replace, $string);
        debug(sprintf("returning cleaned string %s", $new));
        return $new;
    }
    
    function teiInteract_getItemByDCTitle($title){
        
        $tbl = get_db()->getTable('ElementText');
        $matches = $tbl->findBySQL("`element_id` = 50 AND `text` = ?", array($title));
        debug(sprintf("found %d matches in element texts table", count($matches)));
        debug(sprintf("match id = %d", $matches[0]->id));
        return $matches;
    }
    
    
?>
