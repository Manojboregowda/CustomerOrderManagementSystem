<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
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
	margin-top: -10px;
}

#b2{
	display: flex;
	margin-left: 400px;
	position: absolute;
	margin-top:225px;
	width:125px;
	text-align: center;
	align-content: center;
	align-items: center;
}
</style>
</head>
<body>
	<form action="/CustomerOrderMaven/addCustomer" method="POST">
		<div class="card">
			<h5 class="card-header">SignUp</h5>
			<div class="card-body">
				<div class="mb-3 row">
					<label for="staticName" class="col-sm-2 col-form-label">Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="name"
							id="staticName" placeholder="Enter your name">
					</div>
				</div>
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
			<button type="submit" class="btn btn-primary">Register</button>
	<a id="b2" href="/CustomerOrderMaven/login" class="btn btn-primary">Login</a>

		</div>
	</form>
</body>
</html>