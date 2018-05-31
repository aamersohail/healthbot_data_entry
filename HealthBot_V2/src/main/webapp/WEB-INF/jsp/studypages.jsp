<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        
        <script type="text/javascript">
            function doAjaxPost() {
                $.ajax({
                    type: "GET",
                    url: "subView",
                    success: function(response) {
                        $("#subViewDiv").html( response );
                    }
                });
            }
        </script>


        <script type="text/javascript">
            function getUserDetails(user_id) {

               $.ajax({
                    type: "GET",
                    url: "userDetailssubview/"+user_id, //this is controller method url

                    success: function(response) {
                        $("#collapse"+user_id).html( response );
                    }
                });
            }
        </script>
     	
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
                    <div class="col-md-12 padding--lg">  
                        <div class="col-md-12 padding--sm">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="font--600">Studies</h3>
                                </div>
                                <div class="col-md-6">
                                    <a href="showstudyform" class="btn btn-primary pull-right" style="float: right;">Create Study</a>
                                </div>
                            </div>
                        </div> 
	  	                <table class="table table-striped">
                        <thead>
                          <tr>
                            <th>Study Id</th>
                            <th>Study Description</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>User Id</th>
                            <!-- <th>Add Module</th> -->
                          </tr>
                        </thead>
                        
                        <tbody>
                        <c:forEach var="study" items="${list}">
                          <tr>
                            <td>${study.studyId}</td>
                            <td>${study.studyDesc}</td>
                            <td>${study.startDate}</td>
                            <td>${study.endDate}</td>
                            <td>${study.tblUsers.userId}</td>
                            <%-- <td><a href="getUserIdStudId/${study.tblUsers.userId}/${study.studyId}" >Add Module</a></td> --%>
                          </tr>
                         </c:forEach>
                        </tbody>
                      </table>
                     
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
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></script>
    	<script src="<c:url value="/resources/scripts/custom.js" />"></script>
    	<script src="<c:url value="/resources/scripts/jquery-3.3.1.min.js" />"></script>

    	  <script>

           $('.more_info').click(function(){
              var $this = $(this);
              $this.toggleClass('more_info');
              if($this.hasClass('more_info')){
                 $this.text('User Details.');			
              } else {
                 $this.text('Hide.');
              }
           });
           $('.user_info_button').click(function(){
              var $this = $(this);
              $this.toggleClass('user_info_button');
           });
        </script>
    </body>
</html>