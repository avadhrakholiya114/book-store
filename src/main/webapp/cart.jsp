<%-- 
    Document   : cart
    Created on : 23-Mar-2024, 2:28:59 pm
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="com.entity.cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.cartDaoimpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBconnect"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart </title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>


        <%@include file="all_component/navbar.jsp" %>

        <c:if test="${ empty userObj}">


            <c:redirect url="login.jsp" ></c:redirect>
        </c:if>   

        <div class="container">
            <div class="row p-2">
                <div class="col-md-6">

                    <div class="card">
                        <div class="card-body">

                            <c:if test="${not empty success}">
                                <div class="alert alert-success" role="alert">${success}</div>

                                <c:remove var="success" scope="session" />

                            </c:if>
                            <c:if test="${not empty failed}">
                                <div class="alert alert-danger" role="alert">${failed}</div>

                                <c:remove var="failed" scope="session" />

                            </c:if>


                            <h3 class="text-center text-success">Your Selected Item</h3>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Book Name</th>
                                        <th scope="col">Author</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        User u = (User) session.getAttribute("userObj");
                                        cartDaoimpl dao = new cartDaoimpl(DBconnect.getConn());
                                        List<cart> cartItems = dao.getBookbyUser(u.getId());
                                        Double totalprice = 0.00;

                                        for (cart c : cartItems) {
                                    %>
                                    <tr>
                                        <td><%= c.getBookName()%></td>
                                        <td><%= c.getAuthor()%></td>
                                        <td><%= c.getPrice()%></td>
                                        <td>
                                            <a href="removebook?bid=<%= c.getBId()%>&&uid=<%= c.getUId()%>&&cid=<%= c.getCId()%>" class="btn btn-danger">Remove</a>
                                        </td>
                                    </tr>
                                    <%

                                            totalprice += c.getTotalPrice();
                                        }
                                    %>

                                    <tr>
                                        <td>Total Price</td>
                                        <td></td>
                                        <td></td>
                                        <td><%= totalprice%></td>
                                    </tr>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card">
                       
                        <div class="card-body">
                            <h3 class="text-center text-success">Your Details for Order</h3>
                              <c:if test="${not empty errorMsg}">
                            <p class="text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                            <form method="post" action="order">
                                <input type="hidden" value="<%= u.getId() %>" name="id">
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="inputName" class="form-label">Name</label>
                                        <input type="text" class="form-control" id="inputName" name="name" value="<%= u.getName()%>" >
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputEmail" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="inputEmail" name="email" value="<%= u.getEmail()%>" >
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="inputPhoneNumber" class="form-label">Phone Number</label>
                                        <input type="text" class="form-control" id="inputPhoneNumber" name="phone" value="<%= u.getPhnNo()%>" >
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputAddress" class="form-label">Address</label>
                                        <input type="text" class="form-control" id="inputAddress" name="address" value="<%= u.getAddress()%>" >
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="inputLandmark" class="form-label">Landmark</label>
                                        <input type="text" class="form-control" id="inputLandmark" name="landmark" value="<%= u.getLandmark()%>" >
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputCity" class="form-label">City</label>
                                        <input type="text" class="form-control" id="inputCity" name="city" value="<%= u.getCity()%>" >
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="inputState" class="form-label">State</label>
                                        <input type="text" class="form-control" id="inputState" name="state" value="<%= u.getState()%>" >
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputZip" class="form-label">Zip</label>
                                        <input type="text" class="form-control" id="inputZip" name="zip" value="<%= u.getPincpde()%>" >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Payment Mode</label>
                                    <select class="form-control" name="paymentMode" required>
                                        <option value="noselect">--Select--</option>
                                        <option value="cod">Cash On Delivery</option>
                                    </select>
                                </div>

                                <div class="text-center mt-2">
                                    <button class="btn btn-warning">Order Now</button>
                                    <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                                </div>
                            </form>


                        </div>
                    </div>
                </div>



            </div>
        </div>

    </body>
</html>
