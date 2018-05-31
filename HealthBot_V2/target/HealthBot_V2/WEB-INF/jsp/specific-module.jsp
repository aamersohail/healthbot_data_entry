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
                        <div class="form--container padding--lg">
                              <h4 class="font--bold">New Module</h4>
                              <form name="savemoduleform" method="POST" class="padding--xs" action="/HealthBot_V2/saveSpecificModule">
                                    <div class="input-group">
                                       <label for="username">Module Title :</label> 
                                       <input type="text" name="module_title" placeholder="Title" />
                                    </div>
                                    <div class="input-group">
                                       <label for="module_description"> Module Description :</label> 
                                       <textarea name="module_description"> </textarea>
                                    </div>
                                    <div class="input-group">
                                       <label for="module_description"> Module video url :</label> 
                                       <input type="text" name="module_video_url" required/>
                                    </div>
                                    <div class="input-group">
                                       <label for="module_description"> Goal :</label> 
                                       <input type="text" name="module_goal" placeholder="Enter the Study Goals" required/>
                                    </div>
                                    <div class="input-group">
                                       <label for="startDate">Start Date</label> 
                                       <input name="startDate" type="datetime-local" placeholder="" required />
                                    </div>
                                    <div class="input-group">
                                       <label for="endDate">End Date</label> 
                                         <input name="endDate" type="datetime-local" placeholder="" required />
                                    </div>
                                    <div class="input-group">
                                        <input type="submit" class="button1 btn--submit" value="Save - Goto Section" />
                                  	</div>
                                  	<!-- take inputs to hide the parameters -->
                                  	<input name="userId" type="hidden" value="${module.tblUsers.userId}">
                                  	<input name="studyId" type="hidden" value="${module.tblStudy.studyId}">
                            </form>
                            <div class="moduleButton">
                                <form action="sectionTypeform">
                                    <div class="input-group">
                                       <input type="submit" class="btn--submit" value=" Add Section " />
                                    </div>
                                </form>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
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
    	
    	<h1> USER ID : ${module.tblUsers.userId} </h1>
    	<h1> USER ID : ${module.tblStudy.studyId} </h1>
    	
    	
    </body>
</html>