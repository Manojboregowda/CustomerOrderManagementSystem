<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Summary</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h2 class="my-4">Order Summary</h2>

		<div class="alert alert-success">
			<strong>${message}</strong>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>Item Name</th>
					<th>Price</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${selectedItem}">
					<tr>
						<td>Item: ${item.name}</td> 
						<td>Price: &#8377 ${item.price}
						<td>
					</td>

						</tr>
				</c:forEach>
			</tbody>
		</table>
		<h4>Total: &#8377 ${order.totalAmount}</h4>

		<a href="/CustomerOrderMaven/order" class="btn btn-primary">Back
			to Items</a>
	</div>
</body>
</html>
