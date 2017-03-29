<%-- 
    Document   : ajaxSearchSuggestion
    Created on : 18 Mar, 2017, 12:08:51 AM
    Author     : aditya
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bookshelf.utillity.SQLConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    String q = request.getParameter("squery");
    if(q.length() > 2) {
        String query = "select title,isbn from book_info where (isbn like ? ) or (title like ? ) or (description like ? ) limit 4;";
        try {
            Connection connection = SQLConnection.createConnection();
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "%"+q+"%");
            ps.setString(2, "%"+q+"%");
            ps.setString(3, "%"+q+"%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
              out.print("<li><a>"+ rs.getString("title") +"</a></li>");
            }
        } catch (Exception e) {
            out.print(e);
        }
    }
%>