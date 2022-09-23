<%-- 
    Document   : addProduct
    Created on : Aug 4, 2022, 11:54:40 AM
    Author     : trunghuynh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
        <!------------ CSS core ------------ -->
        <jsp:include page="../include/management/css-page.jsp"/>
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/AddProduct.css"/>">

    </head>
    <body>
        <header>
            <!-- ================= Import Header ============ -->
            <div id="header">
                <jsp:include page="../include/management/header.jsp"/>
            </div>
        </header>
        <div class="layout-page">
            <div class="content-wrapper">
                <div class="col-sm-12 flex-grow-1 container-p-y">
                    <div class="row">
                        <div class="center-block col-xxl">
                            <mvc:form id="form-add" class="card mb-3 mb-lg-5"
                                      method="POST" modelAttribute="product"
                                      action="${pageContext.request.contextPath}/management/resultProduct" enctype="multipart/form-data">
                                <!-- Header -->
                                <c:if test="${action == 'update'}">
                                    <input hidden value="${product.id}" name="id" />
                                </c:if>

                                <c:if test="${action == 'add'}">
                                    <div class="card-header">
                                        <h4 class="card-header-title">Product information</h4>
                                    </div>                                       
                                </c:if>

                                <c:if test="${action == 'update'}">
                                    <div class="card-header">
                                        <h4 class="card-header-title">Update product</h4>
                                    </div>
                                </c:if>

                                <!-- End Header -->

                                <!-- Body -->
                                <div class="card-body">
                                    <!-- Form Group -->
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="productName" class="input-label">Name</label>
                                                <div class="input-group input-group-merge">                                                  
                                                    <input required id="productName" class="form-control" placeholder="name product" 
                                                           name="name" value="${product.name}"></input>                                                   
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <div class=" form-group">
                                                <label for="productCategory" class="input-label">Category</label>
                                                <select id="productCategory" class="form-select" name="category.id">
                                                    <c:if test="${action == 'add'}">
                                                        <option>Choose Category</option>                                                    
                                                    </c:if>
                                                    <c:forEach items="${category}" var="c">
                                                        <option value="${c.id}">${c.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>  

                                    </div>

                                    <!-- End Form Group -->

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="productPrice" class="input-label">Price</label>
                                                <div class="input-group input-group-merge">
                                                    <span class="input-group-text">$</span>
                                                    <input min="0" type="number" id="productPrice" class="form-control" placeholder="100"
                                                           aria-label="Amount (to the nearest dollar)"
                                                           name="price" value="${product.price}"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <div class="mb-3 form-group">
                                                    <label for="productStatus" class="input-label">Status</label>
                                                    <select id="productStatus" class="form-select" name="status">
                                                        <c:if test="${action == 'add'}">
                                                            <option>Choose Status</option>
                                                        </c:if>
                                                        <c:forEach items="${status}" var="s">
                                                            <option value="${s}">${s}</option>
                                                        </c:forEach>    
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="productDesscription" class="input-label">Description</label>
                                                <div class="input-group input-group">                                                  
                                                    <textarea style='display:none' id="productDesscription" class="form-control" placeholder="description" 
                                                              name="description " value="${product.description}">
                                                    </textarea>    
                                                    <div class="form-control"
                                                         id='htmlsource' contenteditable placeholder="description" style='padding:1em;width:100%;min-height:2em;' >${product.description}</div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <label class="input-label"></label>
                                            <div class="upload__box">
                                                <div class="upload__btn-box">
                                                    <label class="upload__btn">
                                                        <p>Upload images</p> 
                                                        <input type="file" multiple name="files" class="upload__inputfile"/>
                                                    </label>
                                                </div>
                                                <div class="upload__img-wrap">  
                                                    <c:forEach items="${product.images}" var="i">  
                                                        <div style="position: relative">
                                                            <img style="background-size: cover;width: 230px;height:230px; padding: 0 10px;margin: 20px 16px;
                                                                 margin-bottom: 30px" src="<c:url value="/resources/image/${i.path}"/>"/>   
                                                            <a href="<c:url value="/management/deleteImage/${i.id}/${product.id}"/>">
                                                                <div style="position: absolute;top: 25px;right: 35px;    width: 24px;
                                                                     height: 24px;
                                                                     border-radius: 50%;
                                                                     background-color: rgba(0, 0, 0, 0.5);
                                                                     color: white;
                                                                     font-weight: 900;
                                                                     text-align: center;
                                                                     line-height: 24px;
                                                                     z-index: 1;
                                                                     cursor: pointer;">x</div></a>
                                                        </div>                                                     
                                                    </c:forEach>   
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="btn btnArond">
                                        <a onclick="clearForm()">
                                            <button type="button" class="btn btn-warning">Reset</button>
                                        </a>
                                        <button type="submit" class="btn button btn-primary">Submit</button>
                                    </div>
                                </div>
                                <!-- Body -->
                            </mvc:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            jQuery(function () {
                jQuery('form').submit(function (e) {
                    jQuery('textarea').val(jQuery('#htmlsource').html());
                });
            });
        </script>
        <script src="<c:url value="/resources-management/assets/js/AddProduct.js"/> "></script>
        <!---------------  Import Header JS ---------------->
        <script type="module" src=""<c:url value="/resources-management/assets/js/importPage.js"/>"></script>
        <script>
            function clearForm() {
                document.getElementById("form-add").reset();
            }
        </script>
    </body>
</html>
