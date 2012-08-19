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
    }else{
        echo "go to  ";
        echo " <a href=\"" . html_escape(uri('tei-interact/files/browse'))."\">files list</a>";
    }
    ?>
    

        
    <?php
    foot();
    ?>
