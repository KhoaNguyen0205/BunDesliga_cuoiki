<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.PlayerDAOImpl"%>
<%@page import="com.entity.PlayerDtls"%>
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
		
			  String ch =request.getParameter("ch");
	          PlayerDAOImpl dao2 = new PlayerDAOImpl(DBConnect.getConn());
	          List<PlayerDtls> list2 =dao2.getPlayerBySearch(ch);
			  for(PlayerDtls b:list2) {
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