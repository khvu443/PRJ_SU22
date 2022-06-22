<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Student"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="~/WEB-INF/styleTable.css" type="text/css"/>
        <title>Display Page</title>
    </head>
    <body>
        <div class="container-lg mt-5">
            <div class="row justify-content-center">

                <div class="col-lg">
                    <div class="my-5">
                        <h2 class="text-primary">WORKSHOP 2 - DE160383</h2>
                    </div>
                    <div>
                        <table class="table table-primary table-bordered border-light table-hover">
                            <thead class="table-light">
                                <tr class="text-center">
                                    <td>Student ID</td>
                                    <td>Student Name</td>
                                    <td>Class ID</td>
                                    <td>Age</td>
                                    <td>image</td>
                                    <td colspan="2">Action</td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${list}">
                                    <tr>
                                        <td class="text-center">${dto.SID}</td>
                                        <td class="text-center">${dto.getSname()}</td>
                                        <td class="text-center"> ${dto.getCID()}</td>
                                        <td class="text-center">${dto.getAge()}</td>
                                        <td><img style="height: 100px; width: 150px" class="img-fluid" src="${dto.image}" alt="alt"/></td>

                                        <td class="text-center">
                                            <a class="btn btn-outline-secondary" href="UpdateStudentServlet?sid=${dto.SID}">Update</a>
                                        </td>
                                        <td class="text-center"><a class="btn btn-outline-danger"  href="#" onclick="confirmDelete(${dto.SID})">Delete</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="mb-5">
                        <a class="btn btn-outline-primary" href="AddNewStudent.jsp">Add new Student</a>
                        <a class="btn btn-outline-dark mx-3" href="DisplayClass">Return Class List</a>
                    </div>
                </div>                
            </div>
        </div>
        <script>
            function confirmDelete(id)
            {
                let txt = "Do you want to delete " + id + " ?";
                if (confirm(txt) === true)
                {
                    window.location.href = 'DeleteStudentServlet?sid=' + id;
                }
            }
        </script>
    </body>
</html>
