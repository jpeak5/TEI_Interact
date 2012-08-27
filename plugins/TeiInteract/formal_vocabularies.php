<?php
/**
 * Template borrowed from the ItemsRelations plugin
 */
return $formalVocabularies = array(
    array(
        'name' => 'TEI Interact Vocabulary #1', 
        'description' => 'first attempt vocabulary that will glue together our disparate items', 
        'namespace_prefix' => 'teiterms', 
        'namespace_uri' => 'http://literati.cct.lsu.edu', 
        'properties' => array(
            array(
                'local_part' => 'generalRelation', 
                'label' => 'General Relation', 
                'description' => 'the weakest link that can exist between two items.'
            ), 
            array(
                'local_part' => 'characterBelongsToStory', 
                'label' => 'Character Belongs to Story', 
                'description' => 'for characters, this links them with their story.'
            ),
            array(
                'local_part' => 'storyHasCharacter', 
                'label' => 'Story has Character', 
                'description' => "handle to a story's character."
            ), 
            array(
                'local_part' => 'depicts', 
                'label' => 'Depicts', 
                'description' => 'that which an image represents; based on the FOAF element'
            ), 
            array(
                'local_part' => 'depiction', 
                'label' => 'Depiction', 
                'description' => 'The object of this triple is the depiction itself'
            ), 
            array(
                'local_part' => 'hasSetting', 
                'label' => 'Has Setting', 
                'description' => 'the geographic places that are the setting for a tale'
            ), 
            array(
                'local_part' => 'settingOf', 
                'label' => 'Is Setting Of', 
                'description' => 'for a geographic place, these are the tales that use it as a setting'
            ),
            array(
                'local_part' => 'hasPublisher', 
                'label' => 'Publisher', 
                'description' => 'the Publisher of a tale'
            ), 
            array(
                'local_part' => 'published', 
                'label' => 'Published', 
                'description' => 'Publisher published this item'
            ), 
        )
    ), 
     
);
