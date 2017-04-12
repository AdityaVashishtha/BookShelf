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
        <title>Change Password,<%= username %> </title>
        <link type="text/css" href="./css/bootstrap.min.css" rel="stylesheet">    

        <link rel="shortcut icon" type="image/png" href="images/icon/open-book.png" />
        <link rel="stylesheet" type="text/css" href="./css/style.css">    
        <style>
            .main-box {
                width: 40%;
                box-sizing: border-box;
                min-width: 450px;
                border: 2px solid #00A5E2;
                height: 400px;
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
                background: #00A5E2;
                width: 100%;
                padding: 10px;
                text-align: center;
                color: #FEFEFE;
                font-size: 1.5em;
            }
            .main-box > .form > form > input[type=password] {                
                border: 0px;
                width: 80%;
                margin-left: 10%;
                margin-bottom: 20px;
                border-bottom: 2px solid #00A5E2;
                font-size: 1.5em;
                padding: 10px;
                text-align: center;
            }
            .main-box > .form > form > input[type=submit] {                
                border: 0px;
                width: 150px;
                margin-left: 10%;
                margin-bottom: 20px;
                border-bottom: 2px solid #00A5E2;
                font-size: 1.5em;
                padding: 10px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="main-box">
            <div class="title">Change Password, <%= username %></div>
            <div class="form">
                   <form action="#" method="post">
                        <input type="password" placeholder="Old Password" name="oldpwd" />
                        <input type="password" placeholder="New Password" name="newpwd" />                
                        <input type="submit" name="update" value="Submit" />                
                    </form>
            </div>            
            <br>
            <a href="index.jsp"><- Back to Home</a>
            
            <%
                String oldPassword = request.getParameter("oldpwd");
                String newPassword = request.getParameter("newpwd");
                if(oldPassword!=null && newPassword != null && username != null) {
                    if( (oldPassword.length() > 5) && (newPassword.length() > 5) ) {                        
                        
                        MessageDigest md5 = MessageDigest.getInstance("MD5");
                        md5.update(StandardCharsets.UTF_8.encode(oldPassword));
                        String hashedPass = String.format("%032x", new BigInteger(1, md5.digest())).toString();         
                        
                        String query = "select password from users where user_id = ? ";
                        Connection con = SQLConnection.createConnection();
                        PreparedStatement ps = con.prepareStatement(query);
                        ps.setString(1, username);
                        ResultSet rs = ps.executeQuery();
                        if(rs.next()) {
                            String pass = rs.getString(1);
                            if(pass.equals(hashedPass)) {
                                
                                md5.update(StandardCharsets.UTF_8.encode(newPassword));
                                hashedPass = String.format("%032x", new BigInteger(1, md5.digest())).toString();     
                                
                                query = "update users set password=? where user_id = ? ";
                                ps = con.prepareStatement(query);
                                ps.setString(1, hashedPass);
                                ps.setString(2, username);
                                int x = ps.executeUpdate();
                                if(x>0) {
                                    out.print("<div class='notify success'>Password updated.</div>");
                                } else {
                                    out.print("<div class='notify danger'>Error occured!</div>");
                                }                                                                
                            } else {
                                out.print("<div class='notify danger'>Invalid Password!</div>");
                            }
                        }
                    } else {
                        out.print("<div class='notify info'>Password length is Small!</div>");
                    }
                }
                %>            
        </div>                        
    </body>
</html>
