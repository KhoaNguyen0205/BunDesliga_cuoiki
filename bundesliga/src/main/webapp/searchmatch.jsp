<%@page import="com.entity.ClubDtls"%>
<%@page import="com.DAO.ClubDAOImpl"%>
<%@page import="com.entity.MatchesDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.MatchesDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" href="css1/style.css">
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@include file="all_component/navbar2.jsp"%>

<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	
	<h3 class="text-center">Hello Admin</h3>

	<c:if test="${not empty succMsg}">
		<h5 class="text-center text-success">${succMsg}</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg}">
		<h5 class="text-center text-damger">${failedMsg}</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>


<form action="allClub.jsp" method="post">
	<table class="table table-light ">
			<thead>
				<tr>
				<th scope="col">ID</th>
				<th scope="col">Round</th>
				<th scope="col">Time</th>
				<th scope="col">Team1</th>
				<th scope="col">Score</th>
				<th scope="col">Score</th>
				<th scope="col">Team2</th>
			</tr>
			</thead>
			
			<tbody>
			<%
			String ch = request.getParameter("ch");
			MatchesDAOImpl dao2 =new MatchesDAOImpl(DBConnect.getConn());
			List<MatchesDtls> list = dao2.getMatchesBySearch(ch);
			for(MatchesDtls b2 : list) {
			%>
				<tr>
				<td><%=b2.getIdmatches()%></td>
				<td><%=b2.getRound()%></td>
				<td><%=b2.getTime()%></td>
				<td><%=b2.getTeam1()%></td>
				<td><%=b2.getScore1()%></td>
				<td><%=b2.getScore2()%></td>
				<td><%=b2.getTeam2()%></td>
				
				<%
			}
			 %>
		<button class=" my-2 my-sm-0" type="submit">Back</button>
</body>
</html>