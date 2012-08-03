<?php

/**
 * TEI Interact is a plugin to provide hooks into the TEI markup of a document.
 * 
 * We intend to extend the functionality provided by the Scholar's Lab TeiDisplay plugin
 * @package TeiInteract 
 */
define('TEI_INTERACT_TEST', 'this is only a test');

/**
 * 
 * 
 * This class is the main script for the plugin as desribed in 
 * @link http://omeka.org/codex/Plugin_Writing_Best_Practices The Omeka Plugins-writing best practices
 */
class TeiInteract extends Omeka_Plugin_Abstract {

    /**
     * hooks array
     * The hooks that you declare you are using in the $_hooks array must have a corresponding public method of the form hook{Hookname} as above. 
     * @link http://omeka.org/codex/Plugin_Writing_Best_Practices Plugins Best-practices
     * @var string[] the set of hooks that this plugin uses
     */
    protected $_hooks = array('install','initialize', 'public_theme_header', 'public_theme_body');

    
    public function hookInstall() {
        debug('TeiInteract::hookInstall()');
    }

    public function hookInitialize() {
        debug('TeiInteract::hookInitialize()');
    }

    /**
     *
     * @param type $request 
     */
    public function hookPublicThemeHeader($request) {

        if(($item = get_current_item())!=false){
        debug("injecting TeiInteract jQuery");
        echo js('teiInteract');
//        echo $item->id;
        }
    }

    /**
     *
     * @param type $request 
     */
    public function hookPublicThemeBody($request) {

    }


}

$teiInteract = new TeiInteract();
$teiInteract->setUp();

