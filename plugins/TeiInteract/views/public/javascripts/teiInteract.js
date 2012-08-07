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



