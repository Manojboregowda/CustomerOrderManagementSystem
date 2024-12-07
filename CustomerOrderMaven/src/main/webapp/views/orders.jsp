<!DOCTYPE html>
<html>
<head>
    <title>Orders</title>
</head>
<body>
    <h1>Orders for Customer ${customerId}</h1>
    <ul>
        <c:forEach var="order" items="${orders}">
            <li>
                ${order.orderDate} - ${order.totalAmount} 
                <a href="/orders/${order.id}/delete?customerId=${customerId}">Delete</a>
            </li>
        </c:forEach>
    </ul>
    <form action="/customers/${customerId}/orders" method="post">
        <input type="date" name="orderDate" required />
        <input type="number" name="totalAmount" required />
        <button type="submit">Add Order</button>
    </form>
</body>
</html>
