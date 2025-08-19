<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create teacher's account</title>
<link rel="stylesheet" href="registerTeacherCss.css">
</head>
<body>
<div class="welcome-message-container">
        <span class="welcome-message">
            <%
                String fullName = (String) session.getAttribute("fullnameLogin");
                String emailLogin = (String) session.getAttribute("emailLogin");
                if (fullName == null && emailLogin == null) {
            %>
            <script>
                alert("Kindly login to do any tasks");
                setTimeout(function() {
                    window.location.href = "login.jsp";
                });
            </script>
            <%
                }
            %>
        </span>
    </div>

    <!-- Logout and Welcome Message -->
    <div class="top-bar">
        <div class="welcome-message-container">
            <span class="welcome-message">
                <% 
                    if (fullName != null && emailLogin != null) {
                        out.println("Welcome " + fullName + " (" + emailLogin + ")");
                    } else {
                        out.println("<a href='login.jsp' style='color: white;'>Session expired, Click Here to login again</a>");
                    }
                %>
            </span>
        </div>
        <div>
            <span>
                <%-- <% 
                    if (fullName != null && emailLogin != null) {
                        out.println("Welcome " + fullName + " (" + emailLogin + ")");
                    } else { --%>
                    <a href='welcomeAdmin.jsp' style='color: yellow;'>HOME PAGE</a>
  
            </span>
        </div>
        <form action="logoutServlet" method="GET">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>
<div class="header-container">
    <h1>Indian Public School</h1>
</div>

<!-- Main Registration Form Container -->
<div class="container">

    <!-- Register Section -->
    <div id="div3">
        <h1>Register here!</h1>
        <form action="registerTeacherServlet" method="post" class="login-form">
            <h2>Select user type</h2>
            
            <!-- User Type Selection (Dropdown) -->
            <label for="usertype">User Type</label><br>
            <select name="usertype" id="usertype">
                <option value="Teacher">Teacher</option>
            </select>
            <br><br>
            
            <!-- Full Name -->
            <label for="fullname">Full Name</label><br>
            <input type="text" name="fullname" id="fullname" placeholder="Enter your full name">
            <br>
            
            <!-- Gender Selection (Dropdown) -->
            <label for="gender">Gender</label><br>
            <select name="gender" id="gender">
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
            <br><br>
            
            <!-- Mobile Number -->
            <label for="mobile">Mobile</label><br>
            <input type="text" name="mobile" id="mobile" placeholder="Enter your mobile">
            <br>
            
            <!-- Email -->
            <label for="email">Email</label><br>
            <input type="text" name="email" id="email" placeholder="Enter your email">
            <br>
            
            <!-- Password -->
            <label for="password">Password</label><br>
            <input type="password" name="password" id="password" placeholder="Enter password">
            <br><br>
            
            <!-- Submit Button -->
            <input type="submit" value="Click to Register">
        </form>
        <br>
    </div>
</div>
</body>
</html>