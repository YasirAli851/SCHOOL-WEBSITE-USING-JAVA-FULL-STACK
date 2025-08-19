<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hi, Please Verify Your OTP</title>
    <link rel="stylesheet" href="otpCss.css">
</head>
<body>

<!-- Header Section -->
<div class="header-container">
    <h1>Indian Public School</h1>
</div>

<!-- OTP Form Section -->
<div class="container">
    <div id="otpvalid">
        <h1>Verify Your OTP Please!</h1>
        <form action="OtpSuccess" method="POST" class="login-form">
            <label for="otp">Please Enter The OTP Below</label><br><br>
            <input type="text" id="otp" name="otp" required><br><br>
            <input type="submit" value="Click to Validate">
        </form>
    </div>
</div>

</body>
</html>
