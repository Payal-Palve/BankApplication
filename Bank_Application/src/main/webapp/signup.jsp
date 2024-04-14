<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="pojo.Account" %>
<%@ page import="dao.DaoAccount" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Confirmation</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<style>
    body {
        background-color: #f8f9fa;
    }
    .confirmation-box {
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        padding: 30px;
    }
    h2, h4 {
        color: #007bff;
    }
    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }
    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #0056b3;
    }
</style>
</head>
<body>
<jsp:useBean id="obj2" class="pojo.Account" scope="session"></jsp:useBean>
<jsp:useBean id="dao" class="dao.DaoAccount" scope="session"></jsp:useBean>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6 text-center confirmation-box">
            <h2>Registration Confirmation</h2>
            <p>Your registration is done successfully!</p>
            <hr>
            <p>Account ID: <%= obj2.getAcc_id() %></p>
            <p>Account Name: <%= obj2.getAcc_name() %></p>
            <p>Account Balance: <%= obj2.getAcc_balance() %></p>
            <hr>
            <h4>Login here for more transactions and details</h4>
            <a href="index.html" class="btn btn-primary">Login</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-xxxx" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-xxxx" crossorigin="anonymous"></script>
</body>
</html>
