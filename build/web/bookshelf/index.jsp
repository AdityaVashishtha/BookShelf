<%-- 
    Document   : index.jsp
    Created on : 12 Mar, 2017, 6:31:46 PM
    Author     : aditya
--%>
<%@page import="com.bookshelf.data.Users"%>
<%@page import="com.bookshelf.utillity.LoginCheck"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  Users user=null;
    if( !LoginCheck.checkLogin(request) ) {        
            response.sendRedirect("login.jsp");
    } 
    else {
        user = (Users) session.getAttribute("user");        
        String type = user.getUser_type();
        if(!type.equals("admin")) {
            response.sendRedirect("home.jsp");
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
		<div class="menu-logo"></div>
		<div class="search-div" id="id1">
			<input class="search-input" type="text" name="search">
			<input type="submit" name="searchSubmit" value="">
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
					<a href="">
						<img class="menu-image-button" src="images/icon/notebook(11).png" alt="menu-logo" >
						<span>Search Book</span>
					</a>
				</li>
				<li>
					<a href="">
						<img class="menu-image-button" src="images/icon/bookmark.png" alt="menu-logo" >
						<span>Search Book</span>
					</a>
				</li>
				<li>
					<a href="">
						<img class="menu-image-button" src="images/icon/pencil-case.png" alt="menu-logo" >
						<span>Search Book</span>
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
</body>
</html>