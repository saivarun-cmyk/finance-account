<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<table border="1" cellspacing="2" cellpadding="2">
<tr>
	<th>SNO</th><th>Number</th><th>Cube</th>
</tr>
<%
	int i=0;
	while(i<34){
		i=i+6;
%>
<tr>
	<td><%=i%></td><td><%=i%></td><td><%=i%></td>
</tr>
<% 
	}
%>
</table>
