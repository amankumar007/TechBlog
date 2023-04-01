<%-- 
    Document   : profile
    Created on : 14-Mar-2023, 8:59:44 pm
    Author     : Aman.Kumar
--%>
<%@page import="com.tech.blog.entities.*"  language="java"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="ct" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="css/index.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Home</title>
        <style>

            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 89%, 79% 100%, 60% 94%, 0 100%, 0 0);
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <main class="d-flex primary-background" >
            <div class="container-fluid m-2" >
                <div class="row">
                    <div class="col-md-4">
                        <div class="card ">
                            <div class="card-header  primary-background text-white text-center">
                                <img src="Profile_pics/<%=((User) session.getAttribute("currentUser")).getProfilePic()%>" width="200px" height="200px" alt="alt"/>
                                <div class="text-center">
                                    <a type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editUserProfilePicModal">
                                        Edit 
                                    </a>
                                </div>
                            </div>
                            <% User profileUser = (User) session.getAttribute("currentUser");%>
                            <div class="card-body">
                                <table>
                                    <tr>
                                        <td>
                                            <label>Name :</label>
                                        </td>
                                        <td>
                                            <label><%= profileUser.getName()%></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Email :</label>
                                        </td>
                                        <td>
                                            <label><%= profileUser.getEmail()%></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Gender :</label>
                                        </td>
                                        <td>
                                            <label> <%=profileUser.getGender()%></label>
                                        </td>
                                    </tr>
                                </table>
                                <label>About :</label>                                       
                                <p style="text-transform:capitalize"> <%=profileUser.getAbout()%></p>


                            </div>
                            <div class="text-center">
                                <button type="button" class="btn primary-background" data-bs-toggle="modal" data-bs-target="#editUserProfileModal">
                                    Edit Profile
                                </button>
                            </div>
                        </div>
                    </div>
                    <!--col2-->
                    <div class="col-md-8" style="border-color:red; height:100px;">
                        <div class="container offset-md-4">
                            <button type="button" class="btn primary-background text-white" data-bs-toggle="modal" data-bs-target="#createPostModal">Create New Post</button>
                        </div>
                    </div>
                </div>
            </div>



            <!--edit model-->
            <!-- Button trigger modal -->
            <!--MOdal for Add Post-->
            <div class="modal fade" id="createPostModal" tabindex="-1" aria-labelledby="createPost" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scrollable">

                    <div class="modal-content ">
                        <div class="modal-header primary-background  text-white">
                            <h1 class="modal-title fs-5" id="createPostModalLabel">Create Post</h1>
                            <button type="button" class="btn-close text-white" data-bs-dismiss="modal" aria-label="Close" style="color:white;"></button>
                        </div>
                        <div class="modal-body">
                            <div class="text-center " >
                                <button class=" btn primary-background text-white"  id="addTextRow" >
                                    Add Text
                                </button>
                                <button class=" btn primary-background text-white"  id="addImageRow" >
                                    Add Image 
                                </button>
                                <button class=" btn primary-background text-white"  id="addCodeRow" >
                                    Add Code
                                </button>
                                <button class=" btn primary-background text-white"  id="addTopicRow" >
                                    Add SubTitle
                                </button>
                            </div>
                            <form  id="createPostForm" >
                                <div class=" form-group ">
                                    <label for="user-name" class="form-label">Post Title</label>
                                    <input type="text" name="post-title" value="" class="form-control" id="post-title" aria-describedby="post-title">
                                </div>
                                <br/>

                                <br/>
                                <div class="container text-center" >
                                    <button  id="add_post" type="submit" class="btn primary-background text-white">Create Post</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal for  edit user data -->
            <div class="modal fade" id="editUserProfileModal" tabindex="-1" aria-labelledby="editUserProfile" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header primary-background  text-white">
                            <h1 class="modal-title fs-5" id="editUserProfileModalLabel">Edit Profile</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="color:white"></button>
                        </div>
                        <div class="modal-body">
                            <form  id="editProfileForm">
                                <input type="hidden" name="user-id" value="<%=profileUser.getId()%>"  class="form-control" id="user-id" aria-describedby="username">

                                <div class=" form-group">
                                    <label for="user-name" class="form-label">Name</label>
                                    <input type="text" name="username" value="<%=profileUser.getName()%>" class="form-control" id="username" aria-describedby="username">

                                </div>
                                <div class="form-group">
                                    <label for="user-email" class="form-label">Email address</label>
                                    <input type="email" class="form-control" id="user-email" name="user-email" value="<%=profileUser.getEmail()%>" aria-describedby="emailHelp">

                                </div>

                                <%
                                    String genderMale, genderFemale;
                                    if (profileUser.getGender().equals("Male")) {
                                        genderMale = "checked";
                                        genderFemale = "";
                                    } else {
                                        genderMale = "";
                                        genderFemale = "checked";
                                    }
                                %>
                                <div class="form-check form-check-inline">

                                    <input class="form-check-input" type="radio" name="gender" id="genderMale" value="Male" <%=genderMale%>>
                                    <label class="form-check-label" for="genderMale">Male</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="genderFemale" value="Female" <%=genderFemale%>>
                                    <label class="form-check-label" for="grnderFemale">Female</label>
                                </div>

                                <div class="form-group">
                                    <textarea class="form-control" name="about" row="4" placeholder="Leave a comment here" id="about" style="height: 100px" "><%=profileUser.getAbout()%></textarea>

                                </div>

                                <div id="loader" style="display:none;" class="container text-center">
                                    <span class="fa fa-refresh fa-3x fa-spin"></span>
                                    <h4>Please wait ...</h4>
                                </div>
                                <br/>
                                <div class="container text-center" >
                                    <button  id="edit_submit" type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>

            <!--modal for profile pic update-->
            <div class="modal fade" id="editUserProfilePicModal" tabindex="-1" aria-labelledby="editUserProfilePic" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header primary-background  text-white">
                            <h1 class="modal-title fs-5" id="editUserProfileModalLabel">Edit Profile Pic</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="color:white"></button>
                        </div>
                        <div class="modal-body">
                            <div class="card ">
                                <div class="card-header  primary-background text-white text-center">
                                    <img src="Profile_pics/<%=((User) session.getAttribute("currentUser")).getProfilePic()%>" width="200px" height="200px" alt="alt"/>
                                </div>
                            </div>
                            <form  id="editProfilePic">
                                <input type="hidden" name="user-id" value="<%=profileUser.getId()%>"  class="form-control" id="user-id" aria-describedby="username">

                                <div class=" form-group">

                                    <input type="file" name="profilePic" value="<%=profileUser.getProfilePic()%>" class="form-control" id="username" aria-describedby="username">

                                </div>
                                <br/>
                                <div class="container text-center" >
                                    <button   id="edit_profilePic_submit" type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>

        </main>





        <!<!-- Javascript  -->
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script src="js/index.js" type="text/javascript"></script>
        <script>
            $(document).ready(() => {
                var createPostTextIdNum=0;
                console.log("Loaded");
//                #add text row in post from
                $('#addTextRow').on('click', (e) => {
                    e.preventDefault();
                    createPostTextIdNum++;
                    console.log(createPostTextIdNum);
                    console.log(" add text rowbutton clicked");
//                    var TextInput = jQuery('<div>',{
//                        'class':'form-group'}).append('<input>',{
//                        'class':'form-control',
//                        'id':'cre',
//                        'name':''
//                        });
                });
                
//                add image row
                $('#addImageRow').on('click', (e)=>{
                    console.log("add Image row");
                });
                
//                add Text Row
                $('#addCodeRow').on('click', (e)=>{
                    console.log("add Text Row");
                });
                
//                add SubTitle Row
                $('#addTopicRow').on('click', (e)=>{
                    console.log(" add topic Row");
                });
                
                
                
                
                $('#editProfileForm').on('submit', (e) => {
                    e.preventDefault();
                    $('#edit_submit').hide();
                    $('#loader').show();

                    let formdata = new FormData($('#editProfileForm')[0]);
                    console.log(formdata);
                    $.ajax({
                        url: "updateProfile",
                        type: "post",
                        data: formdata,
                        success: (data, textStatus, jqHXR) => {
                            console.log(data);
                            if (data.trim() === "Success") {
                                swal("Profile Updated...").then((val) => {
                                    console.log(val);
                                    window.location = "profile.jsp";
                                }).catch((err) => {
                                    console.log(err);
                                });
                            } else {
                                $('#loader').hide();
                                $('#edit_submit').show();
                                swal("Profile Update Failed");
//                                window.location = "profile.jsp";
                            }

                        },
                        error: (jqHXR, textStatus, errorThrown) => {
                            $('#loader').hide();
                            $('#edit_submit').show();
                            swal("something went wrong try again");
                            console.log(jqXHR);
                        },
                        processData: false,
                        contentType: false


                    });
                });

            });
        </script>
        <!--        <script>
                    var addRowToCreatePost = (e)=>{
                        console.log("row added");
                    };
                </script>-->
    </body>
</html>
