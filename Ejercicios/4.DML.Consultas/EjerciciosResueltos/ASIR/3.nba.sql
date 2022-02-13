USE NBA



--Jugadores de los Boston Celtics

SELECT * FROM JUGADORES J   
inner join equipos e on j.idequipo=e.idequipo
where e.nombre = 'Boston Celtics'

--Jugador que más puntos ha metido en la temporada 2020

select top 1 sum(puntos),j.nombre 
from EstadisticasPartidos e
inner join jugadores j on e.idjugador=j.idjugador
inner join partidos p on p.idpartido=e.idpartido
where temporada=2020
group by j.nombre,j.idjugador
order by sum(puntos) desc 



--equipo con mas victorias en el 2019

select TOP 1 e.nombre from partidos p
inner join equipos e on e.idEquipo=p.idganador
WHERE YEAR(P.FECHA)=2019
group by e.IDequipo,e.nombre
ORDER BY COUNT(1) DESC


--Clasificación de las dos conferencias. ( se ordenan por numero de victorias, separando los equipos del Este y del Oeste), Sacarlo en dos consultas.

select COUNT(1), e.nombre from partidos p
inner join equipos e on e.idEquipo=p.idganador
WHERE conferencia='E'
group by e.IDequipo,e.nombre
ORDER BY COUNT(1) DESC

select COUNT(1), e.nombre from partidos p
inner join equipos e on e.idEquipo=p.idganador
WHERE conferencia='O'
group by e.IDequipo,e.nombre
ORDER BY COUNT(1) DESC



--Jugadores españoles

SELECT * FROM JUGADORES WHERE PAIS='SPAIN'

Paises de nacimiento de los jugadores, ranking de los 20 paises que más jugadores aportan.
top 10 de los jugadores con más puntos por partido
top 10 Jugadores con mas asistencias por partido
Top 10 de jugadores con mas triples por minuto jugado
Jugador mas bajito de la NBA
Equipo con mas puntos por partido
Equipos en los que ha jugado Ricky Rubio estos últimos años.
Equipo con más derrotas.
Clasificación por victorias si no se separaran los equipos por conferencias este y oeste de esta temporada.
¿Que jugadores se seleccionaron en el draft el mismo año que Ricky Rubio?
Equipo con la media de edad mas alta de la NBA esta temporada.
¿Cuantos jugadores tienen un email de hotmail?
top 20 Jugadores mas altos de la NBA. ¿Sabrias como decirme el jugador más alto de cada equipo?