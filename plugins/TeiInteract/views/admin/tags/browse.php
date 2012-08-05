<?php
head(array('title' => 'TEI Interact Configuration', 'bodyclass' => 'primary', 'content_class' => 'horizontal-nav'));
?>
<h1>TEI Interact</h1>

<div id="primary">
    <?php echo flash(); ?>
    <?php
    if (!empty($err)) {
        echo '<p class="error">' . html_escape($err) . '</p>';
    }
    ?>
    <?php // print_r(get_defined_vars()); ?>




    <?php if (!$tags) { ?>
        <h2>Tag not found in File</h2>
    <?php } else { 
        echo "<h2>".$tags->length." Instaces of <em>".$tag."</em>";?></h2>
        
        <ul>
            <?php foreach ($tags as $tag): ?>
                <li>
        <?php
        $v = $tag->nodeValue;
        if(strlen($v)<1){
            echo "empty node";
        }else{
            echo $v;
        }
        ?>


                </li>

    <?php endforeach; ?>
        </ul>
        <?php } ?>
    <?php
    foot();
    ?>
