<%-- 
    Document   : login
    Created on : Jun 20, 2019, 8:17:26 PM
    Author     : AnhLe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://kit.fontawesome.com/64d58efce2.js"></script>
        
        <link rel="stylesheet"
              href="<c:url value="/resources/assets/css/bootstrap.min.css"/>">
         <link rel="stylesheet"
              href="<c:url value="/resources/assets/css/login.css"/>">
    </head>

    <body>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-2"></div>
                <div class="col-lg-6 col-md-8 login-box">
                    <div class="col-lg-12 login-key">
                        <i class="fa fa-key" aria-hidden="true"></i>
                    </div>
                    <div class="col-lg-12 login-title">
                        ADMIN PANEL
                    </div>

                    <div class="col-lg-12 login-form">
                        <div class="col-lg-12 login-form">
                            <form action="<c:url value="j_spring_security_check"/>" method="post">
                                <div class="form-group">
                                    <label class="form-control-label">USERNAME</label>
                                    <input class="form-control" name="username" type="email"/>
                                </div>
                                <div class="form-group">
                                    <label class="form-control-label">PASSWORD</label>
                                    <input class="form-control" name="password" type="password"/>
                                </div>

                                <div class="col-lg-12 loginbttm">
                                    <div class="col-lg-6 login-btm login-text">
                                        <!-- Error Message -->
                                    </div>
                                    <div class="col-lg-6 login-btm login-button">
                                        <button type="submit" class="btn btn-outline-primary">LOGIN</button>
                                    </div>
                                </div>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-2"></div>
                </div>
            </div>
    </body>

</html>
