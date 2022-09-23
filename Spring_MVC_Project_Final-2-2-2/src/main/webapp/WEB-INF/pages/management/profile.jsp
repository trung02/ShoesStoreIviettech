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

        <jsp:include page="../include/management/css-page.jsp"/>
        <link rel="stylesheet" href="<c:url value="/resources/assets/css/bootstrap.min.css"/>"/>
        <style>
            .card-body{
                width: 100%;
                position: relative;
                background-color: white;
                border-radius: 10px;
                padding-bottom: 50px;
            }

            .form__left{
                position: absolute;
                border: 1px solid;
                width: 65%;
            }
            .form__right{
                position: absolute;
                border-radius: 10px;
                width: 30%;
                right: 0;
            }
            .user__image{
                width: 200px;
                height: 200px;
                position: absolute;
                border-radius: 50%;
                border: 5px solid  cornflowerblue;
                transform:translateX(-50%) translateY(-50%);
                left: 50%;
                top: 50%;
            }

            .image{
                position: absolute;
                border-radius: 50%;
                width: 100%;
                height: 100%;
            }
            .upload{
                position: absolute;
                bottom: 0;
            }
            .submitD{
                position: absolute;
                bottom: 0;
                transform:translateX(-50%);
                left: 50%;
            }
            .upload__box{
                position: absolute;
                bottom: 0;
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
        <!-- Layout wrapper -->
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->
                <aside id="layout-menu" class="menu-vertical menu">   
                </aside>
                <div class="layout-page">
                    <div class="content-wrapper">
                        <mvc:form id="form-add" class="card mb-3 mb-lg-5"
                                  method="POST" modelAttribute="account"
                                  action="${pageContext.request.contextPath}/management/submitProfile" enctype="multipart/form-data">
                            <input hidden name="password" value="${account.password}"/>
                            <input hidden name="status" value="${account.status}"/>
                            <input hidden name="id" value="${account.id}"/>
                            <div class="card-body">
                                <div class="card col-sm-8">
                                    <h4 style="text-align: center" class="card-header">Customer information</h4>
                                    <div class="row row_custom" style="display: flex;">
                                        <div class="col-sm-12">
                                            <div class="form-group" style="display: flex">
                                                <label for="nameId" class="input-label col-sm-2">Name</label>
                                                <div class="input-group input-group-merge">                                                   
                                                    <input name="nameCustomer" id="nameId" class="form-control" value="${account.nameCustomer}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row row_custom">
                                        <div class="col-sm-12">
                                            <div class="form-group" style="display: flex">
                                                <label for="phoneId" class="input-label col-sm-2">Phone</label>
                                                <div class="input-group input-group-merge">                                                   
                                                    <input name="phone" id="phoneId" class="form-control" value="${account.phone}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row row_custom">
                                        <div class="col-sm-12">
                                            <div class="form-group" style="display: flex">
                                                <label for="emailId" class="input-label col-sm-2">Email</label>
                                                <div  class="input-group input-group-merge">                                                   
                                                    <input name="email" id="emailId" class="form-control" value="${account.email}"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                              
                                    <div class="row row_custom" >
                                        <div class="col-sm-12">
                                            <div class="form-group" style="display: flex">
                                                <label for="addressId" class="input-label col-sm-2">Adress</label>
                                                <div class="input-group input-group-merge ">                                                   
                                                    <textarea name="address" id="addressId" rows="2" class="form-control">${account.address}</textarea> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form__right" style="height: 90%">
                                    <div class="user__image">  
                                        <img class="image" src="<c:url value="/resources/image/${account.path}"/>" alt="avatar" />
                                    </div>
                                    <div class="upload__box">
                                        <div class="upload__btn-box">
                                            <label class="upload__btn">
                                                <p>Upload images</p> 
                                                <input type="file" multiple name="fileData"/>
                                            </label>
                                        </div>
                                    </div>

                                </div>
                                <div class="submitD">
                                    <div class="btn btnArond">       
                                        <button type="submit" class="btn button btn-primary">Submit</button>
                                    </div>
                                </div>

                            </mvc:form>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
