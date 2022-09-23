<%-- 
    Document   : footer
    Created on : Aug 4, 2022, 11:14:22 PM
    Author     : trunghuynh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- require -->
  <link href="http://fonts.cdnfonts.com/css/sf-pro-display" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
    integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/base.css"/>" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
    integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/grid.css"/>" />
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/_varialbe.css"/>" />
  <!--------------- form ------------------------------- -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
    rel="stylesheet">
  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/shared.css"/>" />
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/components/footer.css"/>" />
  <title>Footer</title>
    </head>
    <body>
  <main>
    <!-- -----------------Begin FOOTER---------------------- -->
    <footer class="footer">
      <div class="footer_top">
        <div class="footer_top-item">
          <div class="block_wrapper">
            <ul class="block_list">
              <li class="block_item logo">
                <a href="/"><img src="/assets/img/logo-white.png" alt="logo-white" /></a>
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
                      <div class="card-item_icon"><img src="/assets/img/social/cod.webp" alt="Tiền mặt"
                          title="Tiền mặt">
                      </div>
                      <div class="card-item_text">Tiền mặt</div>
                    </div>
                  </a><a class="block_link" href="/" title="Momo">
                    <div class="card-item_box">
                      <div class="card-item_icon"><img src="/assets/img/social/momo.png" alt="Momo" title="Momo" />
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
                      <div class="card-item_icon"><img src="/assets/img/social/credit-card.png" alt="VISA, MASTER, JCB"
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
                      <div class="card-item_icon"><img src="/assets/img/social/credit-card.png" alt="Internet Banking"
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
    <!-- -----------------End FOOTER---------------------- -->
  </main>
</body>
</html>
