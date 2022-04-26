
use arepezo
Select *
from pedidos

--1.-Da de alta un cliente en el arepazo

select *
from clientes
insert into Clientes
select 'Bernat', 'bernat@cesur.com', '666666666', 'calle falsa', '41009', 'sevilla', 'sevilla'

--2.-Da de alta un nuevo plato en el arepa<o. Patatas bravas que cueste 3e.

select *
from Menu
insert into Menu
select 'Patatas bravas', 'plato de patatas bravas', 1, 1, 3.00

--3.-Ese plato, lleva 0.2kg de patatas. Añade tb el ingrediente y la receta.
select *
from receta
select *
from ingredientes
where nombre like '%patata%'
insert into Ingredientes
select 'Patata', 1.00
insert into Receta
select (select id
  from menu
  where nombre='Patatas bravas' ),
  (select id
  from ingredientes
  where nombre='Patatas'),
  0.2

--4.-añadir un pedido 3 cañas y 3 bravas
--inserto pedido
insert into pedidos
select getdate(), 0, 4.99, 0, id, telefono, Direccion, cod_postal, ciudad
from clientes
where id=1
--obtengo el id del pedido recien insertado 
select max(id)
from pedidos
--1041
--insertar 3 bravas
insert into PedidosLinea
select 1041, m.id, 3, PrecioVenta, t.IVA
from menu m
  inner join TipoAlimento t on m.Tipo=t.id
where m.id =32
--m.nombre like '%caña%
--insertar 3 cañas
insert into PedidosLinea
select 1041, m.id, 3, PrecioVenta, t.IVA
from menu m
  inner join TipoAlimento t on m.Tipo=t.id
where m.id =2
--m.nombre like '%caña%



select idpedido, sum(Cantidad*PrecioVentaUnitario) as subtotal
from PedidosLinea
group by idpedido
--calculo el subtotal
begin tran
--opcion 1
update pedidos set subtotal =(
  select sum(Cantidad*PrecioVentaUnitario) as subtotal
from PedidosLinea
where idpedido=1041

) 
where Id = 1041
--alternativa para calcular el subtotal opcion 2
update pedidos set subtotal =t1.subtotal
from pedidos p
  inner join (

select idpedido, sum(Cantidad*PrecioVentaUnitario) as subtotal
  from PedidosLinea
  group by idpedido

) as t1 on t1.IdPedido = p.Id
where IdPedido = 1041
rollback tran

--calcular el total
update pedidos set total = GastosEnvio + SubTotal where id=1041

Select *
from pedidos
where id = 1041




select p.SubTotal , t1.subtotalCalculado

from pedidos p
  inner join (

select idpedido, sum(Cantidad*PrecioVentaUnitario) as subtotalCalculado
  from PedidosLinea
  group by idpedido

) as t1 on t1.IdPedido = p.Id


--5 añade y borra un cliente.
begin tran
insert into clientes
select 'bernat2'

delete from clientes where nombre='bernat2'
rollback tra
--6.- Borra todos los clientes que no tengan pedidos realizados.

begin TRAN
delete clientes where id in (

select id
from Clientes c
  left join pedidos p on p.IdCliente=c.Id
where p.id is null
)
rollback tran
--7.- Borra los ingredientes que no se usan en ninguna receta.


begin TRAN
delete ingredientes where id in (

select id
from Ingredientes i
  left join receta r on r.idIngredientes=i.Id
where r.idMenu is null
)
rollback tran
--8.- Cambia la dirección del cliente 2, la nueva dirección es Calle Falsa 44

update clientes set Direccion = 'Calle falsa 44' where id=2
--9.- Modifica la descripción de las patatas bravas añadidas en el ejercicio 2.
update menu set Descripcion='sdfgsdbvsfdvbs' where nombre ='Patatas Bravas'
--10. Microsoft ha decidido cerrar hotmail. Ahora todos los correos de hotmail seran outlook. 
--Actualiza la bbdd de clientes.

update clientes set email = REPLACE(email,'hotmail','gmail')
--11. Incrementa el precio de todos los elementos del menú un 5%.
update menu set PrecioVenta = PrecioVenta*1.05
--12 Los pedidos del 2022 tb deben verse afectados por ese incremento del 5%
--Recalcula el subtotal, y el total de todos los pedidos del 2022.


--13.- Borra todos los elementos del menú que nadie ha pedido nunca.

begin tran

delete from receta where idmenu in (
select m.id
from menu m
  left join PedidosLinea l on l.IdMenu=m.Id
where l.id is null
)

delete from menu where id in (
select m.id
from menu m
  left join PedidosLinea l on l.IdMenu=m.Id
where l.id is null

)
rollback tran

--14.- Añade un pedido a fecha de hoy para el cliente 5. Añadele 5 unidades del menu 1. 
--Recalcula todos los precios con el mínimo número de instrucciones SQL y intentando no poner nada "a pelo"
-- que no sea estrictamente necesario.