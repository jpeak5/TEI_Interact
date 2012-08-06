<?php

/**
 * TEI Interact is a plugin to provide hooks into the TEI markup of a document.
 * 
 * We intend to extend the functionality provided by the Scholar's Lab TeiDisplay plugin
 * @package TeiInteract 
 */
define('TEI_INTERACT_TEST', 'this is only a test');

use \Omeka_Record;

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
    protected $_hooks = array('install', 'initialize', 'public_theme_header', 'public_theme_body', 'uninstall', 'define_acl');
    protected $_filters = array('admin_navigation_main');

    public function hookInitialize() {
//        debug('TeiInteract::hookInitialize()');
    }

    /**
     *
     * @param type $request 
     */
    public function hookPublicThemeHeader($request) {


        echo js('teiInteract');
    }

    /**
     *
     * @param type $request 
     */
    public function hookPublicThemeBody($request) {
        
    }

    function hookInstall() {
        $db = get_db();
        if (!class_exists('XSLTProcessor')) {
            throw new Exception('Unable to access XSLTProcessor class.  Make sure the php-xsl package is installed.');
        } else {
//            if(!copy('libraries/teiInteract_default.xsl', TEI_DISPLAY_STYLESHEET_FOLDER, null)){
//                throw new Exception('Failed to copy libraries/teiInteract_default.xsl');
//            }
//            if(!copy('libraries/teiInteract_component.xsl', TEI_DISPLAY_STYLESHEET_FOLDER.DIRECTORY_SEPARATOR."includes", null)){
//                throw new Exception('Failed to copy libraries/teiInteract_component.xsl');
//            }
            debug("done trying to copy files to xsl directory" . TEI_DISPLAY_STYLESHEET_FOLDER);
//create for facet mapping
            $db->exec("CREATE TABLE IF NOT EXISTS `{$db->prefix}tei_interact_configs` (
			`id` int(10) unsigned NOT NULL auto_increment,
			`tei_display_id` int(10) unsigned, 
                        `tei_classes` text, 
	       PRIMARY KEY  (`id`)
	       ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;");

            $namesTable = "CREATE TABLE IF NOT EXISTS `{$db->prefix}tei_interact_names` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `teiHeader` tinyint(1) NOT NULL COMMENT 'whether or not this name appears in the header or in the main text...1 for header, 0 for text',
  `occurrenceCount` int(5) NOT NULL COMMENT 'how many times does this name occur in the file',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=166 ;";
            $db->exec($namesTable);

            //repopulate the tei_interact_config_table with existing TEI datastreams from Fedora if FedoraConnector is installed
            //change datastream from 'TEI' to another string, if applicable
            if (function_exists('fedora_connector_installed')) {
//do something similar
//                
//                $datastreams = $db->getTable('FedoraConnector_Datastream')->findBySql('datastream = ?', array('TEI'));
//                foreach ($datastreams as $datastream) {
//                    $teiFile = fedora_connector_content_url($datastream);
//                    //get the TEI id
//                    $xml_doc = new DomDocument;
//                    $xml_doc->load($teiFile);
//                    $xpath = new DOMXPath($xml_doc);
//
//                    $teiNode = $xml_doc->getElementsByTagName('TEI');
//                    $tei2Node = $xml_doc->getElementsByTagName('TEI.2');
//
//                    foreach ($teiNode as $teiNode) {
//                        $p5_id = $teiNode->getAttribute('xml:id');
//                    }
//                    foreach ($tei2Node as $tei2Node) {
//                        $p4_id = $tei2Node->getAttribute('id');
//                    }
//
//                    if (isset($p5_id)) {
//                        $tei_id = $p5_id;
//                    } else if (isset($p4_id)) {
//                        $tei_id = $p4_id;
//                    } else {
//                        $tei_id = NULL;
//                    }
//
//                    if ($tei_id != NULL) {
//                        $teiData = array('item_id' => $datastream->item_id, 'is_fedora_datastream' => 1, 'fedoraconnector_id' => $datastream->id, 'tei_id' => $tei_id);
//                        $db->insert('tei_interact_configs', $teiData);
//                    }
//                }
            }
        }
    }

    function hookUninstall() {
        $db = get_db();
        $sql = "DROP TABLE IF EXISTS `{$db->prefix}tei_interact_configs`";
        debug('dropping table ' . $db->prefix) . 'tei_interact_configs';
        $db->query($sql);

        $sql = "DROP TABLE IF EXISTS `{$db->prefix}tei_interact_names`";
        debug('dropping table ' . $db->prefix) . 'tei_interact_names';
        $db->query($sql);

        //delete options, if exist
    }

    public function hookAfterSaveItem($item) {
        debug("calling from the TeiInteract AfterSaveItem() hook");
        //store keywords (aka TEI-tagged things) in the db
        //use XSLTProcessor::registerPHPFunctions() to fire a db->update() everytime the xslt encounters something interesting
        //based on the small mod to the 'person-type' in component.xsl,
        //make a new XSL that preserves all TEI tags in similar fashion
    }

    function filterAdminNavigationMain($tabs) {
        if (get_acl()->checkUserPermission('TeiInteract_Config', 'index')) {
            $tabs['TEI Interact'] = uri('tei-interact/config/');
        }
        return $tabs;
    }

    function hookDefineAcl($acl) {
        $acl->loadResourceList(array('TeiInteract_Config' => array('browse', 'status')));
    }

}

$teiInteract = new TeiInteract();
$teiInteract->setUp();

