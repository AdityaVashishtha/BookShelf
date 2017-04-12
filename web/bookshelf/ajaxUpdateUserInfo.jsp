<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bookshelf.utillity.SQLConnection"%>
<%@page import="java.sql.Connection"%>
<div class="input-box book-upload-box">
    <div class="box-title">
            <h2>Update User Info</h2>
    </div>
    <div class="input-form">    
        <div class="input-field">                        
            <input class="input" type="text" name="uid" placeholder="User Id" required="" maxlength="100">
        </div>					                   
        <input id="fetch_user_info" class="input-submit" type="submit" name="register" value="Fetch">							
    </div>
    <div class="input-suggestion">	            	
            <div class="content">
            <form action="../UpdateUserInfo" method="POST">                
                    <input class="input" type="hidden" name="isbn" >
                    <div class="input-field">                       
                        <input class="input" type="text" name="fname" placeholder="Full Name" required="" maxlength="100">
                    </div>                                   
                    <div class="input-field">
                        <input class="input" type="number" name="mobile" placeholder="Mobile" required="" maxlength="10">						
                    </div>
                
                    <div class="input-field">
                        <input class="input" type="email" name="email" placeholder="Email" required="" >						
                    </div>                
                    <div class="input-field">
                        <select class="input" name="dept">
                                <%
                                    Connection connection = SQLConnection.createConnection();
                                    String query = "select * from department;";
                                    PreparedStatement ps = connection.prepareStatement(query);
                                    ResultSet rs  = ps.executeQuery();
                                    while(rs.next()) {
                                        out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>");
                                    }
                                %>
                            </select>
                    </div>
                    
                    <div class="input-field">
                        <select class="input" name="quota">                               
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>                            
                            <option value="8">8</option>                            
                        </select>
                    </div>                                        
                    <input class="input-submit" type="submit" name="register" value="Update">							
            </form>					
            </div>		
    </div>
</div>