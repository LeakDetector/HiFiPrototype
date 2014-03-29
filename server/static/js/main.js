$(document).ready(function(){
    $(".info").on("click", function(e){
        // find the meta info, if it exists
        var meta = $(this).closest(".info_wrapper").find(".meta");

        // EYGUHGHHGH javascript animations are bad :(
        meta.slideToggle(200);
    });
})