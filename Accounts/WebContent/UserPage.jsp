<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta  http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
		
	<form name="userform" action="user.jsp" method="post" >
		<fieldset>
			<legend>Account:</legend>
			<p>
				Account Id: <input style="font-family:verdana" type="text" name="accountId" placeholder="Enter the AccountId" required="required">
			</p>
		</fieldset>
		<input  style="font-family: verdana" type="submit" value="Get Details">
	</form>
</body>
</html>