use nba
--Jugador mas alto de cada equipo
select j.nombre,tablaAlturas.nombre,tablaAlturas.alturamaxima from jugadores j 
inner join 

    (select max(altura) as alturamaxima,e.nombre,e.idequipo from jugadores j
    inner join equipos e on e.idequipo= j.idequipo
    group by e.nombre,e.idequipo) as tablaAlturas

on j.idequipo=tablaAlturas.idequipo 
and j.altura = tablaAlturas.alturamaxima
order by tablaalturas.nombre

--Jugadores de los Boston  sin Inner Join
select * from jugadores where idequipo = (
    select idequipo 
from equipos 
where nombre like '%Boston%')


--Suma de puntos por equipo
select sum(t1.sumapuntos),idequipo_local from
    (select sum(marcador_local) as sumapuntos,idequipo_local 
    from partidos 
    group by idequipo_local
    union all
    select sum(marcador_visitante) as sumapuntos,idequipo_visitante 
    from partidos 
    group by idequipo_visitante) as t1
Group by idequipo_local





