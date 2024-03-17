    <%-- 
        Document   : add_book
        Created on : 15-Mar-2024, 10:16:50 pm
        Author     : ADMIN
    --%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@page isELIgnored="false" %>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Add Book</title>
            <%@include file="allCss.jsp" %>
        </head>
        <body>
            <%@include file="navbar.jsp" %>
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4 mt-3">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="text-center">Add Books</h4>
                                <c:if test="${not empty succMSG}">
                                    <p class="text-center text-success">${succMSG}</p>

                                    <c:remove var="succMSG" scope="session" />

                                </c:if>
                                 <c:if test="${not empty failedMsg}">
                                    <p class="text-center text-danger">${failedMsg}</p>
                                    <c:remove var="failedMsg" scope="session" />
                                </c:if>

                                <form action="../add_book" method="post" enctype="multipart/form-data">
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
                                        <label for="bookType" class="form-label">Book Category*</label>
                                        <select name="bookType" id="bookType" class="form-control">
                                            <option selected disabled>--select--</option>
                                            <option value="new">New Book</option>

                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="status" class="form-label">Book Status*</label>
                                        <select name="status" id="status" class="form-control">
                                            <option selected disabled>--select--</option>

                                            <option value="active">Active</option>
                                            <option value="inactive">Inactive</option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label for="photo" class="form-label">Photo*</label>
                                        <input type="file" class="form-control" id="photo" name="photo" aria-describedby="photoHelp">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Add</button>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>
