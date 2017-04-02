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
        String query = "select * , DATE_FORMAT(admission_date,'%d, %b %Y') as a_date from users natural join user_profile natural join department  where user_id = ?;";
        Connection connection  = SQLConnection.createConnection();
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setString(1, q);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
            String uid = rs.getString(2);
            String name = rs.getString(3);
            String user_type = rs.getString(6);
            String email = rs.getString(7);
            String mobile = rs.getString(8);
            String date = rs.getString(14);
            int quota = rs.getInt(10);
            int issued_book = rs.getInt(11);
            String profile_img = rs.getString(12);
            String dept_name = rs.getString(13);
            profile_img = profile_img.replaceAll("/home/aditya/PJT/BookShelf/web/", "");
            //out.print("<img src='../"+profile_img+"' />"+dept_name);                        
            %>
            
            <div class="personal-detail">
                <div class="userId"> <%= uid %> </div>
                <input type="hidden" name="issue-user-id" value="<%= uid %>"/>
                    <div class="profile-image">
                        <img class="thumbnail" src="<%= "../"+profile_img %>" alt="profile-image" />
                    </div>
                    <div class="personal-profile">
                            <p class="name"><%= name %></p>
                            <p class="stream"><%= uid %></p>
                            <p class="stream">( <%= dept_name %> )</p>
                            <p class="mobile"> +91-<%= mobile %> </p>
                            <p class="email"> <%= email %> </p>
                            <p class="address"> Admission Date : <%= date %> </p>					
                    </div>
            </div>            
            <div class="current-issue">
                    <div class="fine-detail">
                            <%
                            query = "select title,book_id,datediff(issue_date,due_date) as ex_day ,date_format(due_date,'%D %b %y %h:%m:%s %p') as due_date,thumbnail, date_format(issue_date,'%D %b %y %h:%m:%s %p') as issue_date from issued_book NATURAL JOIN book NATURAL JOIN book_info where user_id=?";
                            ps = connection.prepareStatement(query);
                            ps.setString(1, uid);
                            rs = ps.executeQuery();                        
                            int totalFine = 0;
                            int x = 1;
                            while(rs.next()) {
                                int ex_day = rs.getInt("ex_day");
                                ex_day = ex_day>0 ? ex_day : 0;
                                totalFine += ex_day*x;
                            }
                            String color = totalFine>0 ? "danger" : "success" ;
                            
                            %>
                            <p>Total Fine</p>
                            <p class="<%= color %>"><%= totalFine %>.00</p>
                            <p>Book Allow</p>
                            <p><%= quota %></p>
                            <p>Issued</p>
                            <p><%= issued_book %></p>
                    </div>
                    <div class="issued-book">
                    <div class="title">Issued Book details:</div>
                        <%
                            rs.beforeFirst();
                            while(rs.next()) {   
                                String title = rs.getString("title");
                                String bookid = rs.getString("book_id");
                                String issued_date = rs.getString("issue_date");
                                String due_date = rs.getString("due_date");
                                String thumbnail = rs.getString("thumbnail");
                                int ex_day = rs.getInt("ex_day");
                                ex_day = ex_day>0 ? ex_day : 0;
                        %>
                            <div class="book-item">
                                <img class="thumbnail" src="<%= thumbnail %>" alt="Book Desc" />
                                <br>
                                    <p class="book-title"><%= title %></p>
                                    <div><%= bookid %></div>
                                    <div>Issued On</div>
                                    <div><%= issued_date %></div>
                                    <div>Issued Till</div>
                                    <div><%= due_date %></div>
                                    <div>Extended Days</div>
                                    <div><%= ex_day %></div>
                            </div>					                            
                            <%
                                }
                            %>
                    </div>
            </div>


<%              

        } else {
            out.print("<h1>No result found</h1>");
        }
    }
%>