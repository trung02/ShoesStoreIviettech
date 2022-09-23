<%-- 
    Document   : categoryList
    Created on : Aug 5, 2022, 1:35:23 PM
    Author     : trunghuynh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category</title>

        <meta name="description" content="" />
        <jsp:include page="../include/management/css-page.jsp"/>
    </head>
    <body>
        <header>
            <!-- ================= Import Header ============ -->
            <div id="header">
                <jsp:include page="../include/management/header.jsp"/>
            </div>
        </header>
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->
                <aside id="layout-menu" class="menu-vertical menu">   
                </aside>
                <!-- / Menu -->

                <!-- Layout container -->
                <div class="layout-page">
                    <!-- Navbar -->

                    <nav
                        class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                        id="layout-navbar">
                       
                        <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                            <!-- Search -->

                            <mvc:form id="form" class="form-inline float-right" method="post" 
                                      action="${pageContext.request.contextPath}/management/search">
                                <div class="navbar-nav align-items-center">
                                    <div class="nav-item d-flex align-items-center">
                                        <i class="bx bx-search fs-4 lh-0"></i>
                                        <input oninput="searchByName(this)" type="text" 
                                               class="form-control border-0 shadow-none" placeholder="Search..."
                                               aria-label="Search..." name="searchValue"/>     
                                    </div>
                                    <div style="float: right" class="nav-item d-flex align-items-center">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-search icon-fas"></i>           
                                        </button>
                                    </div>
                                </div>
                            </mvc:form>

                        </div>
                    </nav>

                    <!-- / Navbar -->

                    <!-- Content wrapper -->
                    <div class="content-wrapper">
                        <!-- Content -->

                        <div class="col-sm-12 center-block">
                            <div class="card-body">
                                <div class="card mb-4 abcz">

                                    <div class="header-table">
                                        <h4 class="card-header">Category List</h4>
                                        <div class="btn btnArond button-wrapper">
                                            <a href="<c:url value="/management/addCategory"/>">
                                                <button type="button" class="btn btn-primary" href="./AddCategory.html">
                                                    <i class="fas fa-plus icon-fas"></i>
                                                    <span>Add New Category</span>
                                                </button>
                                            </a>
                                            <!-- <button type="button" class="btn btn-primary"><i class="fas fa-plus icon-fas"></i>Add Sub-Category</button> -->
                                        </div>
                                    </div>
                                    <div class="table-responsive text-nowrap">
                                        <table class="table table-hover">
                                            <thead class="table-light">
                                                <tr>
                                                    <th style="width:5%"></th>
                                                    <th style="width:45%">CATEGORY</th>
                                                    <th style="width:45%">Description</th>
                                                    <th style="width:5%">Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody class="table-border-bottom-0">
                                                <c:forEach items="${categories}" var="c">
                                                <div id="categoryList">
                                                    <tr>    
                                                        <td style="width:5%"></td>
                                                        <td>${c.name}</td>
                                                        <td>${c.description}</td>
                                                        <td>
                                                            <div class="dropdown">
                                                                <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                    <a class="dropdown-item" href="./updateCatefory/${c.id}"><i class="bx bx-edit-alt me-1"></i>
                                                                        Edit</a>
                                                                    <a class="dropdown-item" href="./deleteCategory/${c.id}"><i class="bx bx-trash me-1"></i>
                                                                        Delete</a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </div>
                                                    
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

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
                                <a href="#" target="_blank" class="footer-link fw-bolder">Trung Huynh Iviettech</a>
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
    <!-------------- Check All --------------------->
    <script src="<c:url value="/resources-management/assets/js/checkAll.js"/>"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        var list = [];
        function searchByName(param) {
            var txtSearch = param.value;
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/management/api/search?txt="+txtSearch,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    list = data;
                    console.print(data);
                    var row = document.getElementById("categoryList");
                    row.innerHTML = data;
                }
            });
        }
    </script>

</body>
</html>
