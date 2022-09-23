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
    </head>
    <body>
        <header>
            <!-- ================= Import Header ============ -->
            <div id="header">
                <jsp:include page="../include/management/header.jsp"/>
            </div>
        </header>

        <div class="">
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->
                <div class=" flex-grow-1 container-p-y">
                    <div class="row">
                        <div class="col-xxl col-sm-12">
                            <mvc:form id="form" class="card mb-3 mb-lg-5"
                                      method="POST" modelAttribute="order"
                                      action="${pageContext.request.contextPath}/management/searchOrder" >
                                <div class="card mb-4 ">   

                                    <div class="row pad-top">
                                        <div class="col-md-6 input-space">
                                            <div class="form-group">
                                                <label for="phoneId" class="input-label-03">Phone </label>
                                                <input required id="phoneId" type="number" class="form-control" name="phone" value="${order.phone}"
                                                       placeholder="input phone number" aria-label="eg. 348121032">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group ">
                                                <label for="DataStartId" class="input-label-02">Date</label>
                                                <input required="" type="Date" class="form-control" name="createDate" value="${order.createDate}" id="DataStartId"
                                                       placeholder="from" aria-label="eg. 348121032">
                                                <span>-</span>
                                                <label for="DataEndId" class="input-label-02">Date</label>
                                                <input required type="Date" class="form-control" name="createDate2" value="${order.createDate2}" id="DataEndId"
                                                       placeholder="from" aria-label="eg. 348121032">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 input-space"  style="margin-top: 16px">
                                            <div class="form-group ">
                                                <label for="categoryName" style="margin-right: 20px">Status</label>
                                                <select required id="categoryName" name="status" class="btn btn-outline-primary dropdown-input dropdown-toggle"
                                                        type="button" data-bs-toggle="dropdown" aria-expanded="false" >
                                                    
                                                    <c:forEach items="${status}" var="s">
                                                        
                                                        <option class="dropdown-item" value="${s}">${s}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6 " style="position: relative">
                                            <div class="btn-group" style="position: absolute;right: 0">

                                                <button type="submit" class="btn btn-outline-primary btn-clear">
                                                    <span>Search</span>
                                                </button>

                                                <a href="<c:url value="/management/viewOrder"/>">
                                                    <button onclick="clearForm()" type="button" class="btn btn-outline-secondary btn-clear">
                                                        <span>Reset</span>
                                                    </button>
                                                </a>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </mvc:form>
                            <div class="card mb-4 ">
                                <div class="header-table">
                                    <h4 class="card-header">Order List</h4>                                       
                                </div>
                                <div class=" table-responsive text-nowrap">
                                    <table class="table table-hover">
                                        <thead class="table-light">
                                            <tr>

                                                <th>Name</th>
                                                <th>Phone</th> 
                                                <th>Code</th>
                                                <th>Discount</th>   
                                                <th>Price</th>
                                                <th>Status</th>
                                                <th>Order Date</th>
                                                <th>Action</th>

                                            </tr>
                                        </thead>
                                        <tbody class=" table-border-bottom-0">

                                            <c:forEach items="${orders}" var="o">
                                                <tr>

                                                    <td>${o.nameCustomer}</td>
                                                    <td>${o.phone}</td>
                                                    <td>${o.promotion.code}</td> 
                                                    <td>${o.promotion.discount}%</td> 
                                                    <td>${o.price}$</td>
                                                    <td>${o.status}</td>
                                                    <td>${o.createDate}</td>                                                                                                                                                                                                                          
                                                    <td>
                                                        <a href="<c:url value="/management/viewOrderDetail/${o.id}"/>">Detail</a>                           
                                                    </td>
                                                </tr>

                                            </c:forEach>                                               
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            </form>

                        </div>
                    </div>
                </div>

            </div>

            <!-- / Content -->
        </div>


        <!-- build:js assets/vendor/js/core.js -->
        <jsp:include page="../include/management/js-page.jsp"/>
        <!----------------All Checked -------------------->
        <script src="<c:url value="/assets/js/checkAll.js"/>"></script>
        <script type="module" src="<c:url value="./assets/js/importPage.js"/>"></script>

        <!-- ============= Clear Button ============== -->
        <script>
                                                    function clearForm() {
                                                        document.getElementById("form").reset();
                                                    }
        </script>

        <script>
            var e = document.getElementById("ddlViewBy");
            function show() {
                var as = document.forms[0].ddlViewBy.value;
                var strUser = e.options[e.selectedIndex].value;
                console.log(as, strUser);
            }
            e.onchange = show;
            show();
        </script>

    </body>
</html>
