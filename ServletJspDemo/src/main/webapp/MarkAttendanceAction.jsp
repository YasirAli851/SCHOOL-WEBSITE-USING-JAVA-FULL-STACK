<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mark Attendance</title>
<link rel="stylesheet" href="MarkAttendanceActionCss.css">
</head>
<body>

<div class="container">
    <h2>Mark Attendance</h2>

    <%
        String sname = request.getParameter("studentName"); 
        String sclass = request.getParameter("studentClass");
        String sid = request.getParameter("studentId");
    %>

    <!-- Date Picker -->
    <div class="date-section">
        <label for="doa">Select Date:</label>
        <input type="date" name="doa" id="doa">
    </div>

    <!-- Attendance Table -->
    <form action="markAttendanceServlet" method="post">
    <table class="attendance-table">
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Class</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= sid %></td>
                <td><%= sname %></td>
                <td><%= sclass %></td>
                <td>
                    <label>
                        <input type="radio" name="attendanceStatus" value="Present" required> Present
                    </label>
                    <label>
                        <input type="radio" name="attendanceStatus" value="Absent"> Absent
                    </label>
                    <input type="hidden" name="studentId" value="<%= sid %>">
                    <input type="hidden" name="studentName" value="<%= sname %>">
                    <input type="hidden" name="studentClass" value="<%= sclass %>">
                    <input type="hidden" name="attendanceDate" id="hiddenDate">
                </td>
            </tr>
        </tbody>
    </table>

    <div class="submit-section">
        <button type="submit" class="submit-btn">Submit Attendance</button>
    </div>
    </form>
</div>

<script>
// Set hidden date value when form submits
document.querySelector('form').addEventListener('submit', function() {
    document.getElementById('hiddenDate').value = document.getElementById('doa').value;
});
</script>

</body>
</html>
