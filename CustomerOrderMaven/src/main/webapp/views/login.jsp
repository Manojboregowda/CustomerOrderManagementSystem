<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<style>
.card {
	position: absolute;
	margin-top: 180px;
	width: 600px;
	left: 400px;
}

button {
	width: 150px;
	margin-left: 120px;
	margin-top:-7px;
}

h2 {
	color: red;
}

#b1{
	position: absolute;
	margin-left: 800px;
	margin-top: 355px;
}
</style>
</head>
<body>
	<form action="/CustomerOrderMaven/login" method="GET">
		<div class="card">
			<h5 class="card-header">Login</h5>
			<div class="card-body">
				<div class="mb-3 row">
					<label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="email"
							id="staticEmail" placeholder="email@example.com">
					</div>
				</div>
				<div class="mb-3 row">
					<label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="password"
							id="inputPassword">
					</div>
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Login</button>
		</div>
		<a id="b1" href="/CustomerOrderMaven/allCustomers" class="btn btn-primary">All Customers</a>
	</form>
</body>
</html>