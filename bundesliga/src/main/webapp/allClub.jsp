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
<title>Clubs</title>
<style type="text/css">
a.button{
 display: inline-block;
 padding: 20px 40px;
 background-color: #ffffb3;
 text-decoration: none;
 border-radius: 20px;
}
a.button.Club{
	background:  #ffffb3;
	float: left;
	height: 100px;
	width: 350px;
	margin: 30px;
}
a.button.Club:hover{
background-color: #e0e0d1; 
}
</style>
<link rel="stylesheet" href="css1/style.css">
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar2.jsp"%>

  <div class="container-fluid">
    <div class="row p-3">
         <%
            ClubDAOImpl dao = new ClubDAOImpl(DBConnect.getConn());
            List<ClubDtls> list = dao.getAllClubs();
            for (ClubDtls b: list ){
         %>
			<div class="list-button div_left" style="border: 5px double">
				<a href="view_clubs.jsp?id=<%=b.getId()%>" class="button Club"> <span> <img
						style="height: 50px; width: 50px"
						src="AllClubs/<%=b.getLogo()%>">
				</span> <span> <b><%=b.getName() %></b>
				</span>
				</a>
			</div>

			<%
			}
			%>
    </div>
  </div>
	
</body>
</html>