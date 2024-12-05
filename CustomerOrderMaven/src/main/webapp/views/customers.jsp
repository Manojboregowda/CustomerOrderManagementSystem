<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.vaish.entity.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View|All Customers</title>
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
body {
	background:
		url("https://blog.greggant.com/images/posts/2021-09-25-preview/pondreeds-preview.jpg");
	background-size: 100%;
	background-position: center;
	font-family: 'Roboto', sans-serif;
	overflow: hidden;
}

.container {
	width: 700px;
	height: 480px;
	margin: 100px auto;
}

.glass {
	background: linear-gradient(135deg, rgba(255, 255, 255, 0.1),
		rgba(255, 255, 255, 0));
	backdrop-filter: blur(20px);
	-webkit-backdrop-filter: blur(20px);
	border-radius: 20px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
}

table #tablepress {
	/* the next line does the trick */
	background-color: rgba(255, 255, 255, .65);
	/* change this per your requirements */
	/* just for the demo */
	width: 75%;
	margin: 10px auto;
}

table {
	font-family: 'Lora', serif;
	font-size: 1.1rem;
}

th {
	font-family: 'Roboto', sans-serif;
	font-weight: bold;
}

td {
	font-family: 'Lora', serif;
}

.table {
	border-radius: 10px;
	overflow: hidden;
}

.table th, .table td {
	padding: 7px;
}
</style>
</head>
<body>
	<div class="container glass">
		<center>
			<h1 class="display-2">All Customers</h1>
			<br />
			<table class="table table-bordered border-light table-sm w-80"
				border="2" id="tablepress">
				<thead class="table-light border-light thead-dark">
					<tr>
						<th class="bg-transparent">Customer Id</th>
						<th class="bg-transparent">Customer Name</th>
						<th class="bg-transparent">Customer Email</th>
					</tr>
				</thead>
				<tbody class="table-group-divider border-light">
					<c:forEach var="cs" items="${customer}">
						<tr>
							<td class="bg-transparent">${cs.id}</td>
							<td class="bg-transparent">${cs.name}</td>
							<td class="bg-transparent">${cs.email}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</center>
	</div>
</body>
</html>