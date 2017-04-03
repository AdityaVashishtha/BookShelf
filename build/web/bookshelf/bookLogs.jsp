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
        <br>
        <form method="get" action="bookLogs.jsp">
            <input type="text" placeholder="book id" name="bookid" />
            <input type="text" placeholder="ISBN Num" name="isbn" />
            <input type="text" placeholder="User id" name="userid" />
            <input type="text" placeholder="Date Start" name="dateS" />
            <input type="text" placeholder="Date End" name="dateE" />
            <input type="submit" name="submit" value="Search" />
        </form>        
        <br>           
        <%
           String book_id = request.getParameter("bookid");
           String isbn = request.getParameter("isbn");
           String date_start = request.getParameter("dateS");
           String date_end = request.getParameter("dateE");
           String temp = request.getParameter("in_table");
           String uid = request.getParameter("userid");
           int inTable = 0;
           if(temp != null) {
               inTable = Integer.parseInt(temp);
           }
           String query = "select *, date_format(submission_date,'%d, %b %Y') as sdate, date_format(due_date,'%d, %b %Y') as ddate  from book Natural Join book_info Natural Join receipt Natural Join users where 1 ";
           if(book_id != null && book_id.length() > 0) {
               query += " and book_id = "+book_id;
           } 
           if(isbn !=null && isbn.length() > 0) {
               query += " and isbn = " + isbn;
           }
           if(uid != null && uid.length() > 0) {
               query += " and user_id = "+ uid;
           } 
           if(date_start != null && date_start.length() > 0 ) {
               query += " and issue_date >= date_format('"+date_start+"','%Y-%m-%d %H:%i:%S')";               
           }
           if (date_end !=null && date_end.length() > 0 ) {
               query += " and issue_date <= date_format('"+date_end+"','%Y-%m-%d %H:%i:%S')";               
           }           
        %> 
        
        <table class="table table-hover">            
            <tr>
                <th>#</th>
                <th>Boodk ID</th>
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
                int sNum = 0;
                while(rs.next()) {
                    String bookid = rs.getString("book_id");
                    String userid = rs.getString("user_id");
                    String bname = rs.getString("title");
                    String name = rs.getString("name");
                    String IssueDate= rs.getString("sdate");
                    String dueDate= rs.getString("ddate");
                    int fine = rs.getInt("fine");
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
        </table>        
    </body>
</html>
