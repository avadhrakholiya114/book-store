<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-5">
                        <div class="card-body">
                            <h5 class="text-center text-primary p-1"> Edit Profile</h5>
                            <c:if test="${not empty succMSG}">
                                <p class="text-center text-success">${succMSG}</p>

                                <c:remove var="succMSG" scope="session" />

                            </c:if>
                            <c:if test="${not empty failed}">
                                <p class="text-center text-danger">${failed}</p>
                                <c:remove var="failed" scope="session" />
                            </c:if>

                            <form action="update_profile" method="post" >
                                <input type="hidden"   name="id" value="${userObj.id}" >
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name*</label>
                                    <input type="text" class="form-control" id="name" name="name" aria-describedby="nameHelp" value="${userObj.name}">
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email Address*</label>
                                    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" value="${userObj.email}">
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone*</label>
                                    <input type="tel" class="form-control" id="phone" name="phone" aria-describedby="phoneHelp" value="${userObj.phnNo}">
                                </div>


                                <div class="mb-3">
                                    <label for="password" class="form-label">Password*</label>
                                    <input type="password" class="form-control" id="password" name="password" aria-describedby="passwordHelp">
                                </div>
                                <button type="submit" class="btn btn-primary">UPDATE</button>
                            </form>
                        </div>      
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
