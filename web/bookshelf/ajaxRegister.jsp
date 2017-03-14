<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bookshelf.utillity.SQLConnection"%>
<%@page import="java.sql.Connection"%>
<div class="input-box register-box">
    <div class="box-title">
            <h2>Registration</h2>
    </div>
    <div class="input-form">
        <form action="../Register" method="POST" enctype="multipart/form-data" onsubmit="checkEveryThing(this.id)">
                    <div class="input-field">
                        <label class="input-label">
                                    <span>
                                            Full Name
                                    </span>
                        </label>
                        <input class="input" type="text" name="fname" placeholder="Full Name" required="" maxlength="100">

                    </div>					
                    <div class="input-field">
                            <label class="input-label">
                                    <span>
                                            User-id
                                    </span>
                            </label>
                        <input class="input" type="text" name="uid" placeholder="User Id" required="" maxlength="10">						
                    </div>
                    <div class="input-field">
                            <label class="input-label">
                                    <span>
                                            Address
                                    </span>
                            </label>
                        <input class="input" type="text" name="address" placeholder="Address" required="true" maxlength="100">						
                    </div>
                    <div class="input-field">
                            <label class="input-label">
                                    <span>
                                            Mobile
                                    </span>
                            </label>
                        <input class="input" type="number" name="mobile" placeholder="Mobile" required="" maxlength="10">						
                    </div>
                    <div class="input-field">
                            <label class="input-label">
                                    <span>
                                            Email
                                    </span>
                            </label>
                        <input class="input" type="email" name="email" placeholder="Email" required="" >						
                    </div>  
                <div class="input-field">
                            <label class="input-label">
                                    <span>
                                            Enrollement Date
                                    </span>
                            </label>
                            <input class="input" type="date" name="date" placeholder="dd/mm/yyyy" required="" >						
                    </div> 
                    <div class="input-field">
                            <label class="input-label">
                                    <span>
                                            User Type
                                    </span>
                            </label>
                        <select class="input" name="user_type">
                                <option value="student">Student</option>
                                <option value="staff">Staff</option>
                                <option value="faculty">Faculty</option>
                                <option value="admin">Admin</option>                                
                            </select>
                    </div> 
                    <div class="input-field">
                            <label class="input-label">
                                    <span>
                                            Department
                                    </span>
                            </label>
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
                            <label class="input-label">
                                    <span>
                                            Book Quota
                                    </span>
                            </label>
                            <select class="input" name="quota">                               
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>                            
                                <option value="8">8</option>                            
                            </select>
                    </div> 
                    <div class="input-field">
                            <label class="input-label">
                                    <span>
                                            Upload Photo
                                    </span>
                            </label>
                            <input class="input" type="file" name="image">						
                    </div>

                    <input class="input-submit" type="submit" name="register" value="Register">							
            </form>
    </div>
    <div class="input-suggestion">	
            <div class="tip">
                    Details Required
            </div>	
            <div class="content">
            <ol>

            </ol>					
            </div>		
    </div>
</div>