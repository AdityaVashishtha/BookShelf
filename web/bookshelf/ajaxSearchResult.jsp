<%-- 
    Document   : ajaxSearchResult
    Created on : 18 Mar, 2017, 7:35:54 PM
    Author     : aditya
--%>

<%@page import="com.bookshelf.utillity.SQLConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String q = request.getParameter("squery");
    int limit = Integer.parseInt(request.getParameter("limit"));
    if(q.length() > 0) {
        String query = "select * from book_info where (isbn like ? ) or (title like ? ) or (description like ? ) limit ?, ?;";
        try {
            Connection connection = SQLConnection.createConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "%"+q+"%");
            ps.setString(2, "%"+q+"%");
            ps.setString(3, "%"+q+"%");
            ps.setInt(4,limit);
            ps.setInt(5,limit+10);
            ResultSet rs = ps.executeQuery();              
            while(rs.next()) {
                String title = rs.getString("title");
                String author = rs.getString("author");
                String desc = rs.getString("description");
                if(desc.length() > 200 )
                     desc = desc.substring(0, 200)+" .......more";
                String aut = rs.getString("author");                
                String thumbnail = rs.getString("thumbnail");
                String isbn = rs.getString("isbn");
                String availability = "Not Available";
                query = "SELECT * FROM book NATURAL JOIN book_info WHERE isbn = ? and  book.book_id NOT in (SELECT book_id from issued_book);";
                ps = connection.prepareStatement(query);
                ps.setString(1, isbn);
                ResultSet rs1 = ps.executeQuery();
                boolean isAvailable = rs1.next();
                if(isAvailable) {
                    availability = "Available";                                    
                }                
                if(thumbnail.length() < 1) {
                    thumbnail = "http://imgh.us/books_2.png";
                }
              %>
                <div class="result-line">
                        <h2>
                            <a href=""><%= title %> - <%= author %></a>
                        </h2>
                        <div class="content">
                            <img class="thumbnail" src="<%= thumbnail %>" alt="search result image" />
                                <div class="book-detail">
                                    <div class="tags-details"><%= desc %></div>					
                                        <div class="stream">ISBN :: <%= isbn %></div>
                                        <div class="availabillity <%=  isAvailable %>"><%= availability %></div>						
                                </div>					
                        </div>	
                        <div class="bottom-seprate"></div>			
                </div>
              <%
            }  
            rs.first();
            if(!rs.next()) {
                out.print("No result found");
            }
        } catch (Exception e) {
            out.print(e);
        }
    }
%>