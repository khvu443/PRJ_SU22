

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-md">
            <div class="row justify-content-center my-3">
                <div class="col-lg-6 border border-2 border-info rounded-3">
                    <div class="text-center my-3">
                        <h4>Add New Class</h4>
                    </div>
                    <form action="NewClassServlet" method="POST">
                        <div class="my-3">
                            <label for="Cname" class="my-2 text-primary">Class Name</label>
                            <input type="text" class="form-control border-dark" value="" placeholder="Enter Class Name" name="Cname" >
                        </div>
                        <div class="mb-3">
                            <label for="Des" class="my-2 text-primary">Description</label>
                            <input type="text" class="form-control border-dark" value="" placeholder="Enter Class's Description" name="des" >
                        </div>
                        <div class="mb-4 text-center">
                            <button type="submit" name="btnAction" value="save" class="btn btn-outline-primary border-3">Save</button>
                            <a href="DisplayClass" name="btnAction" class="btn btn-outline-secondary border-3">Cancel</a> 
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </body>
</html>
