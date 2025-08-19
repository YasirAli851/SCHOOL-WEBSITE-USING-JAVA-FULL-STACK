<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="index2.css">
</head>
<body>

    <!-- Logout Button (Positioned outside of the container) -->
    <form action="logoutServlet" method="GET">
        <button type="submit" class="logout-btn">Logout</button>
    </form>

    <!-- Welcome Admin at the Top Left -->
    <div class="welcome-message-container">
        <span class="welcome-message"><% 
        // Access session attribute and display it
        String FullName = (String) session.getAttribute("fullnameLogin");
        String  EmailLogin= (String) session.getAttribute("emailLogin");
        if (FullName != null && EmailLogin !=null) {
            out.println("welcome "+FullName+" "+EmailLogin);
        } else {
        	
        	out.println("<a href=\"login.jsp\" style=\"color: white;\">Session expired, Click Here to login again</a>");

        }
    %> </span>
    </div>

    <!-- Main Container -->
    <div class="container">
        <h1 class="header">INDIAN PUBLIC SCHOOL</h1>

        <div class="cards-container">
         <a href="AssignClass.jsp" class="card-link">
                <div class="card">
                    <h3>Assign class</h3>
                    <p>Assign the classes to the teachers</p>
                    <button type="button" class="card-btn">Click to assign</button>
                </div>
            </a>
            <!-- Create Teacher's Account Card -->
            <a href="createTeacher.jsp" class="card-link">
                <div class="card">
                    <h3>Create Teacher's Account</h3>
                    <p>Manage teacher's accounts by creating new ones.</p>
                    <button type="button" class="card-btn">Create Account</button>
                </div>
            </a>

            <!-- Delete/Update Teacher's Account Card -->
            <a href="selectClass.jsp" class="card-link">
                <div class="card">
                    <h3>Show Students</h3>
                    <p>click on the button to move to show student page</p>
                    <button type="button" class="card-btn">Show Students</button>
                </div>
            </a>

            <!-- Add Students Card -->
            <a href="addStudent.jsp" class="card-link">
                <div class="card">
                    <h3>Add Students</h3>
                    <p>Add new students to the system.</p>
                    <button type="button" class="card-btn">Add Students</button>
                </div>
            </a>

            <!-- Edit Admin Profile Card -->
            <a href="editAdmin.html" class="card-link">
                <div class="card">
                    <h3>Edit Admin Profile</h3>
                    <p>Edit your admin profile details.</p>
                    <button type="button" class="card-btn">Edit Profile</button>
                </div>
            </a>
        </div>
    </div>

</body>
</html>
