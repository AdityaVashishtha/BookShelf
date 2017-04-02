<%-- 
    Document   : book.jsp
    Created on : 2 Apr, 2017, 11:19:52 AM
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
					<a href="">
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
            <div class="profile-detail">
                <div class="book-page">
                    <div class="book-page-image thumbnail blueborder col-lg-3">
                        <img src="http://books.google.com/books/content?id=w_d5ngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api" />
                    </div>                    
                    <div class="book-page-details redborder col-lg-9 ">
                        <div class="book-page-title myred">
                            This is the title of Book
                        </div>
                    </div>
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

        <script type="text/javascript" src="js/index.js"></script>
        <script type="text/javascript" src="js/ajaxIndexPage.js"></script>
</body>
</html>
