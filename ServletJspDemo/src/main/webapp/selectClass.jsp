<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Students</title>
    <link rel="stylesheet" href="selectClassCss.css">
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

    <!-- Logout Button -->
    <form action="logoutServlet" method="GET" class="logout-form">
        <button type="submit" class="logout-btn">Logout</button>
    </form>

    <!-- Welcome Message -->
    <div class="welcome-message-container">
        <span class="welcome-message"><% 
            String FullName = (String) session.getAttribute("fullnameLogin");
            String EmailLogin = (String) session.getAttribute("emailLogin");
            if (FullName != null && EmailLogin != null) {
                out.println("Welcome " + FullName + " " + EmailLogin);
            } else {
                out.println("<a href='login.jsp' style='color: white;'>Session expired, Click Here to login again</a>");
            }
        %></span>
    </div>

    <!-- Header -->
    <h1 class="header">INDIAN PUBLIC SCHOOL</h1>

    <!-- Form Container -->
    <div class="form-container">
        <h2>Select Class to View Students</h2>
        <form action="viewStudent.jsp" method="POST">
            <label for="class">Select Class:</label>
            <select id="class" name="class" required>
                <option value="">Select Class</option>
                <option value="Nursery">Nursery</option>
                <option value="KG">KG</option>
                <option value="Prep">Prep</option>
                <option value="1">Class 1</option>
                <option value="2">Class 2</option>
                <option value="3">Class 3</option>
                <option value="4">Class 4</option>
                <option value="5">Class 5</option>
                <option value="6">Class 6</option>
                <option value="7">Class 7</option>
            </select>

            <button type="submit" class="submit-btn">View Students</button>
        </form>
    </div>

</body>
</html>
