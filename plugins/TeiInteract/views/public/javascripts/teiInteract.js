/**
 * When the user hovers over something tagged as 'thing',
 * send the textual content of the tag back to the script to 
 * be used as a paramenter in a db query for related items
 * @package TeiInteract 
 */
$(document).ready(function(){
    $(".name").hover(
        function (event) {
//            var $target = event.target;
            var $hover = encodeURIComponent($(this).text());
            $("#thing").load("http://apc.local/tei-interact/services/names?hover="+$hover);
            console.log('looking up '+$(this).text());
//            $(this).append($("<span class=\"green\">"+event.pageX+", "+event.pageY+" - "+$target.valueOf()+"</span>"));
        }, 
        function () {
//            $(this).find("span:last").remove();
            $("#thing").html("");
        }
        );

});



