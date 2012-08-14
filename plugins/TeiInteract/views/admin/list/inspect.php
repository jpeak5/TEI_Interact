<?php
/**
 * @package TeiInteract 
 */
head(array('title' => 'TEI Interact Tags', 'textclass' => 'primary', 'content_class' => 'horizontal-nav'));
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




    <?php if (!$record) { ?>
        <h2>File not found!</h2>
    <?php } else { ?>
        <ul>
            
                <li>


                    <?php
                    $file = $record['file'];
                    $tags = $record['tags'];
//                    sort($tags, SORT_STRING);
                    $item = item('Dublin Core', 'Title', $options, $file->getItem());
                    $xml = $file->getWebPath('archive');
                    echo "<em>".$file->original_filename."</em> attached to <strong>" . $item . "</strong><br/><a href=\"" . $xml . "\">" . $xml . "</a>";
                    echo "<br/><br/>Head Tags<hr/>";

                    $headTags = $tags['head'];
                    sort($headTags);
                    for ($i = 0; $i < count($headTags); $i++) {
                        $link = " <a href=\"" . html_escape(uri('tei-interact/tags/browse', array('id' => $file->id,'tag' => $headTags[$i], 'section'=>'teiHeader'))) . "\" class=\"inspect\">".$headTags[$i]."</a>";
                        echo $link;
//                        debug("built link:" . $link);
                        if ($i != count($headTags) - 1) {
                            echo ", ";
                        }
                        if (($i + 1) % 5 == 0) {
                            echo "<br/>";
                        }
                    }
                    
                    echo "<br/><br/>Text Tags<hr/>";
                    
                    $textTags = $tags['text'];
                    sort($textTags);
                    
                    
                    for ($i = 0; $i < count($textTags); $i++) {
                        $link = " <a href=\"" . html_escape(uri('tei-interact/tags/browse', array('id' => $file->id,'tag' => $textTags[$i], 'section'=>'text'))) . "\" class=\"inspect\">".$textTags[$i]."</a>";
                        echo $link;
                        if ($i != count($textTags) - 1) {
                            echo ", ";
                        }
                        if (($i + 1) % 5 == 0) {
                            echo "<br/>";
                        }
                    }
 
                    ?>

                </li>

            
        </ul>
    <?php } ?>
    <?php
    foot();
    ?>
