<%-- 
    Document   : index
    Created on : Jul 10, 2022, 3:20:32 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang chu</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="javascript:void(0)">SaleWeb Online</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="mynavbar">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="javascript:void(0)">&#9749; Trang chu</a>
                        </li>
                        <c:forEach items="${categories}" var="c">
                            <li class="nav-item">
                                <a class="nav-link" href="javascript:void(0)">${c}</a>
                            </li>
                        </c:forEach>
                    </ul>
                    <c:url value="/" var="action" />
                    <form action="${action}" class="d-flex">
                        <input class="form-control me-2" type="text" name="kw" placeholder="Nhap tu khoa de tim...">
                        <button type="submit" class="btn btn-primary" type="button">Tim</button>
                    </form>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="row">
                <c:forEach items="${products}" var="p">
                    <div class="col-md-3 col-xs-12" style="padding: 10px;">
                        <div class="card">
                            <img class="card-img-top" class="img-fluid" src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248652/dkeolz3ghc0eino87iec.jpg" alt="Card image">
                            <div class="card-body">
                                <h4 class="card-title">${p}</h4>
                                <p class="card-text">20.000.000 VND</p>
                                <a href="#" class="btn btn-primary">Xem chi tiet</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>


            </div>
        </div>

        <div class="mt-4 p-5 bg-primary text-white rounded">
            <h1>SaleWeb Online</h1>
            <p>DHT &copy; 2022</p>
        </div>
    </body>
</html>
