<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Teacher List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px 15px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #f5f5f5;
        }
        button {
            padding: 6px 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: #45a049;
        }
        h2 {
            text-align: center;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<h2>Teacher List</h2>

<table>
    <thead>
        <tr>
            <th>Teacher Name</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver"); // Load MySQL JDBC Driver
                con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/yasirDb1", "root", "121Yasir@123"
                );
                stmt = con.createStatement();
                String sql = " SELECT * from userInfo where usertype='Teacher' "; // Change table/column names if needed
                rs = stmt.executeQuery(sql);
                
                while (rs.next()) {
                   	String TeacherName = rs.getString("FULLNAME");
        %>
        <tr>
            <td><%= TeacherName	 %></td>
            <td>
                <form action="asncls.jsp" method="post">
                    <input type="hidden" name="TeacherName" value="<%= TeacherName %>">
                    <button type="submit">Assign/Change Class</button>
                </form>
            </td>
        </tr>
        <%
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>");
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) {}
                if (stmt != null) try { stmt.close(); } catch (Exception e) {}
                if (con != null) try { con.close(); } catch (Exception e) {}
            }
        %>
    </tbody>
</table>

</body>
</html>
