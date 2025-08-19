<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Details</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #f0f4f7, #d9e2ec);
        height: 100vh;
        margin: 0;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .card {
        background: white;
        padding: 40px 60px;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        text-align: center;
    }
    h1 {
        color: #333;
        font-size: 28px;
    }
</style>
</head>
<body>

<%
    String TName = request.getParameter("TeacherName");
%>

<div class="card">
    <h3>Class is Being assigned to: <%= TName %></h3>
    <br>
    <form action="classAssignServlet" method="post">
     <h3>Please enter the class to assign</h3>
     <input type="text" name="classtoteacher" id="classtoteacher">
     <input type="hidden" name="TeacherName" value="<%= TName %>">
     <input type="submit" value="click to assign">
    </form>
    
</div>


</body>
</html>
