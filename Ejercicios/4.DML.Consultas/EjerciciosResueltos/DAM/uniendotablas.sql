-- EJERCICIOS CON ADVENTUREWORKS
use AdventureWorks2017


--1.-Nombre empleados

select LastName,FirstName from HumanResources.Employee e
inner join person.Person p on p.BusinessEntityID = e.BusinessEntityID

--2.-Clientes que sean empleados

select LastName,FirstName from HumanResources.Employee e
inner join person.Person p on p.BusinessEntityID = e.BusinessEntityID
inner join sales.customer c on c.personID = p.BusinessEntityID

--3.-Empleados de california


select LastName,FirstName from HumanResources.Employee e
inner join person.Person p on p.BusinessEntityID = e.BusinessEntityID
inner join person.BusinessEntityAddress pa on pa.BusinessEntityID= p.BusinessEntityID
inner  join person.address a on a.addressID = pa.addressID
inner  join person.StateProvince s on s.StateProvinceID = a.StateProvinceID
where s.Name = 'California'


--4.-Pedido más caro

select top 1 * from sales.SalesOrderHeader order by TotalDue desc

--5.-Clientes que el nombre empiece por c


select LastName,FirstName from  person.Person p 
inner join sales.customer c on c.personID = p.BusinessEntityID
where FirstName like 'c%'
--6.-Total ventas 2011

select count(1),sum(TotalDue) from sales.SalesOrderHeader where year(orderdate)=2011
--and orderdate like '%2011%'

--7.-Total importe ventas 2011

select count(1),sum(TotalDue) from sales.SalesOrderHeader where year(orderdate)=2011
--and orderdate like '%2011%'

--8.-Importe de todas las ventas de cada año

select year(orderdate),count(1),sum(TotalDue) from sales.SalesOrderHeader 
group by year(orderdate)

--9.- Nombre y apellidos del cliente que mas pedidos ha realizado.
select top 1 LastName,FirstName,count(1) from  person.Person p 
inner join sales.customer c on c.personID = p.BusinessEntityID
inner join sales.SalesOrderHeader s on s.CustomerID = c.CustomerID
group by LastName,FirstName ,p.BusinessEntityID
order by count(1) desc
--10.- ranking de los 10 clientes  (Nombre y Apellido con los pedidos mas caros
select top 10  LastName,FirstName,MAX(TotalDue) from  person.Person p 
inner join sales.customer c on c.personID = p.BusinessEntityID
inner join sales.SalesOrderHeader s on s.CustomerID = c.CustomerID
group by LastName,FirstName ,p.BusinessEntityID
order by MAX(TotalDue) desc



--11.- Media de los pedidos de los clientes de California
select avg(TotalDue) from  person.Person p 
inner join sales.customer c on c.personID = p.BusinessEntityID
inner join sales.SalesOrderHeader s on s.CustomerID = c.CustomerID
inner join person.BusinessEntityAddress pa on pa.BusinessEntityID= p.BusinessEntityID
inner  join person.address a on a.addressID = pa.addressID
inner  join person.StateProvince sT on sT.StateProvinceID = a.StateProvinceID
WHERE ST.Name='California'

--12.- Producto más caro comprado.

select top 1 UnitPrice,OrderQty,d.ProductID,p.name from sales.SalesOrderDetail d
inner join Production.Product p on p.ProductID=d.ProductID
order by UnitPrice desc


--13.- Producto comprado más veces.
select top 1 sum(OrderQty),count(1),d.ProductID,p.name from sales.SalesOrderDetail d
inner join Production.Product p on p.ProductID=d.ProductID
group by d.ProductID,p.name
order by sum(OrderQty) desc


--14.- Cliente que más productos distintos ha comprado

select top 1  CustomerID,LastName,FirstName,count(1) from
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

select top 20 sum(OrderQty),count(1),d.ProductID,p.name from sales.SalesOrderDetail d
inner join Production.Product p on p.ProductID=d.ProductID
group by d.ProductID,p.name
order by sum(OrderQty) desc
