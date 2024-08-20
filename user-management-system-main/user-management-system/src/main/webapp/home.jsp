<%@page import="java.util.List"%>
<%@page import="com.org.dao.UserDao"%>
<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="components/bootstrapCss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

	<%
	User sessionUser = (User) session.getAttribute("userObj");
	if (sessionUser == null) {
		response.sendRedirect("login.jsp");
	} else {
	%>

	<%@ include file="components/homeNavbar.jsp"%>
	<h1 class="text-center">
		Hey

		<%=sessionUser.getName()%>
		,Welcome TO User Management System
	</h1>

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">User Details</p>
						<a href="#" class="text-decoration-none btn btn-primary">Add
							User</a>
						<table class="table">
							<thead>
								<tr>
									<th>Name</th>
									<th>Age</th>
									<th>Email</th>
									<th>Mobile</th>
									<th>Action</th>
								</tr>
								<%
								UserDao dao = new UserDao();
								List<User> list = dao.fetchAllUsers();

								for (User u : list) {

									if (sessionUser.getId() == u.getId()) {
										continue;
									}
								%>
								<tr>
									<td><%=u.getName()%></td>

									<td><%=u.getAge()%></td>

									<td><%=u.getEmail()%></td>

									<td><%=u.getMobile()%></td>

									<td><a href="update.jsp?id=<%=u.getId()%>"
										class="btn btn-success text-decoration-none">Update</a> <a
										href="#" class="btn btn-danger text-decoration-none">Delete</a>
									</td>

								</tr>

								<%
								}
								%>

							</thead>
							<tbody>
						</table>

					</div>
				</div>


			</div>

		</div>


	</div>

	<%
	}
	%>
</body>
</html>