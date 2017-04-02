<%-- 
    Document   : book.jsp
    Created on : 2 Apr, 2017, 11:19:52 AM
    Author     : aditya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bookshelf.utillity.SQLConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String usid = request.getParameter("uid");
    String session_uid = (String) session.getAttribute("user_id");    
    if(usid == null || usid.length() < 4 ) {
        usid = session_uid;
    }         
    if(session_uid == null) {
        response.sendRedirect("index.jsp");
    }
    else if( !session_uid.equals(usid) && !(session_uid.equals("admin1234")) ) {
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>BookShelf, search your books here !!</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link type="text/css" href="./css/bootstrap.min.css" rel="stylesheet">    
        
    <link rel="shortcut icon" type="image/png" href="images/icon/open-book.png" />
    <link rel="stylesheet" type="text/css" href="./css/style.css">        
</head>
<body>
	<div class="main-menu">
		<div class="menu-logo"></div>
		<div class="search-div" id="id1">
                    <input class="search-input" id="main-search-input" type="text" name="search" autocomplete="off">
                    <input id="searchSubmit" type="submit" name="searchSubmit" value="">
                    <div class="search-suggestion">
                        <ul>
                            
                        </ul>
                    </div>
		</div>
		<div class="menu-button">
			
		</div>
		<div class="float-menu">
			<ul>
                                <li>
					<a href="./profile.jsp">
						<img class="menu-image-button" src="images/icon/reading.png" alt="menu-logo" >
						<span>Profile</span>
					</a>
				</li>
				<li>
					<a href="./index.jsp">
						<img class="menu-image-button" src="images/icon/open-book-1.png" alt="menu-logo" >
						<span>Home</span>
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
        <% 
               String q = usid;
               if(q != null) {
                   String query = "select * , DATE_FORMAT(admission_date,'%d, %b %Y') as a_date from users natural join user_profile natural join department  where user_id = ?;";
                   Connection connection  = SQLConnection.createConnection();
                   PreparedStatement ps = connection.prepareStatement(query);
                   ps.setString(1, q);
                   ResultSet rs = ps.executeQuery();
                   if(rs.next()) {
                       String uid = rs.getString(2);
                       String name = rs.getString(3);
                       String user_type = rs.getString(6);
                       String email = rs.getString(7);
                       String mobile = rs.getString(8);
                       String date = rs.getString(14);
                       int quota = rs.getInt(10);
                       int issued_book = rs.getInt(11);
                       String profile_img = rs.getString(12);
                       String dept_name = rs.getString(13);
                       profile_img = profile_img.replaceAll("/home/aditya/PJT/BookShelf/web/", "");
                       //out.print("<img src='../"+profile_img+"' />"+dept_name);                        
       %>
            
            <!--this is test-->             
            <div class="col-lg-2 col-md-2 visible-lg visible-md"></div>
            <div class="profile-page darkblueborder profile-detail">    
                <div class="profile-page-title mydarkblue">
                    <%= name %>
                </div>
                <div class="personal-detail">
                <div class="userId"> <%= uid %> </div>
                <input type="hidden" name="issue-user-id" value="<%= uid %>"/>
                    <div class="profile-image">
                        <img class="thumbnail" src="<%= "../"+profile_img %>" alt="profile-image" />
                    </div>
                    <div class="personal-profile">
                            <p class="name"><%= name %></p>
                            <p class="stream"><%= uid %></p>
                            <p class="stream">( <%= dept_name %> )</p>
                            <p class="mobile"> +91-<%= mobile %> </p>
                            <p class="email"> <%= email %> </p>
                            <p class="address"> Admission Date : <%= date %> </p>					
                    </div>
            </div>            
            <div class="current-issue">
                    <div class="fine-detail">
                            <%
                            query = "select title,book_id,datediff(issue_date,due_date) as ex_day ,date_format(due_date,'%D %b %y %h:%m:%s %p') as due_date,thumbnail, date_format(issue_date,'%D %b %y %h:%m:%s %p') as issue_date from issued_book NATURAL JOIN book NATURAL JOIN book_info where user_id=?";
                            ps = connection.prepareStatement(query);
                            ps.setString(1, uid);
                            rs = ps.executeQuery();                        
                            int totalFine = 0;
                            int x = 1;
                            while(rs.next()) {
                                int ex_day = rs.getInt("ex_day");
                                ex_day = ex_day>0 ? ex_day : 0;
                                totalFine += ex_day*x;
                            }
                            String color = totalFine>0 ? "danger" : "success" ;
                            
                            %>
                            <p>Total Fine</p>
                            <p class="<%= color %>"><%= totalFine %>.00</p>
                            <p>Book Allow</p>
                            <p><%= quota %></p>
                            <p>Issued</p>
                            <p><%= issued_book %></p>
                    </div>
                    <div class="issued-book">
                    <div class="title">Issued Book details:</div>
                        <%
                            rs.beforeFirst();
                            while(rs.next()) {   
                                String title = rs.getString("title");
                                String bookid = rs.getString("book_id");
                                String issued_date = rs.getString("issue_date");
                                String due_date = rs.getString("due_date");
                                String thumbnail = rs.getString("thumbnail");
                                int ex_day = rs.getInt("ex_day");
                                ex_day = ex_day>0 ? ex_day : 0;
                        %>
                            <div class="book-item">
                                <img class="thumbnail" src="<%= thumbnail %>" alt="Book Desc" />
                                <br>
                                    <p class="book-title"><%= title %></p>
                                    <div><%= bookid %></div>
                                    <div>Issued On</div>
                                    <div><%= issued_date %></div>
                                    <div>Issued Till</div>
                                    <div><%= due_date %></div>
                                    <div>Extended Days</div>
                                    <div><%= ex_day %></div>
                            </div>					                            
                            <%
                                }
                            %>
                    </div>
            </div>
                                        <%              

                            } else {
                                out.print("<h1>No result found</h1>");
                            }
                        }
                    %>
                    
            </div>
<!--                    this is test -->            
<!--                <div class="book-page darkblueborder col-lg-4">
                    <div class="book-page-title mydarkblue">
                                Related Books
                    </div>
                </div>-->                                              
        </div>
	
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery-2.2.4.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>

        <script type="text/javascript" src="js/index.js"></script>
        <script type="text/javascript" src="js/ajaxIndexPage.js"></script>
</body>
</html>
