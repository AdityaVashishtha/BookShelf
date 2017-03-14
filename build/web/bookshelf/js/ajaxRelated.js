$(document).ready(function(){
    //    this is register ajax call function 
    $(".profile-detail").ajaxStart(function(){
        $(".loader-gif").css("display", "block");
    });

    $(".profile-detail").ajaxComplete(function(){
        $(".loader-gif").css("display", "none");
    }); 
    
    $("#register").click(function () {
        $.ajax({url: "ajaxRegister.jsp", success: function(result){
            $(".profile-detail").html(result);
        }});
    });
        
});