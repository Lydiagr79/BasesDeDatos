
select * from Sushi s
left join MenuSushi m on s.idSushi =m.idSushi
where m.idMenu is null

select * from Sushi where nombre='sashimis'

select * from MenuSushi where idSushi=(select idsushi from Sushi where nombre='sashimis'
)


select * from Menu
select * from clientes




begin TRAN
delete from detalle  where idPedido in (
    select idpedido from pedidos p 
    inner join  clientes c on c.idCliente=p.idCliente
     where email='christineferrer8010@yahoo.org' )


delete from pedidos where idCliente in (
    select idCliente from clientes where email='christineferrer8010@yahoo.org' )

delete from clientes where idCliente in (
    select idCliente from clientes where email='christineferrer8010@yahoo.org' )
rollback tran
select * from clientes where email='christineferrer8010@yahoo.org' 


select m.nombre +' ('+ cast(sum(cantidad) as varchar) + ' unidades)' from Menu m
inner join MenuSushi ms on m.idMenu=ms.idMenu
group by m.idMenu,m.nombre