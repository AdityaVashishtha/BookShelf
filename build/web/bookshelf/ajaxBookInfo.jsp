<%-- 
    Document   : ajaxStudentProfile
    Created on : 16 Mar, 2017, 10:45:41 AM
    Author     : aditya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bookshelf.utillity.SQLConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String q = request.getParameter("query");
    if(q != null) {
        String query = "SELECT * FROM book_info NATURAL JOIN book where book_id = ?;";
        Connection connection  = SQLConnection.createConnection();
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, q);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            String isbn = rs.getString(1);                        
            String title = rs.getString(2);
            String author = rs.getString("author");
            String publisher = rs.getString("publisher");
            String desc = rs.getString("description");
            if(desc.length()>250) {
                desc = desc.substring(0,250) + "....";
            }
            String bookid = rs.getString("book_id");
            String thumbnail = rs.getString("thumbnail");
            if(thumbnail.length() < 1) {
                thumbnail = "http://imgh.us/books_2.png";
            }
            //out.print("<img src='../"+profile_img+"' />"+dept_name);
            %>
            
            <div class="thumbnail">
                <img src="<%= thumbnail %>" >
            </div>
            <div class="other-details">
                <ul>
                    <li class="title">Book ID: <%= bookid %></li>
                    <li class="title"><%= title %></li>
                    <li class="author">By: <%= author %></li>
                    <li class="publisher">Publisher: <%= publisher %> </li>
                    <li class="desc"><%= desc %></li>                                    
                    <li>ISBN: <%= isbn %></li>
                    <br>
                    <input type="hidden" name="issue-book-id" value="<%= bookid %>"/>
                    <li>
                        <select name="issue-book-for-time">
                            <option value="30" >1 month</option>
                            <option value="60" >2 month</option>
                            <option value="90" >3 month</option>
                            <option value="180" >6 month</option>
                        </select>
                    </li>                    
                    <br>
                    
                    <%
                        query = "select * from issued_book where book_id=?";
                        ps = connection.prepareStatement(query);
                        ps.setString(1, bookid);
                        rs = ps.executeQuery();
                        if(rs.next()) {
                        %>
                            <li class="availabillity"><button type="button" class="btn btn-danger return-book-btn">Return</button></li>                                   
                    <%
                        }
                        else {
                        %>
                            <li class="availabillity"><button type="button" class="btn btn-success issue-book-btn">Issue</button></li>                                   
                    <%
                        }
                    %>                    
                </ul>
            </div>


<%
        } else {
            out.print("NOT result found");
        }
    }
%>