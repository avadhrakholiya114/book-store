<%-- 
    Document   : all_new
    Created on : 22-Mar-2024, 1:39:43 am
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All New Book</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row p-3">
                <%
                    BookDaoImp dao = new BookDaoImp(DBconnect.getConn());
                    List<BookDtls> list = dao.getAllNewBook();
                    for (BookDtls b : list) {
                %>
                <div class="col-md-3">
                    <div class="card crd-do mt-2"> 
                        <div class="card-body text-center">
                            <img src="img/<%= b.getPhotoName()%>" alt="alt" style="width:150px;height: 200px" class="img-thumblin"/>

                            <p><%= b.getBookName()%></p>
                            <p><%= b.getAuthor()%></p>
                            <p>Catagories : <%= b.getBookCategory()%></p>
                            <div class="row">
                                <div class="col-sm-4">
                                    <a href="url" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>
                                </div>
                                <div class="col-sm-4">
                                    <a href="view.jsp?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm">View </a>
                                </div>
                                <div class="col-sm-4">
                                    <a href="url" class="btn btn-danger btn-sm"><%= b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
                <%
                    }
                %>


            </div>
        </div>
    </body>
</html>
