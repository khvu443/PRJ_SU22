<%@page import="model.Product"%>
<%@page import="model.category"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="DAO.RestaurantDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Store Page</title>

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
            <!-- BREADCRUMB -->
            <div id="breadcrumb" class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="breadcrumb-tree">
                                <li><a href="HomeServlet">Home</a></li>
                                <li><a href="HomeStoreServlet?page=1&sort=all">Categories</a></li>
                                <c:if test="${not empty cid}">
                                    <c:forEach items="${categoryList}" var="cList">
                                        <c:if test="${cid == cList.categoryID}">
                                        <li><a href="StoreCategoryServlet?page=1&cid=${cid}&sort=all">${cList.categoryName}</a></li>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
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
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Categories</h3>
                            <div class="checkbox-filter">
                                <div>
                                    <a href="HomeStoreServlet?page=1&sort=all" style="font-size: 18px">All Categories</a>
                                </div>
                                <%
                                    RestaurantDAO d = new RestaurantDAO();
                                    List<category> cl = d.getAllCategory();
                                %>
                                <%  for (int i = 0; i < cl.size(); i++) {%>
                                <div>
                                    <a href="StoreCategoryServlet?page=1&cid=<%=cl.get(i).getCategoryID()%>&sort=all" id="categoriesStyle" style="font-size: 18px"><%=cl.get(i).getCategoryName()%></a>
                                </div>
                                <% }%>
                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!--                         aside Widget 
                                                <div class="aside">
                                                    <h3 class="aside-title">Price</h3>
                                                    <div class="price-filter">
                                                        <div id="price-slider"></div>
                                                        <div class="input-number price-min">
                                                            <input id="price-min" type="number">
                                                            <span class="qty-up">+</span>
                                                            <span class="qty-down">-</span>
                                                        </div>
                                                        <span>-</span>
                                                        <div class="input-number price-max">
                                                            <input id="price-max" type="number">
                                                            <span class="qty-up">+</span>
                                                            <span class="qty-down">-</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                 /aside Widget -->

                        <hr class="solid" style="border-top: 3px solid #bbb;">
                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">New Product</h3> 
                            <%
                                List<Product> pl = d.getNewProduct();
                            %>
                            <%  for (Product p : pl) {%>
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="<%=p.getImage()%>" alt="">
                                </div>
                                <div class="product-body">      
                                    <%  for (category c : cl) {%>
                                    <% if (p.getCategoryID().equals(c.getCategoryID())) {%>
                                    <p class="product-category"><%= c.getCategoryName()%></p>
                                    <%}%>
                                    <% }%>
                                    <h3 class="product-name"><a href="Detail?pid=<%=p.getPID()%>"><%=p.getNameP()%></a></h3>
                                    <h4 class="product-price"> <%=p.getPrice() / 2%> <del class="product-old-price"> <%=p.getPrice()%> </del></h4>
                                </div>
                            </div>
                            <% }%>

                        </div>
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <!-- store top filter -->
                        <div class="store-filter clearfix">
                            <div class="store-sort">
                                <label>
                                    Sort By:
                                </label>
                                <select class="input-select" name="sort" onchange="window.location.href = this.value">
                                    <c:if test="${not empty cid}">
                                        <option value="#">Select Sort</option>
                                        <option value="StoreCategoryServlet?page=1&cid=${cid}&sort=all" ${allSort}>All Product</option>
                                        <option value="StoreCategoryServlet?page=1&cid=${cid}&sort=new" ${newSort}>New Product</option>
                                        <option value="StoreCategoryServlet?page=1&cid=${cid}&sort=low" ${lowSort}>Lower Price</option>
                                        <option value="StoreCategoryServlet?page=1&cid=${cid}&sort=high" ${highSort}>Higher Price</option>
                                    </c:if>
                                    <c:if test="${empty cid}">
                                        <option value="#">Select Sort</option>
                                        <option value="HomeStoreServlet?page=1&sort=all" ${allSort}>All Product</option>
                                        <option value="HomeStoreServlet?page=1&sort=new"  ${newSort}>New Product</option>
                                        <option value="HomeStoreServlet?page=1&sort=low"  ${lowSort}>Lower Price</option>
                                        <option value="HomeStoreServlet?page=1&sort=high"  ${highSort}>Higher Price</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                        <!-- /store top filter -->

                        <!-- store products -->
                        <div class="row">
                            <!-- product -->

                            <c:forEach items="${listP}" var="product" >
                                <div class="col-md-4 col-xs-6">
                                    <div class="product">
                                        <div class="product-img">
                                            <img style="height: 230px" src="${product.image}" alt="">
                                            <div class="product-label">
                                                <c:if test="${!product.getPID().equals( pl.getPID())}">
                                                    <span class="sale">-50%</span>
                                                    <span class="new">NEW</span>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="Detail?pid=${product.PID}">${product.nameP}</a></h3>
                                                <c:if test="${product.getPID() != pl.getPID()}">
                                                <h4 class="product-price">${product.price/2} <del class="product-old-price">${product.price}</del></h4>
                                                </c:if>
                                                <c:if test="${product.getPID() == pl.getPID()}">
                                                <h4 class="product-price">${product.price}</h4>
                                            </c:if>

                                            <div class="product-rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="product-btns">
                                                <button><a class="add-to-wishlist" href="Work_In_Progress.jsp"><i class="fa fa-heart-o"></i><span class="tooltipp">add to wishlist</span></a></button>
                                                <button><a class="quick-view" href="Detail?pid=${product.PID}"><i class="fa fa-eye"></i><span class="tooltipp">quick view</span></a></button>
                                            </div>
                                        </div>
                                        <div class="add-to-cart">
                                            <a href="CartServlet?id=${product.PID}" class="add-to-cart-btn" type="submit"><i class="fa fa-shopping-cart"></i>Ordered</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- /product -->
                        </div>
                        <!-- /store products -->

                        <!-- store bottom filter -->
                        <div class="store-filter clearfix">
                            <c:if test="${empty cid}">
                                <ul class="store-pagination">
                                    <%
                                        List<Product> sizeP = d.getAllProduct();
                                    %>
                                    <c:if test="${(page-1) >= 1}">
                                        <li><a href="HomeStoreServlet?page=${page-1}&sort=${sortPage}"><i class="fa fa-angle-left"></i></a></li>
                                            </c:if>
                                            <c:if test="${(page-1) < 1}">
                                        <li><a href="HomeStoreServlet?page=${page}&sort=${sortPage}"><i class="fa fa-angle-left"></i></a></li>
                                            </c:if>
                                            <%for (int j = 0; j <= (sizeP.size() / 5); j++) {%>
                                    <li><a href="HomeStoreServlet?page=<%=j + 1%>&sort=${sortPage}"><%=j + 1%></a></li>
                                        <%}%>

                                    <c:if test="${page <= sizeProduct}">
                                        <li><a href="HomeStoreServlet?page=${page+1}&sort=${sortPage}"><i class="fa fa-angle-right"></i></a></li>
                                            </c:if>
                                            <c:if test="${page > sizeProduct}">
                                        <li><a href="HomeStoreServlet?page=${page}&sort=${sortPage}"><i class="fa fa-angle-right"></i></a></li>
                                            </c:if>
                                </ul>
                            </c:if>
                            <c:if test="${not empty cid}">
                                <ul class="store-pagination">
                                    <c:if test="${(page-1) >= 1}">
                                        <li><a href="StoreCategoryServlet?page=${page-1}&cid=${cid}&sort=${sortPage}"><i class="fa fa-angle-left"></i></a></li>
                                            </c:if>
                                            <c:if test="${(page-1) < 1}">
                                        <li><a href="StoreCategoryServlet?page=${page}&cid=${cid}&sort=${sortPage}"><i class="fa fa-angle-left"></i></a></li>
                                            </c:if>

                                    <c:forEach var="i" begin="1" end="${sizeProduct}">
                                        <li><a href="StoreCategoryServlet?page=${i}&cid=${cid}&sort=${sortPage}">${i}</a></li>
                                        </c:forEach>

                                    <c:if test="${page <= sizeProduct}">
                                        <li><a href="StoreCategoryServlet?page=${page+1}&cid=${cid}&sort=${sortPage}"><i class="fa fa-angle-right"></i></a></li>
                                            </c:if>
                                            <c:if test="${page > sizeProduct}">
                                        <li><a href="StoreCategoryServlet?page=${page}&cid=${cid}&sort=${sortPage}"><i class="fa fa-angle-right"></i></a></li>
                                            </c:if>
                                </ul>
                            </c:if>
                        </div>

                        <!-- /store bottom filter -->
                    </div>
                    <!-- /STORE -->
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

