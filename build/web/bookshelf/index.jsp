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
                            <div class="notification-slide">
                                <strong class="redcolor">Warning!</strong> Better check yourself, you're not looking too good.
                            </div>
                            <div class="notification-slide">
                                <strong class="greencolor">Well done!</strong> Your request for approval is accepted.
                            </div>
                            <div class="notification-slide">
                                <strong class="yellowcolor">Check it!</strong> A request for update is just arrived.
                            </div>
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
</body>
</html>