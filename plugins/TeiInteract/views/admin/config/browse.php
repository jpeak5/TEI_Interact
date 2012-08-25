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
    
    echo "<h1>".$elSetId."</h1>";
    echo "<h1>".$itemTypeId."</h1>";
    
    echo "<h2>Parsing for Tags</h2>";
    echo "<p>The following is a summary of the TEI entities<br/> for which we will create tags and/or items from the ";
    echo " <a href=\"" . html_escape(uri('tei-interact/files/browse'))."\">TEI Files</a>";
    echo " in this system</p>";
    echo "<ul>";
    
    
    foreach ($results as $records){
        
        echo "<ul>";
        foreach($records as $k=>$v){
            echo "<li>";
            echo $k ."...";
                echo "<ul>";
                foreach($v as $obj){
                    echo "<li>";
//                foreach($value as $x=>$y){
                    echo $obj->name.", id ".$obj->id;
                    echo "</li>";
                }
                echo "</ul>";
            echo "</li>";
        }
        echo "</ul>";
//            print_r($result);
    }
    echo "</ul>";
    ?>
    

        
    <?php
    foot();
    ?>
