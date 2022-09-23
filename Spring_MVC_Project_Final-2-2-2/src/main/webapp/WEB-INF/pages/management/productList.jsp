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
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/custom.css"/>">
        <jsp:include page="../include/management/css-page.jsp"/> 
        <style>
            /* The Modal (background) */
            .modal {
                display: ${message};
            }

        </style>
    </head>
    <body>
        <header>
            <!-- ================= Import Header ============ -->
            <div id="header">
                <jsp:include page="../include/management/header.jsp"/>
            </div>
        </header>

        <div class="layout-page">
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->
                <div class=" flex-grow-1 container-p-y">
                    <div class="row">
                        <div class="col-xxl col-sm-12">
                            <mvc:form id="form" class="card mb-3 mb-lg-5"
                                      method="POST" modelAttribute="productS"
                                      action="${pageContext.request.contextPath}/management/searchProduct" >
                                <div class="card mb-4 ">
                                    <div class="row">
                                        <div class="col-md-6 ">
                                            <div class="input-group">
                                                <select id="ddlViewBy" class="btn btn-outline-primary dropdown-input dropdown-toggle"
                                                        type="button" data-bs-toggle="dropdown" aria-expanded="false" name="category.id">
                                                    <option class="dropdown-item" value="0" selected>Category</option>
                                                    <c:forEach items="${category}" var="c">
                                                        <option class="dropdown-item" value="${c.id}">${c.name}</option>
                                                    </c:forEach>
                                                </select>
                                                <label for="nameProduct"></label>                                              
                                                <input id="nameProduct" name="name" value="${productS.name}" 
                                                       type="text" class="form-control" aria-label="Text input search" placeholder="Input name product" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 ">
                                            <div class="form-group">
                                                <label for="priceId" class="input-label-01">Price</label>
                                                <input type="number" class="form-control" name="price" id="priceId" value="${productS.price}"
                                                       placeholder="from" aria-label="eg. 348121032"><span class="input-group-text">$</span>
                                                <label for="toPriceId" class="input-label-01">To</label>
                                                <input type="number" class="form-control" name="toPrice" id="toPriceId" value="${productS.toPrice}"
                                                       placeholder="to" aria-label="eg. 348121032"><span class="input-group-text">$</span>
                                            </div>
                                        </div>
                                    </div>                                   
                                    <div class="row">
                                        <div class="col-md-4 input-space">
                                            <div class="btn-group">
                                                <button type="submit" class="btn btn-outline-primary btn-clear">
                                                    <span>Search</span>
                                                </button>

                                                <a href="<c:url value="/management/viewProduct"/>">
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
                                    <h4 class="card-header">Product List</h4>
                                    <div class="btnArond">
                                        <a href="<c:url value="/management/addProduct"/>">
                                            <button type="button" class="button btn primary">
                                                <i class="fas fa-plus icon-fas"></i>
                                                <span>Add New Product</span>
                                            </button>
                                        </a>

                                    </div>
                                </div>
                                <div class=" table-responsive text-nowrap">
                                    <table class="table table-hover">
                                        <thead class="table-light">
                                            <tr class="trCustom">
                                                <th></th>
                                                <th>CATEGORY</th>
                                                <th>PRODUCT</th> 
                                                <th>PRICE</th>   
                                                <th>View&Edit Detail</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody class=" table-border-bottom-0">

                                            <c:forEach items="${product}" var="p">
                                                <tr class="trCustom">
                                                    <c:forEach items="${p.images}" var="i" end="0">
                                                        <td style="width: 10%">
                                                            <img src="<c:url value="/resources/image/${i.path}"/>" alt="alt"/>
                                                        </td>
                                                    </c:forEach>                                                     
                                                    <td>${p.category.name}</td>
                                                    <td>${p.name}</td>
                                                    <td>${p.price}$</td> 
                                                    <td><a href="<c:url value="/management/viewImage/${p.id}"/>">click here</a> </td>                                                                                                                                                                  
                                                    <td>
                                                        <div class="dropdown">
                                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                                                <i class="bx bx-dots-vertical-rounded"></i>
                                                            </button>
                                                            <div class="dropdown-menu">
                                                                <a class="dropdown-item" href="<c:url value="/management/updateProduct/${p.id}"/>"><i class="bx bx-edit-alt me-1"></i>
                                                                    Update Product</a>
                                                                <a class="dropdown-item" href="<c:url value="/management/deleteProduct/${p.id}"/>"><i class="bx bx-trash me-1"></i>
                                                                    Delete</a>

                                                            </div>
                                                        </div>
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

        <div id="myModal" class="modal">
            <!-- Modal content -->   
            <div class="modal-content">
                <a href="<c:url value="/management/viewProduct"/>"><span class="close">&times;</span></a>
                <p>You cannot delete the product because the product exists in the order</p>   
            </div>
        </div>

    </body>
</html>
