<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Survey form</title>
</head>

	<h1> Survey page </h1>
	
	<form action="saveSurvey" method="post" enctype="multipart/form-data">
		Add Question : <input type="text" name="addQuestion" /> <br /> <br />
		Upload Image:<input type="file" name="file" /> <br /> <br />
		Question Description : <textarea rows="5" cols="40" name="sectionDesc"></textarea> <br /> <br />
		<input type="submit" class="button1" value="Save" />
	</form>
	
	
	
</html>