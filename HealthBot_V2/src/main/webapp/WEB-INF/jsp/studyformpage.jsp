<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Study form</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

<link rel="stylesheet" href="css/style.css">

 <!-- BOOTSTRAP AND CUSTOM CSS FILES -->
        <link href="<c:url value="/resources/styles/styles.css" />" rel="stylesheet">
    	<link href="<c:url value="/resources/styles/bootstrap.min.css" />" rel="stylesheet">


<style>
*,*:before,*:after {
	box-sizing: border-box;
}

body {
	padding: 1em;
	font-family: 'Open Sans', 'Helvetica Neue', Helvetica, Arial, sans-serif;
	font-size: 15px;
	color: #b9b9b9;
	background-color: #e3e3e3;
}

h4 {
	color: #5bc0de;
}
label{
color:black;
}

input,input[type="checkbox"]+label:before,select option,select {
	width: 100%;
	padding: 1em;
	line-height: 1.4;
	background-color: #f9f9f9;
	border: 1px solid #e5e5e5;
	border-radius: 3px;
	-webkit-transition: 0.35s ease-in-out;
	-moz-transition: 0.35s ease-in-out;
	-o-transition: 0.35s ease-in-out;
	transition: 0.35s ease-in-out;
	transition: all 0.35s ease-in-out;
}

input:focus {
	outline: 0;
	border-color: #64ac15;
}

input:focus+.input-icon i {
	color: #7ed321;
}

input:focus+.input-icon:after {
	border-right-color: #7ed321;
}

select {
	height: 3.4em;
	line-height: 2;
}

select:first-of-type {
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
}

select:last-of-type {
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
}

select:focus,select:active {
	outline: 0;
}

select option {
	background-color: #7ed321;
	color: #fff;
}

.input-group {
	margin-bottom: 1em;
	zoom: 1;
}

.input-group:before,.input-group:after {
	content: "";
	display: table;
}

.input-group:after {
	clear: both;
}

.input-group-icon {
	position: relative;
}

.input-group-icon input {
	padding-left: 4.4em;
}

.input-group-icon .input-icon {
	position: absolute;
	top: 0;
	left: 0;
	width: 3.4em;
	height: 3.4em;
	line-height: 3.4em;
	text-align: center;
	pointer-events: none;
}

.input-group-icon .input-icon:after {
	position: absolute;
	top: 0.6em;
	bottom: 0.6em;
	left: 3.4em;
	display: block;
	border-right: 1px solid #e5e5e5;
	content: "";
	-webkit-transition: 0.35s ease-in-out;
	-moz-transition: 0.35s ease-in-out;
	-o-transition: 0.35s ease-in-out;
	transition: 0.35s ease-in-out;
	transition: all 0.35s ease-in-out;
}

.input-group-icon .input-icon i {
	-webkit-transition: 0.35s ease-in-out;
	-moz-transition: 0.35s ease-in-out;
	-o-transition: 0.35s ease-in-out;
	transition: 0.35s ease-in-out;
	transition: all 0.35s ease-in-out;
}

.container {
	max-width: 38em;
	padding: 1em 3em 2em 3em;
	margin: 0em auto;
	background-color: #fff;
	border-radius: 4.2px;
	box-shadow: 0px 3px 10px -2px rgba(0, 0, 0, 0.2);
}

.row {
	zoom: 1;
}

.row:before,.row:after {
	content: "";
	display: table;
}

.row:after {
	clear: both;
}

.col-half {
	padding-right: 10px;
	float: left;
	width: 50%;
}

.col-half:last-of-type {
	padding-right: 0;
}

.col-third {
	padding-right: 10px;
	float: left;
	width: 33.33333333%;
}

.col-third:last-of-type {
	padding-right: 0;
}
 
@media only screen and (max-width: 540px) {
	.col-half {
		width: 100%;
		padding-right: 0;
	}
}

.button1 {
	background-color: #5bc0de;
}

</style>
</head>
<body>
<!-- HEADER -->
        <header class="site--header">
            <div class="container">
                <div class="logo--container">
                    <img src="<c:url value="/resources/images/logo-healthbot.png" />" class="site--logo" />
                    <!-- <h1> Health Bot </h1> -->
                </div>
                <div class="menu--switch">Menu</div>
                <nav class="site--nav">
                    <div class="close--sidebar">X</div>
                    <ul class="nav--list">
                        <li class="nav--item">
                            <a href="#">Home</a>
                        </li>
                        <li class="nav--item">
                            <a href="#">About</a>
                        </li>
                        <li class="nav--item">
                            <a href="#">Studies</a>
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
        


	<div class="container">
		<form name="studyform" method="POST" action="savestudyform"
			onsubmit="return validate()">
			<div class="row">
				<h4>New Study</h4>
				<div class="input-group">
					<label for="studyDesc">Title</label> 
					<input name="studyDesc" type="text" placeholder="Enter the Study Description" required />
				</div>
				<div class="input-group">
					<label for="username">Username</label> 
					<input name="username" type="text" placeholder="Enter the your nae" required />
				</div>
				<div class="input-group">
					<label for="startDate">Start Date</label> 
					<input name="startDate" type="datetime-local" placeholder="" required />
				</div>
				<div class="input-group">
					<label for="endDate">End Date</label> <input name="endDate"
						type="datetime-local" placeholder="" required />
				</div>
				<div class="input-group">
					<label for="goals">Goals</label> <input name="goals"
						type="text" placeholder="Enter the Study Goals" required />
				</div>



				<div class="input-group">

					<label for="gender">Gender</label>
					<div>
						<input type="radio" name="gender" id="gender1" value="Male"> Male
						<input type="radio" name="gender" id="gender2" value="Female"> Female 
						<input type="radio" name="gender" id="gender3" value="Other"> Other
					</div>

				</div>
				
				<div class="input-group">
					<label for="usertype">User Type</label>
					<div>
						<input type="radio" name="usertype" id="user">User 
						<input type="radio" name="usertype" id="practitioner">Practitioner
						<input type="radio" name="usertype" id="researcher">Researcher
					</div>
				</div>
			</div>


			<div class="row">
				<input type="submit" class="button1" value="Save" />
			</div>
		</form>
			
			<div class="moduleButton">
				<form action="showmoduleform">
    				<input type="submit" value=" Add Module " />
				</form>
			</div>
		
	</div>
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>



	<script>
	function validateform(){  
		var name=document.studyform.startDate.value;  
		var goals=document.myform.studyGoals.value;  
		var usertype=document.studyform.usertype.value;  
		var gender=document.myform.gender.value;
		  
		if (name==null || name==""){  
		  alert("Title can't be blank");  
		  return false;  
		}else if(goals==null || goals==""){  
			  alert("Goals can't be blank");  
			  return false;  
		  }
		else if(gender==null || gender==""){  
			  alert("Select the Gender");  
			  return false; 
			  
		}  
		else if(usertype==null || usertype==""){  
			  alert("Select the Usertype");  
			  return false;  
		  }
	}
	</script>
	 <!-- FOOTER -->
        <footer>
        </footer>
        
        <!-- EXTERNAL JAVASCRIPTS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></script>
    	<script src="<c:url value="/resources/scripts/custom.js" />"></script>
    	<script src="<c:url value="/resources/scripts/jquery-3.3.1.min.js" />"></script>



</body>
</html>