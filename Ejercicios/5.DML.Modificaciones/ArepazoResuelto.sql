
use arepezo
Select * from pedidos

insert into pedidos
select getdate(),0,4.99,0,id,telefono,Direccion,cod_postal,ciudad from clientes where id=1
select * from pedidos
select * from PedidosLinea

insert into PedidosLinea
select 1041,m.id,3,PrecioVenta,t.IVA from menu m
inner join TipoAlimento t on m.Tipo=t.id
where m.id =32 --m.nombre like '%caña%



insert into PedidosLinea
select 1041,m.id,3,PrecioVenta,t.IVA from menu m
inner join TipoAlimento t on m.Tipo=t.id
where m.id =2 --m.nombre like '%caña%

select * from PedidosLinea where IdPedido=1041


select idpedido, sum(Cantidad*PrecioVentaUnitario) as subtotal from PedidosLinea
group by idpedido

begin tran


update pedidos set subtotal =(
  select  sum(Cantidad*PrecioVentaUnitario) as subtotal from PedidosLinea
  where idpedido=1041

) 
where Id = 1041


update pedidos set subtotal =t1.subtotal
from pedidos p
inner join (

select idpedido, sum(Cantidad*PrecioVentaUnitario) as subtotal from PedidosLinea
group by idpedido

) as t1 on t1.IdPedido = p.Id
where IdPedido = 1041
rollback tran
update pedidos set total = GastosEnvio + SubTotal where id=1041

Select * from pedidos where id = 1041




select p.SubTotal , t1.subtotalCalculado

from pedidos p
inner join (

select idpedido, sum(Cantidad*PrecioVentaUnitario) as subtotalCalculado from PedidosLinea
group by idpedido

) as t1 on t1.IdPedido = p.Id

--13.- Borra todos los elementos del menú que nadie ha pedido nunca.

begin tran

delete from receta where idmenu in (
select m.id from menu m
left join PedidosLinea l on l.IdMenu=m.Id 
where l.id is null
)

delete from menu where id in (
select m.id from menu m
left join PedidosLinea l on l.IdMenu=m.Id 
where l.id is null

)
rollback tran

