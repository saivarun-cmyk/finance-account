<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Admin Page</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker1" ).datepicker();
  } );
  
  $( function() {
	    $( "#datepicker2" ).datepicker();
	  } );
  </script>
</head>
<body>
 <form method="post" name="adminform" action="admin.jsp" >
 <fieldset>
 	 <legend>Account:</legend>
	<p>Account Id: <input type="text" name="accountId" placeholder="Enter the AccountId" required="required"></p>
 </fieldset>
 <fieldset>
 	 <legend>Choose Date:</legend>
	<p>From Date: <input type="text" name="fromDate" id="datepicker1" placeholder="From Date"></p>
	<p>To Date: <input type="text" name="toDate" id="datepicker2" placeholder="To Date"></p>
 </fieldset>

<fieldset>
 	 <legend>Choose Amount:</legend>
	<p>From Amount: <input type="text" name="fromAmount" placeholder="From Amount"></p>
	<p>To Amount: <input type="text" name="toAmount" placeholder="To Amount"></p>
 </fieldset>

<input type="submit" value="Get Details">
</form>
 
</body>
</html>