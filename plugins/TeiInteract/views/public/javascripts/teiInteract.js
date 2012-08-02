$(document).ready(function(){
    $("p").hover(
        function (event) {
            var $target = event.target;
            
            $(this).append($("<span class=\"green\">"+event.pageX+", "+event.pageY+" - "+$target.valueOf()+"</span>"));
        }, 
        function () {
            $(this).find("span:last").remove();
        }
        );

});



