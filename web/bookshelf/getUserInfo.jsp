<%@page import="java.sql.ResultSet"%>
<%@page import="com.bookshelf.utillity.SQLConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
    String userId = request.getParameter("query");
    String query = "SELECT name, email, mobile, quota, dept_name,dept_id FROM `user_profile` NATURAL JOIN department WHERE user_id=?";
    Connection connection = SQLConnection.createConnection();
    PreparedStatement ps = connection.prepareStatement(query);
    ps.setString(1, userId);
    ResultSet rs = ps.executeQuery();
    String name = "";
    String mobile = "";
    String email = "";
    String dept_id = "";
    String dept_name = "";
    int quota = 0;
    if(rs.next()) {
        name = rs.getString("name");
        mobile = rs.getString("mobile");
        email = rs.getString("email");
        dept_id = rs.getString("dept_id");
        dept_name = rs.getString("dept_name");
        quota = rs.getInt("quota");
    }
%>

<div class="content">
            <form action="../UpdateUserInfo" method="POST">                
                    <input class="input" type="hidden" name="uid" value="<%= userId %>" >
                    <div class="input-field">                       
                        <input class="input" type="text" name="fname" placeholder="Full Name" value="<%= name %>" required="" maxlength="100">
                    </div>                    
                    <div class="input-field">
                        <input class="input" type="number" name="mobile" placeholder="Mobile" value="<%= mobile %>" required="" maxlength="10">						
                    </div>
                
                    <div class="input-field">
                        <input class="input" type="email" name="email" placeholder="Email" value="<%= email %>" required="" >						
                    </div>                                                        
                    <div class="input-field">
                        <select class="input" name="dept">
                            <option value="<%= dept_id %>"><%= dept_name %> </option>
                                <%                                    
                                    query = "select * from department;";
                                    ps = connection.prepareStatement(query);
                                    rs  = ps.executeQuery();
                                    while(rs.next()) {
                                        out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>");
                                    }
                                %>
                            </select>
                    </div>
                    
                    <div class="input-field">
                        <select class="input" name="quota">       
                            <option value="<%= quota %>"><%= quota %> </option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>                            
                            <option value="8">8</option>                            
                        </select>
                    </div>                                        
                    <input class="input-submit" type="submit" name="update_user_info" value="Update">							
            </form>					
            </div>