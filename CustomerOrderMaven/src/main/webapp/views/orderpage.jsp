<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Page</title>
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
h2 {
	color: green;
}
</style>
</head>
<body>
	<center>
		<h2>${msg}</h2>
	</center>
	<div class="container">
		<h2 class="my-4">Select Items to Order</h2>

		<form action="/CustomerOrderMaven/addOrder" method="post">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>Select</th>
							<th>Item Name</th>
							<th>Price</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${items}">
							<tr>
								<td>
									<!-- Allow multiple selections using checkboxes --> <input
									type="checkbox" name="itemIds" value="${item.id}">
								</td>
								<td>${item.name}</td>
								<td>${item.price}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- Submit button to add selected items to the order -->
			<button type="submit" class="btn btn-primary">Place Order</button>
		</form>
	</div>
</body>
</html>
