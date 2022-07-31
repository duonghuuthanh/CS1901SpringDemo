<%-- 
    Document   : products
    Created on : Jul 24, 2022, 1:22:38 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-info">QUAN LY SAN PHAM</h1>

<c:url value="/admin/products" var="action" />

<form:form method="post" action="${action}" 
           modelAttribute="product">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    
    <div class="form-floating mb-3 mt-3">
        <form:input class="form-control" path="name" id="name" placeholder="name" />
        <label for="name">Ten san pham</label>
        <form:errors path="name" element="div" cssClass="invalid-feedback" />
    </div>

    <div class="form-floating mt-3 mb-3">
        <form:input class="form-control" path="price" id="price" placeholder="price" />
        <label for="price">Gia</label>
        <form:errors path="price" element="div" cssClass="invalid-feedback" />
    </div>

    <div class="form-group">
        <label for="sel1" class="form-label">Danh muc</label>
        <form:select path="categoryId" class="form-select">
            <c:forEach items="${categories}" var="c">
                <option value="${c.id}">${c.name}</option>
            </c:forEach>
        </form:select>
    </div>
    
    <div class="form-floating">
        <br>
        <input type="submit" value="Them san pham" class="btn btn-danger" />
    </div>
</form:form>

<div class="spinner-border text-secondary" id="myLoading"></div>
<table class="table table-hover">
    <tr>
        <th></th>
        <th>Ten san pham</th>
        <th>Gia ban</th>
        <th></th>
    </tr>
    <tbody id="adminProd">

    </tbody>
</table>

<script src="<c:url value="/js/product.js" />"></script>
<script>
    <c:url value="/api/products" var="endpoint" />

    window.onload = function () {
        loadAdminProducts('${endpoint}');
    }
</script>