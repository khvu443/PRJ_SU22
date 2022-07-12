<%@page import="java.util.List"%>
<%@page import="model.*"%>
<%@page import="DAO.GameDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/StyleCss.css"/>

        <link rel="stylesheet" href="css/font-awesome.min.css">
        <title>JSP Page</title>

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

        <div class="context" style="margin-top:-40px">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">
                    <img src="img/Example1.png" alt="" width="35" class="d-inline-block align-text-top">
                    ADMIN PAGE
                </a>
                <div class="nav nav-tabs" id="tab-nav" roll="tablist">

                    <a href="AdminHomeServlet" class="nav-link ">Account</a>

                    <a href="AdminShowProduct?page=1" class="nav-link active">Product</a>

                    <a href="AdminHomeServlet" class="nav-link ">Bill Order</a>

                    <a href="AdminShowCategory" class="nav-link">Category</a>

                </div>
                <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Hello ${NAME.username}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                                <li><a class="dropdown-item" href="AdminUpdateAccount?user=${NAME.accID}">Update Account</a></li>
                                <li>
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
                    <div class="col-lg-10">
                        <div>
                            <table class="table table-primary table-bordered border-light table-hover">
                                <thead class="table-light">
                                    <tr class="text-center">
                                        <td>Product ID</td>
                                        <td>Product Name</td>
                                        <td>Genre</td>
                                        <td>Price</td>
                                        <td>Image</td>
                                        <td>DateCreate</td>
                                        <td>Rate</td>
                                        <td>Action</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="p" value="${listP}" scope="session"/>
                                    <c:forEach items="${p}" var="product">
                                        <tr>
                                            <td class="text-center">${product.PID}</td>
                                            <td class="text-center">${product.nameP}</td>

                                            <c:forEach items="${cl}" var="genre">
                                                <c:if test="${product.categoryID == genre.categoryID}">
                                                    <td class="text-center"> ${genre.categoryName}</td>
                                                </c:if>
                                            </c:forEach>

                                            <td class="text-center">${product.price}</td>
                                            <td class="text-center"><img src="${product.image}" alt="image${product.nameP}" style="width: 100px;"/></td>
                                            <td class="text-center">${product.dateCreate}</td>
                                            <td class="text-center">${product.rating}</td>

                                            <td class="text-center">
                                                <a class="btn btn-outline-primary" href="AdminUpdateProduct?PID=${product.PID}">Update</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="store-filter clearfix col-lg-10" style="margin-top: -10px">  
                                <ul class="store-pagination">
                                    <%
                                        GameDAO resd = new GameDAO();
                                        List<Product> sizeP = resd.getAllProduct();
                                    %>
                                    <c:if test="${(page-1) >= 1}">
                                        <li><a href="AdminShowProduct?page=${page-1}" class="text-decoration-none"><i class="fa fa-angle-left"></i></a></li>
                                            </c:if>
                                            <c:if test="${(page-1) < 1}">
                                        <li><a href="AdminShowProduct?page=${page}" class="text-decoration-none"><i class="fa fa-angle-left"></i></a></li>
                                            </c:if>

                                    <%for (int j = 0; j < (sizeP.size() / 3); j++) {%>
                                    <li><a href="AdminShowProduct?page=<%=j + 1%>" class="text-decoration-none"><%=j + 1%></a></li>
                                        <%}%>

                                    <c:if test="${page < sizeProduct}">
                                        <li><a href="AdminShowProduct?page=${page+1}" class="text-decoration-none"><i class="fa fa-angle-right"></i></a></li>
                                            </c:if>
                                            <c:if test="${page >= sizeProduct}">
                                        <li><a href="AdminShowProduct?page=${page}" class="text-decoration-none"><i class="fa fa-angle-right"></i></a></li>
                                            </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>                
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    </body>
</html>
