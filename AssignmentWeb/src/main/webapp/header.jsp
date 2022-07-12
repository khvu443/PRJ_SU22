<%@page import="java.util.List"%>
<%@page import="model.*"%>
<%@page import="DAO.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Home</title>
        <!-- icon logo in title bar -->
        <link rel="icon" href="img/icon_group.png" type="image/icon">
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/StyleCss.css"/>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">



        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        <style>
            .alert {
                padding: 20px;
                background-color: ${color};
                color: white;
            }

            .closebtn {
                margin-left: 15px;
                color: white;
                font-weight: bold;
                float: right;
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
            }

            .closebtn:hover {
                color: black;
            }
        </style>

    </head>
    <body>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> +696-96-96-96</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> example@gmail.com</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i> 6969 Akihabara</a></li>
                    </ul>
                    <ul class="header-links pull-right">

                        <c:set var="user" value="${NAME}" scope="session"/>
                        <c:if test="${empty user}">
                            <li><a href="registrate.jsp"><i class="fa fa-user-plus"></i> Register</a></li>
                            <li><a href="login.jsp"><i class="fa fa-user-o"></i> Login</a></li>
                            </c:if>
                            <c:if test="${not empty user}">
                            <li>                            
                                <div class="dropdown">
                                    <button  onclick="hamDropdown()" class="nut_dropdown">
                                        <i class="bi bi-person"></i>
                                        Hello ${user.username}
                                    </button>
                                    <div class="noidung_dropdown">
                                        <a id="dropItem" href="UpdateAccount?AID=${user.accID}">Manager Account</a>
                                        <c:if test="${user.roleID == 'R01'}">
                                            <a id="dropItem" href="AdminHomeServlet">Admin Page</a>
                                        </c:if>
                                        <a id="dropItem" href="LogoutServlet">logout</a>
                                    </div>
                                </div>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="HomeServlet" class="logo">
                                    <img src="./img/logoPixel.png" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form action="SearchProductServlet" method="post">
                                    <select class="input-select" name="category" onchange="window.location.href = this.value">
                                        <option value="0" selected>All Categories</option>
                                        <%
                                            GameDAO dao = new GameDAO();
                                            List<category> cl = dao.getAllCategory();
                                        %>    
                                        <% for (category c : cl) {%>
                                        <option value="StoreCategoryServlet?page=1&cid=<%=c.getCategoryID()%>&sort=all"><%=c.getCategoryName()%></option>
                                        <%}%>
                                    </select>
                                    <input class="input" placeholder="Search here" name="search" value=""> <!-- Thêm value search ở đây -->
                                    <button class="search-btn" name="action" value="search" type="submit">
                                        <a style="color: #000000">Search</a>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Cart -->

                                <div>
                                    <a href="ShowCart">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <c:set var="number" value="numberCart" scope="session"/>
                                        <div class="qty">
                                            <c:if test="${not empty numberCart}">
                                                ${numberCart.size()}
                                            </c:if>
                                            <c:if test="${empty numberCart}">
                                                0
                                            </c:if>
                                        </div>

                                    </a>
                                </div>
                                <!-- /Cart -->

                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li><a href="HomeServlet">Home</a></li>
                        <li><a href="HomeServlet#hot-deal">Event</a></li>
                        <li>              
                            <div class="dropdown">
                                <a href="HomeStoreServlet?page=<%=1%>&sort=<%="all"%>">Gernes</a>
                            </div>

                        </li>

                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->

        <script>
            function hamDropdown() {
                document.querySelector(".noidung_dropdown").classList.toggle("hienThi");
            }
        </script>
</html>
