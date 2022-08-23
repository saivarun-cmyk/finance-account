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
<%!Iterator<Account> stats;
	Account ac;%>
<%!String fromDate, toDate;%>

<%
	String accountId = request.getParameter("accountId");

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

		List<Account> statements = new ArrayList();
		Account acc;
		while (rs.next()) {
			acc = new Account();
			acc.setAccount_id(rs.getString("account_id"));
			acc.setDate(rs.getString("datefield"));
			acc.setAmount(Double.parseDouble(rs.getString("amount")));
			statements.add(acc);
		}
		Iterator<Account> itr = statements.iterator();
		 logger.info( "Statements: "+statements ); 

		SimpleDateFormat format = new SimpleDateFormat("dd.MM.yyyy");
		if (StringUtils.isNotEmpty(request.getParameter("fromDate"))
				&& StringUtils.isNotEmpty(request.getParameter("toDate"))) {
			fromDate = format.format(new Date(request.getParameter("fromDate")));
			toDate = format.format(new Date(request.getParameter("toDate")));
%>
			<table border="1" cellspacing="2" cellpadding="2">
				<tr><h1>Date Details Data</h1>
					<th>AccountID</th>
					<th>Date</th>
					<th>Amount</th>
				</tr>
	<%
		while (itr.hasNext()) {
					Account act = itr.next();
					DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd.MM.yyyy");
					LocalDate inpDate = LocalDate.parse(act.getDate(), dtf);
					LocalDate fDate = LocalDate.parse(fromDate, dtf);
					LocalDate tDate = LocalDate.parse(toDate, dtf);
					if ((inpDate.isEqual(tDate) || inpDate.isEqual(fDate))
							|| (inpDate.isBefore(tDate) && inpDate.isAfter(fDate))) {
	%>

	<tr>
		<td><%=act.getAccount_id()%></td>
		<td><%=act.getDate()%></td>
		<td><%=act.getAmount()%></td>
	</tr>

	<%
		}
				}
			}

			String fromAmount = request.getParameter("fromAmount");
			String toAmount = request.getParameter("toAmount");
			if (StringUtils.isNotEmpty(fromAmount) && StringUtils.isNotEmpty(toAmount)) {
				double fAmount = Double.parseDouble(fromAmount);
				double tAmount = Double.parseDouble(toAmount);
	%>
	<table border="1" cellspacing="2" cellpadding="2">
		<tr><h1>Amount Details Data</h1>
			<th>AccountID</th>
			<th>Date</th>
			<th>Amount</th>
		</tr>
		<%
			while (itr.hasNext()) {
						Account act = itr.next();
						double inpAmount = act.getAmount();
						if (inpAmount >= Double.parseDouble(fromAmount) && inpAmount <= Double.parseDouble(toAmount)) {
		%>
		<%
			if (StringUtils.isEmpty(act.getAccount_id()) && StringUtils.isEmpty(act.getDate())
									&& StringUtils.isEmpty(act.getDate())) {

							}
		%>
		<tr>
			<td><%=act.getAccount_id()%></td>
			<td><%=act.getDate()%></td>
			<td><%=act.getAmount()%></td>
		</tr>
		<%
			}
					}
				}
			} catch (SQLException e) {
				response.sendRedirect("DBError.jsp");
			} catch (NullPointerException e) {
				response.sendRedirect("CommonError.jsp");
			} catch (Exception e) {
				response.sendRedirect("CommonError.jsp");
			}
		%>