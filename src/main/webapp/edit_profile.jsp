<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            
                            <form action="../add_book" method="post" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name*</label>
                                    <input type="text" class="form-control" id="name" name="name" aria-describedby="nameHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email Address*</label>
                                    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp">
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone*</label>
                                    <input type="tel" class="form-control" id="phone" name="phone" aria-describedby="phoneHelp">
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
