<%-- 
    Document   : detail
    Created on : Aug 2, 2022, 9:15:09 PM
    Author     : trunghuynh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="../include/user/css-page-detail.jsp"/>
        <title>Product Detail</title>
    </head>
    <body>
    <body>
        <!-- Header -->
        <header class="header-wrapper">
            <div class="header fixed-header">
                <!-- Header - top-->
                <div class="header-top">
                    <div class="header-top-left">
                        <i class="fas fa-home header-top-left-link"></i>
                        <a class="header-top-left-link" href="#">Bán hàng cùng Dosiin</a>
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
                                <img src="../assets/img/logo.svg" alt="logo" />
                            </a>
                        </li>
                        <li class="header-bottom-item">
                            <a href="#">
                                <span class="header-bottom-item-text text-hover active">Shopping</span>
                            </a>
                        </li>
                        <li class="header-bottom-item">
                            <a href="#">
                                <span class="header-bottom-item-text text-hover">Style</span>
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
                        <li class="header-bottom-right-item">
                            <a href="#">
                                <i class="far fa-bell"></i>
                            </a>
                        </li>
                        <li class="header-bottom-right-item">
                            <a href="#">
                                <i class="fas fa-shopping-bag"></i>
                            </a>
                        </li>
                        <li class="header-bottom-right-items user">
                            <div class="header-bottom-right-item">
                                <a href="#">
                                    <i class="far fa-user"></i>
                                </a>
                            </div>
                            <a class="about-user" href="#">
                                <span class="about-user-1">Tài khoản</span>
                                <span class="about-user-2">Xin chào!</span>
                            </a>
                            <i class="fas fa-caret-down" style="font-size: 1.6rem"></i>
                        </li>
                    </ul>
                    <!-- end Header-right -->
                </div>
                <!-- end Header - bottom -->

                <!-- ------------------------ Begin BREADCRUMB ------------------------------- -->
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
                <!-- ------------------------ End BREADCRUMB ------------------------------- -->
            </div>

        </header>
        <!-- end Header -->
   <!-- ----------------- Begin MAIN---------------------- -->
        <main class="detail">
            <section class="mid-container">
                <section class="detail__product box">
                    <div class="detail__product-img-container">
                        <div class="slider__product-img">
                            <div class="slider__product-img-list--left">
                                <c:forEach items="${images}" var="i">
                                    <img src="<c:url value="/resources/image/${i.path}"/>" class="active" />
                                </c:forEach>
                            </div>
                            <div class="slider__product-img-list--right">
                                <span class="back"><i class="fa-solid fa-angle-left"></i></span>
                                <div class="slider__product-img-wrapper">
                                    <c:forEach items="${images}" var="i">
                                        <img src="<c:url value="/resources/image/${i.path}"/>" class="active" />
                                    </c:forEach>

                                </div>
                                <span class="next"><i class="fa-solid fa-angle-right"></i></span>
                            </div>
                        </div>
                    </div>
                    <div class="detail__product-detail">

                        <div class="product__box--detail">
                            <p class="product__brand">Thương hiệu:&nbsp;<span class="text-highlight">${product.category.name}</span></p> 


                            <div class="product__name-wishlist">
                                <p class="product__name">${product.name}<br>Unisex</p>
                                <span class="product__add-to-wishlist"><i class="fa-regular fa-heart"></i></span>
                            </div>
                        </div>

                        <div class="product__box--detail">
                            <div class="product__price-wrapper">
                                <div class="product__price--new"></div>
                                <div class="product__price--old"></div>
                                <div class="product__price--discount"></div>
                            </div>
                            <div class="product__judge">
                                <span class="product-judge__stars">
                                    <i class="fas fa-star star-icon active"></i>
                                    <i class="fas fa-star star-icon active"></i>
                                    <i class="fas fa-star star-icon active"></i>
                                    <i class="fas fa-star star-icon"></i>
                                    <i class="fas fa-star star-icon"></i></span>
                                <span class="product-judge__star-number">3</span>
                                <span class="product-judge__dot"><i class="fa-solid fa-circle"></i></span>
                                <span class="product-judge__wishlist "><i class="fa-regular fa-heart text-highlight"></i></span>
                                <span class="product-judge__wishlist-number">0</span>
                            </div>
                        </div>
                        <div class="product__box--detail">
                            <div class="product__attribute-wrapper">
                                <div class="product__attribute">
                                    <div class="product__attribute-text">Màu sắc</div>
                                    <span></span>

                                </div>
                                <div class="product__attribute__select">
                                    <c:forEach items="${details}" var="d">
                                        <div class="product__attribute__select-item">
                                            <input class="color-input" id="color-${d.color.name}" type="radio" name="color" value="">
                                            
                                            <label class="color-text" for="color-${d.color.name}"><span class="text">${d.color.name}</span></label>
                                        </div>  
                                    </c:forEach>

                                </div>
                            </div>
                        </div>
                        <div class="product__box--detail">
                            <div class="product__attribute-wrapper">
                                <div class="product__attribute">
                                    <div class="product__attribute-text">Kích thước</div>
                                    <span></span>
                                    
                                </div>
                                <div class="product__attribute__select">
                                    <c:forEach items="${details}" var="d">
                                        <div class="product__attribute__select-item">
                                            <input class="color-input" id="size-${d.size.name}" type="radio" name="color" value="">
                                            <label class="color-text" for="size-${d.size.name}"><span class="text">${d.size.name}</span></label>
                                        </div>  
                                    </c:forEach>                              
                                </div>
                            </div>
                        </div>
                        <div class="product__box--detail">
                            <div class="product__in-store"><span></span>&nbsp;sản phẩm có sẵn</div>
                            <div class="product__quantity-wrapper">
                                <span class="minus">-</span>
                                <span class="product__quantity">1</span>
                                <span class="plus">+</span>
                            </div>
                            <div class="error text-highlight">Số lượng bạn chọn đã đến mức tối đa của sản phẩm này</div>
                        </div>
                        <div class=" product__box--detail">
                            <div class="product__navigate">
                                <a class="btn btn-primary"><span>Thêm vào giỏ hàng</span></a><a class="btn btn-primary"><span>Đến
                                        trang mua
                                        hàng</span></a>
                            </div>
                           
                        </div>
                        
                    </div>
                </section>
                <section class="page-section">
                    <div class="detail-info__left">
                        <div class="aside-left__describe box">
                            <div class="section-title">
                                <h3>Mô tả sản phẩm</h3>
                            </div>
                            <div class="info-box__content">
                                <p> Áo Thun Sly Simple màu vàng</p>
                                <p>– Chất liệu: 100% Cotton Chính Phẩm 4 chiều.</p>
                                <p>– Họa tiết: Thêu</p>
                                <p>– Kiểu dáng: Form suông hiện đại phù hợp cho cả Nam lẫn Nữ.</p>
                                <p></p>
                                <p>HƯỚNG DẪN BẢO QUẢN</p>
                                <p>– Hạn chế giặt máy, nên giặt tay</p>
                                <p>– Lộn trái khi giặt, nên phơi nơi nắng nhẹ, tránh ánh nắng trực tiếp.</p>
                                <p></p>
                                <p>- Chính sách và điều kiện đổi trả của SLY CLOTHING:</p>
                                <p> + Cam kết được đổi trả hàng trong vòng 7 ngày (tính từ ngày nhận hàng).</p>
                                <p> + Cam kết chất lượng và mẫu mã sản phẩm giống với hình ảnh.</p>
                                <p> + Hàng phải còn mới, chưa qua sử dụng và còn tag.</p>
                                <p> + Sản phẩm bị lỗi do vận chuyển và do nhà sản xuất.</p>
                                <p></p>
                                <p> ⚠️ LƯU Ý:</p>
                                <p> - Khi bạn gặp bất kì vấn đề gì về sản phẩm đừng vội đánh giá mà hãy liên hệ qua kênh chat hoặc gọi
                                    ngay vào
                                    Hotline để được SLY hỗ trợ quý khách tốt nhất nhé.</p>
                                <p> - Quý khách vui lòng quay video unbox sản phẩm. Nếu sản phẩm có Sai xót, lỗi của nhà sản xuất, thiếu
                                    sản phẩm SLY
                                    sẽ dựa trên video mà bạn cung cấp để giải quyết đơn hàng của bạn.</p>
                                <p>📥 Chat qua fanpage: http://m.me/slyclothing.saigon</p>
                                <p>📲 Hotline: 0902788994</p>
                                <p></p>
                                <p>#sly #slyclothing #freeship #follow</p>
                                <p>#unisex #streetwear #teen #friends #oversized #fashion #xuhuongthoitrang</p>
                                <p>#aothun #simple #aothunsly #aosly </p>
                            </div>
                        </div>
                        <div class="aside-left__reviews box">
                            <div class="section-title">
                                <h3>Đánh giá sản phẩm</h3>
                            </div>
                            <div class="reviews__container">
                                <div class="reviews__left">
                                    <div class="box-reviews__top">
                                        <div class="box-reviews__left">
                                            <h5 class="box-reviews__number">3.5<span class="box-reviews__description">trên 5</span></h5>

                                        </div>
                                        <div class="box-reviews__right">
                                            <div class="box-reviews__stars">
                                                <i class="fas fa-star star-icon active"></i>
                                                <i class="fas fa-star star-icon active"></i>
                                                <i class="fas fa-star star-icon active"></i>
                                                <i class="fas fa-star star-icon"></i>
                                                <i class="fas fa-star star-icon"></i>

                                            </div>
                                            <div class="box-reviews__description"><strong>1</strong><span>&nbsp;đánh giá</span></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="v-divider"></div>

                                <div class="reviews__mid">
                                    <div class="box-reviews__bottom">
                                        <div class="reviews-bar">
                                            <div class="reviews-bar__stars">
                                                <span class="reviews-bar__star-number">5</span>
                                                <span class="reviews-bar__star"><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="reviews-bar__progress" style="--percent:80%"></div>
                                            <div class="reviews-bar__percent">80%</div>
                                        </div>
                                        <div class="reviews-bar">
                                            <div class="reviews-bar__stars">
                                                <span class="reviews-bar__star-number">4</span>
                                                <span class="reviews-bar__star"><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="reviews-bar__progress" style="--percent:80%;"></div>
                                            <div class="reviews-bar__percent">100%</div>
                                        </div>
                                        <div class="reviews-bar">
                                            <div class="reviews-bar__stars">
                                                <span class="reviews-bar__star-number">3</span>
                                                <span class="reviews-bar__star"><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="reviews-bar__progress" style="--percent:0%;"></div>
                                            <div class="reviews-bar__percent">10%</div>
                                        </div>
                                        <div class="reviews-bar">
                                            <div class="reviews-bar__stars">
                                                <span class="reviews-bar__star-number">2</span>
                                                <span class="reviews-bar__star"><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="reviews-bar__progress" style="--percent:10%;"></div>
                                            <div class="reviews-bar__percent">0%</div>
                                        </div>
                                        <div class="reviews-bar">
                                            <div class="reviews-bar__stars">
                                                <span class="reviews-bar__star-number">1</span>
                                                <span class="reviews-bar__star"><i class="fas fa-star"></i></span>
                                            </div>
                                            <div class="reviews-bar__progress" style="--percent:0%;"></div>
                                            <div class="reviews-bar__percent">0%</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="v-divider"></div>
                                <div class="reviews__right">
                                    <div class="reviews__direct">
                                        <p class="reviews-direct__text">Đánh giá sản phẩm
                                        </p>
                                        <div class="review-direct__stars box">
                                            <i class="fas fa-star star-icon active"></i>
                                            <i class="fas fa-star star-icon active"></i>
                                            <i class="fas fa-star star-icon active"></i>
                                            <i class="fas fa-star star-icon"></i>
                                            <i class="fas fa-star star-icon"></i>
                                        </div>
                                        <div class="reviews-direct__comment">
                                            <p class="text-highlight">Viết đánh giá</p><span><i
                                                    class=" fa-regular fa-comment-dots text-highlight"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="aside-left__reviews box">
                            <!-- ------------------------ ELSE NO REVIEWS ------------------------------- -->
                            <section class="no-reviews">
                                <div><img src="../assets/img/shop/no-review.webp">
                                    <p>Hãy là người đầu tiên đánh giá sản phẩm này</p>
                                </div>
                            </section>
                            <!-- ------------------------ ENDIF ------------------------------- -->
                        </div>

                    </div>
                </section>
                <section class="detail__product-list box">
                    <!-- ------------------------ Begin PRODUCT ------------------------------- -->
                    <section class="page-section">
                        <div class="section-title">
                            <h3>Bạn cũng có thể thích</h3>
                        </div>
                        <ul class="product-slider category-about row">
                            <li class="col c-6 m-4 l-2-4 py-1">
                                <a href="#">
                                    <div class="card">
                                        <div class="card-img">
                                            <img src="../assets/img/product/card1.webp" alt="" />
                                        </div>
                                        <div class="card-text">
                                            <h3 class="card-title text-hover">TEELAB</h3>
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
                    <!-- ------------------------ End PRODUCT ------------------------------- -->
                </section>
            </section>
        </main>
        <!-- ----------------- End MAIN---------------------- -->

        <!-- ----------------- Begin FOOTER---------------------- -->
        <footer class="footer">
            <div class="footer_top">
                <div class="footer_top-item">
                    <div class="block_wrapper">
                        <ul class="block_list">
                            <li class="block_item logo">
                                <a href="/"><img src="../assets/img/logo-white.png" alt="logo-white" /></a>
                            </li>
                            <li class="block_item">
                                <a class="block_link" href="tel:0906.880.960" title="Hotline: 0906.880.960">Hotline: 0906.880.960</a>
                            </li>
                            <li class="block_item">
                                <a class="block_link" href="/" title="9h-18h từ Thứ 2 đến Thứ 6">(9h-18h từ Thứ 2 đến Thứ 6)</a>
                            </li>
                            <li class="block_item">
                                <a class="block_link" href="email:customer@dosiinvn.com" title="Email: customer@dosiinvn.com">Email:
                                    customer@dosiinvn.com</a>
                            </li>
                        </ul>
                        <h5 class="block_heading">Kết nối với chúng tôi</h5>
                        <ul class="block-app-list">
                            <li class="block-app-item">
                                <a href="https://www.instagram.com/dosiin.magz/" title="Instagram"><i
                                        class="fab fa-instagram-square"></i></a>
                            </li>
                            <li class="block-app-item">
                                <a class="dosiin_d-block" href="https://www.facebook.com/dosiinvietnam/" title="Facebook"><i
                                        class="fab fa-facebook"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="block_wrapper">
                        <h5 class="block_heading">Về Dosiin</h5>

                        <ul class="block_list">
                            <li class="block_item">
                                <a class="block_link" href="#">Các điều khoản khác</a>
                            </li>
                            <li class="block_item"><a class="block_link" href="#">Hợp tác</a></li>
                            <li class="block_item"><a class="block_link" href="#">Hỏi và Đáp</a></li>
                            <li class="block_item">
                                <a class="block_link" href="#">Hạn chế với thời gian và quản lý</a>
                            </li>
                            <li class="block_item">
                                <a class="block_link" href="#">Nghĩa vụ của người bán</a>
                            </li>
                            <li class="block_item">
                                <a class="block_link" href="#">Nghĩa vụ của khách hàng</a>
                            </li>
                            <li class="block_item">
                                <a class="block_link" href="#">Chính sách vận chuyển</a>
                            </li>
                            <li class="block_item">
                                <a class="block_link" href="#">Về chúng tôi</a>
                            </li>
                        </ul>
                    </div>
                    <div class="block_wrapper">
                        <h5 class="block_heading">Nội dung chính sách</h5>
                        <ul class="block_list">
                            <li class="block_item">
                                <a class="block_link" href="#">Chính sách bảo mật</a>
                            </li>
                            <li class="block_item"><a class="block_link" href="#">Điều khoản dịch vụ</a></li>
                            <li class="block_item"><a class="block_link" href="#">Chính sách thành viên</a></li>
                            <li class="block_item">
                                <a class="block_link" href="#">Chính sách thanh toán</a>
                            </li> 
                            <li class="block_item">
                                <a class="block_link" href="#">Chính sách bảo mật thanh toán</a>
                            </li>
                            <li class="block_item">
                                <a class="block_link" href="#">Chính sách dành cho khách hàng</a>
                            </li>
                        </ul>
                    </div>
                    <div class="block_wrapper">
                        <h5 class="block_heading">Cách thức thanh toán</h5>
                        <ul class="block_card-list">
                            <li class="block_card-item">
                                <div class="card-item_list">
                                    <a class="block_link" href="/" title="COD Tiền mặt">
                                        <div class="card-item_box">
                                            <div class="card-item_icon"><img src="../resources/assets/img/social/cod.webp" alt="Tiền mặt"
                                                                             title="Tiền mặt">
                                            </div>
                                            <div class="card-item_text">Tiền mặt</div>
                                        </div>
                                    </a><a class="block_link" href="/" title="Momo">
                                        <div class="card-item_box">
                                            <div class="card-item_icon"><img src="../resources/assets/img/social/momo.png" alt="Momo" title="Momo" />
                                            </div>
                                            <div class="card-item_text">Momo</div>
                                        </div>
                                    </a>
                                </div>
                            </li>
                            <li class="block_card-item">
                                <div class="card-item_list">
                                    <a class="block_link" href="/" title="VISA, MASTER, JCB">
                                        <div class="card-item_box">
                                            <div class="card-item_icon"><img src="../resources/assets/img/social/credit-card.png" alt="VISA, MASTER, JCB"
                                                                             title="VISA, MASTER, JCB" /></div>
                                            <div class="card-item_text">VISA, MASTER, JCB</div>
                                        </div>
                                    </a>
                                </div>
                            </li>
                            <li class="block_card-item">
                                <div class="card-item_list">
                                    <a class="block_link" href="/" title="Internet Banking">
                                        <div class="card-item_box">
                                            <div class="card-item_icon"><img src="../resources/assets/img/social/credit-card.png" alt="Internet Banking"
                                                                             title="Internet Banking" /></div>
                                            <div class="card-item_text">Internet Banking</div>
                                        </div>
                                    </a>
                                </div>
                            </li>
                        </ul>


                    </div>
                </div>
            </div>
            <div class="footer_bot">
                Copyright 2022 &copy; FPT University DaNang
            </div>
        </footer>
        <!-- ----------------- End FOOTER---------------------- -->
        <script src="<c:url value="/resources/assets/js/utils.js"/>"></script>
        <script src="<c:url value="/resources/assets/js/modal.js"/>"/>/>></script>
        <script src="<c:url value="/resources/assets/js/detail.js"/>"></script>
    </body>

</html>
