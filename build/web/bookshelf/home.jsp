<%-- 
    Document   : home.jsp
    Created on : 14 Mar, 2017, 11:50:34 AM
    Author     : aditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
		<div class="main-search-div search-div" id="id1">
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
						<img class="menu-image-button" src="images/icon/student.png" alt="menu-logo" >
						<span>My Profile</span>
					</a>
				</li>	
                                <li>
                                    <a href="./userHistory.jsp">
						<img class="menu-image-button" src="images/icon/notebook(18).png" alt="menu-logo" >
						<span>My History</span>
					</a>
				</li>	
                                <li>
					<a href="./notifyAdmin.jsp">
						<img class="menu-image-button" src="images/icon/notebook(6).png" alt="menu-logo" >
						<span>Notify Admin</span>
					</a>
				</li>	
                                <li>
                                    <a href="./changePassword.jsp">
						<img class="menu-image-button" src="images/icon/notebook(14).png" alt="menu-logo" >
						<span>Password</span>
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
		<div class="result-div">						

		</div>
		<div class="filter-div">
				
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
        
        
	<script type="text/javascript" src="js/index.js"></script>
        <script type="text/javascript" src="js/ajaxIndexPage.js"></script>
</body>
</html>