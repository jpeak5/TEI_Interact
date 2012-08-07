<?php

debug('begin view');

$buffer = "";
$thing = "<div class=\"thing-content\">";
foreach ($occurrences as $file => $fileAttrs) {
    print_r("$file");
    $buffer.="<span class=\"thing-result\">File:".$file." - (".$fileAttrs['count'].")</span><br/>";
    debug("view got result ".$file);
}
if(!strlen($buffer)>0){
    $thing.="<div class=\"thing-struckout\">No Results Found</div>";
}else{
    $thing.= "<div class=\"thing-result-header\">results for ".$searchStr.":</div>";
    $thing.="<div class=\"thing-results\">";
    $thing.=$buffer;
    $thing.="</div>";
}
$thing.="</div>";
echo $thing;

?>
