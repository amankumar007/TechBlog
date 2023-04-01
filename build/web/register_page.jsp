<%-- 
    Document   : register_page
    Created on : 08-Mar-2023, 5:06:54 pm
    Author     : Aman.Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>register_page</title>
        <style>

            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 89%, 79% 100%, 60% 94%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>

        <!--include navbar-->
        <%@include file="navbar.jsp" %>
        <main class="d-flex align-items-center primary-background justify-items-center " style="height:95vh" >
            <div class="container ">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card ">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-plus fa-2x text-white"></span>
                                <p> Sign Up</p>
                            </div>
                            <div class="card-body">
                                <form  id="reg_form">
                                    <div class=" form-group">
                                        <label for="user-name" class="form-label">Name</label>
                                        <input type="text" name="username" class="form-control" id="username" aria-describedby="username">

                                    </div>
                                    <div class="form-group">
                                        <label for="user-email" class="form-label">Email address</label>
                                        <input type="email" class="form-control" id="user-email" name="user-email" aria-describedby="emailHelp">
                                        <div id="user-email-ft" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="password" name="password">
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender1" value="Male">
                                        <label class="form-check-label" for="genderMale">Male</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender" id="gender2" value="Female">
                                        <label class="form-check-label" for="grnderFemale">Female</label>
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" name="about"  row="4" placeholder="Leave a comment here" id="about" style="height: 100px"></textarea>

                                    </div>
                                    <div class=" form-check">
                                        <input name="condition" type="checkbox" value="Agree" class="form-check-input" id="termscheck">
                                        <label class="form-check-label" for="Check">Agree Terms and Condition</label>
                                    </div>
                                    <div id="loader" style="display:none;" class="container text-center">
                                        <span class="fa fa-refresh fa-3x fa-spin"></span>
                                        <h4>Please wait ...</h4>
                                    </div>
                                    <br/>
                                    <div class="container text-center">
                                        <button id="register_submit" type="submit" class="btn btn-primary">Submit</button>
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
                console.log('loaded....');

                $("#reg_form").on('submit', (e) => {
                    e.preventDefault();
                    $('#loader').show();
                    $('#register_submit').hide();

                    var formdata = new FormData($("#reg_form")[0]);

                    $.ajax({
                        url: "RegisterUser",
                        type: "post",
                        data: formdata,
                        success: (data, textStatus, jqXHR) => {
                            console.log(data);
                            console.log(textStatus);
                            if (data.trim() === "done") {
                                $('#loader').hide();
                                $('#register_submit').show();
                                swal("Registration Successful. Redirecting to Login Page")
                                        .then((value) => {
                                            if (value === true) {
                                                window.location = "login_page.jsp";
                                            }

                                        });
                            } else {
                                $('#loader').hide();
                                $('#register_submit').show();
                                swal("Something went wrong try again..");
                            }

                        },
                        error: (jqHXR, textStatus, errorThrown) => {
                            $('#loader').hide();
                            $('#register_submit').show();
                            swal("something went wrong try again");
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
