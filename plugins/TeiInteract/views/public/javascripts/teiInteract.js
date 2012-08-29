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
            enter.apply(this,[$(this).data("tei").tag, $(this).data("tei").type]);
            
        },leave.apply(this)
    );}
    
    
);

function enter(tag, type){
            console.log("begin the enter callback");
                var $hover = encodeURIComponent($(this).text());
            $("#thing").load("http://apc.local/tei-interact/services/lookup?hover="
                +$hover
                +"&element="
                +tag
                +"&type="
                +type);
            console.log('looking up '+$(this).text() + tag);
}

function leave(){
    
    $("#thing").html("");
}

