<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Indian Public School - Login</title>
   <!-- Link to external CSS file -->
   <link rel="stylesheet" href="loginCss.css">
</head>
<body>

<% 
    // Retrieve the alert message from the request attributes
    String alertMessage = (String) request.getAttribute("alertMessage");
    if (alertMessage != null) {
%>

    <!-- Custom Modal for the alert -->
    <div id="myModal" class="modal" style="display: none; position: fixed; z-index: 1; left: 0; top: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.4); padding-top: 60px;">
    <div class="modal-content" style="background-color: white; margin: 5% auto; padding: 20px; border-radius: 10px; width: 80%; max-width: 400px;">
        <span class="close" style="color: #aaa; float: right; font-size: 28px; font-weight: bold;">&times;</span>
        <p style="color: black;"><%= alertMessage %></p> <!-- Set the text color of the alert message to black -->
    </div>
	</div>

    <script type="text/javascript">
        var modal = document.getElementById("myModal");
        var span = document.getElementsByClassName("close")[0];

        window.onload = function() {
            modal.style.display = "block";
        };

        span.onclick = function() {
            modal.style.display = "none";
        };

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        };
    </script>
<%
    }
%>

<div class="container">
    <div class="header">
        <h1>Welcome to Indian Public School</h1>
    </div>

    <div class="login-form">
        <h2>Login to your account</h2>
        
        <form action="loginServlet" method="post">
            <label for="usertype">Select User Type</label>
            <select name="usertype" id="usertype">
                <option value="admin">Admin</option>
                <option value="Teacher">Teacher</option>
            </select>
            
            <label for="uname">Username</label>
            <input type="text" name="uname" id="uname" placeholder="Enter your username" required>

            <label for="pwd">Password</label>
            <input type="password" name="pwd" id="pwd" placeholder="Enter your password" required>

            <input type="submit" value="Login">

        </form>
        <br>
        <a href="register.jsp">New User? Click to register as an Admin</a>
        <br>
        <a href="studentLogin.jsp">Are you a student? Click here to login</a>
    </div>
</div>

</body>
</html>
