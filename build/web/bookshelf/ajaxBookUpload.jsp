<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bookshelf.utillity.SQLConnection"%>
<%@page import="java.sql.Connection"%>
<div class="input-box book-upload-box">
    <div class="box-title">
            <h2>Book Upload</h2>
    </div>
    <div class="input-form">    
        <div class="input-field">                        
            <input class="input" type="text" name="fname" placeholder="ISBN 13" required="" maxlength="100">
        </div>					                   
        <input id="fetch_book" class="input-submit" type="submit" name="register" value="Fetch">							
    </div>
    <div class="input-suggestion">	            	
            <div class="content">
            <form action="../UploadBook" method="GET">
                <%
                    Connection con = SQLConnection.createConnection();
                    String query = "select max(book_id) from book;";
                    PreparedStatement ps = con.prepareStatement(query);
                    ResultSet rs = ps.executeQuery();
                    String bookid = "";
                    int bid=0;
                    if(rs.next()) {
                        bid = rs.getInt(1);
                        bookid = "" + (bid+1) ;
                    }
                %>
                    <input class="input" type="hidden" name="isbn" >
                    <div class="input-field">                       
                        <input class="input" type="text" name="bookid" placeholder="Book Id" value="<%= bookid %>" required="" maxlength="100">
                    </div>
                    <div class="input-field">                       
                        <input class="input" type="text" name="title" placeholder="Title" required="" maxlength="100">
                    </div>
                
                    <div class="input-field">
                        <input class="input" type="text" name="author" placeholder="Author" required="" maxlength="100">
                    </div>
                
                    <div class="input-field">
                        <input class="input" type="text" name="publisher" placeholder="Publisher" required="" maxlength="100">
                    </div>
                
                    <div class="input-field">
                        <textarea class="input" type="text" name="desc" placeholder="description" required=""  maxlength="500"></textarea>
                    </div>
                    
                    <div class="input-field">
                        <input class="input" type="text" name="date" placeholder="date" required="" maxlength="20">
                    </div>
                    
                    <div class="input-field">
                        <input class="input" type="number" name="page" placeholder="page count" required="" maxlength="5">
                    </div>
                    
                    <div class="input-field">
                        <input class="input" type="text" name="thumbnail" placeholder="thumbnail url" required="" maxlength="150">
                    </div>
                    
                    <input class="input-submit" type="submit" name="register" value="Upload">							
            </form>					
            </div>		
    </div>
</div>