<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.accounts.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="Error.jsp" %>  


<%
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");

	session.setAttribute("user", user);
	
	 HttpSession sess = request.getSession();
	 if (sess == null || sess.getAttribute("user") == null) {
	        // Forward the control to login.jsp if authentication fails or session expires
	        request.getRequestDispatcher("/Login.jsp").forward(request,
	            response);
	        sess.removeAttribute("user");
	 }
	 
		if (user.equals("admin") && pass.equals("admin")) {
			response.sendRedirect("AdminPage.jsp");
		} else if (user.equals("user") && pass.equals("user")) {
			response.sendRedirect("UserPage.jsp");
		} else {
			response.sendRedirect("Error.jsp");

		}
%>

