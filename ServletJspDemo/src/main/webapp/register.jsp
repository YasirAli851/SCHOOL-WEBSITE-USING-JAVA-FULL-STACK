<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="registerCss.css"> <!-- Link to external CSS file -->
</head>
<body>

<!-- Welcome Message at the Top -->
<div class="header-container">
    <h1>Indian Public School</h1>
</div>

<!-- Main Registration Form Container -->
<div class="container">

    <!-- Register Section -->
    <div id="div3">
        <h1>Register here!</h1>
        <form action="registerServlet" method="post" class="login-form">
            <h2>Select user type</h2>
            
            <!-- User Type Selection (Dropdown) -->
            <label for="usertype">User Type</label><br>
            <select name="usertype" id="usertype">
                <option value="admin">Admin</option>
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
