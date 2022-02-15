-- EJERCICIOS CON ADVENTUREWORKS
use AdventureWorks2017



--1.-Nombre empleados


select LastName,FirstName,MiddleName,PersonType from HumanResources.Employee e
inner join Person.Person p on e.BusinessEntityID=p.BusinessEntityID

--2.-Clientes que sean empleados

select LastName,FirstName,MiddleName,PersonType from HumanResources.Employee e
inner join Person.Person p on e.BusinessEntityID=p.BusinessEntityID
inner join sales.Customer c on c.PersonID = p.BusinessEntityID

--3.-Empleados de california

select LastName,FirstName,MiddleName,PersonType,* from HumanResources.Employee e
inner join Person.Person p on e.BusinessEntityID=p.BusinessEntityID
inner join person.BusinessEntityAddress pa on pa.BusinessEntityID=p.BusinessEntityID
inner join person.Address a on a.AddressID=pa.AddressID
inner join person.StateProvince s on s.StateProvinceID= a.StateProvinceID
where s.Name = 'California'


--4.-Pedido más caro

select top 1 * from sales.SalesOrderHeader order by TotalDue desc

--5.-Clientes que el nombre empiece por c

select LastName,FirstName,MiddleName,PersonType from  Person.Person p 
inner join sales.Customer c on c.PersonID = p.BusinessEntityID
where p.FirstName like 'c%'


--6.-Total ventas 2011

select sum(totaldue),count(1) from sales.SalesOrderHeader
where year(OrderDate)=2011

--7.-Total importe ventas 2011

select sum(totaldue),count(1) from sales.SalesOrderHeader
where year(OrderDate)=2011

--8.-Importe de todas las ventas de cada año

select sum(totaldue),count(1),year(OrderDate) from sales.SalesOrderHeader
group by year(orderdate)



--9.- Nombre y apellidos del cliente que mas pedidos ha realizado.
select top 2 sum(totaldue),count(1),c.CustomerID,p.FirstName,p.LastName from sales.SalesOrderHeader s
inner join sales.Customer c on c.CustomerID = s.CustomerID
inner join person.Person p on p.BusinessEntityID = c.PersonID
group by c.CustomerID,p.FirstName,p.LastName
order by count(1) desc

--10.- ranking de los 10 clientes  (Nombre y Apellido con los pedidos mas caros
select top 10 LastName,FirstName,max(TotalDue) from sales.SalesOrderHeader s
inner join sales.Customer c on c.CustomerID = s.CustomerID
inner join person.Person p on p.BusinessEntityID = c.PersonID
group by LastName,FirstName,c.CustomerID
order by max(totaldue) desc

--11.- Media de los pedidos de los clientes de California
select  LastName,FirstName,avg(TotalDue) from sales.SalesOrderHeader s
inner join sales.Customer c on c.CustomerID = s.CustomerID
inner join person.Person p on p.BusinessEntityID = c.PersonID
inner join person.BusinessEntityAddress pa on pa.BusinessEntityID=p.BusinessEntityID
inner join person.Address a on a.AddressID=pa.AddressID
inner join person.StateProvince sp on sp.StateProvinceID= a.StateProvinceID
where sp.Name = 'California'
group by LastName,FirstName,p.BusinessEntityID,sp.Name
order by LastName

--12.- Producto más caro comprado.

select p.Name,UnitPrice from  sales.SalesOrderDetail d
inner join Production.Product p on p.ProductID = d.ProductID
--ºgroup by p.Name
  order by UnitPrice desc



--13.- Producto comprado más veces.

select top 1 p.Name,sum(OrderQty) from  sales.SalesOrderDetail d
inner join Production.Product p on p.ProductID = d.ProductID
group by p.Name,p.ProductID
  order by sum(OrderQty) desc

--14.- Cliente que más productos distintos ha comprado


select  CustomerID,LastName,FirstName,count(1) from
 (    
    SELECT sa.CustomerID,ProductID,p.LastName,p.FirstName,count(1) AS NUMVECESCOMPRADO
    FROM Sales.Customer sa     
    INNER JOIN Sales.SalesOrderHeader so on sa.CustomerID=so.CustomerID    
    INNER JOIN Sales.SalesOrderDetail sod on so.SalesOrderID=sod.SalesOrderID
    inner join Person.Person p on sa.PersonID=p.BusinessEntityID
    group by sa.CustomerID,ProductID,p.LastName,p.FirstName
   -- order by CustomerID
     ) 
as tabla1 

group by tabla1.CustomerID,tabla1.LastName,tabla1.FirstName
order   by count(1) desc




--15.- Ranking de los 20 productos más veces vendidos.
select  top 20 p.Name,sum(OrderQty) from  sales.SalesOrderDetail d
inner join Production.Product p on p.ProductID = d.ProductID
group by p.Name,p.ProductID
  order by sum(OrderQty) desc
