<%-- 
    Document   : changePassword
    Created on : 7 Apr, 2017, 11:34:19 AM
    Author     : aditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% 
            String username = (String) session.getAttribute("user_id");
        %>
        <title>Change Password,<%= username %> </title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
