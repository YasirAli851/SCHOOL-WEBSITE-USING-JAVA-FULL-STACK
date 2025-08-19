<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome teacher</title>
<link rel="stylesheet" href="teacherCss.css">
</head>
<body>
    <!-- Logout Form -->
    <form action="logoutServlet" method="GET">
        <button type="submit" class="logout-btn">Logout</button>
    </form>

    <div class="welcome-message-container">
        <span class="welcome-message">
        <% 
        // Access session attribute and display it
        String FullName = (String) session.getAttribute("fullnameLogin");
        String  EmailLogin= (String) session.getAttribute("emailLogin");
        if (FullName != null && EmailLogin != null) {
            out.println("Welcome " + FullName + " (" + EmailLogin + ")");
        } else {
            out.println("<a href=\"login.jsp\" style=\"color: white;\">Session expired, Click Here to login again</a>");
        }
        %>
        </span>
    </div>

    <div id="teacherLoginSuccess">
        <h1>Logged in as teacher successfully</h1>
    </div>

    <!-- Form for Mark Attendance -->
    <form action="MarkAttendance.jsp" method="GET">
        <input type="hidden" name="NameTeacher" value="<%= FullName %>">
        <div class="card">
            <h3>Mark Attendance</h3>
            <p>Click to see the students that are assigned to you!</p>
            <button type="submit" class="card-btn">Click to mark attendance</button>
        </div>
    </form>
</body>
</html>
