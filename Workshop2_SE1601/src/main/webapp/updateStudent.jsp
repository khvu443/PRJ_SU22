<%@page import="java.util.ArrayList"%>
<%@page import="DAO.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Student"%>
<%@page import="Model.Class"%>
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
                <div class="col-lg-6 border border-primary border-3 rounded-3">
                    <div class="text-center mx-3">
                        <h2 class="text-primary">Update Information</h2>
                    </div>
                    <form action="UpdateStudentServlet" method="post" enctype="multipart/form-data">
                        <div class="mt-3">
                            <label class="form-label">Student ID</label>
                            <input type="text" class="form-control border border-2" name="Id" value="${st.SID}" readonly>                                
                        </div>

                        <div class="my-3">
                            <label class="form-label">Student Name </label>
                            <input type="text" class="form-control border border-2" name="Name" value="${st.getSname()}">                                                                
                        </div>

                        <div class="my-2">
                            <label for="selectClass" class="col-form-label">Class Name</label>
                            <select  class="form-select" aria-label="select class" name="classID">
                                <%
                                    Dao d = new Dao();
                                    ArrayList<Class> cl = d.getAllClass();
                                    request.setAttribute("cl", cl);

                                %>
                                <c:forEach items="${cl}" var="c">
                                    <option value="${c.cid}" ${st.CID == c.cid?"selected":""}>${c.className}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="my-3">
                            <label class="form-label">Age </label>
                            <input type="number" class="form-control border border-2" name="age" value="${st.age}">                
                        </div>

                        <div>
                            <label for="userInput" class="col-form-label">Upload Photo</label>
                            <input class="form-control" type="file" name="photo" value="${st.image}">
                        </div>

                        <div class="text-center my-3">
                            <button type="submit" class="btn btn-primary" name="submit" value="">Update</button>
                            <a class="btn btn-primary" name="submit" value="" href="DisplayStudent">Cancel Update</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
