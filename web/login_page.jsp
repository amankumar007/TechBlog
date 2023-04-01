<%-- 
    Document   : login_page
    Created on : 08-Mar-2023, 3:51:31 pm
    Author     : Aman.Kumar
--%>

<%@page import="com.tech.blog.entities.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--CSS-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>login_techBlog</title>
        

        <style>

            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 89%, 79% 100%, 60% 94%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <main class="d-flex align-items-center primary-background banner-background" style="height:70vh">
            <div class="container" >
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card ">
                            <div class="card-header  primary-background text-white text-center">
                                <span class="fa fa-user-circle fa-2x"></span>
                                <h5>Login Here</h5>
                            </div>
                            <div class="card-body">

                                <form  id="loginUser" >
                                    <div class="mb-3">
                                        <label for="userOrEmail" class="form-label">Email address</label>
                                        <input  name="email" type="email/text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    </div>
                                    <div class="mb-3">
                                        <label for="Password" class="form-label">Password</label>
                                        <input type="password" class="form-control" name="password" id="exampleInputPassword1" name="password">
                                    </div>
                                    <div id="loader" style="display:none;" class="container text-center">
                                        <span class="fa fa-refresh fa-3x fa-spin"></span>
                                        <h4>Please wait ...</h4>
                                    </div>
                                    <br/>
                                    <div  id="login" class="container justify-items-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </main>


        <!<!-- Javascript  -->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="js/index.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script>
            $(document).ready(() => {
                console.log("loaded...");



                $('#loginUser').on('submit', (e)=>{
                    e.preventDefault();
                    $('#loader').show();
                    $('#login').hide();
                    
                    let formData = new FormData($('#loginUser')[0]);
                    $.ajax({
                        url: "LoginUser",
                        type: "post",
                        data: formData,

                        success: (data, textStatus, jqXHR)=> {
                            console.log(data);
                            if (data.trim() === "done") {
                                $('#loader').hide();
                                $('#login').show();
                                window.location="profile.jsp";
                            }
                            else{
                                swal("Invalid Credentials Try Again..").then((val)=>{
                                     $('#loader').hide();
                                        $('#login').show();
                                        window.location="login_page.jsp"; 
                                }
                                      
                                );
                                
                                
                            }
                        },
                        error: (jqHXR, textStatus, errorThrown) => {
                            $('#loader').hide();
                            $('#login').show();
                            swal("something went wrong try again");
                            window.location="login_page.jsp";
                            console.log(jqXHR);
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });

        </script>
    </body>
</html>
