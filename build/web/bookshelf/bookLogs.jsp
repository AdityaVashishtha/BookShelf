<%-- 
    Document   : bookLogs
    Created on : 2 Apr, 2017, 6:48:02 PM
    Author     : aditya
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <title>Book Logs</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link type="text/css" href="./css/bootstrap.min.css" rel="stylesheet">    

        <link rel="shortcut icon" type="image/png" href="images/icon/open-book.png" />
        <link rel="stylesheet" type="text/css" href="./css/style.css"> 
    </head>
    <body>
        <%
           String book_id = request.getParameter("bookid");
           String isbn = request.getParameter("isbn");
           String date_start = request.getParameter("dateS");
           String date_end = request.getParameter("dateE");
           String temp = request.getParameter("in_table");
           int inTable = 0;
           if(temp != null) {
               inTable = Integer.parseInt(temp);
           }
           String query = "select * from book Natural Join book_info Natural Join issued_book Natural Join users;";
        %>
    </body>
</html>
