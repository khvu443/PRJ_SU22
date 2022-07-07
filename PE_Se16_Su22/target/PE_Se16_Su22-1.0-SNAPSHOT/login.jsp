<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

        <title> LOGIN Page</title>
    </head>
    <body id="backgroundLogin">
        <div class="container-md">              
            <div class="row g-3 justify-content-center my-5">
                <div>
                    <div class="alert alert-warning alert-dismissible fade ${show} text-center fs-5" role="alert">
                        ${MESSAGE}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </div>
                <div class="col-lg-6 border border-1 border-dark rounded-3" id="colorDiv">
                    <h2 class="text-dark text-center mt-4">LOGIN</h2>
                    <form action="LoginServlet" method="POST">
                        <div>
                            <label for="loginUsername" class="my-2 text-danger">Username</label>
                            <input type="text" class="form-control border-dark" value="" placeholder="Enter username" name="username" >
                        </div>

                        <div class="my-3">
                            <label for="loginPassword" class="my-2 text-danger">Password</label>
                            <input type="password" class="form-control border-dark" value="" placeholder="Enter password" name="pass"> 
                        </div>
                        <div class="text-center">
                            <div class="mb-2">
                                <input type="checkbox" class="form-check-input" id="checkBox" name="check" value="checked">
                                <label for="checkBox" class="form-check-label text-secondry">Remember me</label>
                            </div>

                            <div class="my-2">
                                <button type="submit" name="btnAction" value="login" class="btn btn-outline-dark">Login</button>
                                <a href="Work_In_Progress.jsp" name="btnAction" class="btn btn-outline-dark">Registration</a>                            
                            </div>
                            <a href="Work_In_Progress.jsp" name="btnAction" class="btn btn-link text-dark">Forget Password or Username</a>

                        </div>                         
                    </form> 
                </div>
            </div>
        </div>

        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    </body>
</html>