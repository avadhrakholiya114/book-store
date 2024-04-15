<%-- 
    Document   : user_order
    Created on : 24-Mar-2024, 11:07:51 am
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
        <title>orders</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container mt-5">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Order Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Payment Type</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                         User u = (User) session.getAttribute("userObj");
                        
                        BookOrderDaoimpl dao = new orderBookDao(DBconnect.getConn());
                        List<bookOrder> blist = dao.getBook(u.getEmail());
                        for (bookOrder b : blist) {
                    %>

                    <tr>
                        <td><%= b.getOrderId()%></td>
                        <td><%= b.getUserName()%></td>
                        <td><%= b.getBookname()%></td>
                        <td><%= b.getAuthor()%></td>
                        <td><%= b.getPrice()%></td>
                        <td><%= b.getPaymenttype()%></td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </body>
</html>
