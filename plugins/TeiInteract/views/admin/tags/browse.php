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

    if (!$tags) {
        echo "<h2>Tag not found in File</h2>";
    } else {
        echo "<h2>" . $tags->length . " Instaces of <em>" . $tag . "</em></h2>";


        echo "<ul>";
        if (!$types) {
            foreach ($tags as $tag) {
                echo"<li>";

                $v = $tag->nodeValue;
                if (strlen($v) < 1) {
                    echo "empty node";
                } else {
                    echo $v;
                }
                echo "</li>";
            }
        } else {
            ksort($types);
            foreach ($types as $type => $values) {
                echo "Names of type <em>" . $type . "</em>";
                echo "<ul>";
                ksort($values);
                foreach ($values as $name => $attr) {
                    echo "<li>";
                    echo $name."(".$attr['count'].")";
                    echo "</li>";
                }

                echo "</ul>";
            }
        }

        echo "</ul>";
    }

    foot();



    