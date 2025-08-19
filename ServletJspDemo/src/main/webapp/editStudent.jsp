<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="jakarta.servlet.http.*" %>

<%
    HttpSession userSession = request.getSession(false);
    String fullName = (userSession != null) ? (String) userSession.getAttribute("fullnameLogin") : null;
    String emailLogin = (userSession != null) ? (String) userSession.getAttribute("emailLogin") : null;

    if (fullName == null && emailLogin == null) {
%>
    <script>
        alert("Kindly login to do any tasks");
        window.location.href = "login.jsp";
    </script>
<%
    return;
    }

    String studentId = request.getParameter("SID");
    String name = "", adm="",studentClass = "", roll = "", dob = "", fatherName = "", motherName = "", aadhar = "", gender = "";

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yasirDb1", "root", "121Yasir@123");
        PreparedStatement ps = con.prepareStatement("SELECT SNAME,ADMDATE, SCLASS, SROLL, SDOB, FNAME, MNAME, AADHAR, GENDER FROM student WHERE SID=?");
        ps.setString(1, studentId);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            name = rs.getString("SNAME");
            studentClass = rs.getString("SCLASS");
            roll = rs.getString("SROLL");
            adm = rs.getString("ADMDATE");
            dob = rs.getString("SDOB");
            fatherName = rs.getString("FNAME");
            motherName = rs.getString("MNAME");
            aadhar = rs.getString("AADHAR");
            gender = rs.getString("GENDER");
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <link rel="stylesheet" href="editStudentCss.css">
</head>
<body>

    <!-- Top Bar -->
    <div class="top-bar">
        <div class="welcome-message-container">
            <span class="welcome-message">
                Welcome, <%= fullName %> (<%= emailLogin %>)
            </span>
        </div>
        <form action="logoutServlet" method="GET">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>

    <!-- Header -->
    <h1 class="header">INDIAN PUBLIC SCHOOL</h1>

    <!-- Form Card -->
    <div class="form-container">
        <h2 class="form-title">Edit Student</h2>
        
        <form action="updateStudentServlet" method="post">
            <input type="hidden" name="SID" value="<%= studentId %>">

            <label>Name:</label>
            <input type="text" name="name" value="<%= name %>" required>

            <label>Gender:</label>
            <select name="gender" required>
                <option value="Male" <%= gender.equals("Male") ? "selected" : "" %>>Male</option>
                <option value="Female" <%= gender.equals("Female") ? "selected" : "" %>>Female</option>
                <option value="Other" <%= gender.equals("Other") ? "selected" : "" %>>Other</option>
            </select>
			
            <label>Date of Admission:</label>
            <input type="text" name="adm" value="<%= adm %>" required>
            
            <label>Date of Birth:</label>
            <input type="text" name="dob" value="<%= dob %>" required>

            <label>Class:</label>
            <input type="text" name="class" value="<%= studentClass %>" required>

            <label>Roll:</label>
            <input type="text" name="roll" value="<%= roll %>" required>

            <label>Father's Name:</label>
            <input type="text" name="father_name" value="<%= fatherName %>" required>

            <label>Mother's Name:</label>
            <input type="text" name="mother_name" value="<%= motherName %>" required>

            <label>Aadhar Number:</label>
            <input type="text" name="aadhar" value="<%= aadhar %>" required>

            <button type="submit">Update</button>
        </form>
    </div>

</body>
</html>
