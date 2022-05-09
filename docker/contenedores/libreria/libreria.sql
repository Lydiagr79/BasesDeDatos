use books

use books



create  table Tamanyo(
idTamanyo int IDENTITY(1,1) PRIMARY KEY,
alto int not null,
ancho int not null

)
alter table tamanyo add nombre varchar(100) not null

create  table preciosImpresion(
idPrecio int IDENTITY(1,1) primary key,
idtamanyo INT,
precioFijo decimal(10,4),
precioPorPaginaColor decimal(10,4),
precioPorPaginaBlancoNegro decimal(10,4),
CONSTRAINT fktamanyoprecio FOREIGN KEY (idtamanyo) REFERENCES Tamanyo(idtamanyo)

)


ALTER TABLE LIBROS ADD IdTamanyo int
alter table libros add CONSTRAINT fktamanyolibro FOREIGN KEY (IdTamanyo) REFERENCES Tamanyo(idTamanyo)

alter table libros add peso decimal(18,2)

update libros set peso =dbo.calcularPeso(idLibro)

select * from libros
select * from preciosImpresion

go
create or alter function dbo.calcularpeso(@id as int)
returns decimal(18,2)
AS
BEGIN
    declare @res as decimal(18,2)
    declare @numPaginas as int =(select num_paginas
    from libros
    where idLibro=@id)
    set @res = 0.030 + (@numPaginas/2)*0.0015
    return @res
END
go
--2
select * from libros
go
create or alter function dbo.calcularGastosEvnioporPeso(@peso as decimal(18,2),@codpostal as varchar(5))
returns decimal(18,2)
AS
BEGIN
    declare @res as decimal(18,2)
    --declare @peso as decimal(18,2)= (select dbo.calcularpeso(@id))

    if left(@codpostal,2)='41'
       set  @res=1.9
    else
       set @res=3.9

    set @res = @res + (@peso)* 0.1
    return @res
END
go
select dbo.calcu
--3
select * from libros
go
create or alter function dbo.calcularCosteProduccion(@id as int)
returns decimal(18,2)
AS
BEGIN
    declare @res as decimal(18,2)
    declare @numPaginas as int
    declare @precioPag as decimal(10,4)
    declare @precioFijo as decimal(10,4)
    select @numPaginas = num_paginas, @precioFijo = p.precioFijo,
    @precioPag = case when color=1 then precioPorPaginaColor else precioPorPaginaBlancoNegro end
    from libros l
    inner join preciosImpresion p on p.idtamanyo = l.idTamanyo

    where idLibro=@id

    set @res = @precioFijo + (@numPaginas)*@precioPag
    return @res
END
go


--4

go
create or alter procedure rellenarprecios
AS
BEGIN
    update libros set precioVenta = dbo.calcularCosteProduccion(idLibro) + 1
END

EXEC rellenarprecios

go
create or alter procedure rellenarpreciosBonitos
AS
BEGIN

    EXEC rellenarprecios
    
    update libros set precioVenta = case when precioVenta<4.99 then 4.99 
        when precioventa >4.99 and precioVenta<9.99 then 9.99
        when precioventa >9.99 and precioVenta<14.99 then 14.99
        when precioventa >14.99 and precioVenta<19.99 then 19.99
        when precioventa >19.99 and precioVenta<24.99 then 24.99
        when precioventa >19.99 and precioVenta<24.99 then 24.99
        when precioventa >24.99 and precioVenta<29.99 then 29.99
        ELSE precioVenta
    end

    delete from libros where precioVenta >29.99 

END
GO
EXEC rellenarpreciosBonitos

SELECT * FROM LIBROS

update libros set idtamanyo = cast(isbn13 as bigint) %3 +1

select * from libros
insert into Tamanyo
select 15,10,'Mini'
union 
select 17,24,'Estandard'
union  
select 21,29,'Grande'
select * from preciosImpresion
insert into preciosImpresion 
select 1,0.45,0.045,0.009
UNION
select 2,0.6,0.06,0.012
union 
select 3,0.8,0.08,0.015



CREATE TABLE [Clientes] (
    [idCliente] INTEGER NOT NULL IDENTITY(1, 1),
    [nombre] VARCHAR(255) NULL,
    [telefono] VARCHAR(100) NULL,
    [email] VARCHAR(255) NULL,
    [direccion] VARCHAR(255) NULL,
    [cod_postal] VARCHAR(10) NULL,
    [ComAutonoma] VARCHAR(50) NULL,
    [Pais] VARCHAR(100) NULL,
    [alphanumeric] VARCHAR(255) NULL,
    PRIMARY KEY ([idCliente])
);



create table Pedidos
(
    idPedido int IDENTITY(1,1) Primary Key,
    fecha datetime,
    idCliente int not null, 
    constraint fkclientes FOREIGN KEY(idcliente) REFERENCES Clientes(idCliente),
    SubTotal decimal(6,2) not null,
    GastosEnvio decimal(6,2) not null,
    Total decimal(6,2) not null,
    direccionEntrega varchar(255),
    telefonoEntrega varchar(100),
    [cod_postalEntrega] VARCHAR(10) NULL,
    [ComAutonomaEntrega] VARCHAR(50) NULL,
)

create table Detalle(
idPedido int,
idLibro int,
Cantidad int,
PrecioUnitario Decimal(5,2)
constraint fkpedidodetalle FOREIGN KEY(idPedido) REFERENCES Pedidos(idPedido),
constraint fkPizzadetalle FOREIGN KEY(idLibro) REFERENCES Libros(idLibro),
PRIMARY KEY(idpedido,idLibro)

)

GO



DECLARE @Date1 datetime
SET @Date1 = '1/01/2021'

declare @contador as int= 0

while @contador<15000
BEGIN
  INSERT INTO Pedidos
  select DATEADD(DAY, cast(RAND(CHECKSUM(NEWID())) * 365*( cast(RAND(CHECKSUM(NEWID())) * 2 as INT)) as INT), @Date1),
  idCliente,0,0,0,direccion,telefono,cod_postal,ComAutonoma from clientes where idCliente =cast(RAND(CHECKSUM(NEWID())) * 500 as INT)+1
  set @contador=@contador +1
END



declare @idpedido as int=1

while @idpedido<15000
BEGIN
    declare @numlibros as int =cast(RAND(CHECKSUM(NEWID())) * 5 as INT)+1
 
    while @numlibros >0
    BEGIN
        insert into Detalle
        select @idpedido,idlibro,cast(RAND(CHECKSUM(NEWID())) * 3 as INT)+1,precioventa from libros where idlibro=cast(RAND(CHECKSUM(NEWID())) * (select max(idLibro) from libros) as INT)+1
        set @numlibros =@numlibros-1
    END
    set @idpedido=@idpedido+1
END


set @idpedido =1
declare @idpedido as int=1

while @idpedido<15001
BEGIN
    declare @subtotal as decimal(6,2)
    select @subtotal=subtotal from pedidos where idPedido=@idpedido
    IF  @subtotal=0
        BEGIN 
        print 'recalcular pedido '
        print @idpedido
            declare @numpizzas as int =cast(RAND(CHECKSUM(NEWID())) * 5 as INT)+1
        
            while @numpizzas >0
            BEGIN
                insert into Detalle
                select @idpedido,idlibro,cast(RAND(CHECKSUM(NEWID())) * 3 as INT)+1,precioventa from libros where idlibro=cast(RAND(CHECKSUM(NEWID())) * (select max(idLibro) from libros) as INT)+1
                set @numpizzas =@numpizzas-1
            END
            

        END
    set @idpedido=@idpedido+1
END


update pedidos set SubTotal=t1.totalcalculado
from pedidos p
inner join (

select p.idPedido,sum(Cantidad*PrecioUnitario) as totalcalculado from pedidos p
inner join Detalle d on p.idPedido=d.idPedido
group by p.idPedido
) as t1 on t1.idPedido=p.idPedido

select * from pedidos where subtotal = 0

update pedidos set GastosEnvio = t1.gastoscalculados 
from pedidos p
inner join (

select p.idPedido,sum(l.peso*cantidad) as peso,p.cod_postalEntrega,dbo.calcularGastosEvnioporPeso(sum(l.peso*cantidad),p.cod_postalEntrega) as gastoscalculados from pedidos p
inner join Detalle d on p.idPedido=d.idPedido
inner join libros l on d.idLibro = l.idLibro
group by p.idPedido,p.cod_postalEntrega
) as t1 on t1.idPedido=p.idPedido
select * from pedidos

update pedidos set Total=GastosEnvio+SubTotal




-- consultas

-- 1.- Dime los 20 libros con más paginas. Quiero saber el titulo y el peso.


--2 obten el nombre, el telefono y el email del cliente que mas se ha gastado en la libreria


--3 obten todos los libros de tamaño estandard.

select * from libros where autores = 'J.R.R. Tolkien'
--4 Quiero una lista con el nombre del cliente, la fecha del pedido, el id del pedido de todos 
--los pedidos entregados en sevilla
-- 5.-obten los pedidos que contengan más de 4 libros distintos

--Modificaciones
--1.- Añadete como cliente
--2.- Añade un nuevo formato de libro extramini de dimensiones 9 de alto por 9 de ancho. y asignaselo a todos los libros de menos de 50 paginas
--3.- Incrementa los precios de impresión fijos un 5%
--4.- añade un pedido de un libro al cliente id 23 de todos los libros de J.R.R.Tolkien
--5.- borra todos los libros que nadie haya pedido

select * from libros
-- Borra todos los libros que nadie haya comprado 

