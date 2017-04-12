<%-- 
    Document   : index.jsp
    Created on : 12 Mar, 2017, 6:31:46 PM
    Author     : aditya
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bookshelf.utillity.SQLConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.bookshelf.data.Users"%>
<%@page import="com.bookshelf.utillity.LoginCheck"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  Users user=null;
    if( !LoginCheck.checkLogin(session) ) {        
            response.sendRedirect("login.jsp");
    } 
    else {
        try {
                user = (Users) session.getAttribute("user");        
                String type = user.getUser_type();
                if(!type.equals("admin")) {
                    response.sendRedirect("home.jsp");
                }
            } catch (Exception e) {
                out.print(e);                
                out.print(session.getAttribute("user_name"));
            }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Profile, Your request, dues, books here !!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">    
    <link type="text/css" href="./css/bootstrap.min.css" rel="stylesheet">    
    
    <link rel="shortcut icon" type="image/png" href="images/icon/open-book.png" />    
    <link rel="stylesheet" type="text/css" href="./css/style.login.css">        
    <link rel="stylesheet" type="text/css" href="./css/style.css">             
</head>
<body>
	<div class="main-menu">
                <a href="index.jsp"><div class="menu-logo"></div></a>
		<div class="search-div" id="id1">
                    <input class="search-input" id="main-search-input" type="text" name="search" autocomplete="off">
                    <input id="searchSubmit" type="submit" name="searchSubmit" value="">
                    <div class="search-suggestion">
                        <ul>
                            
                        </ul>
                    </div>
		</div>
                <div class="welcome-note  visible-lg-block visible-md-block">Welcome, 
                        <%
                            try {
                                   out.println(user.getName());
                                } catch (Exception e) {
                                   out.println(e);
                                }                                            
                        %>
                </div>
		<div class="menu-button">
			
		</div>
		<div class="float-menu">
			<ul>
                                <li>
					<a href="#/register" id="register">
						<img class="menu-image-button" src="images/icon/student.png" alt="menu-logo" >
						<span>Register User</span>
					</a>
				</li>
				<li>
					<a href="#/addBook" id="add_book">
						<img class="menu-image-button" src="images/icon/notebook.png" alt="menu-logo" >
						<span>Add Book</span>
					</a>
				</li>
				<li>
					<a href="home.jsp">
						<img class="menu-image-button" src="images/icon/notebook(11).png" alt="menu-logo" >
						<span>Search Book</span>
					</a>
				</li>
				<li>
					<a href="bookLogs.jsp">
						<img class="menu-image-button" src="images/icon/bookmark.png" alt="menu-logo" >
						<span>Book Logs</span>
					</a>
				</li>
				<li>
					<a href="#/update_user_info" id="update_user_info">
						<img class="menu-image-button" src="images/icon/pencil-case.png" alt="menu-logo" >
						<span>Update User Info</span>
					</a>
				</li>
				<li>
					<a href="">
						<img class="menu-image-button" src="images/icon/notebook(20).png" alt="menu-logo" >
						<span>Search Book</span>
					</a>
				</li>
                                <li>
					<a href="../Logout">
						<img class="menu-image-button" src="images/icon/logout.png" alt="menu-logo" >
						<span>Logout</span>
					</a>
				</li>
			</ul>
		</div>
	</div>		
	<div class="main-body">		
		<div class="profile-detail">                    
                    <div class="loader-gif"></div> 
                    
                   <div class="dashboard col-lg-12">                                                
                        <div class="dashboard-block dashboard-head blueborder col-lg-11">       
                            <%
                            Date date = new Date();
                            String dateformat = "EEEEEE d MMMMM yyyy";
                            SimpleDateFormat sdf = new SimpleDateFormat(dateformat);       
                            String query = "select ( SELECT count(*) FROM `issued_book` "
                                    + "WHERE DATE_FORMAT(issue_date,'%d, %b %Y') = DATE_FORMAT(now(),'%d, %b %Y') ) as ibook,"
                                    + "( SELECT count(*) FROM `receipt` WHERE DATE_FORMAT(submission_date,'%d, %b %Y') = DATE_FORMAT(now(),'%d, %b %Y') ) as sbook,"
                                    + "( SELECT sum(fine) FROM `receipt` WHERE DATE_FORMAT(submission_date,'%d, %b %Y') = DATE_FORMAT(now(),'%d, %b %Y') ) as tfine,"
                                    + "( SELECT count(*) FROM `issued_book` WHERE due_date < now() ) as duebook;";
                            int ibook=0,sbook=0,fine=0,duebook=10;                           
                            try {
                                    Connection con = SQLConnection.createConnection();
                                    PreparedStatement ps = con.prepareStatement(query);
                                    ResultSet rs = ps.executeQuery();                                    
                                    if(rs.next()) {
                                        ibook = rs.getInt("ibook");
                                        sbook = rs.getInt("sbook");
                                        duebook = rs.getInt("duebook");
                                        fine = rs.getInt("tfine");
                                    }
                                } catch (Exception e) {
                                    out.print(e);
                                }
                            %>
                            <div class="dashboard-block-title myblue"> <%= sdf.format(date) %></div>
                        </div>     
                        <div class="dashboard-upper-block orangeborder notification-box col-lg-4">
                            <div class="dashboard-block-title myorange">Notification Area</div>
                            <% 
                            query = "select  * from notification where user_id = ? limit 5";
                            String uid= (String) session.getAttribute("user_id");
                            try {
                                    Connection con = SQLConnection.createConnection();
                                    PreparedStatement ps = con.prepareStatement(query);
                                    ps.setString(1, uid);
                                    ResultSet rs = ps.executeQuery();
                                    while (rs.next()) {
                                        String content = rs.getString("content");
                                        String type = rs.getString("type");
                                        String typeString = "Info! ";
                                        String [] color = {"greencolor", "bluecolor", "yellowcolor", "redcolor"};
                                        int typeint =0;
                                        if(type.equals("w")) {
                                            typeint=2;
                                            typeString = "Warning! ";
                                        } else if(type.equals("d")) {
                                            typeint=3;
                                            typeString = "Danger! ";
                                        } else if(type.equals("a")) {
                                            typeString = "Alert! ";
                                            typeint=1;
                                        }
                                        %>
                            <div class="notification-slide">
                                <strong class="<%= color[typeint] %>"><%= typeString %></strong> <%= content %>
                            </div>
                            <%
                                    }
                                } catch (Exception e) {
                                }
                            %>
                           
                        </div>                        
                        <div class="dashboard-upper-block col-lg-8">
                            <div class="dashboard-block darkblueborder col-lg-5">
                                <div class="dashboard-block-content darkbluecolor"> <%= ibook %> </div>
                                <div class="dashboard-block-title mydarkblue">Book Issued</div>
                            </div>                        
                            <div class="dashboard-block redborder col-lg-5">
                                <div class="dashboard-block-content redcolor"> <%= duebook %> </div>
                                <div class="dashboard-block-title myred">Due Books</div>
                            </div>                        
                            <div class="dashboard-block greenborder col-lg-5">
                                <div class="dashboard-block-content greencolor"><%= sbook %></div>
                                <div class="dashboard-block-title mygreen">Books Returned</div>
                            </div>                        
                            <div class="dashboard-block yellowborder col-lg-5">
                                <div class="dashboard-block-content yellowcolor"><%= fine %></div>
                                <div class="dashboard-block-title myyellow">Fine Collected</div>
                            </div>                                 
                        </div>                                                
                    </div>
                    
		</div>
		<div class="side-detail">
			<div class="s-search">
				<div class="title">Student/Book Search</div>
                                <input type="text" name="ssearch" autocomplete="off">	                                
                                <input type="submit" name="search-text" value="Search" >
                                Book search :<input type="checkbox" name="booksearch" />
			</div>
                        <div class="book-details">
                            
                        </div>
		</div>

	</div>
                
        <div id="snackbar"></div>
                
	<footer class="footer">
		<div class="footer-note">
			Project Created by Aditya Vashishtha, Abhishek Verma, and Vivek Brahmne
		</div>
	</footer>
                
                
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery-2.2.4.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        
        <script src="js/path.min.js"></script>        
        <script type="text/javascript" src="js/ajaxRelated.js"></script>        
	<script type="text/javascript" src="js/index.js"></script>        
        <script type="text/javascript" src="js/validate.js"></script>   
        <script>
            function checkEveryThing() {                                
                isValidField = true;
                errorString = "";
                var X = document.querySelectorAll("input[name=fname]")[0];
                fname = X.value;               
                X = document.querySelectorAll("input[name=uid]")[0];
                uid = X.value;                
                X = document.querySelectorAll("input[name=address]")[0];
                address = X.value;
                X = document.querySelectorAll("input[name=mobile]")[0];
                mobile = X.value;
                X = document.querySelectorAll("input[name=email]")[0];
                email = X.value;
                X = document.querySelectorAll("input[name=date]")[0];
                date = X.value;
                var isCorrect = /[1-9]|[@#$%]/.test(fname);
                //alert(isCorrect);
                if(isCorrect || fname.length < 8) {
                        errorString += "<div class='notify-user'> Not a Valid Name </div>";
                        isValidField = false;
                }
                //isCorrect = /[1-9]|[@#$%]/.test(pname);
                if(uid.length < 6) {
                        errorString += "<div class='notify-user'>Not a Valid User Id </div>";
                        isValidField = false;
                }
                if(address.length < 10) {
                        errorString += "<div class='notify-user'>Not a Valid Address </div>";
                        isValidField = false;
                }
                isCorrect = /[a-z|1-9]*[@][a-z|1-9]*[.][a-z|1-9]*/.test(email);
                if(!isCorrect || email.length < 8) {
                        errorString += "<div class='notify-user'>Not a Valid Email</div>";
                        isValidField = false;
                }
                isCorrect = /[a-z|@$%#]*/.test(mobile);
                if(mobile.length < 10) { //|| (mobile.length < 10) || (mobile.length > 10)) {
                        errorString += "<div class='notify-user'>Not a Valid Mobile</div>";
                        isValidField = false;
                }
                isCorrect = date.split("/");                
                day = isCorrect[0];
                month = isCorrect[1];
                year = isCorrect[2];
                if(isCorrect <= 0 || day<0 || day>31 || month <1 || month > 12 || year < 2000 || year>2020 ) {
                    errorString += "<div class='notify-user myred'>Not a Valid Date</div>";
                    isValidField = false;
                }                
                $(".input-suggestion").find(".content").html(errorString);
                return isValidField;
        }        
        $(document).on("mouseover","#registeruser",function () {
            if(!checkEveryThing()) {
                $(this).attr("disabled","true");
                $(this).css("cursor","not-allowed");    
                $("html, body").animate({ scrollTop: 0 }, "slow");
                //scroll(0,0);                                                 
            } else {
                $(this).attr("disabled","false");
                $(this).css("cursor","pointer");
                //alert(x);
            }
        });       
        </script>
                
        <script type="text/javascript" src="js/ajaxIndexPage.js"></script>
</body>
</html>