<%-- 
    Document   : index
    Created on : 07-Mar-2023, 10:44:25 pm
    Author     : Aman.Kumar
--%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="ct" %>
<%@page import="com.tech.blog.helpers.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>

<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.entities.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Style css -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Home</title>
        <style>

            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 89%, 79% 100%, 60% 94%, 0 100%, 0 0);
            }
        </style>
    </head>

    <body>
        <!<!-- Navbar -->
        <%@include file="navbar.jsp" %>
        <!--Banner-->
        <div class="container-fluid m-0 p-0 ">
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container ">
                    <div class="container p-4">
                        <h3 class="display-2"> Welcome To TechBlog</h3>
                        <p>A programming language is a system of notation for writing computer programs.[1] Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language. </p>
                        <p>The description of a programming language is usually split into the two components of syntax (form) and semantics (meaning), which are usually defined by a formal language. </p>
                        <ct:if test='<%= (User) session.getAttribute("currentUser") == null%>'>
                            <a href="register_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>  Start! Its Free</a>
                            <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span> Sign In</a>
                        </ct:if>

                    </div>
                </div>
            </div>
        </div>


        <!--Cards-->

        <div class="container ">
            <div class="row m-4">
                <div class="card col-md-4 m-auto ">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Read More...</a>
                    </div>
                </div>
                <div class="card col-md-4 m-auto ">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Read More...</a>
                    </div>
                </div>
                <div class="card col-md-4 m-auto">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Read More...</a>
                    </div>
                </div>
            </div>
            <div class="row m-4">
                <div class="card col-md-4 m-auto ">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Read More...</a>
                    </div>
                </div>
                <div class="card col-md-4 m-auto">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Read More...</a>
                    </div>
                </div>
                <div class="card col-md-4 m-auto">
                    <div class="card-body">
                        <h5 class="card-title">Java Programming</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Read More...</a>
                    </div>
                </div>
            </div>
        </div>

        <!<!-- Javascript  -->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="js/index.js" type="text/javascript"></script>
    </body>
</html>
