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
                                <h4 class="font--bold">Create Study</h4>
                                
                                <form class="padding--xs" id="" action="savestudyform">
                                    <label for="studyDesc">Study Title</label> 
									<input name="studyDesc" type="text" placeholder="Enter the Study Description" required />
                                    
                                    <label for="username">Username</label> 
									<input name="username" type="text" placeholder="Enter the your nae" required />
                                    
	                                <label for="startDate">Start Date</label> 
									<input name="startDate" type="datetime-local" placeholder="" required />
                                    
                                    <label for="endDate">End Date</label> 
                                    <input name="endDate" type="datetime-local" placeholder="" required />
                                    
                                    <label for="goals">Goals</label> 
                                    <input name="goals" type="text" placeholder="Enter the Study Goals" required />
                                    
                                    <div class="input-group">
										<label for="gender">Gender</label>
										<div class="gender--selection">
											<input type="radio" name="gender" id="gender1" value="Male"> Male
											<input type="radio" name="gender" id="gender2" value="Female"> Female 
											<input type="radio" name="gender" id="gender3" value="Other"> Other
										</div>		
									</div>
									<div class="input-group">
										<label for="usertype">User Type</label>
										<div class="gender--selection">
											<input type="radio" name="usertype" id="user">User 
											<input type="radio" name="usertype" id="practitioner">Practitioner
											<input type="radio" name="usertype" id="researcher">Researcher
										</div>
									</div>
									<input type="submit"  value="Save - Goto Module" class="btn--submit" />
				                    <!-- <input type="submit" value="Create Study" class="btn--submit" /> -->
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