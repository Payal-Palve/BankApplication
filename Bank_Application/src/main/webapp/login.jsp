<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="pojo.Account"%>
<%@ page import="dao.DaoAccount"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Banking System</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
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
<%
    obj2.setAcc_id(Integer.parseInt(request.getParameter("id")));
    int id=Integer.parseInt(request.getParameter("id"));
    session.setAttribute("id",obj2.getAcc_id());
    obj2.setAcc_password(request.getParameter("pass"));
    Account validAccount = dao.checkValid(obj2.getAcc_id(), obj2.getAcc_password());
    dao.getAccountDetails(obj2);
%>

<div class="container">
    <% if (validAccount != null) { %>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-success text-white text-center">
                    <h2>Your Balance</h2>
                </div>
                <div class="card-body">
                    <h1 class="text-center">$<%=obj2.getAcc_balance()%></h1>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-light text-dark text-center">
                    <h3>Transaction Operations</h3>
                </div>
                <div class="card-body">
                    <form action="transaction.jsp" method="post">
                        <div class="mb-3">
                            <label for="input_money" class="form-label">Enter Amount:</label>
                            <div class="input-group">
                                <span class="input-group-text">$</span>
                                <input type="text" class="form-control" id="input_money" name="input_money" placeholder="Enter amount" required>
                                <span class="input-group-text">.00</span>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Select Transaction Type:</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="amount" id="deposit" value="1" checked>
                                <label class="form-check-label" for="deposit"> Deposit </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="amount" id="withdraw" value="2">
                                <label class="form-check-label" for="withdraw"> Withdraw </label>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-light text-dark text-center">
                    <h3>Your Account Details</h3>
                </div>
                <div class="card-body">
                    <p class="card-text fw-semibold">Your Account Id : <%=obj2.getAcc_id()%></p>
                     <p class="card-text fw-semibold">Bank IFSC Code : <%=obj2.getBkid()%></p>
                    <p class="card-text fw-semibold">Account Holder Name : <%=obj2.getAcc_name()%></p>
                  
                </div>
            </div>
        </div>
    </div>
    <% } else { %>
    <div class="alert alert-danger mt-4" role="alert">
        Invalid account credentials
    </div>
    <% } %>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
