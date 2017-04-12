<%-- 
    Document   : changePassword
    Created on : 7 Apr, 2017, 11:34:19 AM
    Author     : aditya
--%>

<%@page import="java.math.BigInteger"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bookshelf.utillity.SQLConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% 
            String username = (String) session.getAttribute("user_id");
            if(username==null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <title>User Notification</title>
        <link type="text/css" href="./css/bootstrap.min.css" rel="stylesheet">    

        <link rel="shortcut icon" type="image/png" href="images/icon/open-book.png" />
        <link rel="stylesheet" type="text/css" href="./css/style.css">    
        <style>
            .main-box {
                width: 40%;
                box-sizing: border-box;
                min-width: 450px;
                border: 2px solid #04B173;
                height: 500px;
                position: absolute;
                top: 100px;
                left: 50%;
                transform: translateX(-50%);
                padding-top: 60px;                
            }
            .main-box > a {
                margin-left: 50px;
                font-size: 1.5em;
            }
            .main-box > .notify {
                position: absolute;
                bottom: 0px;
                left: 0px;                
                width: 90%;
                margin-left: 5%;
                padding: 10px;
                font-weight: bold;
                margin-bottom: 15px;
                font-size: 1.25em; 
                color: white;
                text-align: center;
            }
            .danger {
                background: rgba(255,100,100,0.75);
            }
            .success {
                background: #04B173;
            }
            .info {
                background: rgba(100,100,255,0.75);
            }
            .main-box > .title {
                position: absolute;
                box-sizing: border-box;
                top: 0px;
                left: 0px;
                background: #04B173;
                width: 100%;
                padding: 10px;
                text-align: center;
                color: #FEFEFE;
                font-size: 1.5em;
            }
            .main-box > .form > form > input[type=text],.main-box > .form > form > textarea {                
                border: 0px;
                width: 80%;
                margin-left: 10%;
                margin-bottom: 20px;
                border-bottom: 2px solid #04B173;
                font-size: 1.5em;
                padding: 10px;                
            }
            .main-box > .form > form > input[type=submit] {                
                border: 0px;
                width: 150px;
                margin-left: 10%;
                margin-bottom: 20px;
                border-bottom: 2px solid #04B173;
                font-size: 1.5em;
                padding: 10px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="main-box">
            <div class="title">Request Admin UID:<%= username %></div>
            <div class="form">
                   <form action="#" method="post">                        
                        <input type="text" placeholder="Subject" name="subject" />
                        <textarea placeholder="Message goes here" name="message"></textarea>
                        <input type="submit" name="update" value="Submit" />                
                    </form>
            </div>            
            <br>
            <a href="index.jsp"><- Back to Home</a>
            
            <%
                String subject = request.getParameter("subject");
                String message = request.getParameter("message");
                String type = "w";
                String adminid = "admin1234";
                if(subject!=null && message != null && username != null) {
                    if( (subject.length() > 25) && (message.length() > 25) ) {                                                
                        String query = "INSERT INTO `notification`(`user_id`, `content`, `type`, `link`, `from_user_id`) VALUES (?,?,?,?,?);";
                        Connection con = SQLConnection.createConnection();                        
                        PreparedStatement ps = con.prepareStatement(query);
                        ps.setString(1, adminid);
                        ps.setString(2, message);
                        ps.setString(3, type);
                        ps.setString(4, subject);
                        ps.setString(5, username);
                        int x = ps.executeUpdate();
                        if(x > 0) {
                            out.print("<div class='notify success'>Request sent!</div>");
                        } else {
                            out.print("<div class='notify danger'>Some Error occured!!</div>");
                        }                        
                    } else {
                        out.print("<div class='notify info'>Subject or Message length is Small!</div>");
                    }
                }
                %>            
        </div>                        
    </body>
</html>
