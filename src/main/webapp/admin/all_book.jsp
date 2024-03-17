<%-- 
    Document   : all_book
    Created on : 15-Mar-2024, 10:42:39 pm
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@page import="com.DB.DBconnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Book</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container mt-5">
            <h2 class="mb-4">Books</h2>
            <c:if test="${not empty succMSG}">
                <p class="text-center text-success">${succMSG}</p>

                <c:remove var="succMSG" scope="session" />

            </c:if>
            <c:if test="${not empty errorMsg}">
                <p class="text-center text-danger">${errorMsg}</p>
                <c:remove var="errorMsg" scope="session" />
            </c:if>
            <div class="table-responsive">
                <table class="table table-bordered table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>ID</th>
                            <th>Book Name</th>
                            <th>Author Name</th>
                            <th>Price</th>
                            <th>Book Category</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <%
                        BookDaoImp dao = new BookDaoImp(DBconnect.getConn());
                        List<BookDtls> list = dao.getAllBook();
                        for (BookDtls b : list) {
                    %>
                    <tr>
                        <td><%= b.getBookId()%></td>
                        <td><img src="../book/<%=b.getPhotoName()%>" style="width: 50px; height: 50px;"></td>
                        <td><%= b.getBookName()%></td>
                        <td><%= b.getAuthor()%></td>
                        <td><%= b.getPrice()%></td>
                        <td><%= b.getBookCategory()%></td>
                        <td><%= b.getStatus()%></td>
                        <td>
                            <a href="edit.jsp?id=<%= b.getBookId()%>" class="btn btn-success btn-sm"><i class="fas fa-edit"></i> Edit</a>
                            <a href="../delete?id=<%= b.getBookId()%>" class="btn btn-danger btn-sm"><i class="fas fa-trash"></i> Delete</a>
                        </td>
                    </tr>

                    <%
                        }
                    %>




                </table>
            </div>
        </div>
    </body>
</html>
