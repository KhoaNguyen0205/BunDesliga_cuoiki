<%@page import="com.DAO.ClubDAOImpl"%>
<%@page import="com.entity.ClubDtls"%>
<%@page import="com.entity.PlayerDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.PlayerDAOImpl"%>
<%@page import="com.entity.User" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BUNDESLIGA || PLAYERS</title>
<link rel="stylesheet" href="css1/style.css">
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar2.jsp"%>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	
	<h2 class="text-center text-danger">ALL Players</h2>
	
	<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search by club" aria-label="Search"> 	
				<button class=" my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	
	<table class="table table-light ">
			<thead>
				<tr>
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Name</th>
				<th scope="col">Number-Shirt</th>
				<th scope="col">Club</th>
				<th scope="col">Position</th>
			</tr>
			</thead>
			
			<tbody>
			  <%
			  PlayerDAOImpl dao = new PlayerDAOImpl(DBConnect.getConn());
			  List<PlayerDtls> list = dao.getAllPlayers();
			  for(PlayerDtls b:list) {
				%>
				<tr>
				   <td><%=b.getId()%></td>
				   <td><img src="AllPlayers/<%=b.getImage()%>"
					style="width: 50px; height: 50Px"></td>
				<td><%=b.getName()%></td>
				<td><%=b.getNs()%></td>
				<td><%=b.getClub()%></td>
				<td><%=b.getPositon()%></td>
				
			  <%	  
			  }
			  %>
			
			</tbody>
		</table>
</body>
</html>