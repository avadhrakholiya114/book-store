<%-- 
    Document   : sell_book
    Created on : 24-Mar-2024, 10:37:08 am
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
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        
        <c:if test="${ empty userObj}">


            <c:redirect url="login.jsp" ></c:redirect>
        </c:if>   

        <div class="container">
            <div class="row">

                <div class="col-md-4 offset-md-4">
                    <div class="card mt-5">

                        <c:if test="${not empty succMSG}">
                            <p class="text-center text-success">${succMSG}</p>

                            <c:remove var="succMSG" scope="session" />

                        </c:if>
                        <c:if test="${not empty errorMsg}">
                            <p class="text-center text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <div class="card-body">
                            <h5 class="text-center text-primary p-1"> Sell Old Book</h5>
                            <form action="addoldbook" method="post" enctype="multipart/form-data">
                                <input type="hidden" class="form-control"  name="email" value="${userObj.email}">

                                <div class="mb-3">
                                    <label for="bookName" class="form-label">Book Name*</label>
                                    <input type="text" class="form-control" id="bookName" name="bookName" aria-describedby="bookNameHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="authorName" class="form-label">Author Name*</label>
                                    <input type="email" class="form-control" id="authorName" name="authorName" aria-describedby="authorNameHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="price" class="form-label">Price*</label>
                                    <input type="number" class="form-control" id="price" name="price" aria-describedby="priceHelp">
                                </div>



                                <div class="mb-3">
                                    <label for="photo" class="form-label">Upload Photo*</label>
                                    <input type="file" class="form-control" id="photo" name="photo" aria-describedby="photoHelp">
                                </div>
                                <button type="submit" class="btn btn-primary">Sell</button>
                            </form>
                        </div>      
                    </div>

                </div>
            </div>

        </div>
    </body>
</html>
