    /**
 * When the user hovers over something tagged as 'thing',
 * send the textual content of the tag back to the script to 
 * be used as a paramenter in a db query for related items
 * @package TeiInteract 
 */
$(document).ready(function(){
    $(".tei").hover(
        function(){
            console.log("calling enter with param");
            enter.apply(this,[$(this).data('tei')]);
            
        },leave
    );}
    
    
);

function enter(tei){
            console.log("begin the enter callback");
                var $hover = encodeURIComponent($(this).text());
            $("#thing").load("http://apc.local/tei-interact/services/lookup?hover="+$hover+"&element="+tei);
            console.log('looking up '+$(this).text() + tei);
}

function leave(){
    $("#thing").html("");
}

