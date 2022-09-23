<%-- 
    Document   : addProductDetail
    Created on : Aug 10, 2022, 12:08:24 AM
    Author     : trunghuynh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="../include/management/css-page.jsp"/>
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/AddProduct.css"/>">
    </head>
    <body>
        <header>
            <!-- ================= Import Header ============ -->
            <div id="header"><jsp:include page="../include/management/header.jsp"/></div>
        </header>
        <div class="layout-page">
            <div class="content-wrapper">
                <div class="col-sm-12 flex-grow-1 container-p-y">
                    <div class="row">
                        <div class="center-block col-xxl">
                            <mvc:form id="form-addProduct" class="card mb-3 mb-lg-5"
                                      method="POST" modelAttribute="productDetail"
                                      action="${pageContext.request.contextPath}/management/handleAddDetail">
                                <!-- Header -->
                                <div class="card-header">
                                    <h4 class="card-header-title">Product detail information</h4>
                                </div>
                                <!-- End Header -->

                                <!-- Body -->
                                <div class="card-body">
                                    <input readonly hidden class="form-control" type="text"
                                           name="product.id" value="${productDetail.product.id}"/>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <!-- Form Group -->
                                            <div class="form-group">
                                                <label for="productId" class="input-label">Product</label>
                                                <input readonly class="form-control" type="text" id="productId"
                                                       name="product.name" value="${productDetail.product.name}"/>
                                            </div>
                                            <!-- End Form Group -->
                                        </div>


                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <!-- Form Group -->
                                            <div class="form-group">
                                                <label for="colorId" class="input-label">Color</label>
                                                <select id="colorId" class="form-select" name="color.id">
                                                    <option>Choose Color</option>
                                                    <c:forEach items="${color}" var="c">
                                                        <option value="${c.id}">${c.name}</option>       
                                                    </c:forEach>                                            
                                                </select>
                                            </div>
                                            <!-- End Form Group -->
                                        </div>   
                                        <div class="col-sm-6">
                                            <!-- Form Group -->
                                            <div class="form-group">
                                                <label for="sizeId" class="input-label">Size</label>
                                                <select id="sizeId" class="form-select" name="size.id">
                                                    <option>Choose Size</option>
                                                    <c:forEach items="${size}" var="s">
                                                        <option value="${s.id}">${s.name}</option>       
                                                    </c:forEach>                                            
                                                </select>
                                            </div>
                                            <!-- End Form Group -->
                                        </div>      
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <div class="mb-3 form-group">
                                                    <label for="productGender" class="input-label">Gender</label>
                                                    <select id="productGender" class="form-select" name="gender">
                                                        <option>Choose Gender</option>
                                                        <c:forEach items="${gender}" var="g">
                                                            <option value="${g}">${g}</option>       
                                                        </c:forEach>                                            
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="quantityId" class="input-label">Quantity</label>
                                                <input min="1" id="quantityId" type="number" class="form-control" 
                                                       value="${productDetail.quantity}" name="quantity"></input>
                                            </div>
                                        </div>                                            
                                    </div>               
                                    <div class="row">
                                        <div class="btn btnArond">
                                            <a onclick="clearForm()">
                                                <button type="button" class="btn btn-warning">Clear</button>
                                            </a>
                                            <button type="submit" class="btn button btn-primary"><span>Add</span></button>
                                        </div>
                                    </div>
                                    <!-- Body -->
                                </mvc:form>

                                <div class="row">
                                    <table class="table-active table-responsive border-label-dark" >
                                        <tr style="text-align: center;">
                                            <th>Color</th>
                                            <th>Size</th>
                                            <th>Gender</th>
                                            <th>Quantity</th>
                                            <th>Action</th>
                                        </tr>
                                        <c:forEach items="${listDetail}" var="l">
                                            <tr style="text-align: center">
                                                <c:forEach items="${color}" var="c">
                                                    <c:if test="${c.id == l.color.id}">
                                                        <td>${c.name}</td>
                                                    </c:if>
                                                </c:forEach>                                                
                                                <td>${l.size.id}</td>
                                                <td>${l.gender}</td>
                                                <td>${l.quantity}</td>
                                                <td>
                                                    <a href="<c:url value="/management/deleteDetailSession/${l.id}"/>">Delete</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>   
                                <div class="row" style="margin-bottom: 10px;">
                                    <div class="col-sm-12" style="text-align: center; margin-top: 10px">
                                        <a href="<c:url value="/management/submitP"/>"
                                           <button type="button" class="btn btn-primary">Submit</button>
                                        </a>
                                    </div>
                                </div>     
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="<c:url value="/resources-management/assets/js/AddProduct.js"/> "></script>

            <!---------------  Import Header JS ---------------->
            <script type="module" src=""<c:url value="/resources-management/assets/js/importPage.js"/>"></script>
    </body>
</html>
