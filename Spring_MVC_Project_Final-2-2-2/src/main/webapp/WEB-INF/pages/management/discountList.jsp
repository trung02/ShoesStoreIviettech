<%-- 
    Document   : discountList
    Created on : Aug 5, 2022, 1:37:48 PM
    Author     : trunghuynh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Discount List</title>
        <!------------ CSS core ------------ -->
       <jsp:include page="../include/management/css-page.jsp"/>

        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/DiscountList.css"/>">

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
                <div class="col-sm-12 flex-grow-1">
                    <div class="row">
                        <div class="col-xxl center-block">
                            <form class="" action="">

                                <div class="card mb-4 ">
                                    <div class="header-table">
                                        <h4 class="card-header">Discount List</h4>
                                        <div class="btn btnArond button-wrapper">
                                            <a href="<c:url value="/management/addDiscount"/>">
                                                <button type="button" class="btn button primary">
                                                    <i class="fas fa-plus icon-fas"></i>
                                                    <span>Add New Discount</span>
                                                </button>
                                            </a>
                                            <!-- <button type="button" class="btn btn-primary"><i class="fas fa-plus icon-fas"></i>Add Sub-Category</button> -->
                                        </div>
                                    </div>
                                    <div class="table-responsive text-nowrap">
                                        <table class="table table-hover">
                                            <thead class="table-light">
                                                <tr>
                                                    <th></th>
                                                    <th>Name</th>
                                                    <th>Code</th>
                                                    <th>Start-Date</th>
                                                    <th>End-Date</th>
                                                    <th>Discount</th>
                                                    <th>Promotion Type</th>
                                                    <th>Used</th>
                                                </tr>
                                            </thead>
                                            <tbody class="table-border-bottom-0">

                                                <c:forEach items="${promotions}" var="pr">
                                                    <tr>
                                                        <td></td>
                                                        <td>${pr.name}</td>
                                                        <td>${pr.code}</td>
                                                        <td>${pr.startDate}</td>
                                                        <td>${pr.endDate}</td>
                                                        <td>${pr.discount}%</td>
                                                        <td>${pr.promotionType}</td>
                                                        <td>
                                                            <c:if test="${pr.used == 1}">
                                                            True
                                                        </c:if>
                                                            <c:if test="${pr.used == 0}">
                                                            False
                                                        </c:if>
                                                        </td>
                                                        
                                                        
                                                       
                                                        <td>
                                                            <div class="dropdown">
                                                                <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                                                                    <i class="bx bx-dots-vertical-rounded"></i>
                                                                </button>
                                                                <div class="dropdown-menu">
                                                                    <a class="dropdown-item" href="./updatePromotion/${pr.id}"><i class="bx bx-edit-alt me-1"></i>
                                                                        Edit</a>
                                                                    <a class="dropdown-item" href="./deletePromotion/${pr.id}"><i class="bx bx-trash me-1"></i>
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



        <!-- ================= Upload Mutilple Image ===================== -->
        <script>
            jQuery(document).ready(function () {
                ImgUpload();
            });

            function ImgUpload() {
                var imgWrap = "";
                var imgArray = [];

                $('.upload__inputfile').each(function () {
                    $(this).on('change', function (e) {
                        imgWrap = $(this).closest('.upload__box').find('.upload__img-wrap');
                        var maxLength = $(this).attr('data-max_length');

                        var files = e.target.files;
                        var filesArr = Array.prototype.slice.call(files);
                        var iterator = 0;
                        filesArr.forEach(function (f, index) {

                            if (!f.type.match('image.*')) {
                                return;
                            }

                            if (imgArray.length > maxLength) {
                                return false
                            } else {
                                var len = 0;
                                for (var i = 0; i < imgArray.length; i++) {
                                    if (imgArray[i] !== undefined) {
                                        len++;
                                    }
                                }
                                if (len > maxLength) {
                                    return false;
                                } else {
                                    imgArray.push(f);

                                    var reader = new FileReader();
                                    reader.onload = function (e) {
                                        var html = "<div class='upload__img-box'><div style='background-image: url(" + e.target.result + ")' data-number='" + $(".upload__img-close").length + "' data-file='" + f.name + "' class='img-bg'><div class='upload__img-close'></div></div></div>";
                                        imgWrap.append(html);
                                        iterator++;
                                    }
                                    reader.readAsDataURL(f);
                                }
                            }
                        });
                    });
                });

                $('body').on('click', ".upload__img-close", function (e) {
                    var file = $(this).parent().data("file");
                    for (var i = 0; i < imgArray.length; i++) {
                        if (imgArray[i].name === file) {
                            imgArray.splice(i, 1);
                            break;
                        }
                    }
                    $(this).parent().parent().remove();
                });
            }
        </script>


        <!----------------All Checked -------------------->
        <script src="../assets/js/checkAll.js"></script>

        <!-- ============= Clear Button ============== -->
        <script>
            function clearForm() {
                document.getElementById("form-addProduct").reset();
            }
        </script>
    </body>
</html>
