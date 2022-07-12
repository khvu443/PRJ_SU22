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
        <link rel="icon" href="img/icon_group.png" type="image/icontype">
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

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <jsp:include page="header.jsp"></jsp:include>

    ${message}

    <!-- SECTION -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- shop -->
                <div class="col-md-4 col-xs-6">
                    <div class="shop">
                        <div class="shop-img">
                            <img style="height:230px" src="./img/rpgImage.jpg" alt="rpg">
                        </div>
                        <div class="shop-body">
                            <h3>RPG<br>Gernes</h3>
                            <a href="StoreCategoryServlet?page=1&cid=C1" class="cta-btn">See More <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                </div>
                <!-- /shop -->

                <!-- shop -->
                <div class="col-md-4 col-xs-6">
                    <div class="shop">
                        <div class="shop-img">
                            <img style="height:230px" src="./img/sandboxImage.jpg" alt="Sandbox">
                        </div>
                        <div class="shop-body">
                            <h3>Sandbox<br>Gernes</h3>
                            <a href="StoreCategoryServlet?page=1&cid=C2" class="cta-btn">See More<i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                </div>
                <!-- /shop -->

                <!-- shop -->
                <div class="col-md-4 col-xs-6">
                    <div class="shop">
                        <div class="shop-img">
                            <img style="height:230px" src="./img/hackNslackImage.jpg" alt="Hack n Slack">
                        </div>
                        <div class="shop-body">
                            <h3>Hack n Slack<br>Gernes</h3>
                            <a href="StoreCategoryServlet?page=1&cid=C3" class="cta-btn">See More <i class="fa fa-arrow-circle-right"></i></a> <!-- taọ thêm 1 jsp cho combo -->
                        </div>
                    </div>
                </div>
                <!-- /shop -->

            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /SECTION -->



    <!-- HOT DEAL SECTION -->
    <div id="hot-deal" class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="hot-deal">
                        <ul class="hot-deal-countdown">
                            <li>
                                <div>
                                    <h3 id="day"></h3>
                                    <span>Days</span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <h3 id="hours"></h3>
                                    <span>Hours</span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <h3 id="mins"></h3>
                                    <span>Mins</span>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <h3 id="sec"></h3>
                                    <span>Secs</span>
                                </div>
                            </li>

                        </ul>
                        <div><h3 id="Notice" style="color: #FFF; text-shadow: 2px 2px #ff0000;"></h3></div>
                        <h2 class="text-uppercase">big sale this week</h2>
                        <p>UP TO 85% OFF</p>
                        <a class="primary-btn cta-btn" href="#">Buy now</a>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /HOT DEAL SECTION -->


    <!-- SECTION -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">

                <!-- section title -->
                <div class="col-md-12">
                    <div class="section-title">
                        <div class="section-nav">
                            <ul class="section-tab-nav tab-nav">
                                <li class="active"><a data-toggle="tab" href="#tab1">Highest Rating</a></li>
                                <li><a data-toggle="tab" href="#tab2">Newest</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /section title -->

                <!-- Products tab & slick -->
                <div class="col-md-12">
                    <div class="row">
                        <div class="products-tabs">
                            <!-- tab -->
                            <div id="tab1" class="tab-pane fade in active">
                                <div class="products-slick" data-nav="#slick-nav-1">
                                    <c:forEach items="${rateP}" var="p">
                                        <div class="product">
                                            <div class="product-img">
                                                <img style="height: 230px" src="${p.image}">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="Detail?pid=${p.PID}">${p.nameP}</a></h3>
                                                <h4 class="product-price">${p.price}</h4>
                                                <div class="product-rating">
                                                    <i style="color: #000000; z-index: 1">${p.rating}</i>
                                                    <c:forEach var="i" begin="1" end="${p.rating}">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                    <c:choose>
                                                        <c:when test="${p.rating < 5 && p.rating >=4}"><i class="fa fa-star-o"></i></c:when>
                                                        <c:when test="${p.rating < 4 && p.rating >=3}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                        <c:when test="${p.rating < 3 && p.rating >=2}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                        <c:when test="${p.rating < 2 && p.rating >=1}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                        <c:when test="${p.rating == 0 && p.rating < 1}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                                <div class="product-btns">
                                                    <button><a class="add-to-wishlist" href="Work_In_Progress.jsp"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></a></button>
                                                    <button><a class="quick-view" href="Detail?pid=${p.PID}"><i class="fa fa-eye"></i><span class="tooltipp">View</span></a></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <a href="CartServlet?id=${p.PID}" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Ordered</a>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                                <div id="slick-nav-1" class="products-slick-nav"></div>
                            </div>
                            <!-- /tab -->

                            <!-- tab -->
                            <div id="tab2" class="tab-pane fade in">
                                <div class="products-slick" data-nav="#slick-nav-2">
                                    <c:forEach items="${listP}" var="p">
                                        <div class="product">
                                            <div class="product-img">
                                                <img style="height: 230px" src="${p.image}">
                                            </div>
                                            <div class="product-body">
                                                <h3 class="product-name"><a href="Detail?pid=${p.PID}">${p.nameP} - check</a></h3>
                                                <h4 class="product-price">${p.price}</h4>
                                                <div class="product-rating">
                                                    <i style="color: #000000; z-index: 1">${p.rating}</i>
                                                    <c:forEach var="i" begin="1" end="${p.rating}">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                    <c:choose>
                                                        <c:when test="${p.rating < 5 && p.rating >=4}"><i class="fa fa-star-o"></i></c:when>
                                                        <c:when test="${p.rating < 4 && p.rating >=3}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                        <c:when test="${p.rating < 3 && p.rating >=2}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                        <c:when test="${p.rating < 2 && p.rating >=1}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                        <c:when test="${p.rating == 0 && p.rating < 1}">
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                                <div class="product-btns">
                                                    <button><a class="add-to-wishlist" href="Work_In_Progress.jsp"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></a></button>
                                                    <button><a class="quick-view" href="Detail?pid=${p.PID}"><i class="fa fa-eye"></i><span class="tooltipp">View</span></a></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <a href="CartServlet?id=${p.PID}" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Ordered</a>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                                <div id="slick-nav-2" class="products-slick-nav"></div>
                            </div>
                            <!-- /tab -->
                        </div>
                    </div>
                </div>
                <!-- /Products tab & slick -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /SECTION -->


    <jsp:include page="footer.jsp"></jsp:include>
    <script>
                                // Set the date we're counting down to
                                var countDownDate = new Date();
                                countDownDate.setDate(countDownDate.getDate() + 7);

                                // Update the count down every 1 second
                                var x = setInterval(function () {

                                    // Get today's date and time
                                    var now = new Date().getTime();

                                    // Find the distance between now and the count down date
                                    var distance = countDownDate - now;

                                    // Time calculations for days, hours, minutes and seconds
                                    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                                    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                                    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                                    // Output the result in an element with id="demo"
                                    document.getElementById("day").innerHTML = days;
                                    document.getElementById("hours").innerHTML = hours;
                                    document.getElementById("mins").innerHTML = minutes;
                                    document.getElementById("sec").innerHTML = seconds;

                                    // If the count down is over, write some text 
                                    if (distance <= 0) {
                                        document.getElementById("day").innerHTML = 0;
                                        document.getElementById("hours").innerHTML = 0;
                                        document.getElementById("mins").innerHTML = 0;
                                        document.getElementById("sec").innerHTML = 0;
                                        clearInterval(x);
                                        document.getElementById("Notice").innerHTML = "HOT DEAL IS OVER <(＿　＿)>";
                                    }
                                }, 1000);
    </script>


</html>
