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
    echo "<a href=\"".  html_escape(uri('tei-interact/config/create-element-sets'))."\">Create Element Sets</a>";
    echo "<br /><a href=\"".  html_escape(uri('tei-interact/config/create-items'))."\">Create Items</a>";
    foreach ($results as $result){
        echo "<li><strong>".$result->tag_name."</strong>";
            echo "<ul>";
                echo "<li>Creating items for: ".$result->create_item;
                echo "</li>";
            
            
                echo "<li>Creating tei-interact tags for: ".$result->create_tag;
                echo "</li>";
            echo "</ul>";
        echo "</li>";
    }
    echo "</ul>";
    ?>
    

        
    <?php
    foot();
    ?>
