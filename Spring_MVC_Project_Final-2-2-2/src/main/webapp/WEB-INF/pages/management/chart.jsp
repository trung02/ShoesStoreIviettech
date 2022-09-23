<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Page Title</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <jsp:include page="../include/management/header.jsp"/>
        <jsp:include page="../include/management/css-page.jsp"/>
        <link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/assets/css/bootstrap.min.css"/>'>
        <style>
            #layout-menu{
                margin-left: 20px;
                padding-right: 0;               
            }
            .colChart{
                background-color: antiquewhite;
                height: 750px;
                display: flex;
                align-items: flex-end;
                position: relative;
            }
            .colMoth{
                width: 100%;
                margin-bottom: 50px;
                display: flex;
                align-items: flex-end;
            }
            .month{
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
                bottom: 10px;
            }
            .record{
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
                top: -20px;
            }
            .title{
                position: absolute;
                z-index: 1;
                left: 50%;
                transform: translateX(-50%);
                top: 20px;
                font-size: 24pt;
                font-weight: 500;
                color: #0DB8DE;
            }
            .col-sm-12{
                position: relative;
            }
        </style>
    </head>
    <body>
        <div class="layout-wrapper layout-content-navbar">
            <div class="layout-container">
                <!-- Menu -->
                <aside id="layout-menu" class="menu-vertical menu">   
                </aside>
                <div class="layout-page">
                    <div class="content-wrapper">
                        <div class="col-sm-12">
                            <div class="title">RECORD ORDER IN 2021</div>
                            <c:forEach items="${listRecord}" var="l">
                                <div class="col-sm-1 colChart"><div class="colMoth"><div class="col-sm-12" style="background-color: ${l.color};height: ${l.record*30}px;"><div class="record">${l.record}%</div></div><div class="month">${l.month}</div></div></div>
                            </c:forEach>                      
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>