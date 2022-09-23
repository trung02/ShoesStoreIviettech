<%-- 
    Document   : header
    Created on : Aug 4, 2022, 11:08:24 PM
    Author     : trunghuynh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="css-page-header.jsp"/>
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/custom.css"/>">
        <title>header</title>
    </head>
    <body>
        <div class="container">
            <!-- Header -->
            <header class="header-wrapper">
                <div class="header fixed-header">
                    <!-- Header - bottom -->
                    <div class="header-bottom">

                        <!-- Header-left -->
                        <ul class="header-bottom-left">
                            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                                <a href="#menu-toggle" class="btn btn-default menu-toggle"><i
                                        class="bx bx-menu bx-sm"></i></a>
                            </div>
                            <li class="header-bottom-logo">
                                <a href="#">
                                    <img src="<c:url value="/resources/assets/img/logo.svg"/>" alt="logo" />
                                </a>
                            </li>
                        </ul>
                        <!-- end Header-left -->
                        <!-- Header-right -->
                        <ul class="header-bottom-right">
                            <div class="noti_click" style="position: relative">
                                <li class="header-bottom-right-item">
                                    <a href="#">
                                        <i class="far fa-bell"></i>
                                    </a>
                                </li>
                                <div class="dropdown_noti" style="display: none" >
                                    
                                    <p><c:out value='${sessionScope["username"]}'/></p>
                                </div>
                            </div>

                            <li class="header-bottom-right-item">
                                <a href="<c:url value="/management/viewProfile"/>">
                                    <i class="far fa-user"></i>                                  
                                </a>
                            </li>
                            <li class="header-bottom-right-items user">
                                <div class="header-bottom-right-item">
                                    <a href="<c:url value="/logout"/>">
                                        <i class="fas fa-sign-out-alt"></i>
                                    </a>
                                </div>

                            </li>
                        </ul>
                        <!-- end Header-right -->
                    </div>
                </div>
            </header>
            <!-- end Header -->
            <!--========== NAV ==========-->
            <aside class="nav" id="layout-menu">
                <nav class="nav__container " id="layout-navbar">

                    <div class="list-group">


                        <div id="wrapper-navbar">
                            <div class="nav__list">
                                <div class="nav__items">
                                    <div class="nav__dropdown">                                  
                                        <i class='bx bx-closet nav__icon'></i>
                                        <span class="nav__name">Management</span>
                                        <div class="nav__dropdown-collapse">
                                            <div class="nav__dropdown-content">
                                                <a href="<c:url value="/management/addCategory"/>" class="nav__dropdown-item">Add Category</a>
                                                <a href="<c:url value="/management/addProduct"/>" class="nav__dropdown-item">Add Product</a>
                                                <a href="<c:url value="/management/addDiscount"/>" class="nav__dropdown-item">Add Discount</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="nav__dropdown">           
                                        <i class='bx bx-list-ul nav__icon'></i>
                                        <span class="nav__name">My list</span>
                                        <div class="nav__dropdown-collapse">
                                            <div class="nav__dropdown-content">
                                                <a href="<c:url value="/management/viewCategory"/>" class="nav__dropdown-item">My Category</a>
                                                <a href="<c:url value="/management/viewProduct"/>" class="nav__dropdown-item">My Product</a><!-- comment -->
                                                <a href="<c:url value="/management/viewDiscount"/>" class="nav__dropdown-item">My Discount</a>

                                            </div>
                                        </div>
                                    </div>

                                    <a href="<c:url value="/management/viewOrder"/>" class="nav__link">
                                        <i class='bx bxs-discount nav__icon'></i>
                                        <span class="nav__name">Order</span>
                                    </a>
                                    <a href="<c:url value="/management/viewChart"/>" class="nav__link">
                                        <i class=' bx bxs-bar-chart-square nav__icon'></i>
                                        <span class="nav__name">Report</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </aside>
        </div>
        <!-- jQuery CDN - Slim version (=without AJAX) -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script>
            $(".menu-toggle").click(function (e) {
                e.preventDefault();
                $("#layout-menu").toggleClass("toggled");
            });

        </script>

        <style>
            #layout-menu.toggled {
                padding-left: 0;
                margin-left: -100px;
            }

            #layout-menu.toggled {
                width: 0;
            }

            #layout-menu.toggled {
                position: relative;
                margin-right: 0;
            }
        </style>
        <script>
            hide = true;
            $('body').on("click", function () {
                if (hide)
                    $('.dropdown_noti').removeClass('noti');
                hide = true;
            });

// add and remove .active
            $('body').on('click', '.noti_click', function () {

                var self = $('.dropdown_noti');

                if (self.hasClass('noti')) {
                    $('.dropdown_noti').removeClass('noti');
                    return false;
                }
                $('.dropdown_noti').removeClass('noti');

                self.toggleClass('noti');
                hide = false;
            });
        </script>
    </body>
</html>
