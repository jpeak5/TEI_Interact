<?php

/**
 * we are given the database result(s) for things that are similar to the 
 * item the user is hovering over.
 * Iterate over those and accumulate a block of markup in $buffer
 * @package TeiInteract 
 */
$buffer = "";
$thing = "<div class=\"thing-content\">";

    $buffer.="<span class=\"thing-result\">"."</span><br/>";

    $buffer.="<ul>";
        foreach ($related as $rel => $kvPair) {
            foreach($kvPair as $k => $v){
                $img = "";
                $buffer.= "<li>".$k." = ";
                
                if(item_has_files($v)){
                    $img = item_square_thumbnail(array(), 0, $v);
                    debug($img);
                }
                
                $buffer.= $v->id.$img."</li>";
            }
        }
    $buffer.="</ul>";
    


/**
 * output markup for the thing block.
 * if the buffer is empty, say so;
 * otherwise, insert the results inside the block
 */

//    $thing.="<div class=\"thing-struckout\">No Results Found</div>";

    $thing.= "<div class=\"thing-result-header\">results for ".$element.":".$search."<br/>type ".$type.":</div>";
    $thing.="<div class=\"thing-results\">";
    $thing.=$buffer;
    $thing.="</div>";

$thing.="</div>";
echo $thing;

?>
