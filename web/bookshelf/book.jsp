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
    String isbn = request.getParameter("isbn");
    if(isbn == null || isbn.length() < 8 ) {
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
					<a href="./index.jsp">
						<img class="menu-image-button" src="images/icon/bookshelf.png" alt="menu-logo" >
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
                Connection con  = SQLConnection.createConnection();
                String query = "select * from book_info where isbn=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, isbn);
                ResultSet rs = ps.executeQuery();
                if(rs.next()) {
                    String author = rs.getString("author");
                    String title = rs.getString("title");
                    String desc = rs.getString("description");
                    String publisher = rs.getString("publisher");
                    String thumbnail = rs.getString("thumbnail");
                    String publishDate = rs.getString("publishdate");
                    String pageCount = rs.getString("pagecount");
                    query = "select (select count(*) from book where isbn=?), (select count(*) from book NATURAL join issued_book where isbn=?), (select date_format((select min(due_date) from book NATURAL join issued_book where isbn = ?),'%d, %b `%y')) ";
                    ps = con.prepareStatement(query);
                    ps.setString(1, isbn);
                    ps.setString(2, isbn);
                    ps.setString(3, isbn);
                    rs = ps.executeQuery();
                    int bookCount = 0;
                    int issuedCount = 0;
                    String arrivalDate = "Available";
                    String temp = "";
                    if(rs.next()) {
                        bookCount = rs.getInt(1);
                        issuedCount = rs.getInt(2);
                        temp = rs.getString(3);
                    }
                    if((bookCount-issuedCount) == 0) {
                        arrivalDate = temp;
                    }
                    %>
                    <div class="col-lg-1"></div>
                <div class="book-page redborder col-lg-9">
                    <div class="book-page-title myred">
                        <%= title %>
                    </div>
                    <%
                        if((bookCount-issuedCount) == 0) {
                    %>
                        <div class="notify-me">
                            <button type="button" class="book-notify-me btn btn-success">Notify me!!</button>
                        </div>
                    <% 
                        }
                    %>                    
                    <div class="book-page-image col-lg-2 col-md-3">
                        <img src="<%= thumbnail %>" />
                    </div> 
                    <div class="col-lg-1"></div>
                    <div class="book-page-details col-lg-9 col-md-9">                         
                        <ul>
                            <li class="b_isbn">
                                <div class="header-side">ISBN: </div>
                                <div class="header-content"><%= isbn %></div>
                            </li>
                            <li class="b_author">
                                <div class="header-side">Author: </div>
                                <div class="header-content"><%= author %></div>                                
                            </li>                            
                            <li class="b_publisher">
                                <div class="header-side">Publisher: </div>
                                <div class="header-content"> <%= publisher %> </div>                                
                            </li>
                            <li class="b_description">
                                <div class="header-side">Description: </div>
                                <div class="header-content"><%= desc %></div>                                                                
                                <div class="header-content"><%= pageCount %> Pages</div>                                
                            </li>                                                        
                            <li class="b_p_date">
                                <div class="header-side">Publish Date: </div>
                                <div class="header-content"><%= publishDate %></div>                                
                            </li>                           
                        </ul>
                        <br>
                        <div class="col-lg-1 col-md-1"></div>
                        <div class="book-page-box col-lg-3 col-md-3 blueborder">
                            <div class="book-page-box-title myblue">Available Copies</div>                            
                            <div class="book-page-box-content bluecolor"><%= bookCount - issuedCount %></div>
                        </div>
                        <div class="col-lg-1 col-md-1"></div>
                        <div class="book-page-box col-lg-3 col-md-3 orangeborder">                            
                            <div class="book-page-box-title myorange">Total Copies</div>
                            <div class="book-page-box-content orangecolor"><%= bookCount %></div>
                        </div>
                        <div class="col-lg-1 col-md-1"></div>
                        <div class="book-page-box col-lg-3 col-md-3 greenborder">
                            <div class="book-page-box-title mygreen">Expected Arrival</div>
                            <div class="book-page-box-content greencolor"><%= arrivalDate %></div>
                        </div>
                    </div>
                </div>
<!--                <div class="book-page darkblueborder col-lg-4">
                    <div class="book-page-title mydarkblue">
                                Related Books
                    </div>
                </div>-->
            
            <%
                }
            %>                            
        </div>
	
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery-2.2.4.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>

        <script type="text/javascript" src="js/index.js"></script>
        <script type="text/javascript" src="js/ajaxIndexPage.js"></script>
</body>
</html>
