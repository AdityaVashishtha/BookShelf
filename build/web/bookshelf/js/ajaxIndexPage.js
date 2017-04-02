$(document).ready(function (){
            
    $('#main-search-input').keyup(function (e) {
        q = $(this).val();  
        q = q.trim();
        x = e.keyCode;        
        if((q.length > 3) && x!=13) {            
            $.post("ajaxSearchSuggestion.jsp", {squery: q}, function(result){                
                result = result.trim();
                if(result.length > 0) {                    
                    $('.search-suggestion').find('ul').html(result);
                    $('.search-suggestion').show();
                }  else {
                    $('.search-suggestion').hide();
                }                  
            });            
        } else if((q.length > 3) && x==13) {
                $('.search-suggestion').hide();
                limit = 0;
                $.post("ajaxSearchResult.jsp", {squery: q, limit: limit}, function(result){                
                    result = result.trim();
                    if(result.length > 0) {                    
                        $('.result-div').html(result);                        
                    }                
                });
        } else {
            $('.search-suggestion').hide();
        }
    });    
    
    $('#searchSubmit').click(function () {        
        q = $('#main-search-input').val();
        q = q.trim();
        if(q.length > 0) {
            $('.search-suggestion').hide();
            limit = 0;
            $.post("ajaxSearchResult.jsp", {squery: q, limit: limit}, function(result){                
                result = result.trim();
                if(result.length > 0) {                    
                    $('.result-div').html(result);                        
                }                
            });
        }        
    }); 
    
    $('#main-search-input').blur(function (e) {        
        //$('.search-suggestion').hide();        
    });
});