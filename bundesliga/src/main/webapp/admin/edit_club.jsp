<%@page import="com.entity.ClubDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ClubDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
	
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	ClubDAOImpl dao = new ClubDAOImpl(DBConnect.getConn());
	ClubDtls b = dao.getClubById(id);
	%>

	<form action="../editClub" method="post" >
    <table class="table table-light ">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Logo</th>
					<th scope="col">Name</th>
					<th scope="col">W</th>
					<th scope="col">D</th>
					<th scope="col">L</th>
					<th scope="col">Score</th>
					<th scope="col">Conceded</th>
				</tr>
			</thead>
         <tboby>
			<tr>
				
				<th>
				<input type="hidden" name="id" value="<%=b.getId()%>">
				</th>
				
				<th><img src="../AllClubs/<%=b.getLogo()%>"
					style="width: 50px; height: 50Px"></th>
				<th><%=b.getName() %></th>
				<th>
					<div class="form-gruop">
						<input style="height: 50px; width: 50px;" name="w" type="number"
							min="0" class="form-control" value="<%=b.getW()%>">
					</div>
				</th>
				<th>
				   <div class="form-gruop">
						<input style="height: 50px; width: 50px;" name="d" type="number"
							min="0" class="form-control" value="<%=b.getD()%>">
					</div>
				</th>
				<th>
				   <div class="form-gruop">
						<input style="height: 50px; width: 50px;" name="l" type="number"
							min="0" class="form-control" value="<%=b.getL()%>">
					</div>
				</th>
				<th>
				   <div class="form-gruop">
						<input style="height: 50px; width: 50px;" name="score" type="number"
							min="0" class="form-control" value="<%=b.getScore()%>">
					</div>
				</th>
				<th>
				   <div class="form-gruop">
						<input style="height: 50px; width: 50px;" name="conceded" type="number"
							min="0" class="form-control" value="<%=b.getConceded()%>">
					</div>
				</th>
				
				
				<th>
					<button type="submit" class=" form-control mr-sm-2">ADD</button>
				</th>
		</table>
</form>

</body>
</html>