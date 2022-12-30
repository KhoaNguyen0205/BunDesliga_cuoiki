<%@page import="java.util.List"%>
<%@page import="com.entity.ClubDtls" %>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ClubDAOImpl"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ALL CLUBS</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
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
	
	<table class="table table-striped ">
		<thead >
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Logo</th>
				<th scope="col">Club Name</th>
			</tr>
		</thead>
		<tbody>
			<%
			ClubDAOImpl dao = new ClubDAOImpl(DBConnect.getConn());
			List<ClubDtls> list = dao.getAllClubs();
			for (ClubDtls b : list) {
			%>
			<tr>
				<td><%=b.getId()%></td>
				<td><img src="../AllClubs/<%=b.getLogo()%>"
					style="width: 50px; height: 50Px"></td>
				<td><%=b.getName()%></td>
					<td><a href="edit_club.jsp?id=<%=b.getId()%>"
					class=" form-control mr-sm-2"><i class="fa-solid fa-pen-to-square"></i> Edit</a> <a
					href="../delete?id=<%=b.getId()%>"
					class=" form-control mr-sm-2"><i class="fa-solid fa-trash"></i> Delete</a></td>
			</tr>
			<%
			}
			%>


		</tbody>
	</table>
</body>
</html>