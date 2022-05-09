use books
select * from libros

go
create or alter function dbo.calcularpeso(@id as int)
returns decimal(18,2)
AS
BEGIN
    declare @res as decimal(18,2)
    declare @numPaginas as int =(select num_paginas
    from libros
    where idLibro=@id)
    set @res = 0.30 + (@numPaginas/2)*0.015
    return @res
END
go
--alternativa sin funcion:
select * , 0.25+ (num_paginas/2)*0.16 as peso from libros
--2

go
create or alter function dbo.calcularGastosEvnio(@id as int,@codpostal as varchar(5))
returns decimal(18,2)
AS
BEGIN
    declare @res as decimal(18,2)
    declare @peso as decimal(18,2)= (select dbo.calcularpeso(@id))

    if left(@codpostal,2)='41'
       set  @res=1.9
    else
       set @res=3.9

    set @res = @res + (@peso/100)* 0.015
    return @res
END
go

--3

go
create or alter function dbo.calcularCosteProduccion(@id as int)
returns decimal(18,2)
AS
BEGIN
    declare @res as decimal(18,2)
    declare @numPaginas as int
    declare @color as bit
    select @numPaginas = num_paginas, @color = color
    from libros
    where idLibro=@id

    if @color=1
        set @res = 0.6 + (@numPaginas)*0.06
    else
        set @res = 0.6 + (@numPaginas)*0.012

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

