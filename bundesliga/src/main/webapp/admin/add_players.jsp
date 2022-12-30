<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Player</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Player</h4>

						<c:if test="${not empty failedMsg}">
							<p class="text-center text-damger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="../add_players" method="post"
							enctype="multipart/form-data">

							<div class="form-group">
								<label for="exampleControlFile1">Upload Photo</label> <input
									name="image" type="file" class="form-control-file"
									id="exampleControlFile1" required="required">
							</div>
							
							<div class="form-gruop">
								<label for="exampleInputEmail">Name</label> <input
									name="pname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"  required="required">
							</div>
							
							<div class="form-gruop">
								<label for="exampleInputEmail">Number-Shirt</label> <input
									name="ns" type="number" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"  required="required">
							</div>
							
							<div class="form-gruop">
								<label for="exampleInputEmail">Club</label> <input
									name="club" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"  required="required">
							</div>
							
							<div class="form-group">
								<label for="inputState">Position</label> <select
									id="inputState" name="position" class="form-control">
									<option selected>--Select--</option>
									<option value="GK">GK</option>
									<option value="DF">DF</option>
									<option value="MF">MF</option>
									<option value="ST">ST</option>
								</select>
							</div>
							
							<button type="submit" class="btn btn-primary">Add</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>