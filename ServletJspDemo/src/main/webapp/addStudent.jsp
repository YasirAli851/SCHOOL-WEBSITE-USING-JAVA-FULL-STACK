<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="studentRegisterCss.css">
</head>
<body>
<div class="welcome-message-container">
        <span class="welcome-message"><%
    String fullName = (String) session.getAttribute("fullnameLogin");
    String emailLogin = (String) session.getAttribute("emailLogin");

    if (fullName == null && emailLogin == null) {
	%>
    <script>
        alert("Kindly login to do any tasks");
        setTimeout(function() {
            window.location.href = "login.jsp";
        }); // Redirects after 2 seconds
    </script>
	<%
    }
	%>
 </span>
</div>

 <div class="top-bar">
        <div class="welcome-message">
            <% 
                String FullName = (String) session.getAttribute("fullnameLogin");
                String EmailLogin = (String) session.getAttribute("emailLogin");
                if (FullName != null && EmailLogin != null) {
                    out.println("Welcome, " + FullName + " " + EmailLogin);
                } else {
                    out.println("<a href=\"login.jsp\" class=\"session-expired\">Session expired, Click Here to login again</a>");
                }
            %>
        </div>
        
        <!-- Logout Button -->
        <form action="logoutServlet" method="GET">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

    <!-- Header -->
    <h1 class="header">INDIAN PUBLIC SCHOOL</h1>

    <!-- Form Container -->
    <div class="form-container">
        <h2>Student Registration</h2>
        <form action="studentRegisterServlet" method="POST">
         	<label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        	<label for="adm">Date of admission:</label>
            <input type="text" id="adm" name="adm" required>

            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="">Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>

            <label for="dob">Date of Birth:</label>
            <input type="text" id="dob" name="dob" required>

            <label for="class">Class:</label>
            <input type="text" id="class" name="class" required>

            <label for="roll">Roll:</label>
            <input type="number" id="roll" name="roll" required>

            <label for="father-name">Father's Name:</label>
            <input type="text" id="father-name" name="father_name" required>

            <label for="mother-name">Mother's Name:</label>
            <input type="text" id="mother-name" name="mother_name" required>

            <label for="aadhar">Aadhar Number:</label>
            <input type="text" id="aadhar" name="aadhar" required>

            <button type="submit" class="submit-btn">Submit</button>
        </form>
    </div>

</body>
</html>