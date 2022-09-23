<%-- 
    Document   : addDiscount
    Created on : Aug 4, 2022, 11:23:22 PM
    Author     : trunghuynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Discount</title>
        <jsp:include page="../include/management/css-page.jsp"/>
        <link rel="stylesheet" href="<c:url value="/resources-management/assets/css/AddDiscount.css"/>">
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
                        <div class=" center-block col-xxl">

                            <mvc:form id="form-addDiscount" class="card mb-3 mb-lg-5" method="POST" modelAttribute="promotion"
                                      action="${pageContext.request.contextPath}/management/resultPromotion">
                                <!-- Header -->
                                <div class="card-header">
                                    
                                    <c:if test="${action == 'update'}">
                                        <input hidden value="${promotion.id}" name="id" />
                                    </c:if>

                                    <c:if test="${action == 'add'}">
                                        <h4 class="card-header-title">Discount information</h4>                                         
                                    </c:if>

                                    <c:if test="${action == 'update'}">
                                        <h4 class="card-header-title">Discount update</h4>
                                    </c:if>
                                </div>
                                <!-- End Header -->

                                <!-- Body -->
                                <div class="card-body">
                                    <div class="row">
                                        <div class="form-group">
                                            <label for="nameId" class="input-label">Name
                                                <i class="tio-help-outlined text-body ml-1" data-toggle="tooltip"
                                                   data-placement="top"></i>
                                            </label>
                                            <input required type="text" class="form-control" name="name" id="nameId"
                                                   placeholder="Shirt01, t-shirts, etc." value="${promotion.name}"/>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="codeId" class="input-label">Code Voucher</label>
                                                </label>
                                                <input required type="text" class="form-control" name="code"
                                                       id="codeId" placeholder="#SE1406" value="${promotion.code}"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <!-- Form Group -->
                                            <div class="form-group">
                                                <label for="ValueOrder" class="input-label">Discount</label>
                                                <input required min="0" class="form-control" type="number" id="ValueOrder"
                                                       placeholder="100$" name="discount" value="${promotion.discount}"/>
                                            </div>
                                            <!-- End Form Group -->
                                        </div>
                                        <div class="col-sm-6">
                                            <!-- Form Group -->
                                            <div class="form-group">
                                                <label for="ValueDiscount" class="input-label">Promotion Type</label>
                                                <input required class="form-control" type="text" id="ValueDiscount"
                                                       placeholder="infinity" name="promotionType" value="${promotion.promotionType}" />
                                            </div>
                                            <!-- End Form Group -->
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <!-- Form Group -->
                                            <div class="form-group">
                                                <label for="html5-datetime-local-input" class="input-label">Start
                                                    Date</label>
                                                <input required class="form-control" type="date" name="startDate" value="${promotion.startDate}"
                                                       id="html5-datetime-local-input" />
                                            </div>
                                            <!-- End Form Group -->
                                        </div>
                                        <div class="col-sm-6">
                                            <!-- Form Group -->
                                            <div class="form-group">
                                                <label for="html5-datetime-local-input" class="input-label">End Date</label>
                                                <input required class="form-control" type="date" name="endDate" value="${promotion.endDate}"
                                                       id="html5-datetime-local-input" />
                                            </div>
                                            <!-- End Form Group -->
                                        </div>
                                    </div>
                                    <div class="btn btnArond">
                                        <a onclick="clearForm()">
                                            <button type="button" class="btn btn-warning">Clear</button>
                                        </a>

                                        <button type="submit" class="btn btn-primary">Submit</button>

                                    </div>

                                </div>
                                <!-- Body -->
                            </mvc:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>


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

        <!---------------  Import Header JS ---------------->
        <script type="module" src="<c:url value="/resources-management/assets/js/importPage.js"/>"></script>


        <!-- ============= Clear Button ============== -->
        <script>
            function clearForm() {
                document.getElementById("form-addDiscount").reset();
            }
        </script>
    </body>
</html>
