<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Attendance Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .table-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .status-present {
    		color: #2e7d32 !important; /* dark green */
		}
        .status-absent {
    		color: #d32f2f !important; /* dark red */
		}
        .btn-yellow {
            background-color: #fbc02d;
            color: #212529;
            border: none;
        }
        .btn-yellow:hover {
            background-color: #f9a825;
            color: #fff;
        }
    </style>
</head>
<body>

<div class="table-container">
    <h3 class="text-center mb-4">Attendance Result</h3>

    <%
        Boolean notfound = (Boolean) request.getAttribute("notfound");
        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
        <div class="alert alert-danger"><%= error %></div>
    <% } else if (notfound != null && notfound) { %>
        <div class="alert alert-warning">No attendance record found for the selected date.</div>
    <% } else { %>
        <table class="table table-bordered text-center">
            <tr>
                <th>Name</th>
                <td><%= request.getAttribute("sname") %></td>
            </tr>
            <tr>
                <th>Roll</th>
                <td><%= request.getAttribute("sroll") %></td>
            </tr>
            <tr>
                <th>Class</th>
                <td><%= request.getAttribute("sclass") %></td>
            </tr>
            <tr>
                <th>Date</th>
                <td><%= request.getAttribute("date") %></td>
            </tr>
            <tr>
                <th>Status</th>
               <% String status = ((String) request.getAttribute("status")).trim(); %>
			 <td class="<%= "Present".equalsIgnoreCase(status) ? "status-present" : "status-absent" %>" style="font-weight: bold;">
               <%= status %>
               </td>
            </tr>
        </table>
    <% } %>

    <div class="text-center mt-3">
        <a href="studentAction.jsp" class="btn btn-yellow">Back to Dashboard</a>
    </div>
</div>

</body>
</html>
