<?php

/**
 * we are given the database result(s) for things that are similar to the 
 * item the user is hovering over.
 * Iterate over those and accumulate a block of markup in $buffer
 * @package TeiInteract 
 */
$buffer = "";
$thing = "<div class=\"thing-content\">";
foreach ($occurrences as $file => $fileAttrs) {
    print_r("$file");
    $buffer.="<span class=\"thing-result\">File:".$file." - (".$fileAttrs['count'].")</span><br/>";
    debug("view got result ".$file);
}


/**
 * output markup for the thing block.
 * if the buffer is empty, say so;
 * otherwise, insert the results inside the block
 */
if(!strlen($buffer)>0){
    $thing.="<div class=\"thing-struckout\">No Results Found</div>";
}else{
    $thing.= "<div class=\"thing-result-header\">results for ".$searchStr.":</div>";
    $thing.="<div class=\"thing-results\">";
    $thing.=$buffer;
    $thing.="</div>";
}
$thing.="</div>";
echo $thing;

?>
