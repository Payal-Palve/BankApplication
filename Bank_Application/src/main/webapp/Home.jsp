<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="pojo.Account" %>

<%@ page import="dao.DaoAccount" %>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Hello, world!</title>
</head>

<body>


    <!-- Optional JavaScript; choose one of the two! -->

    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="text-start text-success fw-bold py-2 m-2 ">
                
                <h1>Your balance is :  </h1>

            </div>
            <hr />
            <div class="col-12 col-md-6 bg-light rounded-2">
                <h3 class="text-dark fs-3 text-center my-2">your transaction operations</h3>
                <div class="col-8 p-1 m-2">
                    <form>

                        <div class="text-success">Enter amount you want to deposit or withdraw</div>
                        <div class="input-group mb-3 form-floating m-2">

                            <span class="input-group-text">$</span>
                            <input type="text" class="form-control" id="floatingInput" placeholder="Account Id">

                            <span class="input-group-text">.00</span>
                        </div>
                        <div class="text-center p- my-3">
                        <input type="radio" class="btn-check" name="options-outlined" id="success-outlined"
                            autocomplete="off" checked>
                        <label class="btn btn-outline-success" for="success-outlined">Deposit Amount</label>

                        <input type="radio" class="btn-check" name="options-outlined" id="danger-outlined"
                            autocomplete="off">
                        <label class="btn btn-outline-danger" for="danger-outlined">Withdraw Amount</label>
                        </div>
                          
                    </form>
                </div>



            </div>
            <div class="col-12 col-md-6 p-2  bg-light shadow rounded-2">
               <h2 class="p-2 m-2 text-center"> your Account details</h2>
             <div class="p-3 m-2  ">
              <h4>your Account Id : </h4>
              <h4>Account Name : </h4>
             </div>
            </div>


        </div>

    </div>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>

</html>