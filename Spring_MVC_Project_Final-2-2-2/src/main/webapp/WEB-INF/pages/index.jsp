<%-- 
    Document   : index
    Created on : Jul 29, 2022, 6:54:20 PM
    Author     : ldanh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://www.springframework.org/security/tags" 
           prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- require -->
        <jsp:include page="include/user/css-page.jsp"/>
        <title>Home</title>
    </head>

    <body>

        <div class="Employed">
            <!-- Header -->
            <header class="header-wrapper">
                <div class="header fixed-header">
                    <!-- Header - top-->
                    <div class="header-top">
                        <div class="header-top-left">
                            <i class="fas fa-home header-top-left-link"></i>
                            <a class="header-top-left-link" href="#">Bán hàng cùng Iviettech</a>
                        </div>
                        <div class="header-top-right">
                            <div>
                                <span class="header-top-right-link">Hotline</span>
                                <a class="header-top-right-link" href="tel:0906880960">0906.880.960</a>
                            </div>
                            <div>
                                <i class="fab fa-facebook-messenger header-top-right-link" style="margin-right: 3px"></i>
                                <a class="header-top-right-link" href="#">Bán hàng</a>
                            </div>
                        </div>
                    </div>
                    <!-- end Header Top -->
                    <!-- Header - bottom -->
                    <div class="header-bottom">
                        <!-- Header-left -->
                        <ul class="header-bottom-left">
                            <li class="header-bottom-logo">
                                <a href="#">
                                    <img src="./assets/img/logo.svg" alt="logo" />
                                </a>
                            </li>
                            <li class="header-bottom-item">
                                <a href="#">
                                    <span class="header-bottom-item-text text-hover active">Shopping</span>
                                </a>
                            </li>
                            
                        </ul>
                        <!-- end Header-left -->
                        <!-- Header-center -->
                        <ul class="header-bottom-center">
                            <div class="header-center-input">
                                <input type="text" placeholder="Nhập từ khóa tìm kiếm " />
                            </div>
                        </ul>
                        <!-- end Header-center -->
                        <!-- Header-right -->
                        <ul class="header-bottom-right">
                            <li class="header-bottom-right-items">
                                <div class="header-bottom-right-item">
                                    <a href="#"> <i class="far fa-bell"></i>
                                    </a>
                                </div>
                            </li>
                            <li class="header-bottom-right-items">
                                <div class="header-bottom-right-item">
                                    <a href="${pageContext.request.contextPath}/cart"> <i
                                            class="fas fa-shopping-bag "><span class="badge"
                                                                           id="quantity-product-in-cart"></span></i>
                                    </a>
                                </div>
                            </li>
                            <li class="header-bottom-right-items user action ">
                                <div class="profile" onclick="menuToggle();">
                                    <div class="header-bottom-right-item">
                                        <a href="#"> <i class="far fa-user"></i>
                                        </a>
                                    </div>
                                    <div class="profile-right">

                                        <a class="about-user" href="#"> <span class="about-user-1"></span>
                                            <span class="about-user-2">Xin chào!</span> <span
                                                class="about-user-1"><c:out
                                                    value="${sessionScope.email }"></c:out></span>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="menu">
                                        <ul>
                                        <c:choose>
                                            <c:when test="${sessionScope.email == null}">
                                                <li><a href="<c:url value="/login"/>">Đăng Nhập</a></li>
                                                <li class="border-top"><a href="register">Đăng Ký</a></li>
                                                </c:when>
                                                <c:when test="${sessionScope.email != null}">
                                                <li><a
                                                        href="${pageContext.request.contextPath}/customer/updateProfile">
                                                        Thông tin </a></li>
                                                <li><a href="logout"> Đăng xuất </a></li>

                                            </c:when>

                                        </c:choose>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                        <!-- end Header-right -->
                    </div>
                    <a class="about-user" href="<c:url value="/viewRegister"/>">register</a>
                    <ul class="category">
                        <li class="category-item text-hover">
                            <a href="#">Sản phẩm</a>
                        </li>
                        <li class="category-item text-hover">
                            <a href="#">Nam</a>
                        </li>
                        <li class="category-item text-hover">
                            <a href="#">Nữ</a>
                        </li>
                        <li class="category-item text-hover">
                            <a href="#">Phụ kiện</a>
                        </li>
                        <li class="category-item text-hover">
                            <a href="#">Thương hiệu</a>
                        </li>
                        <li class="category-item text-hover">
                            <a href="#">Xếp hạng</a>
                        </li>
                        <li class="category-item text-hover">
                            <a href="#">Mới nhất </a>
                        </li>
                        <li class="category-item text-hover">
                            <a href="#">Giá sốc </a>
                        </li>
                        <li class="category-item text-hover">
                            <a href="#">Sự kiện </a>
                        </li>
                    </ul>
                    <!-- end Header - bottom -->
                </div>
            </header>
            <!-- end Header -->

            <!-- Slide -->

            <div class="swiper-container two page-section bg-w" style="margin-top: 1px; padding-bottom: 60px">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="slider-image">
                            <img src="./resources/assets/img/product/slidetop-3.webp" alt="" />
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slider-image">
                            <img src="./resources/assets/img/product/slidetop-1.webp" alt="" />
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slider-image">
                            <img src="./resources/assets/img/product/slidetop-2.webp" alt="" />
                        </div>
                    </div>
                    <!-- Add Pagination -->
                </div>
                <div class="swiper-pagination"></div>

                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
            <!-- end Slide -->

            <!-- Content -->
            <div class="content">
                <section class="product page-section">
                    <div class="tittle-product">
                        <h3>Sản phẩm bán chạy</h3>
                    </div>
                    <ul class="category-product">
                        <li class="category-product-item active">
                            <a href="#">Áo thun tay ngắn</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Sơ Mi Tay Ngắn</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Quần Dài</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Giày Sneaker</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Áo Quần Ngắn</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Áo thun tay ngắn</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Sơ Mi Tay Ngắn</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Quần Dài</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Giày Sneaker</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Áo Quần Ngắn</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Áo thun tay ngắn</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Sơ Mi Tay Ngắn</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Quần Dài</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Giày Sneaker</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Áo Quần Ngắn</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Sơ Mi Tay Ngắn</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Quần Dài</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Giày Sneaker</a>
                        </li>
                        <li class="category-product-item">
                            <a href="#">Áo Quần Ngắn</a>
                        </li>
                    </ul>
                    <ul class="category-about row">
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card1.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card2.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card3.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card4.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card5.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card3.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card1.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card5.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card4.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card1.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card1.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </section>

                <section class="page-section mt-1">
                    <div class="tittle-product">
                        <h3>Tiêu điểm</h3>
                    </div>
                    <ul class="category-about row">
                        <li class="col c-12 m-6 l-6">
                            <a href="#">
                                <div class="card">
                                    <img src="./assets/img/product/tieudiem1.webp" alt="tieu diem" />
                                </div>
                            </a>
                        </li>
                        <li class="col c-12 m-6 l-6">
                            <a href="#">
                                <div class="card">
                                    <img src="./assets/img/product/tieudiem2.webp" alt="tieu diem" />
                                </div>
                            </a>
                        </li>
                    </ul>
                </section>

                <section class="page-section mt-1">
                    <div class="tittle-product">
                        <h3>Top danh mục</h3>
                        <ul class="top-category row">
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-tshirt"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo thun</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-user-secret"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo khoác</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-tshirt"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo thun</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-user-secret"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo khoác</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-tshirt"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo thun</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-user-secret"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo khoác</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-tshirt"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo thun</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-user-secret"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo khoác</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-tshirt"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo thun</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-user-secret"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo khoác</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-tshirt"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo thun</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-user-secret"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo khoác</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-tshirt"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo thun</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-user-secret"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo khoác</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                            <li class="col c-4 m-3 l-2-4">
                                <a href="#">
                                    <div class="top-item">
                                        <span><i class="fas fa-tshirt"></i></span>
                                        <div class="top-text">
                                            <p class="top-title">Áo thun</p>
                                            <span class="top-quant">7,337</span><span>sản phẩm</span>
                                        </div>
                                        <span class="top-arr"><i class="fas fa-angle-right"></i></span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </section>

                <section class="page-section mt-1 three">
                    <div class="tittle-product" style="margin-bottom: 15px; padding-left: 40px">
                        <h3>Thương hiệu mới</h3>
                    </div>
                    <div class="slide-bottom-wraper">
                        <ul class="slide-bottom bg-w">
                            <li class="slide-bottom-item">
                                <a href="#">
                                    <div class="slide-bottom-img">
                                        <img src="./assets/img/product/slidebot-1.webp" alt="bran-new" />
                                    </div>
                                </a>
                            </li>
                            <li class="slide-bottom-item active">
                                <a href="#">
                                    <div class="slide-bottom-img">
                                        <img src="./assets/img/product/slidebot-2.webp" alt="bran-new" />
                                    </div>
                                </a>
                            </li>
                            <li class="slide-bottom-item">
                                <a href="#">
                                    <div class="slide-bottom-img">
                                        <img src="./assets/img/product/slidebot-3.webp" alt="bran-new" />
                                    </div>
                                </a>
                            </li>
                            <li class="slide-bottom-item">
                                <a href="#">
                                    <div class="slide-bottom-img">
                                        <img src="./assets/img/product/slidebot-4.webp" alt="bran-new" />
                                    </div>
                                </a>
                            </li>
                            <li class="slide-bottom-item">
                                <a href="#">
                                    <div class="slide-bottom-img">
                                        <img src="./assets/img/product/slidebot-5.webp" alt="bran-new" />
                                    </div>
                                </a>
                            </li>
                            <li class="slide-bottom-item">
                                <a href="#">
                                    <div class="slide-bottom-img">
                                        <img src="./assets/img/product/slidebot-6.webp" alt="bran-new" />
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <div class="btn-group">
                            <span class="btn-pre"><i class="fas fa-angle-left"></i></span>
                            <span class="btn-next"><i class="fas fa-angle-right"></i></span>
                        </div>
                        <div class="dots"></div>
                    </div>
                </section>

                <section class="page-section mt-1">
                    <div class="tittle-product">
                        <h3>Sản phẩm mới</h3>
                    </div>
                    <ul class="category-about row">
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card1.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card2.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card3.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card4.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card5.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card2.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card1.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card1.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card1.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card1.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="col c-6 m-4 l-2-4 py-1">
                            <a href="#">
                                <div class="card">
                                    <div class="card-img">
                                        <img src="./assets/img/product/card1.webp" alt="" />
                                    </div>
                                    <div class="card-text">
                                        <h3 class="card-title">TEELAB</h3>
                                        <p class="card-des truncate">Áo Thun Teelab Grey Trame TS049</p>
                                        <span class="card-price"> 350.000đ </span>
                                        <span class="card-price-discount"> -50% </span>
                                        <p class="card-price-cost">175.000đ</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </section>

                <section class="page-section mt-1">
                    <div class="tittle-product">
                        <h3>Thương hiệu bạn có thể biết</h3>
                    </div>
                    <ul class="category-about row">
                        <li class="col c-12 m-4 l-4">
                            <a href="#">
                                <div class="card"></div>
                            </a>
                        </li>
                        <li class="col c-12 m-8 l-8">
                            <a href="#">
                                <div class="card">
                                    <img src="./assets/img/product/last_slide_1.webp" alt="tieu diem" />
                                </div>
                            </a>
                        </li>
                    </ul>
                </section>

                <section class="page-section mt-1">
                    <div class="tittle-product">
                        <h3>Gợi ý cho bạn</h3>
                    </div>
                    <ul class="category-about wrap row">
                        <c:forEach items="${product}" var="p">
                            <li class="col c-6 m-4 l-2-4 py-1 mt-1">

                                <a href="#">
                                    <div class="card">
                                        <div class="card-img">
                                            <img src="../resources/assets/img/product/card1.webp" alt="" />
                                        </div>
                                        <div class="card-text">
                                            <h3 class="card-title">${p.name}</h3>
                                            <p class="card-des truncate">${p.description}</p>
                                            <span class="card-price"> ${p.price}$ </span>
                                            <span class="card-price-discount"> -50% </span>
                                            <p class="card-price-cost">175.000đ</p>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </c:forEach>

                    </ul>
                    <button class="button primary"><span>Xem thêm</span></button>
                </section>
            </div>
            <!-- end Content -->

            <!-- footer -->
            <footer>
                <!-- ================= Import Footer ============ -->
                <div id="footer"><jsp:include page="./include/footer.jsp"/></div>
            </footer>
            <!-- end footer -->
        </div>
        <script>
            function menuToggle() {
                const toggleMenu = document.querySelector(".menu");
                toggleMenu.classList.toggle("active");
            }
        </script>
        <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

        <!---------------  Slide  ---------------->
        <script type="module" src="./resources/assets/js/slide.js"></script>

        <!---------------  Import Footer ---------------->
        <script type="module" src="./resources/assets/js/importPage.js"></script>
    </body>

</html>
