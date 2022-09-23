<%-- 
    Document   : productList
    Created on : Aug 5, 2022, 1:36:11 PM
    Author     : trunghuynh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/ProductList.css"/>">
        <jsp:include page="../include/management/css-page.jsp"/> 
        <jsp:include page="../include/management/css-page-detail.jsp"/>
    </head>
    <body>

        <header>
            <!-- ================= Import Header ============ -->
            <div id="header">
                <jsp:include page="../include/management/header.jsp"/>
            </div>
        </header>
        <div class="content-wrapper" style="margin: -100px 0 -20px 0">
            <div class="flex-grow-1 container-p-y">

                <main class="detail">

                    <section class="mid-container">
                        <div class="header-table">
                            <h4 class="card-header">Product List</h4>
                            <div class="btnArond">
                                <a href="<c:url value="/management/resultUpdateProduct/${product.id}"/>">
                                    <button type="button" class="button btn primary">
                                        <i class="fas fa-plus icon-fas"></i>
                                        <span>Add New</span>
                                    </button>
                                </a>
                            </div>
                        </div>
                        <section class="detail__product box">
                            <div class="detail__product-img-container">
                                <div class="slider__product-img">
                                    <div class="slider__product-img-list--left">
                                        <c:forEach items="${images}" var="i">
                                            <img src="<c:url value="/resources/image/${i.path}"/>" />
                                        </c:forEach>       
                                    </div>
                                    <div class="slider__product-img-list--right">
                                        <span class="back"><i class="fa-solid fa-angle-left"></i></span>
                                        <div class="slider__product-img-wrapper">
                                            <c:forEach items="${images}" var="i">
                                                <img src="<c:url value="/resources/image/${i.path}"/>" />
                                            </c:forEach> 
                                        </div>
                                        <span class="next"><i class="fa-solid fa-angle-right"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="detail__product-detail">
                                <div class="product__box--detail">
                                    <div class="row">
                                        <table class="table-active table-responsive border-label-dark" >
                                            <tr style="text-align: center;">
                                                <th>Color</th>
                                                <th>Size</th>
                                                <th>Gender</th>
                                                <th>Quantity</th>
                                                <th>Action</th>
                                            </tr>
                                            <c:forEach items="${details}" var="d">
                                                <tr style="text-align: center">
                                                    <td>${d.color.name}</td>
                                                    <td>${d.size.name}</td>
                                                    <td>${d.gender}</td>
                                                    <td>${d.quantity}</td>
                                                    <td>
                                                        <a class="dropdown-item" href="<c:url value="/management/deleteProductDetail/${product.id}/${d.id}"/>">
                                                            <i class="bx bx-trash me-1"></i>Delete</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>   
                                </div>
                            </div>
                        </section>
                        <section>
                            <div class="box">
                                <div class="section-title">
                                    <h3>Mô tả sản phẩm</h3>
                                </div>
                                <div class="info-box__content">
                                    ${product.description}
                                </div>
                            </div>
                        </section>
                    </section>
                </main>
            </div>
        </div>

        <div class="footer_bot">
            Copyright 2022 &copy; Trung Huynh
        </div>
    </footer>
    <jsp:include page="../include/management/js-page.jsp"/>
    <script src="<c:url value="/resources-management/assets/js/utils.js"/>"></script>
    <script src="<c:url value="/resources-management/assets/js/modal.js"/>"></script>
    <script src="<c:url value="/resources-management/assets/js/detail.js"/>"></script>
</body>
</html>
