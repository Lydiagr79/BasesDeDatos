use nba


--1.Jugadores de los Boston Celtics

select j.nombre from jugadores j
inner join Equipos e on j.idequipo=e.idequipo
where e.nombre like '%Boston%'
 
--2.Jugador que más puntos ha metido en la temporada 2020

select top 1 j.nombre,sum(puntos) as PuntosJugador from EstadisticasPartidos ep
inner  join partidos p on p.idpartido = ep.idpartido
inner join jugadores j on j.idjugador = ep.idjugador
where temporada=2020
group by j.nombre,j.idjugador
order by PuntosJugador desc
--3.equipo con mas victorias en el 2019

select top 1 idganador,e.nombre,count(1) as NumVictorias from partidos p
inner join Equipos e on p.idganador=e.idequipo
where year(fecha) = 2019
group by idganador,e.nombre
order by NumVictorias desc

--4.Clasificación de las dos conferencias. ( se ordenan por numero de victorias, separando los equipos del Este y del Oeste), Sacarlo en dos consultas.


select  idganador,e.nombre,count(1) as NumVictorias from partidos p
inner join Equipos e on p.idganador=e.idequipo
where e.conferencia='E'
group by idganador,e.nombre
order by NumVictorias desc


select  idganador,e.nombre,count(1) as NumVictorias from partidos p
inner join Equipos e on p.idganador=e.idequipo
where e.conferencia<>'E'
group by idganador,e.nombre
order by NumVictorias desc
--5.Jugadores españoles

select * from jugadores where pais ='Spain'

--6.Paises de nacimiento de los jugadores, ranking de los 20 paises que más jugadores aportan.

select top 20 pais,count(1) as NumJugadores from jugadores
where pais is not null
group by pais
order by NumJugadores desc

--7.top 10 de los jugadores con más puntos por partido

select top 10 j.nombre,avg(puntos),max(puntos) as puntos from EstadisticasPartidos e
inner join jugadores j on e.idjugador=j.idjugador
group by j.nombre
order by puntos desc

--8.top 10 Jugadores con mas asistencias por partido

select top 10 j.nombre,avg(asistencias),max(asistencias) as asistencias from EstadisticasPartidos e
inner join jugadores j on e.idjugador=j.idjugador
group by j.nombre
order by asistencias desc


--9.Top 10 de jugadores con mas triples por minuto jugado


select j.nombre,sum(triples) as triples,sum(minutos_jugados) as minutos,
(sum(triples)+0.0)/sum(minutos_jugados) as tripleporminuto,
(cast((sum(triples)) as decimal(8,2)))/sum(minutos_jugados) 
from EstadisticasPartidos e
inner join jugadores j on e.idjugador=j.idjugador
where minutos_jugados >0
group by j.idjugador,j.nombre
order by tripleporminuto desc
--10.Jugador mas bajito de la NBA

select top 1 * from jugadores 
where altura is not null
order by altura 


--11.Equipo con mas puntos por partido
select idequipo,avg(puntos) from (
    select idequipo_local as idequipo,avg(marcador_local) as puntos from partidos 
    group by idequipo_local
    union all
    select idequipo_visitante,avg(marcador_visitante) from partidos 
    group by idequipo_visitante
) as t1
group by idequipo
order by avg(puntos)desc
--12.Equipos en los que ha jugado Ricky Rubio estos últimos años.
select e.nombre,j.nombre from JugadoresEquipos je
inner join equipos e on je.idequipo=e.idequipo
inner join jugadores j on j.idjugador=je.idjugador
where j.nombre like '%Rubio%'
--13.Equipo con más derrotas.

select  idganador,e.nombre,count(1) as NumVictorias from partidos p
inner join Equipos e on p.idganador=e.idequipo
group by idganador,e.nombre
order by NumVictorias 

select idequipo,nombre,sum(numderrotas) as numderrotas from (
    select  idequipo_local as idequipo,e.nombre,count(1) as NumDerrotas from partidos p
    inner join Equipos e on p.idequipo_local=e.idequipo
    where idequipo_local<>idganador
    group by idequipo_local,e.nombre
    UNION ALL
    select  idequipo_visitante,e.nombre,count(1) as NumDerrotas from partidos p
    inner join Equipos e on p.idequipo_visitante=e.idequipo
    where idequipo_visitante<>idganador
    group by idequipo_visitante,e.nombre
) as t1
group by idequipo,nombre
order by NumDerrotas desc

--14.Clasificación por victorias si no se separaran los equipos por conferencias este y oeste de esta temporada.



select  idganador,e.nombre,count(1) as NumVictorias from partidos p
inner join Equipos e on p.idganador=e.idequipo
group by idganador,e.nombre
order by NumVictorias desc

--15.¿Que jugadores se seleccionaron en el draft el mismo año que Ricky Rubio?

select * from jugadores
where draft_anyo =(select draft_anyo from jugadores where nombre like'%Rubio%') 

--16.Equipo con la media de edad mas alta de la NBA esta temporada.

select avg(year(getdate())-anyonacimiento),idequipo from jugadores 
group by idequipo
order by avg(anyonacimiento)

--17.¿Cuantos jugadores tienen un email de hotmail?

select * from jugadores where email like '%hotmail%'

--18.top 20 Jugadores mas altos de la NBA. ¿Sabrias como decirme el jugador más alto de cada equipo?

select * from jugadores order by altura desc


select j.nombre,tablaAlturas.nombre,tablaAlturas.alturamaxima from jugadores j 
inner join 

    (select max(altura) as alturamaxima,e.nombre,e.idequipo from jugadores j
    inner join equipos e on e.idequipo= j.idequipo
    group by e.nombre,e.idequipo) as tablaAlturas

on j.idequipo=tablaAlturas.idequipo 
and j.altura = tablaAlturas.alturamaxima
order by tablaalturas.nombre
