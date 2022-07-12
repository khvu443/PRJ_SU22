<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Order"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <title>Page Detail Order ${id}</title>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Exo:400,700');

            *{
                margin: 0px;
                padding: 0px;
            }

            body{
                font-family: 'Exo', sans-serif;
            }


            .context {
                width: 100%;
                position: absolute;
                top:5vh;

            }
            .area{
                background: #4e54c8;
                background: -webkit-linear-gradient(to left, #8f94fb, #4e54c8);
                width: 100%;
                height:100vh;


            }

            .circles{
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
            }

            .circles li{
                position: absolute;
                display: block;
                list-style: none;
                width: 20px;
                height: 20px;
                background: rgba(255, 255, 255, 0.2);
                animation: animate 25s linear infinite;
                bottom: -150px;

            }

            .circles li:nth-child(1){
                left: 25%;
                width: 80px;
                height: 80px;
                animation-delay: 0s;
            }


            .circles li:nth-child(2){
                left: 10%;
                width: 20px;
                height: 20px;
                animation-delay: 2s;
                animation-duration: 12s;
            }

            .circles li:nth-child(3){
                left: 70%;
                width: 20px;
                height: 20px;
                animation-delay: 4s;
            }

            .circles li:nth-child(4){
                left: 40%;
                width: 60px;
                height: 60px;
                animation-delay: 0s;
                animation-duration: 18s;
            }

            .circles li:nth-child(5){
                left: 65%;
                width: 20px;
                height: 20px;
                animation-delay: 0s;
            }

            .circles li:nth-child(6){
                left: 75%;
                width: 110px;
                height: 110px;
                animation-delay: 3s;
            }

            .circles li:nth-child(7){
                left: 35%;
                width: 150px;
                height: 150px;
                animation-delay: 7s;
            }

            .circles li:nth-child(8){
                left: 50%;
                width: 25px;
                height: 25px;
                animation-delay: 15s;
                animation-duration: 45s;
            }

            .circles li:nth-child(9){
                left: 20%;
                width: 15px;
                height: 15px;
                animation-delay: 2s;
                animation-duration: 35s;
            }

            .circles li:nth-child(10){
                left: 85%;
                width: 150px;
                height: 150px;
                animation-delay: 0s;
                animation-duration: 11s;
            }



            @keyframes animate {

                0%{
                    transform: translateY(0) rotate(0deg);
                    opacity: 1;
                    border-radius: 0;
                }

                100%{
                    transform: translateY(-1000px) rotate(720deg);
                    opacity: 0;
                    border-radius: 50%;
                }

            }
        </style>
    </head>

    <body>

        <div class="area" >
            <ul class="circles">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>          
        <div class="context">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">
                    <img src="img/Example1.png" alt="" width="35" class="d-inline-block align-text-top">
                    ADMIN PAGE
                </a>
                <div class="nav nav-tabs" id="tab-nav" roll="tablist">
                    <a href="AdminHomeServlet" class="nav-link ">Account</a>

                    <a href="AdminShowProduct?page=1" class="nav-link">Product</a>

                    <a href="AdminHomeServlet" class="nav-link active">Bill Order</a>

                    <a href="AdminShowCategory" class="nav-link">Category</a>

                </div>
                <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Hello ${NAME.username}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                <li><a class="dropdown-item" href="AdminUpdateAcc?accID=${NAME.accID}">Update Account</a></li>
                                <li >
                                    <a class="dropdown-item" href="HomeServlet">Home Page</a>
                                </li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>

                <a class="nav-link"  href="AdminCreateAccount.jsp">New Account</a>
                <a class="nav-link"  href="AdminAddProduct.jsp">New Product</a>
                <a class="nav-link"  href="AdminAddCategory.jsp">New Category</a>
            </nav>
            <div class="container-lg mt-5">
                <div class="row justify-content-center">
                    <div class="col-lg">
                        <div>
                            <h5 class="fs-1">Detail Order ${id}</h5>
                        </div>
                        <div>
                            <table class="table table-primary table-bordered border-light table-hover">
                                <thead class="table-light">
                                    <tr class="text-center">
                                        <td>Order ID</td>
                                        <td>Product ID</td>
                                        <td>Total</td>
                                    </tr>
                                </thead>
                                <tbody class="table-light">
                                    <c:forEach items="${orderList}" var="order">
                                        <tr>
                                            <td class="text-center">${order.OID}</td>
                                            <td class="text-center"> ${order.pid}</td>
                                            <td class="text-center">${order.totalMoney}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>                
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>