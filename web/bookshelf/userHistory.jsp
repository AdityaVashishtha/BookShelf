<%-- 
    Document   : bookLogs
    Created on : 2 Apr, 2017, 6:48:02 PM
    Author     : aditya
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.bookshelf.utillity.SQLConnection"%>
<%@page import="java.sql.Connection"%>
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
        <br>
        <a  href="./index.jsp"><button class="button btn btn-primary">HOME</button></a>                       
        <br>           
        <%           
           String uid = (String) session.getAttribute("user_id");           
           if(uid ==null)           {
               response.sendRedirect("index.jsp");
           }
           String query = "select *, date_format(submission_date,'%d, %b %Y') as sdate, date_format(due_date,'%d, %b %Y') as ddate  from book Natural Join book_info Natural Join receipt Natural Join users where user_id ='"+uid+"'";                      
        %> 
        
        <table class="table table-hover">            
            <tr>
                <th>#</th>
                <th>Book ID</th>
                <th>Book Name</th>
                <th>User ID</th>
                <th>User Name</th>
                <th>Submission Date</th>
                <th>Due Date</th>
                <th>Fine Taken</th>
            </tr>
            
            <%
                Connection con = SQLConnection.createConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(query);
                int tFine = 0;
                int sNum = 0;
                while(rs.next()) {
                    String bookid = rs.getString("book_id");
                    String userid = rs.getString("user_id");
                    String bname = rs.getString("title");
                    String name = rs.getString("name");
                    String IssueDate= rs.getString("sdate");
                    String dueDate= rs.getString("ddate");
                    int fine = rs.getInt("fine");
                    tFine += fine;
                    sNum++;
            %> 
                <tr>
                    <td><%= sNum %></td>
                    <td><%= bookid %></td>
                    <td><%= bname %></td>
                    <td><%= userid %></td>
                    <td><%= name %></td>
                    <td><%= IssueDate %></td>
                    <td><%= dueDate %></td>
                    <td><%= fine %></td>
                </tr>  
            <%
                }
            %>      
            <tr>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td>-</td>
                    <td><h4><b>Total Fine</b></h4></td>
                    <td><h4><b><%= tFine %></b></h4></td>
                </tr>  
        </table>        
    </body>
</html>
