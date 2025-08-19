<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>

<!-- Bootstrap for better buttons and styling -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f7fa; /* light grey background */
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .dashboard-container {
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        padding: 40px;
        width: 600px;
        text-align: center;
    }

    .header {
        font-size: 26px;
        font-weight: bold;
        color: #2e7d32;
        margin-bottom: 10px;
    }

    .sub-header {
        font-size: 20px;
        font-weight: normal;
        color: #4b4b4b;
        margin-bottom: 30px;
    }

    .logout-btn {
        background-color: #ff4d4d;
        border: none;
        color: white;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
        margin-top: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .logout-btn:hover {
        background-color: #e60000;
    }

    .welcome-message {
        font-size: 20px;
        color: #333333;
        margin-bottom: 20px;
    }

    .attendance-form input[type="date"],
    .attendance-form input[type="submit"] {
        width: 100%;
        margin-bottom: 15px;
    }

    .attendance-form input[type="submit"] {
        background-color: #4caf50; /* Light green button */
        border: none;
        color: white;
        padding: 12px;
        font-size: 18px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .attendance-form input[type="submit"]:hover {
        background-color: #43a047; /* slightly darker on hover */
    }

    .session-expired {
        font-size: 18px;
        color: red;
        margin-top: 20px;
    }

    a {
        color: #2e7d32;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<div class="dashboard-container">
    <div class="header">
        Indian Public School
    </div>
    <div class="sub-header">
        Student Dashboard
    </div>

    <div class="welcome-message">
        <% 
            String FullName = (String) session.getAttribute("nameofstudent");
            String sid = (String) session.getAttribute("idofstudent");
            String sclass = (String) session.getAttribute("classofstudent");
            String sroll = (String) session.getAttribute("rollofstudent");
            if (FullName != null && sid != null && sroll != null) {
                out.println("Welcome " + FullName + "! (ID: " + sid + ", Roll: " + sroll + ", Class: " + sclass + ")");
            } else {
        %>
                <div class="session-expired">
                    Session expired. <a href="login.jsp">Click Here to login again</a>
                </div>
        <% 
            }
        %>
    </div>

    <!-- Attendance Checking Form -->
    <div class="attendance-form">
        <form action="checkAttendanceServlet" method="post">
            <input type="date" name="attdatecheck" id="attdatecheck" required>
             <input type="hidden" name="studentId" value="<%= sid %>">
             <input type="hidden" name="studentName" value="<%= FullName %>">
             <input type="hidden" name="studentClass" value="<%= sclass %>">
             <input type="hidden" name="studentRoll" value="<%= sroll %>">
            <input type="submit" value="Check Attendance">
        </form>
    </div>

    <form action="logoutServlet" method="GET">
        <button type="submit" class="logout-btn">Logout</button>
    </form>

</div>

</body>
</html>
