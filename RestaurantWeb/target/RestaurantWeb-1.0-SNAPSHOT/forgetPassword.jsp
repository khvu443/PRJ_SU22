<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <title>JSP Page</title>
    </head>
    <body id="registerBackground">
        <div class="container-md">

            <div class="possition-relative">
                <div class="position-absolute top-0 start-50 translate-middle-x">
                    <div class="alert alert-warning alert-dismissible fade ${show} text-center" role="alert" style="width:500px">
                        ${ERROR}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-6 rounded-3" id="colorRegister">
                    <h2 class="text-light text-center mt-4">Reset Password</h2>
                    <span class="text-light">Lost your password? Please enter your username to reset password</span>
                    <form action="ForgetPassword" method="POST">
                        <div>
                            <label for="loginUsername" class="my-2 text-light">Username?</label>
                            <input type="text" class="form-control border-dark" value="" name="username">
                        </div>
                        <div class="gap-3">
                            <div class="my-2">
                                <button type="submit" name="btnAction" value="login" class="btn btn-outline-light">Reset Password</button>
                                <a href="login.jsp" name="btnAction" class="btn btn-outline-primary">Return to login</a>
                            </div>

                        </div>                         
                    </form> 
                </div>
            </div>
        </div>   
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
    </body>
</html>
