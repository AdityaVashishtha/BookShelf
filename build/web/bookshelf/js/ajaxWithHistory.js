$(document).ready(function(){
    //    this is register ajax call function 
    $(".profile-detail").ajaxStart(function(){
        $(".loader-gif").css("display", "block");
    });

    $(".profile-detail").ajaxComplete(function(){
        $(".loader-gif").css("display", "none");
    }); 
    Path.map("#/register").to(function(){
        $.ajax({url: "ajaxRegister.jsp", success: function(result){
            $(".profile-detail").html(result);
        }});
    });            
    Path.root("#/home");
    Path.map("#/home").to(function(){        
        $(".profile-detail").html("");        
    });            
    Path.listen();
    $("#register").click(function () {
        
    });
    
    
});