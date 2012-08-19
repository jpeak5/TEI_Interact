<?php
/**
 * @package TeiInteract 
 */
head(array('title' => 'TEI Interact Configuration', 'bodyclass' => 'primary', 'content_class' => 'horizontal-nav'));
?>
<h1>TEI Interact</h1>

<div id="primary">
    <?php
    echo flash();

    if (!empty($err)) {
        echo '<p class="error">' . html_escape($err) . '</p>';
    }

    echo $count." records added to the db";

    foot();



    