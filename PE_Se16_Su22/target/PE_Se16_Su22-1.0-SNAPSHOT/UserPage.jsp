<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="~/WEB-INF/styleTable.css" type="text/css"/>
        <title>Display Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">
                <img src="img/Example1.png" alt="" width="35" class="d-inline-block align-text-top">
                USER PAGE
            </a>
            <div class="nav nav-tabs" id="tab-nav" roll="tablist">
                <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">
                    Home
                </button>

                <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">
                    Product
                </button>
            </div>
            <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Hello ${NAME.user}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                            <li><a class="dropdown-item" href="UpdateAcc?user=${NAME.user}">Update Account</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active p-3" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                <div class="container-lg mt-5">
                    <div class="row justify-content-center">
                        <div class="col-lg">
                            <div>
                                <table class="table table-primary table-bordered border-light table-hover">
                                    <thead class="table-light">
                                        <tr class="text-center">
                                            <td>UserName</td>
                                            <td>Password</td>
                                            <td>Fullname</td>
                                            <td>Role</td>
                                            <td>Status</td>
                                            <td>Action</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="u" value="${USER}" scope="session"/>
                                        <tr>
                                            <td class="text-center">${u.user}</td>
                                            <td class="text-center">${u.password}</td>
                                            <td class="text-center"> ${u.name}</td>
                                            <c:if test="${u.role == true}">
                                                <td class="text-center">Admin</td>
                                            </c:if>
                                            <c:if test="${u.role == false}">
                                                <td class="text-center">User</td>
                                            </c:if>

                                            <c:if test="${u.status == true}">
                                                <td class="text-center">Active</td>
                                            </c:if>
                                            <c:if test="${u.status == false}">
                                                <td class="text-center">Inactive</td>
                                            </c:if>

                                            <td class="text-center">
                                                <a class="btn btn-outline-primary" href="UpdateAcc?user=${u.user}">Update</a>
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>   
                                            
                        <div>
                            <div class="alert alert-warning alert-dismissible fade ${show} text-center fs-5" role="alert">
                                ${MESSAGE}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade p-3" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">

                <div class="container-lg mt-5">
                    <div class="row justify-content-center">
                        <div class="col-lg">
                            <div>
                                <table class="table table-primary table-bordered border-light table-hover">
                                    <thead class="table-light">
                                        <tr class="text-center">
                                            <td>Product ID</td>
                                            <td>Product Name</td>
                                            <td>Quantity</td>
                                            <td>Price</td>
                                            <td>Image</td>
                                            <td>UserCreate</td>
                                            <td>DateCreate</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="p" value="${PRODUCT}" scope="session"/>
                                        <c:forEach items="${p}" var="product">
                                            <tr>
                                                <td class="text-center">${product.PID}</td>
                                                <td class="text-center">${product.pName}</td>
                                                <td class="text-center"> ${product.quantity}</td>
                                                <td class="text-center">${product.price}</td>
                                                <td class="text-center"><img src="${product.image}" alt="image${product.pName}" style="width: 170px"/></td>
                                                <td class="text-center">${product.user}</td>
                                                <td class="text-center">${product.dateCreate}</td>
                                            </tr>
                                        </c:forEach>


                                    </tbody>
                                </table>
                            </div>
                        </div>                
                    </div>
                </div>
            </div>

        </div>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>
