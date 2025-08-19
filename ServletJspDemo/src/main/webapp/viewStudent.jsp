<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Students</title>
    <link rel="stylesheet" href="viewStudentsCss.css">
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

    <!-- Header -->
    <h1 class="header">INDIAN PUBLIC SCHOOL</h1>

    <div class="form-container">
        <h2>Student List</h2>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Class</th>
                <th>Roll</th>
                <th>Date of Admission</th>
                <th>Date of Birth</th>
                <th>Gender</th>
                <th>Father's Name</th>
                <th>Mother's Name</th>
                <th>Aadhar Number</th>
                <th>Action</th>
            </tr>

            <%
                String selectedClass = request.getParameter("class");
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yasirDb1", "root", "121Yasir@123");
                    String sql = "SELECT * FROM student WHERE SCLASS = ?";
                    
                    ps = con.prepareStatement(sql);
                    ps.setString(1, selectedClass);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        int studentId = rs.getInt("SID"); 
            %>
                        <tr>
                            <td><%= studentId %></td>
                            <td><%= rs.getString("SNAME") %></td>
                            <td><%= rs.getString("SCLASS") %></td>
                            <td><%= rs.getInt("SROLL") %></td>
                            <td><%= rs.getString("ADMDATE") %></td> <!-- Date of Admission -->
                            <td><%= rs.getString("SDOB") %></td>
                            <td><%= rs.getString("GENDER") %></td>
                            <td><%= rs.getString("FNAME") %></td>
                            <td><%= rs.getString("MNAME") %></td>
                            <td><%= rs.getString("AADHAR") %></td>
                            <td>
                                <a href="editStudent.jsp?SID=<%= studentId %>">
                                    <button class="edit-btn">Edit</button>
                                </a>
                                <a href="deleteStudentServlet?SID=<%= studentId %>" onclick="return confirm('Are you sure you want to delete this student?');">
                                    <button class="delete-btn">Delete</button>
                                </a>
                            </td>
                        </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='11'>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                }
            %>
        </table>
    </div>

</body>
</html>
