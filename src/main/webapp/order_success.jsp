<%-- 
    Document   : order_success
    Created on : 11-Apr-2024, 3:23:17 pm
    Author     : ADMIN
--%>

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

        <c:if test="${not empty succMSG}">
            <p class="text-center text-success">${succMSG}</p>

            <c:remove var="succMSG" scope="session" />

        </c:if>
    </body>
</html>
