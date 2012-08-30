<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Annotator
 *
 * @author jpeak5
 */
class Annotator extends Omeka_Plugin_Abstract{

    protected $_hooks = array('install', 'public_theme_header');
 
    public function hookInstall()
    {
       //do your install work here
    }

    public function hookPublicThemeHeader($request){
        debug(sprintf("%s injecting resources to header",  get_class() ));
//        echo js('annotator.min');
        echo "<script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js\"></script>";
        
        echo "<script src=\"http://assets.annotateit.org/annotator/v1.1.0/annotator-full.min.js\"></script>";
        echo "<link rel=\"stylesheet\" href=\"http://assets.annotateit.org/annotator/v1.1.0/annotator.min.css\">";
//        queue_css("annotator.min");
        echo js('use-annotator');
    }

}

$myplugin = new Annotator();
$myplugin->setUp();
?>
