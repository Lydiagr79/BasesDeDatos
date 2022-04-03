--1-Crear un procedimiento almacenado que nos devuelva el factorial de un número​

--2-Crear un procedimiento almacenado que nos indique si un numero es primo o no.​


declare @num as int= 13


declare @contador as int = 2
declare @esprimo as bit = 1
while @contador<@num
BEGIN 

if(@num%@contador=0)
    BEGIN
     SET @esprimo=0
    END
SET @contador=@contador+1
END

IF @esprimo=1
    PRINT CONCAT(@NUM,' ES UN NÚMERO PRIMO')
ELSE
    PRINT CONCAT(@NUM,' NO ES UN NÚMERO PRIMO')
--3-Crear un procedimiento almacenado que nos devuelva los n primeros numeros de la sucesión de fibonacci.​

--https://stackoverflow.com/questions/21746100/how-to-generate-fibonacci-series


--4-Con adventureWorks, dame la lista de empleados de un departamento indicando el id del departamento.​

--5-A la consulta anterior, añadir un parametro opcional que sea el sexo de los empleados​

--6 añade al procedimiento anterior un parametro de salida que nos devuelva el numero de empleados.



--Manipulando cadenas...

--6-Dime que clientes del arepazo, tienen un nombre de mas de 5 caracteres.​

--7-Recorta a 5 caracteres los nombres de los clientes del arepazo. Muestralo por pantalla, no lo guardes en ningun sitio.​

--8-De los email del arepazo, obten los caracteres del 3 al 7​

--9-Dime el total de caracteres de todos los nombres de los clientes del arepazo.​

--10-Haz un procedimiento, dado un cliente del arepazo( el id), me devuelva una cadena de texto con su nombre, el total gastado, y el numero de pedidos. Ejemplo:​

--'El cliente Bernat, ha gastado 100€ en un total de 4 pedidos.'​


----manipulando fechas----

--11.- haz un procedimiento que imprima por pantalla una fecha aleatoria
-- de la semana santa del 9 al 17 de abril.
-- Para obtener un número aleatorio, usa la función:

-- cast(RAND(CHECKSUM(NEWID())) * 10 as INT) siendo  10 el valor máximo -1
-- que nos va a devolver. Nos devolverá un número de 0 a 9. probad: 

declare @numeroAleatorio as int=  cast(RAND(CHECKSUM(NEWID())) * 10 as INT)
print @numeroAleatorio

--12 Serías capaz de hacer un procedure que dado un minuto aleatorio dentro de la
-- semana santa nos dijera con un print cuantas procesiones hay en la calle?
--imaginate que tienes esta bbdd y la tabla procesiones con toda la info.
--haz que el procedimiento te diga: 
-- 'El dia X a de abril a las xxh hay X procesiones en la calle'
create database SemanaSantaSevilla
GO
    use SemanaSantaSevilla
go
create table Procesiones(
                id int identity(1,1) primary key,
    nombre varchar(100) not null,
    fechaSalida datetime not null,
    fechaEntrada datetime not null
) 
declare @viernessanto as datetime ='4/15/2022'
insert into Procesiones
select 'Macarena',@viernessanto,dateadd(hour,13,@viernessanto)