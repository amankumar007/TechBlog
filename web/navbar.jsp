<%-- 
    Document   : navbar
    Created on : 08-Mar-2023, 12:13:08 am
    Author     : Aman.Kumar
--%>

<%@page import="com.tech.blog.entities.*"  language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="ct" %>

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><span class="fa fa-asterisk"></span><b>TechBlog</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/TechBlog"><span class="fa fa-at"></span>Learn With Aman</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <span class="fa fa-check-square-o"></span>Categories
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Programming Languages</a></li>
                        <li><a class="dropdown-item" href="#">Project Implementation</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Data Structure</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-tty"></span>Contact Us</a>
                </li>
                <%  String url = request.getRequestURL().toString();
                    String[] page_url = url.split("/", -1);
                %>

                <ct:if test='<%= !(page_url[page_url.length - 1].trim().equals("profile.jsp"))%>'>
                    <ct:if test='<%= (User) session.getAttribute("currentUser") == null%>'>
                        <li class="nav-item">
                            <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span>Sign In</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span>Sign Up</a>
                        </li>
                    </ct:if>
                    <ct:if test='<%= (User) session.getAttribute("currentUser") != null%>'>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="fa fa-user-circle"></span><%=((User) session.getAttribute("currentUser")).getName()%>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                                <li><a class="dropdown-item" href="LogoutUser">Log Out</a></li>  

                            </ul>
                        </li>

                    </ct:if>
                </ct:if>
            </ul>
            <ct:if test='<%= !(page_url[page_url.length - 1].equals("profile.jsp"))%>'>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-light" type="submit">Search</button>
                </form> 
            </ct:if>
            <ct:if test='<%= new String(page_url[page_url.length - 1]).equals("profile.jsp")%>'>
                <ul class="navbar-nav mr-auto mb-2 mb-lg-0">
                    <li class="nav-item ">
                        <a class="nav-link text-white" ><span class="fa fa-user-circle"><%=((User) session.getAttribute("currentUser")).getName()%></span></a>
                    </li>
                    <ct:if test='<%= (User) session.getAttribute("currentUser") != null%>'>
                        <li class="nav-item ">
                            <a class="nav-link text-white" href="LogoutUser"><span class="fa fa-user-circle"></span>Log Out</a>
                        </li>  
                    </ct:if>
                </ul>
            </ct:if>

        </div>
    </div>
</nav>

