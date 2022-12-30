<%@page import="com.entity.PlayerDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.PlayerDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	PlayerDAOImpl dao = new PlayerDAOImpl(DBConnect.getConn());
	PlayerDtls b = dao.getPlayerById(id);
	%>
	<form action="../editPlayer" method="post">
		<table>
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
				<th>
				<input type="hidden" name="id" value="<%=b.getId()%>">
				</th>

				<th>
				<img src="../AllPlayers/<%=b.getImage()%>"
					style="width: 50px; height: 50Px"></td>
				</th>

				<th>
				  <div class="form-gruop">
						<input style="height: 50px; width: 200px;" name="name"
							type="text" min="0" class="form-control" value="<%=b.getName()%>">
					</div>
				  
				</th>

				<th>
				<div class="form-gruop">
						<input style="height: 50px; width: 50px;" name="ns"
							type="number" min="0" class="form-control" value="<%=b.getNs()%>">
					</div>
				
				</th>

				<th>
				<div class="form-gruop">
						<input style="height: 50px; width: 200px;" name="club"
							type="text" min="0" class="form-control" value="<%=b.getClub()%>">
					</div>
				
				</th>


				<th>
				<%=b.getPositon() %>
				</th>
				
				<th>
					<button type="submit" class=" form-control mr-sm-2">ADD</button>
				</th>
			</tbody>
		</table>
	</form>
</body>
</html>