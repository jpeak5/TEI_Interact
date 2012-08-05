$(document).ready(function(){
    $(".name").hover(
        function (event) {
            var $target = event.target;
            $("#thing").load("http://apc.local/tei-interact/services/names");
            $(this).append($("<span class=\"green\">"+event.pageX+", "+event.pageY+" - "+$target.valueOf()+"</span>"));
        }, 
        function () {
            $(this).find("span:last").remove();
            $("#thing").html("");
        }
        );

});



