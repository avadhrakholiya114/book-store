<%-- 
    Document   : home
    Created on : 14-Mar-2024, 9:45:55 pm
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
    </head>
    <body>
        <h1>Hello World!</h1>
    <c:if test="${not empty userObj}">
        <h1>Name : ${userObj.name}</h1>

    </c:if>
</body>
</html>
