<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.entity.ClubDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ClubDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bundesliga</title>
<style type="text/css">

</style>
<link rel="stylesheet" href="css1/style.css">
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>	
	<%@include file="all_component/navbar2.jsp"%>
	
	<%@include file="all_component/slider.jsp" %>
	
	<%@include file="all_component/star_of_liga.jsp" %>
	
	
	<h1></h1>
	<br><br>
	<br><br>
	
	<div class="container mt-5">
		<table class="table table-light ">
			<thead>
			
				<tr>
					<th scope="col">STT</th>
					<th scope="col">Logo</th>
					<th scope="col">Club</th>
					<th scope="col">Matches</th>
					<th scope="col">W</th>
					<th scope="col">D</th>
					<th scope="col">L</th>
					<th scope="col">Score</th>
					<th scope="col">Conceded</th>
					<th scope="col">+/-</th>
					<th scope="col">Points</th>
				</tr>
		
			</thead>
			<%
			ClubDAOImpl dao2 =new ClubDAOImpl(DBConnect.getConn());
			List<ClubDtls> list2 = dao.getTable();
			for(ClubDtls b: list2) {
			%>
			<tbody>
				<tr>
					<th scope="col">
					
					</th>  
					<td scope="col">
					    <img src="AllClubs/<%=b.getLogo()%>"
					style="width: 50px; height: 50Px">
					</td>
					<td scope="col"><%=b.getName() %></td>
					<td scope="col"><%=b.getMatches()%></td>
					<td scope="col"><%=b.getW() %></td> 
					<td scope="col"><%=b.getD()%></td>
					<td scope="col"><%=b.getL() %></td>
					<td scope="col"><%=b.getScore() %></td>
					<td scope="col"><%=b.getConceded() %></td>	
					<td scope="col"><%=b.getNuof()%></td>
					<td scope="col"><%=b.getP()%></td>
				</tr>
				<%
			}
				%>
			</tbody>
		</table>
</body>
</html>