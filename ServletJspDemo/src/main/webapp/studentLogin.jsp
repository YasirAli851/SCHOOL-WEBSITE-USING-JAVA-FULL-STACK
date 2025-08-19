<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login</title>

<!-- Include Bootstrap for ALERT only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f7fa; /* light grey background */
        margin: 0;
        padding: 0;
    }

    .alert-container {
        width: 100%;
        padding: 10px 0;
        text-align: center;
    }

    .page-container {
        height: calc(100vh - 60px); /* Full height minus alert height */
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .login-container {
        background-color: white;
        width: 400px;
        padding: 40px 30px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        text-align: center;
    }

    .main-heading {
        font-size: 26px;
        font-weight: bold;
        color: #2e7d32;
        margin-bottom: 20px;
    }

    .form-control {
        width: 100%;
        padding: 12px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }

    .btn-submit {
        width: 100%;
        background-color: #4caf50; /* Light green button */
        color: white;
        border: none;
        padding: 12px;
        font-size: 18px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn-submit:hover {
        background-color: #43a047;
    }
</style>

</head>
<body>

<!-- Bootstrap Alert at very top -->
<%
    String alertMessage = (String) request.getAttribute("alertMessage");
    if (alertMessage != null) {
%>
    <div class="alert alert-danger text-center alert-container" role="alert">
        <%= alertMessage %>
    </div>
<%
    }
%>

<!-- Page flex container -->
<div class="page-container">
    <!-- Login Box -->
    <div class="login-container">
        <div class="main-heading">
            Student Login
        </div>

        <form action="loginStudentServ" method="post">
            <input type="text" name="studentId" class="form-control" placeholder="Student ID" required>
            <input type="text" name="studentClass" class="form-control" placeholder="Student Class" required>
            <input type="text" name="rollNumber" class="form-control" placeholder="Roll Number" required>

            <button type="submit" class="btn-submit">Login</button>
        </form>
    </div>
</div>

</body>
</html>
