<%@ page import="com.entity.User" %>

<div class="container-fluid" style="height: 10px;background-color: #303f9f"></div>

<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-3 text-success">
            <h3<i class="fa-solid fa-book me-1"></i>Ebooks</h3>
        </div>
       
        <div class="col-md-3">
            <%
                Object userObj = session.getAttribute("userObj");
                if (userObj != null) {
            %>
            <a href="home.jsp" class="btn btn-primary"><i class="fa-solid fa-user me-1"></i><%= ((User) userObj).getName()%></a>

                <a href="../register.jsp" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal" ><i class="fa-solid fa-user me-1"></i>Log Out</a>

            <%
            } else {
            %>
            <a href="../login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket me-1"></i>Login</a>
            <a href="../register.jsp" class="btn btn-primary"><i class="fa-solid fa-user me-1"></i>Register</a>
            <%
                }
            %>


        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h4>Do you Want to log out??</h4>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <a href="../logout" type="button" class="btn btn-primary">Log Out</a>

            </div>
            
        </div>
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
                    <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
                </li>

            </ul>

        </div>
    </div>
</nav>