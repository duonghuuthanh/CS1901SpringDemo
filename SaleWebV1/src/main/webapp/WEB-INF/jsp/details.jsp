<%-- 
    Document   : details
    Created on : Aug 15, 2022, 1:52:24 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-danger">CHI TIET SAN PHAM</h1>

<div class="row">
    <div class="col-md-5">
        <img src="${product.image}" alt="${product.name}" class="img-fluid" />
    </div>
    <div class="col-md-7">
        <h1>${product.name}</h1>
        <h3>${product.price} VND</h3>
    </div>
</div>
<c:url value="/api/products/${product.id}/comments" var="endpoint" />

<sec:authorize access="!isAuthenticated()">
    <strong>Vui long <a href="<c:url value="/login" />">dang nhap</a> de binh luan!!!</strong>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <div class="form-group">
        <textarea class="form-control" placeholder="Nhap noi dung binh luan" id="contentId"></textarea>
    </div>
    <button class="btn btn-danger" onclick="addComment('${endpoint}', ${product.id})">Them binh luan</button>
</sec:authorize>


<ul id="comments" class="list-group"">

</ul>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<script src="<c:url value="/js/product.js" />"></script>
<script>
    window.onload = function () {
        loadComments('${endpoint}');
    }
</script>