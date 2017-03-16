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
            profile_img = profile_img.replaceAll("/home/aditya/PJT/BookShelf/", "");
            //out.print("<img src='../"+profile_img+"' />"+dept_name);
            %>
            
            <div class="personal-detail">
                <div class="userId"> <%= uid %> </div>
                <input type="hidden" name="issue-book-id" value="<%= uid %>"/>
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
                            <p>Total Fine</p>
                            <p>4.00</p>
                            <p>Book Allow</p>
                            <p><%= quota %></p>
                            <p>Issued</p>
                            <p><%= issued_book %></p>
                    </div>
                    <div class="issued-book">
                    <div class="title">Issued Book details:</div>
                            <div class="book-item">
                                    <img src="images/icon/agenda.png" alt="Book Desc" />
                                    <p class="book-title">Book 1</p>
                                    <div>Issued On</div>
                                    <div>17 Feb 2016 04:54 PM</div>
                                    <div>Issued Till</div>
                                    <div>16 Mar 2016 04:54 PM</div>
                                    <div>Extended Days</div>
                                    <div>7</div>
                            </div>					
                            <div class="book-item">
                                    <img src="images/icon/agenda(1).png" alt="Book Desc" />
                                    <p class="book-title">Book 2</p>
                                    <div>Issued On</div>
                                    <div>17 Feb 2016 04:54 PM</div>
                                    <div>Issued Till</div>
                                    <div>16 Mar 2016 04:54 PM</div>
                                    <div>Extended Days</div>
                                    <div>7</div>
                            </div>
                    </div>
            </div>


<%
        } else {
            out.print("<h1>No result found</h1>");
        }
    }
%>