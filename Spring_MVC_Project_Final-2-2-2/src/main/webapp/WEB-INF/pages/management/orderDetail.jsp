<%-- 
    Document   : productList
    Created on : Aug 5, 2022, 1:36:11 PM
    Author     : trunghuynh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>
        <!------------ CSS core ------------ -->

        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/ProductList.css"/>">
        <jsp:include page="../include/management/css-page.jsp"/> 
        <jsp:include page="../include/management/header.jsp"/>
    </head>
    <body>

        <div class="container-p-y">
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->
                <div class=" flex-grow-1 container-p-y">
                    <div class="row">
                        <div class="col-xxl col-sm-12">
                            <mvc:form id="form-addProduct" class="card mb-3 mb-lg-5"
                                      method="POST" modelAttribute="order"
                                      action="${pageContext.request.contextPath}/management/resultOrder">

                                <input hidden name="id" value="${order.id}"/>
                                <input hidden name="nameCustomer" value="${order.nameCustomer}"/>
                                <input hidden name="phone" value="${order.phone}"/>
                                <input hidden name="promotion.id" value="${order.promotion.id}"/>
                                <input hidden name="account.id" value="${order.account.id}"/>
                                <input hidden name="price" value="${order.price}"/>
                                <input hidden name="createDate" value="${order.createDate}"/>
                                <input hidden name="email" value="${order.email}"/>
                                <input hidden name="gender" value="${order.gender}"/>

                                <div class="card mb-4 ">
                                    <h4 style="text-align: center" class="card-header">Customer information</h4>
                                    <div class="row row_custom">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label class="input-label col-sm-1">Name</label>
                                                <div class="input-group input-group-merge">                                                   
                                                    <input class="form-control" value="${order.nameCustomer}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row row_custom">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label class="input-label col-sm-1">Gender</label>
                                                <div class="input-group input-group-merge">                                                   
                                                    <input class="form-control" value="${order.gender}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row row_custom">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label class="input-label col-sm-1">Phone</label>
                                                <div class="input-group input-group-merge">                                                   
                                                    <input class="form-control" value="${order.phone}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row row_custom">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label class="input-label col-sm-1">Email</label>
                                                <div class="input-group input-group-merge">                                                   
                                                    <input class="form-control" value="${order.email}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row row_custom">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label class="input-label col-sm-1">Adress</label>
                                                <div class="input-group input-group-merge ">                                                   
                                                    <textarea rows="2" class="form-control">${order.address}</textarea> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card mb-4 ">
                                    <div class="header-table">
                                        <h4 style="text-align: center" class="card-header">Order detail</h4>
                                        <div class="btnArond">
                                            <label for="productStatus" class="input-label">Status</label>
                                            <select id="productStatus" class="form-select" name="status">
                                                <option value="${order.status}">--${order.status}--</option>    
                                                <c:if test="${order.status == 'SUCCESS' || order.status == 'CANCEL'}">
                                                    <c:forEach items="${status}" var="s">                                                       
                                                        <c:if test="${s == order.status}">
                                                            <option hidden value="${s}">${s}</option>
                                                        </c:if>
                                                        <c:if test="${s != order.status}">
                                                            <option disabled="disabled" value="${s}">${s}</option>
                                                        </c:if>                                                      
                                                    </c:forEach>                                                
                                                </c:if>    
                                                <c:if test="${order.status == 'TRANSPORTING'}">
                                                    <c:forEach items="${status}" var="s">                                                       
                                                        <c:if test="${s == order.status}">
                                                            <option hidden value="${s}">${s}</option>
                                                        </c:if>
                                                        <c:if test="${s != order.status && s != 'SUCCESS'}">
                                                            <option disabled="disabled" value="${s}">${s}</option>
                                                        </c:if>    
                                                        <c:if test="${s == 'SUCCESS'}">
                                                            <option value="${s}">${s}</option>
                                                        </c:if> 
                                                    </c:forEach>                                                
                                                </c:if> 
                                                <c:if test="${order.status == 'CONFIRMED' || order.status == 'ORDERED'}">
                                                    <c:forEach items="${status}" var="s">                                                       
                                                        <c:if test="${s == order.status}">
                                                            <option hidden value="${s}">${s}</option>
                                                        </c:if>
                                                        <c:if test="${s != order.status}">
                                                            <c:if test="${order.status == 'ORDERED'}">
                                                                <option value="${s}">${s}</option>
                                                            </c:if>  
                                                            <c:if test="${order.status == 'CONFIRMED' && s != 'ORDERED'}">
                                                                <option value="${s}">${s}</option>
                                                            </c:if>
                                                        </c:if>  
                                                        <c:if test="${order.status == 'CONFIRMED' && s == 'ORDERED'}">
                                                            <option disabled="disabled" value="${s}">${s}</option>
                                                        </c:if>                                                       
                                                    </c:forEach>                                                
                                                </c:if> 
                                            </select>                                         
                                        </div>
                                    </div>
                                    <div class=" table-responsive text-nowrap">
                                        <table class="table table-hover">
                                            <thead class="table-light">
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Size</th> 
                                                    <th>Color</th>  
                                                    <th>Quantity</th>
                                                    <th>Price</th>                                                     
                                                </tr>
                                            </thead>
                                            <tbody class=" table-border-bottom-0">
                                                <c:forEach items="${orderDetails}" var="o">
                                                    <tr>                                                    
                                                        <td>${o.product.name}</td>
                                                        <td>${o.size}</td>
                                                        <td>${o.color}</td> 
                                                        <td>${o.quantity}</td>
                                                        <td>${o.price}$</td>      
                                                    </tr>
                                                </c:forEach>   
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>  
                                                    <td></td>
                                                    <td>Discount: ${order.promotion.discount}%</td>

                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>                                           
                                                    <td>Total: ${(totalPrice * (100-order.promotion.discount))/100}$</td>

                                                </tr>
                                            </tbody>
                                        </table>                                      
                                    </div>
                                </div>
                                <div class="btn btnArond">
                                    <button type="submit" class="btn button btn-primary">Save</button>
                                    <button type="button" onclick="javascript:window.print();" class="btn btn-warning">Print invoice</button>
                                </div>
                            </mvc:form>
                        </div>
                    </div>
                </div>

            </div>

            <!-- / Content -->
        </div>

        <script>

        </script>

        <!-- build:js assets/vendor/js/core.js -->
        <jsp:include page="../include/management/js-page.jsp"/>

        <!----------------All Checked -------------------->
        <script src="<c:url value="/assets/js/checkAll.js"/>"></script>
        <script type="module" src="<c:url value="./assets/js/importPage.js"/>"></script>

        <!-- ============= Clear Button ============== -->

    </body>
</html>
