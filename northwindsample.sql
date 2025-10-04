SELECT
	c.CustomerName,
	c.Country,
	SUM(od.Quantity * p.Price) AS TotalCustomerRevenue,
	COUNT(distinct o.OrderID) TotalNumberOfOrders
FROM
	northwindsample.customers c
JOIN
	northwindsample.Orders o ON c.CustomerID = o.customerID
join 
	northwindsample.orderdetails od ON od.OrderID = o.orderID
JOIN
	northwindsample.products p ON od.ProductID = p.ProductID
group by
	c.CustomerID
ORDER BY
	TotalCustomerRevenue DESC
LIMIT 5;