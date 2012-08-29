<?php

/**
 * TEI Interact is a plugin to provide hooks into the TEI markup of a document.
 * 
 * We intend to extend the functionality provided by the Scholar's Lab TeiDisplay plugin
 * @package TeiInteract 
 */
/**
 * a dummy test CONSTANT
 */


use \Omeka_Record;
require_once('controllers/ConfigController.php');
/**
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

/**
 *
 * @var string[] the aset of filters we are implementing
 */
protected $_filters = array('admin_navigation_main');

    const PUBLISHER_TYPE = 'Publisher';
    const PLACE_TYPE = 'Place';
    const CHARACTER_TYPE = 'Character';
    const SHIP_TYPE = 'Ship';
    
    const TEI_ELEMENT_SET = 'TEI Interact';
    const TEI_ELEMENT = 'TEI_ELEMENT';
    const TEI_TAG = 'TEI_TAG';

/**
 * this does nothing
 */
public function hookInitialize() {
//        debug('TeiInteract::hookInitialize()');
    
    $tbl = new ItemTypeTable('ItemType', get_db());
    $itemType = $tbl->findByName('TEI Interact Item');
    /**
     * used when inserting items    
     */
    define(TEI_INTERACT_ITEM_TYPE, $itemType->id);
    
    
    $tbl = new ElementTable('Element', get_db());
    define(TEI_ELEMENT_ID, $tbl->findByElementSetNameAndElementName(TEI_ELEMENT_SET, TEI_ELEMENT));
    define(TEI_TAG_ID, $tbl->findByElementSetNameAndElementName(TEI_ELEMENT_SET, TEI_TAG));
    
    if (!defined('TEI_INTERACT_PLUGIN_DIR')) {
    define('TEI_INTERACT_PLUGIN_DIR', dirname(__FILE__));
    
    
    }
    require_once TEI_INTERACT_PLUGIN_DIR.'/helpers/TeiInteractFunctions.php';
    require_once TEI_INTERACT_PLUGIN_DIR.'/helpers/TeiInteract_Triple.php';
    require_once TEI_INTERACT_PLUGIN_DIR.'/helpers/TeiInteract_TripleSet.php';
    debug(sprintf("my plugin dir = %s",TEI_INTERACT_PLUGIN_DIR));
}

/**
 * inject some javascript and (maybe soon) somem of Derick's CSS and the THING itself
 * @param type $request 
 */
public function hookPublicThemeHeader($request) {


echo js('teiInteract');
}

/**
 * Insert something into the theme body
 * @param type $request 
 */
public function hookPublicThemeBody($request) {

}

/**
 * Do things when the user clicks install, like build DB tables, etc
 * @throws Exception
 */
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
$db->exec("DROP TABLE IF EXISTS `{$db->prefix}tei_interact_configs`; ");
$db->exec("
           CREATE TABLE IF NOT EXISTS `{$db->prefix}tei_interact_configs` (
            `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
            `tag_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
            `create_item` set('ana','key','type','value') COLLATE utf8_unicode_ci DEFAULT NULL,
            `create_tag` set('ana','key','type','value') COLLATE utf8_unicode_ci DEFAULT NULL,
            PRIMARY KEY (`id`)
            ) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
        ");
$db->exec("
            INSERT INTO `{$db->prefix}tei_interact_configs` (`id`, `tag_name`, `create_item`) VALUES
            (1, 'name', 'type,value'),
            (2, 'geogName', 'type,value'),
            (5, 'persName', 'value'),
            (3, 'interp', 'ana,type,value'),
            (6, 'persName', 'ana,key,type,value'),
            (7, 'orgName', 'ana,key,type,value');
           ");
            
$db->exec("
        DROP TABLE IF EXISTS `{$db->prefix}tei_interact_cleanups`;    
        ");
            
$db->exec(
        "CREATE TABLE IF NOT EXISTS `{$db->prefix}tei_interact_cleanups` (
          `id` int(11) NOT NULL AUTO_INCREMENT,
          `omeka_table_name` varchar(80) NOT NULL,
          `omeka_table_id` int(11) NOT NULL,
          PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;"
        );



            $namesTable = "CREATE TABLE IF NOT EXISTS `{$db->prefix}tei_interact_names` (
            `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
             `file_id` int(10) unsigned NOT NULL,
             `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
             `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
             `teiHeader` tinyint(1) NOT NULL COMMENT 'whether or not this name appears in the header or in the main text...1 for header, 0 for text',
             `occurrenceCount` int(5) NOT NULL COMMENT 'how many times does this name occur in the file',
             PRIMARY KEY (`id`)
            ) ENGINE = MyISAM DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT = 166;
            ";
            $db->exec($namesTable);
            
            
            if (function_exists('fedora_connector_installed')) {
//do something similar

            }
        }
        
        $this->_saveVocabularies();
        $this->_createItemType();
        $this->_createElements($this->_createElementSets());
    }
    
    
    /**
     * when the user deletes us from Omeka, cleanup after ourselves by DROPPING or db tables, etc
     */
    function hookUninstall() {
        $db = get_db();
        $sql = "DROP TABLE IF EXISTS `{$db->prefix}tei_interact_configs`";
        debug('dropping table ' . $db->prefix) . 'tei_interact_configs';
        $db->query($sql);

        $sql = "DROP TABLE IF EXISTS `{$db->prefix}tei_interact_names`";
        debug('dropping table ' . $db->prefix) . 'tei_interact_names';
        $db->query($sql);
        
        //delete anything we've added
        $this->_deleteAllArtifacts();
        
        $sql = "DROP TABLE IF EXISTS `{$db->prefix}tei_interact_cleanups`";
        debug('dropping table ' . $db->prefix) . 'tei_interact_cleanups';
        $db->query($sql);

        
    }
    
    /**
     * this method removes all of the items, elements, element sets, etc
     * that we have added to the system
     */
    private function _deleteAllArtifacts() {
        $errors = array();
        $records = get_db()->getTable('TeiInteractCleanup')->findAll();
        foreach ($records as $record) {
            
            $tbl = get_db()->getTable($record->omeka_table_name);
            $toDelete = $tbl->find($record->omeka_table_id);
            if (empty($toDelete)) {
                $errors[] = $record;
            } else {
                debug("Deleting from " . $record->omeka_table_name . ", ID " . $record->omeka_table_id);

                $toDelete->delete();
                debug('delete success, now removing cleanup record, id ' . $record->id);
                $record->delete();
            }
        }


    }

    private function _createItemType() {
        $itemTypes = array(
            array(
                'name'=>self::PUBLISHER_TYPE,
                'description'=>'The publisher of a tale'
            ),
            array(
                'name'=>self::PLACE_TYPE,
                'description'=>'A geographic place referenced within a tale'
            ),
            array(
                'name'=>self::CHARACTER_TYPE,
                'description'=>'a character in a tale'
            ),
            array(
                'name'=>self::SHIP_TYPE,
                'description'=>'A Ship'
            )
            
        );
        
        foreach($itemTypes as $itemType){
        $itemType = insert_item_type(
                                array(
                                    'name' => $itemType['name'],
                                    'description' => $itemType['description']
                                      )
                                );
        TeiInteract_ConfigController::saveCleanupData('ItemType', $itemType->id);
        }


   
    
    
    
   
}

    private function _createElementSets() {

        //playing around with getting an element set...
        $elSets = array("TEI Interact");
        $tbl = get_db()->getTable('ElementSet');
        $elSet = null;
        $alreadyCreated = 4;
        foreach ($elSets as $es) {
            if (($elSet = $tbl->findByName($es)) == null) {
                $elSet = insert_element_set($es);
                $elSet->record_type_id = 2;
                $elSet->description = "Elements used to describe items 
                    auto-created by the TEI Interact plugin";
                $elSet->save();
                _log("browsing for element set id... " . $elSet->id);
                $alreadyCreated = 1;
                
                TeiInteract_ConfigController::saveCleanupData('ElementSet', 
                                                                $elSet->id);

            }
        }
        
        
        
        $message = $alreadyCreated == 4 ? " already exists in the DB!" : " created in the DB";
        debug($result." Element set '" . $es . "', with ID ". $elSet->id . $message, $alreadyCreated);
        
        return $elSet->id;
        
    }

    private function _createElements($elSetId) {
        $elSet= get_db()->getTable('ElementSet')->find($elSetId);
        $elTbl = new ElementTable('Element', get_db());
        $elements = array(
                        array(
                            "name" => 'TEI Tag',
                            "description" => 'TEI tags for identifying items as related to a certain TEI-tagged value',
                            "record_type_id" => 2,
                            "data_type_id" => 1,
                            "element_set_id" => $elSet->id
                            ),
                        array(
                            "name" => 'TEI Element',
                            "description" => "name of the source TEI-XML element ('name', 'persName', 'interp', etc)",
                            "record_type_id" => 2,
                            "data_type_id" => 1,
                            "element_set_id" => $elSet->id
                            )
                        );
        foreach($elements as $element) {
            $el = null;
            if (($el = $elTbl->findByElementSetNameAndElementName(
                                    $elSet->name,$element['name']))==null){
                $el = new Element();
                _log("creating new element");
                $el->record_type_id = $element["record_type_id"];
                $el->data_type_id = $element["data_type_id"];
                $el->name = $element["name"];
                $el->description = $element["description"];
                $el->element_set_id = $element["element_set_id"];
                $el->save();

                TeiInteract_ConfigController::saveCleanupData('Element', $el->id);
            }
        }
        
        return "Elements saved";
    }
    
    /**
     * Do things after an item has been saved
     * @param type $item
     */
    public function hookAfterSaveItem($item) {
        debug("calling from the TeiInteract AfterSaveItem() hook");
        //store keywords (aka TEI-tagged things) in the db
        //use XSLTProcessor::registerPHPFunctions() to fire a db->update() everytime the xslt encounters something interesting
        //based on the small mod to the 'person-type' in component.xsl,
        //make a new XSL that preserves all TEI tags in similar fashion
    }
    
    /**
     * 
     * @param string[] $tabs  An array of label => URI pairs. 
     * @return string[] An array of label => URI pairs.
     */
    function filterAdminNavigationMain($tabs) {
        if (get_acl()->checkUserPermission('TeiInteract_Config', 'index')) {
            $tabs['TEI Interact'] = uri('tei-interact/config/');
        }
        return $tabs;
    }

    
    /**
     * 
     * This hook runs when Omeka's ACL is instantiated. 
     * It allows plugin writers to manipulate the ACL that controls user access in Omeka.
     * In general, plugins use this hook to restrict and/or allow access for specific user roles to the pages that it creates. 
     * @param Zend_Acl $acl The ACL object (a subclass of Zend_Acl)
     */
    function hookDefineAcl($acl) {
        $acl->loadResourceList(array('TeiInteract_Config' => array('browse', 'status')));
    }
    
    private function _saveVocabularies(){
            // Install the formal vocabularies and their properties.
        $formalVocabularies = include 'formal_vocabularies.php';
        foreach ($formalVocabularies as $formalVocabulary) {
            $vocabulary = new ItemRelationsVocabulary;
            $vocabulary->name = $formalVocabulary['name'];
            $vocabulary->description = $formalVocabulary['description'];
            $vocabulary->namespace_prefix = $formalVocabulary['namespace_prefix'];
            $vocabulary->namespace_uri = $formalVocabulary['namespace_uri'];
            $vocabulary->custom = 0;
            $vocabulary->save();
            TeiInteract_ConfigController::saveCleanupData('ItemRelationsVocabulary', 
                                                                $vocabulary->id);
            
//            $vocabularyId = $db->lastInsertId();
            $vocabularyId = $vocabulary->id;
            
            foreach ($formalVocabulary['properties'] as $formalProperty) {
                $property = new ItemRelationsProperty;
                $property->vocabulary_id = $vocabularyId;
                $property->local_part = $formalProperty['local_part'];
                $property->label = $formalProperty['label'];
                $property->description = $formalProperty['description'];
                $property->save();
                
                TeiInteract_ConfigController::saveCleanupData('ItemRelationsProperty', 
                                                                $property->id);
            }
        }
    }
    
}

$teiInteract = new TeiInteract();
$teiInteract->setUp();

