<%-- 
    Document   : register
    Created on : 04-Feb-2024, 8:30:40 am
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ebook Register</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body style="background-color:#f0f1f2;">
        <%@include file="all_component/navbar.jsp" %>
        <div class="container p-2">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center">Login Page</h4>
                            <c:if test="${not empty succMSG}">
                                <p class="text-center text-success">${succMSG}</p>
                               
                                <c:remove var="succMSG" scope="session" />

                            </c:if>
                            <c:if test="${not empty failed}">
                                <p class="text-center text-success">${failed}</p>

                                <c:remove var="failed" scope="session" />

                            </c:if>

                            <form action="login" method="post">

                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address*</label>
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">

                                </div>

                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password*</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" name="password">
                                </div>
                                <button type="submit" class="btn btn-primary">Login</button>
                                <div class="container text-center mt-4">
                                    <p class="mb-0 text-secondary">Don’t you have an account? <a href="register.jsp" class="">Register</a></p>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>    
            </div>
        </div>
        <%@include file="all_component/footer.jsp" %>

    </body>
</html>
