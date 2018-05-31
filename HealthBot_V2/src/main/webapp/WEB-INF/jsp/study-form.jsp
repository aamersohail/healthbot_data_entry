<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <h1> Health Bot </h1>
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
        
        <!-- MAIN CONTENT -->
        <main class="col-sm-12">
            <div class="row">
                <div class="container">
                    <div class="col-md-6 offset-md-3">
                        <div class="row">
                            <div class="form--container padding--lg">
                                <h4 class="font--bold">Create Study</h4>
                                
                                <form class="padding--xs" id="" action="savestudyform">
                                    <label for="username">Username</label> 
                                    <input type="text" id="username" placeholder="Enter Username" />
                                    
                                    <label for="start-date">Start Date</label> 
                                    <input type="text" id="start-date" onfocus="(this.type='date')" placeholder="Select Start Date" />
                                    
                                    <label for="end-date">End Date</label> 
                                    <input type="text" id="end-date" onfocus="(this.type='date')" placeholder="Select End Date" />
                                    
                                    <label for="goals">Goals</label> 
                                    <input name="goals" type="text" placeholder="Enter the Study Goals" required />
                                    
                                    <label for="description">Study Description</label> 
                                    <textarea id="description" name="studyDesc" placeholder="Study Description"></textarea>
                                    
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
											<input type="radio" name="usertype" id="user"> User 
											<input type="radio" name="usertype" id="practitioner"> Practitioner
											<input type="radio" name="usertype" id="researcher"> Researcher
										</div>
									</div>
				                    <input type="submit" value="Create Study" class="btn--submit" />
                                </form> 
                                <form action="showmoduleform">
    								<input type="submit" value=" Add Module " class="btn--submit"/>
								</form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        <!-- FOOTER -->
        <footer>
        </footer>
        
        <!-- EXTERNAL JAVASCRIPTS -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></script>
    	<script src="<c:url value="/resources/scripts/custom.js" />"></script>
    	<script src="<c:url value="/resources/scripts/jquery-3.3.1.min.js" />"></script>
    </body>
</html>