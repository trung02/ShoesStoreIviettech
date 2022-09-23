<%-- 
    Document   : addCategory
    Created on : Aug 4, 2022, 11:23:14 PM
    Author     : trunghuynh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category</title>

        <meta name="description" content="" />

        <jsp:include page="../include/management/css-page.jsp"/>
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/AddCategory.css"/>"/>

    </head>
    <body>
        <header>
            <!-- ================= Import Header ============ -->
            <div id="header">
                <jsp:include page="../include/management/header.jsp"/>
            </div>
        </header>

        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->

                <aside id="layout-menu" class=" menu-vertical ">

                </aside>
                <!-- / Menu -->

                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->
                        <div class="col-sm-8 center-block">
                            <div class="card-body">
                                <div class="card mb-4 ">
                                    <mvc:form id="form-addCate" method="POST" modelAttribute="category"
                                              action="${pageContext.request.contextPath}/management/resultCategory">
                                        <c:if test="${action == 'update'}">
                                            <input hidden value="${category.id}" name="id" />
                                            
                                        </c:if>

                                        <c:if test="${action == 'add'}">
                                            <h4 class="card-header">Add New Category</h4>                                         
                                        </c:if>

                                        <c:if test="${action == 'update'}">
                                            <h4 class="card-header">Edit Category</h4>
                                        </c:if>

                                        <div class="card-body ">
                                            <div class="add-Name-Code">
                                                <div class="mb-3">
                                                    <label for="nameId" class="form-label">Name Category</label>
                                                    <input required id="nameId" class="form-control" type="text" value="${category.name}" name="name" placeholder="Name Here..." />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="nameId" class="form-label">Description</label>
                                                    <textarea required id="nameId" class="form-control" type="text" value="${category.description}" name="description" placeholder="Description Here..." >${category.description}</textarea>
                                                </div> 
                                            </div>
                                            <div class="btn btnArond">
                                                <a onclick="clearForm()">
                                                    <button type="button" class="btn btn-warning">Clear</button>
                                                </a>

                                                <input type="submit" class="btn btn-primary"></input>
                                            </div>
                                        </div>
                                    </mvc:form>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- / Content -->

                    <!-- Footer -->
                    <footer class="content-footer footer bg-footer-theme">
                        <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                            <div class="mb-2 mb-md-0">
                                ©
                                <script>
                                    document.write(new Date().getFullYear());
                                </script>
                                , made with ❤️ by
                                <a href="#" target="_blank" class="footer-link fw-bolder">Trung Huynh</a>
                            </div>
                            <div>
                                <a href="https://github.com/themeselection/sneat-html-admin-template-free/issues" target="_blank"
                                   class="footer-link me-4">Support</a>
                            </div>
                        </div>
                    </footer>
                    <!-- / Footer -->

                    <div class="content-backdrop fade"></div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->



    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <jsp:include page="../include/management/js-page.jsp"/>

    <!-- Clear form btn -->
    <script>
        function clearForm() {
            document.getElementById("form-addCate").reset();
        }
    </script>

</body>
</html>
