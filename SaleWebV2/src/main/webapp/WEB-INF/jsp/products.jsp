<%-- 
    Document   : products
    Created on : Jul 24, 2022, 3:25:42 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-info">QUAN LY SAN PHAM</h1>

<div class="container">
    <div class="spinner-border text-warning" id="myLoading"></div>
    <table class="table">
        <tr>
            <th></th>
            <th>Name</th>
            <th>Price</th>
            <th></th>
        </tr>
        <tbody id="mainId">
            
        </tbody>
    </table>
</div>

<script src="<c:url value="/js/product.js" />"></script>
<script>
    <c:url value="/api/products" var="u" />
    window.onload = function () {
        loadAdminProduct("${u}")
    }
</script>
