<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <title>Create new Page</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">

                <div class="col-lg-6 border border-primary border-3 rounded-3">
                    <div class="text-center">
                        <h2 class="text-primary">Add new product</h2>
                    </div>
                    <form action="AdminAddNewProduct" method="post" enctype="multipart/form-data">

                        <div class="my-3">
                            <label class="form-label">Product Name </label>
                            <input type="text" class="form-control" name="name" value="">                                                                
                        </div>

                        <div class="my-3">
                            <label class="form-label">Product Quantity </label>
                            <input type="text" class="form-control" name="quantity" value="">     
                        </div>

                        <div class="my-3">
                            <label class="form-label">Product Price </label>
                            <input type="text" class="form-control" name="price" value="">     
                        </div>

                        <div class="my-3">
                            <label for="userInput" class="col-form-label">Upload Photo</label>
                            <input class="form-control" type="file" name="photo" value="">
                        </div>

                        <div class="text-center mb-3">
                            <button type="submit" class="btn btn-outline-primary" name="submit" value="">Add New Product</button>
                            <a class="btn btn-outline-secondary" name="submit" href="AdminHomePage">Cancel Add New</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>                    
    </body>
</html>
