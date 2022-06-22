
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Class"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Class List Page</title>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="my-3">
                    <h3 class="my-3 text-info text-center"> LIST OF CLASS </h3>
                </div>
                <div>
                    <table class="table table-success table-bordered border-info table-hover text-center">
                        <thead class="table-light border-info">
                            <tr>
                                <th>Class ID</th>
                                <th>Class Name</th>
                                <th>Description</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${classList}" var="c">
                                <tr>
                                    <td>${c.cid}</td>
                                    <td>${c.className}</td>
                                    <td>${c.des}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="my-3">
                    <a class="btn btn-outline-primary" href="AddNewClass.jsp">Add New Class</a>
                    <a class="btn btn-outline-dark mx-3" href="DisplayStudent">Return Student List</a>
                </div>
            </div>
        </div>
    </body>
</html>
