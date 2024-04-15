<%-- 
    Document   : all_book
    Created on : 15-Mar-2024, 10:42:39 pm
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
        <title>Orders</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container mt-5">
            <h2 class="mb-4">Order</h2>
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>OID</th>
                            <th> Name</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>Phn No</th>
                            <th>Book Name</th>
                            <th>Author</th>
                            <th>Price</th>
                            <th>Payment Type</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                       
                        BookOrderDaoimpl dao = new orderBookDao(DBconnect.getConn());
                        List<bookOrder> blist = dao.getallBook();
                        for (bookOrder b : blist) { 
                        %>
                        <tr>
                            <td><%= b.getOrderId() %></td>
                            <td><%= b.getUserName() %></td>
                            <td><%= b.getEmail() %></td>
                            <td><%= b.getFullAdd() %></td>
                            <td><%= b.getPhnNo() %></td>
                            <td><%= b.getBookname() %></td>
                            <td><%= b.getAuthor() %></td>
                            <td><%= b.getPrice() %></td>
                            <td><%= b.getPaymenttype() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
