<%-- 
    Document   : add_book
    Created on : 15-Mar-2024, 10:16:50 pm
    Author     : ADMIN
--%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDaoImp"%>
<%@page import="com.DB.DBconnect"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Book</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4 mt-3">
                    <div class="card">
                          <div class="card-body">
                               
                            <%
//                                int id = Integer.parseInt(request.getParameter(2));
                                BookDaoImp dao = new BookDaoImp(DBconnect.getConn());

                                BookDtls b = dao.getBook(2);

                                
                                if (b != null) {
                            %>  
                            <form action="../edit" method="post" enctype="multipart/form-data">
                                
                                <div class="mb-3">
                                    <label for="bookName" class="form-label">Book Name*</label>
                                    <input type="text" class="form-control" value="<%= b.getBookName()%>" id="bookName" name="bookName" aria-describedby="bookNameHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="authorName" class="form-label">Author Name*</label>
                                    <input type="email" class="form-control"value="<%= b.getAuthor()%>" id="authorName" name="authorName" aria-describedby="authorNameHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="price" class="form-label">Price*</label>
                                    <input type="number" class="form-control" value="<%= b.getPrice()%>" id="price" name="price" aria-describedby="priceHelp">
                                </div>

                                <div class="mb-3">
                                    <label for="status" class="form-label">Book Status*</label>
                                    <select name="status" id="status" class="form-control">
                                        <%
                                            if (b != null && "active".equals(b.getStatus())) {
                                        %>
                                        <option value="Active" selected>Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <%
                                        } else {
                                        %>
                                        <option value="Active">Active</option>
                                        <option value="Inactive" selected>Inactive</option>
                                        <%
                                            }
                                        %>
                                    </select>

                                </div>




                                <button type="submit" class="btn btn-primary">Edit</button>
                            </form>
                            <%
                                } else {
                                    // Handle case when book is not found
                                    // For example, display an error message
                                    out.println("Book not found.");
                                }
                            %>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
