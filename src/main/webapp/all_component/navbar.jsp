
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<div class="container-fluid" style="height: 10px;background-color: #303f9f"></div>

<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-3 text-success">
            <h3<i class="fa-solid fa-book me-1"></i>Ebooks</h3>
        </div>
        <div class="col-md-6">
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>

        <c:if test="${not empty userObj}">


            <div class="col-md-3">
                <a href="cart.jsp" ><i class="fa-solid fa-cart-plus fa-2x "></i></a>
                <a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-user me-1"></i>${userObj.name}</a>
                <a href="logout" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fa-solid fa-right-to-bracket me-1"></i>Log out</a>

            </div>
        </c:if>   

        <!--===-->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">

                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <h4>Do you Want to log out??</h4>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <a href="logout" type="button" class="btn btn-primary">Log Out</a>

                    </div>

                </div>
            </div>
        </div>  


        <!--======-->

        <c:if test="${empty userObj}">
            <div class="col-md-3">
                <a href="login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket me-1"></i>login</a>
                <a href="register.jsp" class="btn btn-primary"><i class="fa-solid fa-user me-1"></i>Register</a>

            </div>
        </c:if>   

    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house"></i></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link active" href="all_recenet.jsp"><i class="fa-solid fa-book me-1"></i>Recent Book</a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link active" href="all_new.jsp"><i class="fa-solid fa-book me-1"></i>New Book</a>
                </li>

                <li class="nav-item ">
                    <a class="nav-link active" href="all_old.jsp"><i class="fa-solid fa-book me-1"></i>Old Book</a>
                </li>
            </ul>
            <form class="d-flex">
                <button class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-gear"></i>Setting</button>
                <button class="btn btn-light my-2 my-sm-0 ms-1" type="submit"><i class="fa-solid fa-phone"></i>Contact-us</button>
            </form>
        </div>
    </div>
</nav>