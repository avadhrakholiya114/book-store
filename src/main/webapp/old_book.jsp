<%-- 
    Document   : ola_book
    Created on : 24-Mar-2024, 2:43:53 pm
    Author     : ADMIN
--%>


<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@page import="com.DB.DBconnect"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Old Book</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container mt-5">
            <c:if test="${not empty success}">
                <div class="alert alert-success" role="alert">${success}</div>

                <c:remove var="success" scope="session" />

            </c:if>
            <c:if test="${not empty failed}">
                <div class="alert alert-danger" role="alert">${failed}</div>

                <c:remove var="failed" scope="session" />

            </c:if>
            <table class="table table-striped">
                <thead>
                    <tr>

                        <th>Book Name</th>
                        <th>Author</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        User u = (User) session.getAttribute("userObj");
                        String email = u.getEmail();
                        BookDaoImp dao = new BookDaoImp(DBconnect.getConn());
                        List<BookDtls> list = dao.getOldBook(email, "old");
                        for (BookDtls b : list) {
                    %>
                    <tr>

                        <td><%= b.getBookName()%></td>
                        <td><%= b.getAuthor()%></td>
                        <td><%= b.getPrice()%></td>
                        <td>
                            <a href="deletebook?em=<%= email%>&&id=<%= b.getBookId() %>" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

        </div>

    </body>
</html>
