<%-- 
    Document   : setting
    Created on : 24-Mar-2024, 10:05:07 am
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="all_component/allCss.jsp" %>
        <style type="text/css">
            a{
                text-decoration: none;
                color: black;
            }
            a:hover{
                text-decoration: none;

            }
        </style>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>

        <c:if test="${ empty userObj}">


            <c:redirect url="login.jsp" ></c:redirect>
        </c:if>   



            <h3 class="text-center">Hello, ${userObj.name}</h3>


        <div class="container">

            <div class="row p-5">   
                <div class="col-md-6">

                    <a href="sell_book.jsp">  
                        <div class="card">

                            <div class="card-body text-center">
                                <div class="text-primary"><i class="fas fa-book-open fa-3x"></i></div>

                                <h3>Sell Old Book</h3>
                            </div>
                        </div>

                    </a>
                </div>

                <div class="col-md-6">

                    <a href="edit_profile.jsp">  
                        <div class="card">

                            <div class="card-body text-center">
                                <div class="text-primary"><i class="fas fa-edit fa-3x"></i></div>

                                <h3>Edit profile</h3>
                            </div>
                        </div>

                    </a>
                </div>

                <div class="col-md-4 mt-3">

                    <a href="add_address.jsp">  
                        <div class="card">

                            <div class="card-body text-center">
                                <div class="text-warning"><i class="fas fa-map-marker-alt fa-3x"></i></div>

                                <h3>Your Address</h3>
                                <p>Edit Address</p>
                            </div>
                        </div>

                    </a>
                </div>

                <div class="col-md-4 mt-3">

                    <a href="user_order.jsp">  
                        <div class="card">

                            <div class="card-body text-center">
                                <div class="text-danger"><i class="fas fa-box-open fa-3x"></i></div>

                                <h3>My  Order</h3>
                                <p>Track Your Order</p>
                            </div>
                        </div>

                    </a>
                </div>

                <div class="col-md-4 mt-3">

                    <a href="helpline.jsp">  
                        <div class="card">

                            <div class="card-body text-center">
                                <div class="text-primary"><i class="fas fa-user-circle fa-3x"></i></div>

                                <h3> Help  Center</h3>
                                <p>24 * 7 service </p>
                            </div>
                        </div>

                    </a>
                </div>

            </div>  
        </div>


    </body>
</html>
