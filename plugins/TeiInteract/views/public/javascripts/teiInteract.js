    /**
 * When the user hovers over something tagged as 'thing',
 * send the textual content of the tag back to the script to 
 * be used as a paramenter in a db query for related items
 * @package TeiInteract 
 */
$(document).ready(function(){
    $(".persName").hover(
        enter,leave
    );}
    
    
);

function enter(){
                var $hover = encodeURIComponent($(this).text());
            $("#thing").load("http://apc.local/tei-interact/services/lookup?hover="+$hover);
            console.log('looking up '+$(this).text());
}

function leave(){
    $("#thing").html("");
}

