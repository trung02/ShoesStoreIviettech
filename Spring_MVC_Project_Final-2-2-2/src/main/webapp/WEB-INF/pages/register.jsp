<%-- 
    Document   : register
    Created on : Jul 25, 2022, 8:42:46 PM
    Author     : trunghuynh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <mvc:form method="POST" modelAttribute="account"
                  action="${pageContext.request.contextPath}/register">
            <div class =" container">
                <div class="row">    
                    <div class="col-12 col-lg-6">
                        <div class="form-group">
                            <label for="nameId">Email</label>
                            <input type="text" class="form-control" id="nameId" name="email"
                                   value="${account.email}"/>
                        </div>
                    </div>    

                    <div class="col-12 col-lg-6">
                        <div class="form-group">
                            <label for="passId">Password</label>
                            <input type="password" class="form-control" id="passId" name="password"
                                   value="${account.password}"/>
                        </div>
                    </div>          
                </div>
                <div class="row">  
                    <div class ="row justify-content-right" >
                        <div class="col-12" style="text-align: right">
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </div>
                </div>
                <div class="row"> <fieldset>
                        <legend>Register User or Shop</legend>

                        <div>
                            <input type="radio" id="user" name="user" value="2"
                                   checked>
                            <label for="user">User</label>
                        </div>

                        <div>
                            <input type="radio" id="shop" name="shop" value="3">
                            <label for="shop">Shop</label>
                        </div>
                    </fieldset>
                </div>
            </div>
        </mvc:form>
    </body>
</html>
