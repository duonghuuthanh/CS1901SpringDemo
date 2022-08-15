<%-- 
    Document   : index
    Created on : Jul 10, 2022, 3:20:32 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container">
    <c:if test="${products.size() == 0}">
        <p>
            <em>KHONG CO SAN PHAM NAO!!!</em>
        </p>
    </c:if>
     
    <ul class="pagination">
        <c:forEach begin="1" end="${Math.ceil(productCounter/pageSize)}" var="i">
            
            <c:url value="/" var="u">
                <c:param name="page" value="${i}"></c:param>
            </c:url>
        <li class="page-item"><a class="page-link" href="${u}">${i}</a></li>
        </c:forEach>
    </ul>
        
    <div class="row">
        <c:forEach items="${products}" var="p">
            <div class="col-md-3 col-xs-12" style="padding: 10px;">
                <div class="card">
                    <img class="card-img-top" class="img-fluid" src="https://res.cloudinary.com/dxxwcby8l/image/upload/v1647248652/dkeolz3ghc0eino87iec.jpg" alt="Card image">
                    <div class="card-body">
                        <h4 class="card-title">${p.name}</h4>
                        <p class="card-text">
                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${p.price}" /> VND
                        </p>
                        <a href="<c:url value="/products/${p.id}" />" class="btn btn-primary">Xem chi tiet</a>
                    </div>
                </div>
            </div>
        </c:forEach>


    </div>
</div>
