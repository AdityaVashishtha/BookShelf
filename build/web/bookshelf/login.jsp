<%-- 
    Document   : login
    Created on : 13 Mar, 2017, 11:58:59 AM
    Author     : aditya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>welcome, signup-login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="css/style.login.css">
</head>
<body>
	<div class="main-body">
		<div class="input-box">
			<div class="box-title">
				<h2>Login</h2>
			</div>
			<div class="input-form">
                            <form action="../Login" method="post">
				<div class="input-field">
					<input class="input" type="text" name="userid">
					<label class="input-label">
						<span>
							User ID
						</span>
					</label>
				</div>					
				<div class="input-field">
					<input class="input" type="password" name="password">
					<label class="input-label">
						<span>
							Password
						</span>
					</label>
				</div>
				<input class="input-submit" type="submit" name="submit" value="Login">							
				<a href="#">Forgot Password</a>		
				</form>
			</div>
			<div class="input-suggestion">	
				<div class="tip">
					Tips
				</div>	
				<div class="content">
				<ol>
					<li>Valid User Id must contain atleast 8 character.</li>
					<li>Password must contain 8 characters atleast.</li>
					<li>Use special characters for security eg. '@#$'.</li>
					<li>Do not use simple names or word for password eg. 'Johnathan'</li>
				</ol>					
				</div>		
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/validate.js"></script>
</body>
</html>