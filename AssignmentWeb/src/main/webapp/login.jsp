<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/StyleCss.css"/>
        <title> LOGIN Page</title>

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
            <div class="container-md">
                <div class="possition-relative">
                    <div class="position-absolute top-0 start-50 translate-middle-x">
                        <div class="alert alert-${alert} alert-dismissible fade ${show} text-center" role="alert" style="width:500px">
                            ${ERROR}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </div>

                </div>

                <div class="row g-3 justify-content-center my-3">
                    <div class="col-lg-6 rounded-3">
                        <h2 class="text-light text-center mt-4">LOGIN</h2>

                        <%
                            String uname = "", pass = "", check = "";
                            Cookie[] cookies = request.getCookies();
                            if (cookies != null) {
                                for (Cookie c : cookies) {
                                    if (c.getName().equals("cookieName")) {
                                        uname = c.getValue();
                                    } else if (c.getName().equals("cookiePass")) {
                                        pass = c.getValue();
                                    } else if (c.getName().equals("remember")) {
                                        check = c.getValue();
                                    }
                                }
                            }
                        %>

                        <form action="LoginServlet" method="POST">
                            <div>
                                <label for="loginUsername" class="my-2 text-light">Username</label>
                                <input type="text" class="form-control border-dark"  placeholder="Enter username" name="username" value="<%=uname%>">
                            </div>

                            <div class="my-3">
                                <label for="loginPassword" class="my-2 text-light">Password</label>
                                <input type="password" class="form-control border-dark" placeholder="Enter password" name="pass" value="<%=pass%>"> 
                            </div>
                            <a href="forgetPassword.jsp" name="btnAction" class="text-decoration-none text-white">Forget Password</a>
                            <div class="text-center">
                                <div class="mb-2">
                                    <input type="checkbox" class="form-check-input" id="checkBox" name="check" value="1" <%= "1".equals(check) ? "checked='/checked'" : ""%> >
                                    <label for="checkBox" class="form-check-label text-light">Remember me</label>
                                </div>
                                <div class="my-2 d-grid gap-2">
                                    <button type="submit" name="btnAction" value="login" class="btn btn-outline-light btn-lg">Login</button>                           
                                </div>
                            </div>      
                        </form> 
                        <div class="text-center mt-4 mb-2">
                            <span class="text-light fs-5">Or Sign up using</span>
                        </div>
                        <div class="d-flex flex-row justify-content-center gap-3">
                            <a href="" class="fs-1 text-decoration-none p-2"> <i class="bi bi-google"></i> </a>
                            <a href="" class="fs-1 text-decoration-none p-2"> <i class="bi bi-facebook"></i> </a>
                            <a href="" class="fs-1 text-decoration-none p-2"> <i class="bi bi-twitter"></i> </a>
                        </div>

                        <div class="d-flex flex-column gap-3 align-items-center my-4">
                            <span class="text-white fs-5">Not a member?</span>
                            <a href="registrate.jsp" name="btnAction" class="text-decoration-none text-dark fs-5">Signup now</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>