<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Login</title>
<style>
h1 {
	background-color: PINK;
	width: 50%;
}

h2 {
	text-decoration: underline;
}

td {
	padding: 15px;
	width: 50%;
}

legend {
	background-color: green;
}

fieldset {
	width: 30%;
	height: 70%;
	text-align: center;
}
</style>
</head>
<body>
	<script>  
				function validateform(){  
				var user=document.myform.user.value;  
				var pass=document.myform.pass.value;  
				  
				if (user==null || user==""){  
				  alert("UserName can't be blank");  
				  return false;  
				}else if(pass==null || pass==""){  
				  alert("Password can't be blank");  
				  return false;  
				  }  
				}  
				</script>
<body>
	<h2 style="font-family: verdana">LOGIN</h2>
	<fieldset>
		<legend>
			<font color="white"><b>Login Here:</b> </font>
		</legend>
		<form name="myform" action="Home.jsp" method="post"
			onsubmit="return validateform()">
			<table>
				<tr>
					<td style="font-family: verdana">USERNAME</td>
					<td><input type="text" name="user"
						placeholder="Enter the Username"></td>
				</tr>
				<tr>
					<td style="font-family: verdana">PASSWORD</td>
					<td><input type="password" name="pass"
						placeholder="Enter the Password"></td>
				</tr>
				<tr>
					<td></td>
					<td style="font-family: verdana"><input type="submit"
						value="LOGIN">
			</table>
		</form>
	</fieldset>
</body>
</html>
