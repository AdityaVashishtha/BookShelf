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
    
    $("#add_book").click(function () {
        $.ajax({url: "ajaxBookUpload.jsp", success: function(result){
            $(".profile-detail").html(result);
        }});
    });
    
    $("#update_user_info").click(function () {
        $.ajax({url: "ajaxUpdateUserInfo.jsp", success: function(result){
            $(".profile-detail").html(result);
        }});
    }); 

//    this function to load student profile
    function loadProfile(userId) {
        $.post("ajaxStudentProfile.jsp", {query: userId}, function(result){
                $(".profile-detail").html(result);
        });
    }
//    this function to load student profile
    
    
//    ISBN No. content fetch   
    $(document).on('click','#fetch_user_info',function () {
       v = $(this).parent().find(".input");
       uid = v.val();
       if(uid.length > 5) {
            $.post("getUserInfo.jsp", {query: uid}, function(result){
                    $(".input-suggestion").html(result);
            });
       }       
       else {
           alert("Invalid User id");
       }
    });

    $(document).on('click','#fetch_book',function () {
        
        v = $(this).parent().find(".input");
        isbn = v.val();
        $.ajax({url: "https://www.googleapis.com/books/v1/volumes?q=isbn:"+isbn, success: function(result){
            title = null;
            author = null;
            desc = null;
            publisher = null;
            date = null;
            page = null;
            thumbnail = null;
            if ( result.totalItems === 0) {
                
            }  else {
                title = result.items[0].volumeInfo.title;  
                if (typeof title === 'undefined') {
                    title = null;
                }                     
                author = result.items[0].volumeInfo.authors;
                if (typeof author === 'undefined') {
                    author = null;
                } 
                desc = result.items[0].volumeInfo.description;
                if (typeof desc === 'undefined') {
                    desc = null;
                }            
                publisher = result.items[0].volumeInfo.publisher;
                if (typeof publisher === 'undefined') {
                    publisher = null;
                }
                date = result.items[0].volumeInfo.publishedDate;
                if (typeof date === 'undefined') {
                    date = null;
                }
                page = result.items[0].volumeInfo.pageCount;
                if (typeof page === 'undefined') {
                    page = null;
                }
                thumbnail = result.items[0].volumeInfo.imageLinks;
                if (typeof thumbnail === 'undefined') {
                    thumbnail = null;
                } else {
                    thumbnail = thumbnail.thumbnail
                }
                rating = result.items[0].volumeInfo.averageRating;
                if (typeof rating === 'undefined') {
                    rating = null;
                } 
            }
            
            
            //alert(rating);
            //
            //
            //$(".content").html(result);
            
            $('.content').find('input[name=title]').val(title);
            $('.content').find('input[name=author]').val(author);
            $('.content').find('input[name=publisher]').val(publisher);
            $('.content').find('textarea[name=desc]').val(desc);
            $('.content').find('input[name=date]').val(date);
            $('.content').find('input[name=page]').val(page);
            $('.content').find('input[name=thumbnail]').val(thumbnail);
            $('.content').find('input[name=isbn]').val(isbn);
            
        }});
    });
    
    
    $(document).on('click','#fetch_book',function () {
        alert("UPADATE USER");
    });
    
    
    // This script for ajax based student search
    $('.s-search').find('input[type=submit]').click(function () {        
        searchString = $(this).parent().find("input[name=ssearch]").val();
        isBookSearch = $(this).parent().find("input[name=booksearch]").is(":checked");        
        if(searchString.length >5 && !isBookSearch ) {
             $.post("ajaxStudentProfile.jsp", {query: searchString}, function(result){
                 result = result.trim();                 
                 if(result == "<h1>No result found</h1>") {
                     $.post("ajaxBookInfo.jsp", {query: searchString}, function(result){
                        $(".book-details").html(result);
                    });
                 } else {
                    $(".profile-detail").html(result);
                 }                
                 // $(".profile-detail").html(result);
            });
        } else if (searchString.length >5 && isBookSearch ) {            
            $.post("ajaxBookInfo.jsp", {query: searchString}, function(result){
                result = result.trim();                 
                if(result == "NO Result found") {
                    $.post("ajaxStudentProfile.jsp", {query: searchString}, function(result){
                       $(".profile-detail").html(result);
                   });
                } else {
                    $(".book-details").html(result);                   
                }
                // $(".book-details").html(result);
            });
        } else {
            alert("Not a valid input.");
        }
    });
    
    $(document).on('click','.issue-book-btn',function () {
        bookid = $('input[name=issue-book-id]').val();
        userid = $('input[name=issue-user-id]').val();
        time = $('select[name=issue-book-for-time]').val();
        if (typeof userid === 'undefined') {
            alert("First Search a user to issue book.");
        } else {            
            $.post("../IssueBook", {bookid: bookid, userid: userid, time: time}, function(result){
                $('#snackbar').text(result);
                $('#snackbar').addClass('show');
                loadProfile(userid);
                setTimeout(function(){$('#snackbar').removeClass('show');}, 3000);
            });
        }
    });
    
    $(document).on('click','.return-book-btn',function () {
        bookid = $('input[name=issue-book-id]').val();
        $.post("../ReturnBook", {bookid: bookid }, function(result){                       
            $('#snackbar').text(result);            
            $('#snackbar').addClass('show');            
            setTimeout(function(){$('#snackbar').removeClass('show');}, 3000);
        });
    });    
    
//    function loadContenDashboard() {
//        $.ajax({url: "ajaxDashboard.jsp", success: function(result){
//            $(".profile-detail").html(result);
//        }});        
//        setTimeout(function(){ loadContenDashboard() }, 30000);
//        //setTimeout(loadContenDashboard(),5000);
//    }
//    loadContenDashboard();    
});