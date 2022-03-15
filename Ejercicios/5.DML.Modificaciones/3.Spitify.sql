--1--añade un cantante/grupo que te guste.

--2.- añade un disco de ese cantante/grupo con alguna categoria de las que hay


--3- añade ese disco como favorito a todos los clientes de españa


--4 borra todos los discos no escuchados por nadie.



--5 borra todos los clientes de Austria. Borra tb todos los datos de estos usuarios, (favoritos, estaescuchando...)


--6.-- Si pagamos 0,15e por minuto escuchado de un discos, guarda en esta tabla cuanto tengo que pagar a cada artista.
--(crea la tabla tb, claro)
create table facturacion 
(
    idartista int,
    nombre varchar(100),
    totalAPagar decimal(18,2),
    totalSinIva decimal(18,2)
)


--7. Queremos eliminar el Genero Rock (id 1). Pero antes de borrarlo,
-- queremos mover todos los discos clasificados como Rock a Pop (id 2)
-- actualiza la tabla generosdisco y luego borra el genero rock.


--8 borra todos los discos que nadie haya escuchado. Luego, borra a todos los artistas sin discos.
-- Si alguien ha marcado un discos como favorito y no lo ha escuchado,teneis permiso para borrar ese favorito.
-- Y de paso borrar tb a ese usuario TROL que marca como favoritos discos que no escucha