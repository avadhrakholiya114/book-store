<%-- 
    Document   : user_order
    Created on : 24-Mar-2024, 11:07:51 am
    Author     : ADMIN
--%>

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
        <div class="container">
            <h2 class="mt-5 mb-4 text-center">Orders</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Name</th>
                        <th>Book Name</th>
                        <th>Author</th>
                        <th>Price</th>
                        <th>Payment Type</th>
                    </tr>
                </thead>
                <tbody>

                    <tr class="text-success">
                        <td>1</td>
                        <td>John Doe</td>
                        <td>The Great Gatsby</td>
                        <td>F. Scott Fitzgerald</td>
                        <td>10.99</td>
                        <td>Credit Card</td>
                    </tr>
                    <tr class="text-success">
                        <td>2</td>
                        <td>Jane Smith</td>
                        <td>To Kill a Mockingbird</td>
                        <td>Harper Lee</td>
                        <td>8.99</td>
                        <td>PayPal</td>
                    </tr>
             
                </tbody>
            </table>
        </div>
    </body>
</html>
