use arepezo
go
--ejercicio 2
create or alter trigger nuevaarepa
on menu
for insert ,update
AS
BEGIN

if(update(categoria))
BEGIN
    declare @idcategoria as int 
    declare @idmenu as int
    select @idcategoria = categoria,@idmenu=id from inserted

    if @idcategoria=1
    BEGIN
      if (select count(1) from receta where idmenu=@idmenu and idIngredientes=1)=0
      BEGIN
        insert into Receta
        select @idmenu,1,0.10
      END
    end
END
END
go

select * from menu

update menu set Categoria=1 where id = 1

select 1,2,3,4