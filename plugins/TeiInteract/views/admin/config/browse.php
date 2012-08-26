<?php
/**
 * @package TeiInteract 
 * render a list of TEI files
 * @deprecated this view for the config action is ill-name and has been replacd by the more apt 'files/browse'
 */
head(array('title' => 'TEI Interact Configuration', 'bodyclass' => 'primary', 'content_class' => 'horizontal-nav'));
?>
<h1>TEI Interact</h1>

<div id="primary">
    <?php echo flash(); ?>
    <?php
    print_r($el);
    if (!empty($err)) {
        echo '<p class="error">' . html_escape($err) . '</p>';
    }
    

    $cells = array();
    foreach($files as $file){
        
        $title = item('Dublin Core', 'Title', $options, $file->getItem());

        $line1 = sprintf("<strong>%s</strong> - %s",$title ,$file->original_filename);
        $line2 = sprintf("<br/><a href=\"%s\">Raw</a>&nbsp;&nbsp;", $file->getWebPath('archive'));
        $line3 = sprintf("&bull;&nbsp;&nbsp;    <a href=\"%s\" class=\"inspect\">Tags</a>"
                ,html_escape(uri('tei-interact/files/tags', 
                        array('id' => $file->id))));
        $part4 = sprintf("&nbsp;&bull;&nbsp;<a href=\"%s\">populate DB</a></p>",html_escape(uri('tei-interact/files/harvest', array('id' => $file->id))));
        $cells[] = sprintf("%s%s%s%s<br/>", $line1,$line2,$line3, $part4);
    }
    

    
    
    echo "<p>The following is a summary of the TEI entities<br/> for which we 
        will create tags and/or items from the TEI Files in this system</p>";
    
    
    
            
    $iCells = array();
    
    foreach ($results as $records){
        
        foreach($records as $k=>$v){
            $iCell = $k;
                foreach($v as $obj){
                    $iCell.= sprintf("(<em>%d</em>) <strong>%s</strong>",$obj->id,$obj->name); 
                    $iCell .= $k == 'ItemType' 
                                    ? sprintf("&nbsp;&bull;&nbsp;<a href=\"%s\">Items</a>",html_escape(uri('items/browse',
                                            array('type' => $obj->id))))
                                    : '';
                }
        }
        
        $iCells[] = $iCell;
    }

    
    echo "<hr/>";
    $max = max(count($cells), count($iCells));
    
    //build table
    $table = "<table>";
    $table.="<tr><th>FILES</th><th>INFRASTRUCTURE</th></tr>";
    for($i=0;$i<$max;$i++){
        $row = "<tr>";
        $row.="<td>$cells[$i]</td><td>$iCells[$i]</td>";
        $row.="</tr>";
        $table.=$row;
    }
    $table.="</table>";
    echo $table;
    ?>
    

        
    <?php
    foot();
    ?>
