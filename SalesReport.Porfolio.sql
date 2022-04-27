Select *
From [SalesReport.Porfolio]..Orders ord
Join [SalesReport.Porfolio]..Product pro
on ord.ProductID = pro.ProductID

Update [SalesReport.Porfolio]..Orders
SET ProductID = 1021
Where Quantity = 218

--Revenue by Month

Select ord.Month, Round(Sum(ord.Quantity * pro.[Price Each]),0) Revenue
From [SalesReport.Porfolio]..Orders ord
Join [SalesReport.Porfolio]..Product pro
on ord.ProductID = pro.ProductID
Group By ord.Month
Order by Revenue desc

--Revenue by Location

Select ord.[Purchase Address], Round(Sum(ord.Quantity * pro.[Price Each]),0) Revenue
From [SalesReport.Porfolio]..Orders ord
Join [SalesReport.Porfolio]..Product pro
on ord.ProductID = pro.ProductID
Group By ord.[Purchase Address]
Order by Revenue desc

--Total Quantity of by Product

Select Pro.Product, sum(ord.Quantity) TotalQuantity
From [SalesReport.Porfolio]..Orders ord
Join [SalesReport.Porfolio]..Product pro
on ord.ProductID = pro.ProductID
group by pro.Product
order by sum(ord.Quantity) desc

Update [SalesReport.Porfolio]..['Sales Teams]
Set Team = 'Special'
Where Team is null

--Looking at Quantity Sold by salesmen who sold more than 10000

Select sal.Salesperson, st.Team, sum(ord.Quantity) QuantitySold
From [SalesReport.Porfolio]..Orders ord
Join [SalesReport.Porfolio]..Sales sal
on ord.OrderID = sal.OrderID
Join [SalesReport.Porfolio]..['Sales Teams] st
on sal.Salesperson = st.[Sales person]
group by sal.Salesperson, st.Team
Having sum(ord.Quantity) > 10000
order by QuantitySold desc


