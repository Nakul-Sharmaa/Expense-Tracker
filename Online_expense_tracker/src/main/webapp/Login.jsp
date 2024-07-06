<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored ="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/all_css.jsp"%>
</head>
<body class="bg-light">
	<%@include file="component/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header">
						<p class="text-center fs-3">Login Page</p>
						<c:if test="${not empty msg }">
						<p class ="text-center text-danger fs-3"> ${msg}</p>
						<c:remove var="msg"/>
						</c:if>
					</div>
					<div class="card-body">
						<form action="Login" method="post">

							<div class="mb-3">
								<label>Email</label> <input type="email" name="email"
									class="form-control">

							</div>
							<div class="mb-3">
								<label>Password</label> <input type="password" name="password"
									class="form-control">

							</div>

							<button class="btn btn-primary col-md-12">Login</button>
							<div class="text-center mt-2">
								Don't have a account <a href="Register.jsp"
									class="text-decoration-none"> Create new account</a>

							</div>

						</form>

					</div>
				</div>



			</div>



		</div>
	</div>
</body>
</html>