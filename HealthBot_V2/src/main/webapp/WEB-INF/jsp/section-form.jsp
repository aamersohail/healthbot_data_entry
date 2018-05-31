<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Section form</title>
</head>

<script>


</script>


<body>
	<h1> Section Form </h1>
	
	<form action="savesectiontype" method="post" enctype="multipart/form-data">
		Section Name : <input type="text" name="sectionName" /> <br /> <br />
		Section Order : <input type="text" name="sectionOrder" /> <br /> <br />
		Section Description : <textarea rows="5" cols="10" name="sectionDesc"></textarea> <br /> <br />
		Upload Image:<input type="file" name="file" /> <br /> <br />
		Upload Video: <input type="file" name="videoFile"> <br /> <br />
		Any Text:<textarea rows="5" cols="10" name="textFile"></textarea> <br /> <br />
		<input type="submit" class="button1" value="Save" />
	</form>
	 
	 <br />
	
	<div class="surveyButton">
		<form action="surveyform">
    		<input type="submit" value=" Add Survey " />
		</form>
	</div>
</body>
</html>