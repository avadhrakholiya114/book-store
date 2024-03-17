<%-- 
    Document   : all_book
    Created on : 15-Mar-2024, 10:42:39 pm
    Author     : ADMIN
--%>

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
                        <tr>
                            <td>1</td>
                            <td>Book A</td>
                            <td>Author X</td>
                            <td>$20</td>
                            <td>New</td>
                            <td>Active</td>
                            <td>
                                avadj
                            </td>
                            <td>Active</td>
                            <td>Active</td>
                            
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
