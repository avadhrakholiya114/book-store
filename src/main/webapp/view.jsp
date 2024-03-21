<%-- 
    Document   : view
    Created on : 22-Mar-2024, 2:14:36 am
    Author     : ADMIN
--%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@page import="com.DB.DBconnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>

        <%
            int bid = Integer.parseInt(request.getParameter("bid"));
            BookDaoImp dao = new BookDaoImp(DBconnect.getConn());

            BookDtls b = dao.getBook(bid);

        %>


        <div class="container p-3">
            <div class="row">
                <div class="col-md-6 text-center p-5 border">
                    <img src="img/<%= b.getPhotoName()%>" style="height: 100px; width: 100px;" alt="Book Cover Image">
                    <br>
                    <h4>Book Name: <span class="text-warning"><%= b.getBookName()%></span> </h4> 

                    <h4>Author Name: <span class="text-warning"><%= b.getAuthor()%></span></h4>
                    <h4>Category: <span class="text-warning"><%= b.getBookCategory()%></span></h4>
                </div>
                <div class="col-md-6 text-center p-5 border">
                    <h2><%= b.getBookName()%></h2>

                    <%
                        if (b.getBookCategory().equals("old")) {
                    %>

                    <h5 class="text-primary">Connect To Seller</h5>
                    <h5 class="text-primary">Email : <%= b.getUseremail()%></h5>


                    <div class="row ">
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-money-bill-wave fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-undo-alt fa-2x"></i>
                            <p>Rerurn available</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-truck-moving fa-2x"></i>
                            <p>Free Shipping</p>
                        </div>
                    </div>

                    <div>
                        <div class=" text-center p-3">

                            <a href="url" class="btn btn-success">Continue Shopping</a>

                            <a href="url" class="btn btn-danger ">500 <i class="fas fa-rupee-sign"></i></a>

                        </div>
                    </div>
                    <%
                    } else {
                    %>

                    <div class="row ">
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-money-bill-wave fa-2x"></i>
                            <p>Cash On Delivery</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-undo-alt fa-2x"></i>
                            <p>Rerurn available</p>
                        </div>
                        <div class="col-md-4 text-danger text-center p-2">
                            <i class="fas fa-truck-moving fa-2x"></i>
                            <p>Free Shipping</p>
                        </div>
                    </div>

                    <div>
                        <div class=" text-center p-3">

                            <a href="url" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>

                            <a href="url" class="btn btn-danger ">500 <i class="fas fa-rupee-sign"></i></a>

                        </div>
                    </div>

                    <%
                        }
                    %>


                </div>
            </div>
        </div>

    </body>
</html>
