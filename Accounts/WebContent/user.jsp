<%@page import="java.time.Instant"%>
<%@page import="com.accounts.DateComparator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Comparator"%>
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
<%@ page import="org.apache.commons.logging.Log" %>
<%@ page import="org.apache.commons.logging.LogFactory" %>


<% Log logger = LogFactory.getLog( this.getClass() ); %>

<%! Iterator<Account> stats; Account ac; %>
<%
	String accountId = request.getParameter("accountId");
    session.setAttribute("accountId", accountId);
    logger.info( "AccountID: "+accountId ); 
    
    HttpSession sess = request.getSession();
	 if (sess == null || sess.getAttribute("user") == null) {
	        // Forward the control to login.jsp if authentication fails or session expires
	        request.getRequestDispatcher("/Login.jsp").forward(request,
	            response);
	        logger.info( "Session: "+sess );
	        sess.removeAttribute("user");
	 }
	try {
		Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		String url = "jdbc:ucanaccess://D:\\JavaTest\\accountsdb.accdb";
		Connection con = DriverManager.getConnection(url);

		Statement st = con.createStatement();
		String query = "select * from statement where account_id=(select id from account where account_number="
		+ accountId + ")";
		ResultSet rs = st.executeQuery(query);
		
		List<Account> statementsResult = new ArrayList();
		logger.info( "Query: "+query ); 	
		List<Account> statements = new ArrayList();
		Account acc;
		while (rs.next()) {
				acc = new Account();
				acc.setAccount_id(rs.getString("account_id"));
				acc.setDate(rs.getString("datefield"));
				acc.setAmount(Double.parseDouble(rs.getString("amount")));
				statements.add(acc);
				logger.info( "Statements ===>: "+acc ); 
		}
		
		Collections.sort(statements, new DateComparator());
		
		Iterator<Account> itr = statements.iterator();
		%>
		<table border="1" cellspacing="2" cellpadding="2">
<tr>
	<th>AccountID</th><th>Date</th><th>Amount</th>
</tr>
<%
		while(itr.hasNext()){
		Account act = itr.next();
		
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd.MM.yyyy");
		SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy");
		
		String date = act.getDate();
		LocalDate inpDate = LocalDate.parse(date,dtf);
		
		Date cd = new Date();
		String cDdate = sdf.format(cd);
		LocalDate cDate =  LocalDate.parse(cDdate,dtf);
		
		String hDate = statements.get(0).getDate();
		LocalDate hiDate = LocalDate.parse(hDate,dtf);
		Date dt = new SimpleDateFormat("yyyy-MM-dd").parse(hiDate.toString());
		
		Calendar c = Calendar.getInstance();
		c.setTime(dt);
		c.add(Calendar.MONTH, -3);
		String cmDate = sdf.format(c.getTime());
		LocalDate mDate =  LocalDate.parse(cmDate,dtf);
			
			if ((inpDate.isEqual(cDate) || inpDate.isEqual(mDate))
					|| (inpDate.isBefore(cDate) && inpDate.isAfter(mDate))) {
				%>
	<tr>
		<td><%=act.getAccount_id()%></td>
		<td><%=act.getDate()%></td>
		<td><%=act.getAmount()%></td>
	</tr>
	<%
			}
		}
%><%
	} catch (SQLException e) {
		response.sendRedirect("DBError.jsp");
	}catch(NullPointerException e){
		response.sendRedirect("CommonError.jsp");
	}catch(Exception e){
		response.sendRedirect("CommonError.jsp");
	}
%>

