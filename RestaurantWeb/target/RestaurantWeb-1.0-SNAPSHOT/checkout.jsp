<%@page import="model.Product"%>
<%@page import="java.util.*"%>
<%@page import="DAO.RestaurantDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <link rel="icon" href="img/icon_group.png" type="image/icon type">

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css
              <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!--Icon bootstrap-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

            <div id="breadcrumb" class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="breadcrumb-header">Checkout</h3>
                            <ul class="breadcrumb-tree">
                                <li><a href="HomeServlet">Home</a></li>
                                <li class="active">Checkout</li>
                            </ul>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /BREADCRUMB -->

            <!-- SECTION -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">

                        <div class="col-md-7">
                            <!-- Billing Details -->
                            <div class="billing-details">
                                <div class="section-title">
                                    <h3 class="title">Billing address</h3>
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="first-name" placeholder="First Name">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="last-name" placeholder="Last Name">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="email" name="email" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="address" placeholder="Address">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="city" placeholder="City">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="country" placeholder="Country">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="zip-code" placeholder="ZIP Code">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="tel" name="tel" placeholder="Telephone">
                                </div>
                                <div class="form-group">
                                    <div class="input-checkbox">
                                        <input type="checkbox" id="create-account">
                                        <label for="create-account">
                                            <span></span>
                                            Create Account?
                                        </label>
                                        <div class="caption">
                                            <p>Please Enter Password: </p>
                                            <input class="input" type="password" name="password" placeholder="Enter Your Password" value="${password}">
                                        <input style="margin-top:20px" class="input" type="password" name="password1" placeholder="Enter Your Password Again" value="${password1}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Billing Details -->

                        <!-- Shiping Details -->
                        <div class="shiping-details">
                            <div class="section-title">
                                <h3 class="title">Shiping address</h3>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="shiping-address">
                                <label for="shiping-address">
                                    <span></span>
                                    Ship to a diffrent address?
                                </label>
                                <div class="caption">
                                    <div class="form-group">
                                        <input class="input" type="text" name="first-name" placeholder="First Name" value="">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="text" name="last-name" placeholder="Last Name" value="">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="email" name="email" placeholder="Email" value="">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="text" name="address" placeholder="Address" value="">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="text" name="city" placeholder="City" value="">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="text" name="country" placeholder="Country" value="">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="text" name="zip-code" placeholder="ZIP Code" value="">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="tel" name="tel" placeholder="Telephone" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Shiping Details -->

                        <!-- Order notes -->
                        <div class="order-notes">
                            <textarea class="input" placeholder="Order Notes"></textarea>
                        </div>
                        <!-- /Order notes -->
                    </div>

                    <!-- Order Details -->
                    <div class="col-md-5 order-details">
                        <div class="section-title text-center">
                            <h3 class="title">Your Order</h3>
                        </div>
                        <div class="order-summary">
                            <div class="order-col">
                                <div><strong>PRODUCT</strong></div>

                                <div><strong>Total</strong></div>

                            </div>
                            <div class="order-products">
                                <c:set value="${listP}" var="list"/>
                                <c:forEach items="${list}" var="p">
                                    <div class="order-col">
                                        <div>${p.nameP}</div>
                                        <div>
                                            <a href="SubtractCartServlet?id=${p.PID}"><button class="btnSub">-</button></a> 
                                            <strong>${p.quantity}</strong>
                                            <a href="CartServlet?id=${p.PID}"><button class="btnAdd">+</button></a>
                                        </div>
                                        <div>
                                            <a href="RemoveProduct?id=${p.PID}">
                                                <button type="button" id="buttonDelete">
                                                    <span><i class="bi bi-trash"></i></span>
                                                </button>
                                            </a>
                                        </div>
                                        <div>
                                            <%
                                                RestaurantDAO d = new RestaurantDAO();
                                                List<Product> cl = d.getNewProduct();
                                                List<Product> allP = d.getAllProduct();
                                                List<String> arr = new ArrayList<>();
                                                for (int i = 0; i < allP.size(); i++) {
                                                    for (int j = 0; j < cl.size(); j++) {
                                                        if (allP.get(i).getPID().equals(cl.get(j).getPID())) {
                                                            arr.add(allP.get(i).getPID());
                                                        }
                                                    }
                                                }

                                                for (int i = 0; i < allP.size(); i++) {
                                                    for (int j = 0; j < arr.size(); j++) {
                                                        if (allP.get(i).getPID().equals(arr.get(j))) {
                                                            allP.remove(i);
                                                        }
                                                    }
                                                }
                                                request.setAttribute("cl", cl);
                                                request.setAttribute("oldP", allP);
                                            %>
                                            <c:forEach items="${cl}" var="c">
                                                <c:if  test="${p.PID == c.getPID()}">
                                                    <p>${(p.price/2) * p.quantity}</p>
                                                </c:if>
                                            </c:forEach>
                                            <c:forEach items="${oldP}" var="old">
                                                <c:if  test="${p.PID == old.getPID()}">
                                                    <p>${(p.price * 1.0) * p.quantity}</p>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <div class="order-col">
                                <div>Shiping</div>
                                <div><strong>FREE</strong></div>
                            </div>
                            <div class="order-col">
                                <div><strong>TOTAL</strong></div>
                                <div><strong class="order-total">${total}</strong></div>
                            </div>
                        </div>

                        <div class="payment-method">
                            <div class="input-radio">
                                <input type="radio" name="payment" id="payment-1" value="bank_direct">
                                <label for="payment-1">
                                    <span></span>
                                    Direct Bank Transfer
                                </label>
                                <div class="caption">
                                    <form action=""> W.I.P </form> <!-- form bank -->
                                </div>
                            </div>
                            <div class="input-radio">
                                <input type="radio" name="payment" id="payment-2" value="cheque">
                                <label for="payment-2">
                                    <span></span>
                                    Cheque Payment
                                </label>
                                <div class="caption">
                                    <form action=""> W.I.P </form> <!-- form payment -->
                                </div>
                            </div>
                            <div class="input-radio">
                                <input type="radio" name="payment" id="payment-3" value="Paypal">
                                <label for="payment-3">
                                    <span></span>
                                    Paypal Payment
                                </label>
                                <div class="caption">
                                    <form action=""> W.I.P </form> <!-- form bank -->
                                </div>
                            </div>
                        </div>
                        <div class="input-checkbox">
                            <input type="checkbox" id="terms">
                            <label for="terms">
                                <span></span>
                                I've read and accept the <a href="TermAndCondition.jsp" class="termsAndConditions">terms & conditions</a>
                            </label>
                        </div>
                        <a href="PayServlet" class="primary-btn order-submit">Place order</a>
                    </div>
                    <!-- /Order Details -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                            <form>
                                <input class="input" type="email" placeholder="Enter Your Email">
                                <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>
                            <ul class="newsletter-follow">
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">About Us</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Categories</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Hot deals</a></li>
                                    <li><a href="#">Laptops</a></li>
                                    <li><a href="#">Smartphones</a></li>
                                    <li><a href="#">Cameras</a></li>
                                    <li><a href="#">Accessories</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Information</h3>
                                <ul class="footer-links">
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Contact Us</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Orders and Returns</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Service</h3>
                                <ul class="footer-links">
                                    <li><a href="#">My Account</a></li>
                                    <li><a href="#">View Cart</a></li>
                                    <li><a href="#">Wishlist</a></li>
                                    <li><a href="#">Track My Order</a></li>
                                    <li><a href="#">Help</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="footer-payments">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul>
                            <span class="copyright">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </span>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>

