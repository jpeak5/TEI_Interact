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
?>
