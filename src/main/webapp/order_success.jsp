<%-- 
    Document   : order_success
    Created on : 11-Apr-2024, 3:23:17 pm
    Author     : ADMIN
--%>

<%@page import="com.DAO.orderBookDao"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookOrderDaoimpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.bookOrder" %>
<%@page import="com.DB.DBconnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
        <style>
            .thank-you-container {
                max-width: 600px;
                margin: 0 auto;
                text-align: center;
                padding: 50px 20px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.1);
            }
            .icon-check {
                color: green;
                font-size: 50px;
                margin-bottom: 20px;
            }

        </style>
    </head>
    <body>

        <%@include file="all_component/navbar.jsp" %>

        <c:if test="${not empty succMSG}">
            <p class="text-center text-success">${succMSG}</p>
            <c:remove var="succMSG" scope="session" />
        </c:if>

        <div class="thank-you-container mt-5">
            <div class="icon-check">
                <i class="fa-solid fa-check"></i>
            </div>
            <h2>Thank You</h2>
            <p>Your Order Successfully</p>
            <p>Within 7 Days Your Product will be Delivered to Your Address</p>
            <div>
                <a href="index.jsp" class="btn btn-primary me-2"><i class="bi bi-house me-2"></i>Home</a>
                <a href="user_order.jsp" class="btn btn-danger"><i class="bi bi-cart me-2"></i>View Order</a>
            </div>
        </div>


    </body>
</html>
