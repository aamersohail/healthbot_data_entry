<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="Data Entry for Researchers." />
        <meta name="keywords" content="" />
        
        <title>Health Bot </title>
        
        <!-- BOOTSTRAP AND CUSTOM CSS FILES -->
        <link href="<c:url value="/resources/styles/styles.css" />" rel="stylesheet">
    	<link href="<c:url value="/resources/styles/bootstrap.min.css" />" rel="stylesheet">
     	
    </head>
    <body>
        <!-- HEADER -->
        <header class="site--header">
            <div class="container">
                <div class="logo--container">
                    <img src="<c:url value="/resources/images/logo-healthbot.png" />" class="site--logo" />
                </div>
                <div class="menu--switch">Menu</div>
                <nav class="site--nav">
                    <div class="close--sidebar">X</div>
                    <ul class="nav--list">
                        <li class="nav--item">
                            <a href="home">Home</a>
                        </li>
                        <li class="nav--item">
                            <a href="#">About</a>
                        </li>
                        <li class="nav--item">
                            <a href="studies">Studies</a>
                        </li>
                        <li class="nav--item">
                            <a href="#">Reviews</a>
                        </li>
                        <li class="nav--item">
                            <a href="#">Contact</a>
                        </li>
                        <!-- <li class="nav--item">
                            <a href="#" class="btn--nav">Create Study</a>
                        </li> -->
                    </ul>
                </nav>
            </div>
        </header>
        
        <!-- MAIN CONTENT -->
        <main class="col-sm-12">
            <div class="row">
                <div class="container">
                    <div class="col-md-6 offset-md-3">
                        <div class="row">
                            <div class="form--container padding--lg">
                                <h4 class="font--bold">Create Section</h4>
                                   <form action="savesectiontype" class="padding--xs" method="post" enctype="multipart/form-data">
                                       <label>Section Name : </label>
                                       <input type="text" name="sectionName" />
                                       <label>Section Order :</label>
                                       <input type="text" name="sectionOrder" />
                                       <label>Section Description :</label> 
                                       <textarea rows="5" cols="10" name="sectionDesc"></textarea>
                                       <label>Upload Image:</label>
                                       <input type="file" name="file" />
                                       <label>Upload Video:</label>
                                       <input type="file" name="videoFile">
                                       <label>Any Text:</label>
                                       <textarea rows="5" cols="10" name="textFile"></textarea>
                                       <input type="submit" class="button1 btn--submit" value="Save - Add Survey" />
                                   </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- FOOTER -->
        <footer>
            <div class="container">
                <div class="footer--logo">
                    <img src="<c:url value="/resources/images/logo-healthbot.png" />" alt="footer logo" class="footer--logo">
                </div>
            </div>
        </footer>
        
        <!-- EXTERNAL JAVASCRIPTS -->
    	<script src="<c:url value="/resources/scripts/jquery-3.3.1.min.js" />"></script>
    	<script src="<c:url value="/resources/scripts/custom.js" />"></script>
    	<script src="<c:url value="/resources/scripts/jquery-3.3.1.min.js" />"></script>
    	  
    	  
    	  
    </body>
</html>