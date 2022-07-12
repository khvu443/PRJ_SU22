
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <title>Update Page</title>
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
            <div class="container mt-5">
                <div class="possition-relative">
                    <div class="position-absolute top-0 start-50 translate-middle-x">
                        <div class="alert alert-warning alert-dismissible fade ${show} text-center" role="alert" style="width:500px">
                            ${ERROR}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">

                    <div class="col-lg-6 rounded-3">
                        <div class="text-center mx-3">
                            <h2 class="text-primary">Update Information</h2>
                        </div>
                        <form action="UpdateAccount" method="post" >
                            <div class="mt-3">
                                <label class="form-label">Username</label>
                                <input type="text" class="form-control border border-2" name="user" value="${u.username}">                                
                            </div>

                            <div class="my-3">
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control border border-2" name="pass" value="">                                                                
                            </div>

                            <div class="my-3">
                                <label class="form-label">Confirm Password</label>
                                <input type="password" class="form-control border border-2" name="cpass" value="">                                                                
                            </div>

                            <div class="my-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" class="form-control border border-2" name="name" value="${u.fullname}">                                                                
                            </div>

                            <div class="text-center my-3">
                                <button type="submit" class="btn btn-primary" name="submit" value="">Update</button>
                                <a class="btn btn-primary" name="submit" href="HomeServlet">Cancel Update</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
    </body>
</html>
