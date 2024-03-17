<%-- 
    Document   : home
    Created on : 16-Mar-2024, 1:22:42 am
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="allCss.jsp" %>

       
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
            <div class="row p-5">

                <div class="col-md-3">
                    <a href="add_book.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fas fa-plus-square fa-3x text-primary"></i>
                                <h4>Add Books</h4>
                                ----------------

                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="all_book.jsp">
                    <div class="card">
                        <div class="card-body text-center text-danger">

                            <i class="fa-solid fa-book-open fa-3x"></i>
                            <h4>All Books</h4>
                            ----------------

                        </div>
                    </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="orders.jsp">
                    <div class="card">
                        <div class="card-body text-center text-warning">
                            <i class="fa-solid fa-box-open fa-3x"></i>
                            <h4>orders</h4>
                            ----------------

                        </div>
                    </div>
                    </a>
                </div>

               


            </div>
        </div>
    </body>
</html>

