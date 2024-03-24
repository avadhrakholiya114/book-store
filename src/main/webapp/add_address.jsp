<%-- 
    Document   : add_address
    Created on : 24-Mar-2024, 10:58:17 am
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Address</title>
        <%@include file="all_component/allCss.jsp" %>
    </head>
    <body>
        <%@include file="all_component/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-5">
                        <div class="card-body">
                            <h5 class="text-center text-success p-1"> Add Address</h5>
                            <form>
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="inputAddress" class="form-label">Address</label>
                                        <input type="text" class="form-control" id="inputAddress" >
                                    </div>
                                    <div class="col-md-6">
                                        <label for="inputLandmark" class="form-label">Landmark</label>
                                        <input type="text" class="form-control" id="inputLandmark" >
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-4">
                                        <label for="inputCity" class="form-label">City</label>
                                        <input type="text" class="form-control" id="inputCity">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="inputState" class="form-label">State</label>
                                        <input type="text" class="form-control" id="inputState">
                                    </div>
                                    <div class="col-md-4">
                                        <label for="inputZip" class="form-label">Zip</label>
                                        <input type="text" class="form-control" id="inputZip">
                                    </div>
                                </div>



                                <div class="text-center mt-2">
                                    <button type="submit" class="btn btn-warning">Add Address</button>

                                </div>
                            </form>


                        </div>      
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
