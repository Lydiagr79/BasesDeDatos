


select * from clientes where idCliente not in (select idcliente from pedidos)


select * from Ingredientes where idIngrediente not in (select idIngrediente from PizzaIngredientes)

select * from pizzas where idPizza not in (select idPizza from detalle)




begin tran
update clientes set contrasenya = '123456Ab##' + email
where contrasenya = (
select contrasenya from clientes 
group by contrasenya
having count(1)>1)
rollback tran




--

--Añadete como cliente en la pizzeria piccola.
insert into clientes values ('bernat')
--añade una pizza cesur que contenga pollo y calabacín y que cueste 6.5€
insert into pizzas values ( 'cesur',6.5)

--añade un pedido con 2 pizzas Barbacoa y una 4 quesos.
--añadir un pedido

--en la mesa del pedido 23, se han quedado con hambre y quieren añadir al pedido una pizza popeye. Añadela a ese pedido y recalcula el total y el subtotal a pagar.

--hay algun cliente con la contraseña repetida? modifica esas contraseñas repetidas poniendola a 12345Ab## + el id del cliente


begin tran
    update clientes set contrasenya = '123456Ab##' + email
    where contrasenya = (
        select contrasenya from clientes 
        group by contrasenya
        having count(1)>1
        )
rollback tran

--Borra todos los ingredientes que no se usan

--Hemos borrado por error el contenido del campo subtotal de la tabla pedidos. reconstruyelo sin tirar del backup.

--la pizzeria la piccola ha sido comprada por unos italianos. Cuando se han enterado que hay alguna pizza con piña, se han puesto a gritar.
   --Cambia la piña en todas las pizzas donde aparezca por calabacín.

--tenemos que augmentar todos los pedidos de los clientes de la ComAutonoma Illes Balears. Modifica el gasto de envio a 5.99 a dichos clientes.
BEGIN tran 
update pedidos set GastosEnvio= GastosEnvio * 1.35 where ComAutonomaEntrega='Illes Balears'
rollback tran

select * from pedidos
--10.-Si el coste de una base+tomate+mozzarela que es lo que tienen todas las pizzas es 3€, calcula cuanto cuesta cada pizza sumando el coste de ingredientes 
--y localiza todas las pizzas que su precio sea menor.
--Una vez localizadas, augmenta su precio para ganar 0.5€ en esas pizzas en las que perdia dinero.
begin tran

update pizzas set precio = t1.preciocalculado + 0.5
    from pizzas p 
    inner join (
    select p.idPizza, precio,sum(i.PrecioCosteIngrediente)+3 as preciocalculado from Pizzas p
    inner join PizzaIngredientes pi on pi.idPizza=p.idPizza
    inner join Ingredientes i on i.idIngrediente=pi.idIngrediente
    group by p.idPizza,precio
    having precio <sum(i.PrecioCosteIngrediente)+3) as t1 on t1.idPizza=p.idPizza
rollback tran



select * from clientes where contrasenya ='qwertyuiop'