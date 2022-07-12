
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <title>Update Page</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">

                <div class="col-lg-6 rounded-3">
                    <div class="text-center mx-3">
                        <h2 class="text-primary">Update Information</h2>
                    </div>
                    <form action="" method="post" >
                        <div class="my-3">
                            <label class="form-label">Account ID</label>
                            <input type="text" class="form-control border border-2" name="accID" value="${u.accID}" readonly>                                                                
                        </div>

                        <div class="mt-3">
                            <label class="form-label">Username</label>
                            <input type="text" class="form-control border border-2" name="username" value="${u.username}">                                
                        </div>

                        <div class="my-3">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control border border-2" name="password" value="${u.password}">                                                                
                        </div>

                        <div class="my-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control border border-2" name="fullname" value="${u.fullname}">                                                                
                        </div>

                        <div class="my-3">
                            <label class="form-label">Role</label>
                            <input type="text" class="form-control border border-2" name="role" value="${role}">        
                            <div class="form-text">
                                <span>Role is Admin or User only</span>
                            </div>
                        </div>

                        <div class="text-center my-3">
                            <button type="submit" class="btn btn-primary" name="submit" value="">Update</button>
                            <a class="btn btn-outline-secondary" name="submit" href="AdminHomeServlet">Cancel</a>

                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
    </body>
</html>

