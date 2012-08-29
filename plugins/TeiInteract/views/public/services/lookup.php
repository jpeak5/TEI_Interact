<?php

/**
 * we are given the database result(s) for things that are similar to the 
 * item the user is hovering over.
 * Iterate over those and accumulate a block of markup in $buffer
 * @package TeiInteract 
 */
$buffer = "";
$thing = "<div class=\"thing-content\">";

    $buffer.="<span class=\"thing-result\">";
    $buffer.="<h4>".$tripleSet->rootTitle."</h4><br/>";
    $buffer.="</span><br/>";
    
    
    
    if ($tripleSet) {
        $buffer.="<ul>";
        foreach ($tripleSet->triples as $itemID => $triples) {
            foreach($triples as $triple){
            
            debug(sprintf("printing triple relID %d", $triple->irIR->id));
            $tbl = get_db()->getTable('Item');
            $item = $triple->key == $triple->subject->id ? $tbl->find($triple->object->id) : $tbl->find($triple->subject->id);
            
            
            
            set_current_item($item);
            debug(sprintf("from lookup.php, item id is %d",$item->id));
            $triple->dumpTriple();

            $buffer.= "<li>";
            
            $buffer.="<h6>".$triple->irProp->label."</h6>";
            $buffer.= item_square_thumbnail(array(), 0, $item);
            debug(sprintf("img tag = %s",item_square_thumbnail(array(), 0, $item)));
            
            $buffer.=sprintf("<a href=\"%s\">%s</a>",  item_uri('show', $item),item('Dublin Core', 'Title', array(), $item));
            
            
            $buffer.="</li>";
            
            }
            
        }    
        $buffer.="</ul>";
    }


/**
 * output markup for the thing block.
 * if the buffer is empty, say so;
 * otherwise, insert the results inside the block
 */

//    $thing.="<div class=\"thing-struckout\">No Results Found</div>";

    $thing.= "<div class=\"thing-result-header\"></div>";
    $thing.="<div class=\"thing-results\">";
    $thing.=$buffer;
    $thing.="</div>";

$thing.="</div>";
echo $thing;

?>
