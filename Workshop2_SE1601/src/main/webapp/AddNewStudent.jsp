
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.Dao"%>
<%@page import="Model.Class"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title> Add New Page</title>
    </head>
    <body>

        <div class="container-md">
            <div class="row g-3 justify-content-center my-3">
                <div class="col-lg-6 border border-3 border-info rounded-3">
                    <h2 class="text-primary text-center mt-4">Add New Student</h2>
                    <form action="AddNewSevlet" method="POST" enctype="multipart/form-data">
                        <div>
                            <label for="Sname" class="my-2 text-primary">Student Name</label>
                            <input type="text" class="form-control border-dark" value="" placeholder="Enter Student Name" name="Sname" >
                        </div>
                        <div>                        
                            <label for="selectClass" class="col-form-label">Class Name</label>
                            <select  class="form-select" aria-label="select class" name="classID">
                                <%
                                    Dao d = new Dao();
                                    ArrayList<Class> cl = d.getAllClass();
                                %>
                                <%  for (Class s : cl) {%>
                                <option value="<%=s.getCid()%>"><%=s.getClassName()%></option>
                                <% }%>
                            </select>
                        </div>

                        <div class="my-3">
                            <label for="Age" class="my-2 text-primary">Age</label>
                            <input type="number" class="form-control border-dark" value="" placeholder="Enter age" name="age"> 
                        </div>

                        <div>
                            <label for="userInput" class="col-form-label">Upload Photo</label>
                            <input class="form-control" type="file" name="photo" value="">
                        </div>


                        <div class="text-center">
                            <div class="my-2">
                                <button type="submit" name="btnAction" value="save" class="btn btn-primary">Save</button>
                                <a href="DisplayStudent" type="submit" name="btnAction" value="cancel" class="btn btn-outline-secondary">Cancel</a>                            
                            </div>
                        </div>                         
                    </form> 
                    <div><p class="text-danger">${MESSAGE}</p></div>
                </div>
            </div>
        </div>
    </body>
</html>