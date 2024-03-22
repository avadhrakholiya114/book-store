<%-- 
    Document   : index
    Created on : 03-Feb-2024, 10:18:33 am
    Author     : ADMIN
--%>
<%@page import="com.entity.User"%>
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
        <title>Ebook Index</title>
        <%@include file="all_component/allCss.jsp" %>
        <style type="text/css">
            .back-img{
                background: url("book/book.jpg");
                height: 50vh;
                width: 100%;
                background-repeat: no-repeat;
                background-size: cover;
            }
            .crd-do:hover{
                background-color:#fcf7f7;
            }
        </style>
    </head>
    <body style="background-color:#f7f7f7;">


        <%
            User u = (User) session.getAttribute("userObj");
        %>

        <%@include file="all_component/navbar.jsp" %>
        <div class="container-fluid back-img">
            <h2 class="text-danger text-center">Ebook Mangment System</h2>
        </div>



        <!--recent book-->
        <div class="container" >
            <h3 class="text-center mt-2">Recent Book</h3>
            <div class="row">
                <%
                    BookDaoImp dao2 = new BookDaoImp(DBconnect.getConn());
                    List<BookDtls> list1 = dao2.geRecenentBook();
                    for (BookDtls b : list1) {
                %>
                <div class="col-md-3">
                    <div class="card crd-do"> 
                        <div class="card-body text-center">
                            <img src="book/<%= b.getPhotoName()%>" alt="alt" style="width:150px;height: 200px" class="img-thumblin"/>

                            <p><%= b.getBookName()%></p>
                            <p><%= b.getAuthor()%></p>

                            <%
                                if (b.getBookCategory().equals("old")) {
                            %>

                            <p>Catagories : <%= b.getBookCategory()%></p>
                            <div class="row">

                                <div class="col-sm-4">
                                    <a href="view.jsp?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm">View </a>
                                </div>
                                <div class="col-sm-4">
                                    <a href="url" class="btn btn-danger btn-sm"><%= b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
                                </div>
                            </div>
                            <%
                            } else {
                            %>
                            <p>Catagories : <%= b.getBookCategory()%></p>
                            <div class="row">

                                <div class="col-sm-4">
                                    <%

                                        if (u == null) {

                                    %>
                                    <a href="login.jsp" class="btn btn-danger btn-sm">Add Cart</a>
                                    <%} else {
                                    %>
                                    <a href="cart?bid=<%= b.getBookId()%>&&uid=<%= u.getId()%>" class="btn btn-danger btn-sm ">Add Cart</a>
                                    <%
                                        }
                                    %>

                                </div>

                                <div class="col-sm-4">
                                    <a href="view.jsp?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm">View </a>
                                </div>
                                <div class="col-sm-4">
                                    <a href="" class="btn btn-danger btn-sm"><%= b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
                                </div>
                            </div>

                            <%
                                }
                            %>

                        </div>
                    </div>
                </div>
                <%
                    }
                %>

            </div>
            <div class="text-center mt-2">
                <a href="all_recenet.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div>

        </div>
        <!--end recent book--> 
        <hr>
        <!--new book-->
        <div class="container" >
            <h3 class="text-center mt-2">New Book</h3>
            <div class="row">

                <%
                    BookDaoImp dao = new BookDaoImp(DBconnect.getConn());
                    List<BookDtls> list = dao.geNewBook();
                    for (BookDtls b : list) {
                %>
                <div class="col-md-3">
                    <div class="card crd-do"> 
                        <div class="card-body text-center">
                            <img src="book/<%= b.getPhotoName()%>" alt="alt" style="width:150px;height: 200px" class="img-thumblin"/>

                            <p><%= b.getBookName()%></p>
                            <p><%= b.getAuthor()%></p>
                            <p>Catagories : <%= b.getBookCategory()%></p>
                            <div class="row">
                                <div class="col-sm-4">
                                    <%

                                        if (u == null) {

                                    %>
                                    <a href="login.jsp" class="btn btn-danger btn-sm">Add Cart</a>
                                    <%} else {
                                    %>
                                    <a href="cart?bid=<%= b.getBookId()%>&&uid=<%= u.getId()%>" class="btn btn-danger btn-sm ">Add Cart</a>
                                    <%
                                        }
                                    %>

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
            <div class="text-center mt-2">
                <a href="all_new.jsp" class="btn btn-danger btn-sm text-white">View All</a>
            </div>

        </div>
        <!--end new book--> 
        <hr> 
        <!--old book-->
        <div class="container" >
            <h3 class="text-center mt-2">Old Book</h3>
            <div class="row">
                <%
                    BookDaoImp dao3 = new BookDaoImp(DBconnect.getConn());
                    List<BookDtls> list2 = dao3.geOldBook();
                    for (BookDtls b : list2) {
                %>
                <div class="col-md-3">
                    <div class="card crd-do"> 
                        <div class="card-body text-center">
                            <img src="book/<%= b.getPhotoName()%>" alt="alt" style="width:150px;height: 200px" class="img-thumblin"/>

                            <p><%= b.getBookName()%></p>
                            <p><%= b.getAuthor()%></p>
                            <p>Catagories : <%= b.getBookCategory()%></p>
                            <div class="row">
                                
                                <div class="col-sm-4">
                                    <a href="view.jsp?bid=<%= b.getBookId()%>" class="btn btn-success btn-sm">View </a>
                                </div>
                                <div class="col-sm-4">
                                    <a href="all_old.jsp" class="btn btn-danger btn-sm"><%= b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
                <%
                    }
                %>

            </div>
            <div class="text-center mt-2 mb-3">
                <a href="url" class="btn btn-danger btn-sm text-white">View All</a>
            </div>

        </div>
        <!--end old book--> 

        <%@include file="all_component/footer.jsp" %>
    </body>
</html>
