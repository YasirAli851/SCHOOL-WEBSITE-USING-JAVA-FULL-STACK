<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mark Attendance</title>
    <link rel="stylesheet" href="MarkAttendance.css">
</head>
<body>
    <% 
        String TeacherName = request.getParameter("NameTeacher"); // Get the teacher's name from the request
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        String classAssigned = "";  // Declare variable to hold class info
        String teacherId = "";      // Declare variable to hold teacher's ID
        
        try {
            // Step 1: Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Step 2: Establish the database connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yasirDb1", "root", "121Yasir@123");
            
            // Step 3: Create a statement object
            stmt = con.createStatement();
            
            // Step 4: Execute the SQL query to fetch teacher details based on teacher name
            String query = "SELECT * FROM classTeacher WHERE TNAME = '" + TeacherName + "'";
            rs = stmt.executeQuery(query);
            
            // Step 5: Process the result set
            if (rs.next()) {
                teacherId = rs.getString("TID"); // Get Teacher ID
                classAssigned = rs.getString("CLASS"); // Get Class assigned to the teacher
            } else {
                teacherId = "Not Found"; // If no record found
                classAssigned = "Not Assigned"; // If no class assigned
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage()); // Print error message if any exception occurs
        }
    %>

    <!-- Teacher Details Table -->
    <h2>Teacher Details</h2>
    <table class="teacher-table">
        <tr>
            <th>Teacher Name</th>
            <th>Teacher ID</th>
            <th>Class Assigned</th>
        </tr>
        <tr>
            <td><%= TeacherName %></td>
            <td><%= teacherId %></td>
            <td><%= classAssigned %></td>
        </tr>
    </table>

    <% 
    // Fetch and display students details based on class assigned to the teacher
    Connection con1 = null;
    Statement stmt1 = null;
    ResultSet rs1 = null;
    
    try {
        con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/yasirDb1", "root", "121Yasir@123");   
        stmt1 = con1.createStatement();
        String query = "SELECT * FROM student WHERE SCLASS = '" + classAssigned + "'";
        rs1 = stmt1.executeQuery(query);
    %>

    <!-- Student Details Table -->
    <h2>Students Assigned to <%= classAssigned %></h2>
    <table class="student-table">
        <tr>
            <th>Student Name</th>
            <th>Student ID</th>
            <th>Class</th>
            <th>Action</th>
        </tr>
        <% 
        // Iterate through the result set and display student details
        while(rs1.next()) {
            String studentName = rs1.getString("SNAME");
            String studentClass = rs1.getString("SCLASS");
            String studentId = rs1.getString("SID");
        %>
        <tr>
            <td><%= studentName %></td>
            <td><%= studentId %></td>
            <td><%= studentClass %></td>
            <td>
          	<form action="MarkAttendanceAction.jsp" method="POST" style="display:inline;">
            <input type="hidden" name="studentId" value="<%= studentId %>">
            <input type="hidden" name="studentName" value="<%= studentName %>">
            <input type="hidden" name="studentClass" value="<%= studentClass %>">
            <button type="submit" class="mark-attendance-btn">Mark Attendance</button>
        </form>
            </td>
        </tr>
        <% 
        } // End of while loop
    } catch (Exception e) {
        out.println("Error: " + e.getMessage()); // Print error message if any exception occurs
    } finally {
        try {
            if (rs1 != null) rs1.close();
            if (stmt1 != null) stmt1.close();
            if (con1 != null) con1.close();
        } catch (SQLException e) {
            out.println("Error closing resources: " + e.getMessage());
        }
    }
    %>
    </table>

</body>
</html>
