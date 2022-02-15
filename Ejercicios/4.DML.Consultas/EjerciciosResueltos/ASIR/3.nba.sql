use NBA


--1.Jugadores de los Boston Celtics

select * from jugadores j
inner join equipos e on j.idequipo = e.idequipo
where e.nombre like '%Boston%'

--2.Jugador que más puntos ha metido en la temporada 2020
select top 1 j.nombre,sum(puntos) from EstadisticasPartidos as ep
inner join partidos p on ep.idpartido=p.idpartido
inner join jugadores as j on ep.idjugador=j.idjugador
where temporada=2020
group by j.nombre,j.idjugador
order by sum(puntos) desc

--3.equipo con mas victorias en el 2019

select top  1 idganador,e.nombre,count(1) as victorias from Partidos
inner join equipos e on partidos.idganador = e.idequipo
where year(fecha)=2019 
group by idganador,e.nombre 
order by victorias desc

select getdate(),day(getdate()),MONTH(getdate()),year(getdate())

--4.Clasificación de las dos conferencias. ( se ordenan por numero de victorias, separando los equipos del Este y del Oeste), Sacarlo en dos consultas.


select  e.nombre,count(1) as victorias from Partidos
inner join equipos e on partidos.idganador = e.idequipo
where conferencia='E' 
group by e.idequipo,e.nombre 
order by victorias desc

select  idganador,e.nombre,count(1) as victorias from Partidos
inner join equipos e on partidos.idganador = e.idequipo
where conferencia<>'E' 
group by idganador,e.nombre 
order by victorias desc

--5.Jugadores españoles

select * from jugadores where pais='Spain'


--6.Paises de nacimiento de los jugadores, ranking de los 20 paises que más jugadores aportan.

select top 20 pais,count(1) as NumJugadores from jugadores
where pais is not null
group by pais
order by NumJugadores desc
--7.top 10 de los jugadores con más puntos por partido

SELECT TOP 10 J.NOMBRE,MAX(PUNTOS) 
FROM EstadisticasPartidos 
INNER JOIN JUGADORES J ON J.IDJUGADOR=EstadisticasPartidos.idjugador
GROUP BY J.IDJUGADOR, J.NOMBRE 
ORDER BY MAX(PUNTOS) DESC

--8.top 10 Jugadores con mas asistencias por partido

SELECT TOP 10 J.NOMBRE,MAX(asistencias) 
FROM EstadisticasPartidos 
INNER JOIN JUGADORES J ON J.IDJUGADOR=EstadisticasPartidos.idjugador
GROUP BY J.IDJUGADOR, J.NOMBRE 
ORDER BY MAX(ASISTENCIAS) DESC


--9.Top 10 de jugadores con mas triples por minuto jugado
SELECT  J.NOMBRE,(SUM(triples)+0.0)/SUM(minutos_jugados) AS TRIPLESPORMINUTO 
FROM EstadisticasPartidos 
INNER JOIN JUGADORES J ON J.IDJUGADOR=EstadisticasPartidos.idjugador
WHERE minutos_jugados>0
GROUP BY J.IDJUGADOR, J.NOMBRE 
ORDER BY TRIPLESPORMINUTO DESC


--10.Jugador mas bajito de la NBA

SELECT TOP 1 * FROM JUGADORES WHERE ALTURA IS NOT NULL ORDER BY ALTURA 

--11.Equipo con mas puntos por partido
select top 1 idequipo,nombre,sum(puntos) from 
(
    select idequipo_local as idequipo,e.nombre, sum(marcador_local) as puntos from partidos
    inner join Equipos e on e.idequipo = partidos.idequipo_local
    group by idequipo_local,e.nombre

    UNION ALL

    select idequipo_visitante,e.nombre, sum(marcador_visitante) from partidos
    inner join Equipos e on e.idequipo = partidos.idequipo_visitante
    group by idequipo_visitante,e.nombre
) as t1
group by idequipo,nombre
order by sum(puntos) desc
--12.Equipos en los que ha jugado Ricky Rubio estos últimos años.

Select e.nombre from JugadoresEquipos je
inner join jugadores j on je.idjugador=j.idjugador
inner join Equipos e on e.idequipo=je.idequipo
where j.nombre like '%Rubio%'
--13.Equipo con más derrotas.
select top 1 idequipo,nombre,sum(NumDerrotas) from 
(
    select idequipo_local as idequipo,e.nombre, count(1) as NumDerrotas from partidos
    inner join Equipos e on e.idequipo = partidos.idequipo_local
    where idequipo_local<> idganador
    group by idequipo_local,e.nombre
    union all
    select idequipo_visitante as idequipo,e.nombre, count(1) as NumDerrotas from partidos
    inner join Equipos e on e.idequipo = partidos.idequipo_visitante
    where idequipo_visitante<> idganador
    group by idequipo_visitante,e.nombre
) as t1
group by idequipo,nombre
order by sum(NumDerrotas)desc
--14.Clasificación por victorias si no se separaran los equipos 
--por conferencias este y oeste de esta temporada.



select  idganador,e.nombre,count(1) as victorias from Partidos
inner join equipos e on partidos.idganador = e.idequipo
where temporada=2022
group by idganador,e.nombre 
order by victorias desc

--15.¿Que jugadores se seleccionaron en el draft el mismo año que Ricky Rubio?

select * from jugadores where draft_anyo =
(
    select draft_anyo from jugadores where nombre ='Ricky Rubio'
)

--16.Equipo con la media de edad mas alta de la NBA esta temporada.

select top 1 avg(anyonacimiento),idequipo from jugadores group by idequipo
order by avg(anyonacimiento)

--17.¿Cuantos jugadores tienen un email de hotmail?

select count(1) from jugadores where email like '%hotmail%'

--18.top 20 Jugadores mas altos de la NBA. 
--¿Sabrias como decirme el jugador más alto de cada equipo?

select top 20 * from jugadores order by altura desc


select j.nombre,tablaAlturas.nombre,tablaAlturas.alturamaxima from jugadores j 
inner join 

    (select max(altura) as alturamaxima,e.nombre,e.idequipo from jugadores j
    inner join equipos e on e.idequipo= j.idequipo
    group by e.nombre,e.idequipo) as tablaAlturas

on j.idequipo=tablaAlturas.idequipo 
and j.altura = tablaAlturas.alturamaxima
order by tablaalturas.nombre