<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ page isELIgnored="false"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
	
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



<title>Study Page</title>
</head>
<style>
.lf-container {
	max-width: 600px;
	margin: 0 auto;
	margin-top: 50px;
}

.panel-heading a:after {
	font-family: 'Glyphicons Halflings';
	content: "\e114";
	float: right;
	color: grey;
}

.panel-heading a.collapsed:after {
	content: "\e080";
}

.box-custom-layout {
	border: 1px solid #cdcdcd;
	padding: 15px;
	border-radius: 4px;
}

/* Panel Styles  */
.panel-heading.collapsed .fa-chevron-down, .panel-heading .fa-chevron-right
	{
	display: none;
}

.panel-heading.collapsed .fa-chevron-right, .panel-heading .fa-chevron-down
	{
	display: inline-block;
}

i.fa {
	cursor: pointer;
	margin-right: 5px;
}

.collapsed ~ .panel-body {
	padding: 0;
}


<!-- sandesh css -->
.study_btn_sec{
	height: 50px !important;
}
.module_drp{
	float: right;
	backround-color:  #5bc0de;
}
.user_img{
	padding-top:20px;
	text-align:center;
}
.user_img img{
	border-radius:50%;
	height:130px;
	width:130px;
}
.user_info{
	margin-top: 45px;
	font-size: 20px;
}
.user_img_mob{
	padding-top:20px;
	text-align:center;
	display: none;
}
.user_img_mob img{
	border-radius:50%;
	height:130px;
	width:130px;
}
.user_info_mob{
	margin-top: 45px;
	font-size: 20px;
	display: none;
}
.module_item{
	padding: 0px;
	border-radius: 10px;
	background-color: white;
	font-size: 20px;
	margin:20px;
	padding: 5px;
	-webkit-box-shadow: 0px 0px 29px -6px rgba(0,0,0,0.75);
	-moz-box-shadow: 0px 0px 29px -6px rgba(0,0,0,0.75);
	box-shadow: 0px 0px 29px -6px rgba(0,0,0,0.75);
}
.module_item .module_heading{
    text-align: center;
    padding: 15px;

}
.module_section{
	float:left;
	margin-top:50px;
	
}
.module_body{
	padding:10px;
	height:200px;
}
.module_body img{
	width:100%;
	height:100%;
	
}
.hidden_module{
	color:grey;
}
.expand_info{
	margin-left: 10px;
	color:grey;
	font-size:20px;
	float: left;
}
.study_desc{
	margin-left: 10px;
	color:grey;
	font-size:20px;

}
.module_start_btn{
	float: right;
	margin-right: 5px;
}
.module_goto_btn{
	float:right;
	margin-top:20px;
	margin-right:20px;
}
.module_goto_btn_mob{
	margin-right:20px;
	display: none;
}
.goto_mob_sec{
	text-align: right;
	margin-bottom: 10px;
}
.module_comp_prog{
    background-color: white;
    padding: 5px;
    border-radius: 12px;
    margin-top: 50;
    margin-bottom: 40px;
}
.module_comp_prog_mob{
    background-color: white;
    padding: 5px;
    border-radius: 12px;
    margin-top: 50;
    margin-bottom: 40px;
    margin: 10px;
}
.module_comp_prog_mob{
      display: none;
    }
.module_complete{
    margin: 10px;
    padding: 3px;
    background-color: white;
    border-radius: 20px;
    text-align: center;
   
    -webkit-box-shadow: 0px 0px 29px -6px rgba(0,0,0,0.75);
-moz-box-shadow: 0px 0px 29px -6px rgba(0,0,0,0.75);
box-shadow: 0px 0px 29px -6px rgba(0,0,0,0.75);
}
.module_complete ul{
    list-style: none;
    padding: 0;
    font-size: 19px;
}
.header_page{
	height: 100px;
	background-color: #5bc0de;
}
.logo_sec{
	width: 137px;

}
.logo_sec img{
	width:100%;
}
   .user_info_button_sec {
      display: none;
      background-color:#e9ebee;
      text-align: right;
    }
#collapse_user_info{
	background-color: e9ebee;
}
.user_info_button_sec .btn-info{
	margin-right: 10px;
    margin-top: 10px;
    font-size: 15px;
    font-weight: bold;
}
@media (max-width:600px) {
    .user_img {
      display: none;
    }
}
@media (max-width:600px) {
    .user_info {
      display: none;
    }
}
@media (max-width:600px) {
    .module_comp_prog {
      display: none;
    }
}
@media (max-width:600px) {
    .module_comp_prog_mob{
      display: block;
    }
}

@media (max-width:600px) {
    .user_img_mob {
      display: block;
    }
}
@media (max-width:600px) {
    .user_info_mob {
      display: block;
    }
}
@media (max-width:600px) {
    .module_goto_btn_mob {
      display: inline-block;
    }
}
@media (max-width:600px) {
    .module_goto_btn {
      display: none;
    }
}

@media (max-width:600px) {
    .user_info_button_sec {
      display: block;
    }
}
<!-- end sandesh css -->
</style>
<body>
<!-- sandesh code body -->
	<div class="container-fluid">
	  <div class="row header_page">
	  	<div class="logo_sec">
	  		<img src="<c:url value="logo.jpg" />">
	  	</div>
	  	<center><h1>Health Bot </h1></center>
	  </div>

	  <div class="user_info_button_sec row">
	  	<button type="button" class="btn btn-info user_info_button" data-toggle="collapse" href="#collapse_user_info">&#9776;</button>
  	  </div>
  	  <div id="collapse_user_info" class="panel-collapse collapse row">
  	  	<div class="user_img_mob">
			<img src="/images/user.png">		
		</div>
		<div class="user_info_mob">
			<p>Name: New User</p>
			<p>Contact: xxxxxxx</p>
			<p>Address: xxxx aaaaa bbbbbb</p>
		</div>

		
		<div class="module_comp_prog_mob">
			<div class="module_complete">
				<h2 style>Modules in progress</h2>
				<hr>
				<ul>
					<li>Module 1</li>
					<li>Module 3</li>
					<li>Module 9</li>
					<li>Module 5</li>

				</ul>
			</div>

			<div class="module_complete">
				<h2 style>Modules Completed</h2>
				<hr>
				<ul>
					<li>Module 1</li>
					<li>Module 3</li>
					<li>Module 9</li>
					<li>Module 5</li>

				</ul>
			</div>
		</div>
		<div class="goto_mob_sec">
			<a href="showstudyform" class="btn btn-info module_goto_btn_mob">Create New Study</a> 
	    </div>
		
  	  </div>
	  <div class="row" style="background-color:#e9ebee">
	    <div class="col-sm-3" style="background-color:#e9ebee">
		<div class="user_img">
			<img src="/images/user.png">		
		</div>


		<div class="user_info">
			<p>Name: New User</p>
			<p>Contact: xxxxxxx</p>
			<p>Address: xxxx aaaaa bbbbbb</p>
		</div>


		<div class="module_comp_prog">
			<div class="module_complete">
				<h2>Modules in progress</h2>
				<hr>
				<ul>
					<li>Module 1</li>
					<li>Module 3</li>
					<li>Module 9</li>
					<li>Module 5</li>

				</ul>
			</div>

			<div class="module_complete">
				<h2>Modules Completed</h2>
				<hr>
				<ul>
					<li>Module 1</li>
					<li>Module 3</li>
					<li>Module 9</li>
					<li>Module 5</li>

				</ul>
			</div>
		</div>
	    </div>
	    <div class="col-sm-9" style="background-color:#e9ebee">
		<a href="showstudyform" class="btn btn-info module_goto_btn">Create New Study</a> 
	    	<div class="module_section col-sm-7">
	    	
	    
	    
	    <c:forEach var="study" items="${list}">
	    
	    <div class="module_item">
			<div class="module_heading">
				<h1>Study Desc: ${study.studyDesc}</h1>
			</div>
			
			<div class="study_desc">
				<h3>Study Details</h3>
				<p>Study Id:  ${study.studyId}</p>
				<p>Start Date: ${study.startDate} </p>
				<p>End Date: ${study.endDate} </p>
			</div>
			<div class="study_btn_sec" style="height: 50px;">
			<p class="expand_info"><button type="button" class="btn btn-info more_info" data-toggle="collapse" href="#collapse${study.tblUsers.userId}" onclick="getUserDetails(${study.tblUsers.userId});">User Details.</button></p>
  			  <div class="dropdown module_drp">
			    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Modules
			    <span class="caret"></span></button>
			    <ul class="dropdown-menu">
			      <li><a href="#">Module 1</a></li>
			      <li><a href="#">Module 2</a></li>
			      <li><a href="#">Module 3</a></li>
			    </ul>
			  </div>
			</div>
  			<div id="collapse${study.tblUsers.userId}" class="panel-collapse collapse">
        			<div class="panel-body hidden_module">
					<pre>
					</pre>		
					<button type="button" class="btn btn-info module_start_btn"> Start</button>
					<button type="button" class="btn btn-info module_start_btn"> More..</button>
				</div>
     			</div>
     		
		</div>
	    
	   
			
		</c:forEach>
	    
	    



		</div>
	    </div>
	  	
	  </div>
	</div>
<!-- sandesh code body end -->


</body>
<!-- sandesh script -->
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
<!-- sandesh script end -->
</html>