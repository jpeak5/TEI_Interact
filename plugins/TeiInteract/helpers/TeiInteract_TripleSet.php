<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TeiInteract_TripleSet
 *
 * @author jpeak5
 */
class TeiInteract_TripleSet {
    
    public $rootTitle;
    public $rootItems; //array (there may be more than one item with a given title)
    public $triples; //array

    
    public static function getTriplesSetForTitle($title) {
        /**
         * 
         * for a given search string $searchStr,
         * 
         * 1. try to find an item with the same title;
         * 2. if not, stay quiet
         * 3. if found, try to find its ID in the ItemRelations table
         * 4. if no relations, be quiet, or try other search strategies (TBD)
         * 5. for every found relation, pass the referenced item object to the view
         * 
         */

        $tripleSet = new TeiInteract_TripleSet();
        $tripleSet->rootTitle = $title;
        
        $tripleSet->rootItems = teiInteract_getItemsByDCTitle($title); //step 1
        
        debug(sprintf("%s - found %d matches for search term '%s'; first found match ID = %d", get_class(), count($tripleSet->rootItems), $title, $tripleSet->rootItems[0]->id));
        $tripleSet->triples = array();
        debug(sprintf("%s - processing %d item records into one triple Set", get_class(), count($tripleSet->rootItems)));
        
        foreach($tripleSet->rootItems as $item) {  
            debug(sprintf("beginning to build triples sourced from item with id = %d",$item->id));
            $tripleSet->triples[$item->id] = array();
            
            $irirTbl = new ItemRelationsItemRelationTable('ItemRelationsItemRelation', get_db());

            $subjects = array(); //where the searchStr item is subject
            $objects = array(); //where the searchStr item is object


            $subjects = array_merge($subjects, $irirTbl->findBySubjectItemId($item->id));
            $objects = array_merge($objects, $irirTbl->findByObjectItemId($item->id));

            debug(sprintf("found %d matches in the relations table 
                (%d subjects, %d objects) for item with id = %d"
                            , count($subjects) + count($objects)
                            , count($subjects)
                            , count($objects)
                            , $item->id
                    )
            );

            $relations = array_merge($subjects,$objects);


            $itemTbl = get_db()->getTable('Item');
            $irpTbl = get_db()->getTable('ItemRelationsProperty');

            foreach ($relations as $relation) {//ItemRelations
                $triple = new TeiInteract_Triple;
                $triple->key = $item->id;
                $triple->keyTitle = $title;
                $triple->irIR = $relation;
                $triple->object = $itemTbl->find($relation->object_item_id);
                $triple->subject = $itemTbl->find($relation->subject_item_id);
                $triple->irProp = $irpTbl->find($relation->property_id);


                $tripleSet->triples[$item->id][] = $triple;
                $triple->dumpTriple();
                }
            }
            debug(sprintf("returning triple set with rootTitle '%s', %d rootItems, and %d triples",
                        $tripleSet->rootTitle,
                        count($tripleSet->rootItems),
                        count($tripleSet->triples)
                        )
                    );
            return $tripleSet;
        } 
    
    
    
}

?>
