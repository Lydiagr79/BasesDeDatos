--select * from jugadores

select max(fecha),min(fecha) from partidos

select * from jugadores j
inner join Equipos e on j.idEquipoActual=e.idEquipo
where e.nombre like '%FC Sevilla%'




select * from partidos order by GolesLocales+GolesVisitantes desc
--plantilla del Betis o Sevilla

select distinct day(fechaNacimiento) from jugadores where fechaNacimiento is not null order by day(fechaNacimiento)

select  month(fechaNacimiento),day(fechaNacimiento) from jugadores where fechaNacimiento is not null group by day(fechaNacimiento),month(fechaNacimiento)
order by month(fechaNacimiento),day(fechaNacimiento)


--plantilla del Betis o Sevilla

--Hay algun jugador que cumpla años hoy? quien? 

--dame el partido con mas goles

--Dame los resultados de todos los derbies Sevillanos (Partidos Betis-Sevilla)
-- Debes darme el nombre del equipo local, el equipo visitante y el marcador.
select nombre,sum(puntos) from (

  select idEquipoLocal,count(1)*3 as puntos from partidos p
  inner join Competiciones c on c.idCompeticion=p.idcompeticion 
  where idEquipoLocal=idganador AND C.nombre='laliga' and Temporada=2019
   
  group by idEquipoLocal
union all
select idEquipoLocal,count(1) as puntos from partidos p
  inner join Competiciones c on c.idCompeticion=p.idcompeticion 
  where idganador is null AND C.nombre='laliga' and Temporada=2019
  group by idEquipoLocal
union all

  select idEquipoVisitante,count(1)*3 as puntos from partidos p
  inner join Competiciones c on c.idCompeticion=p.idcompeticion 
  where idEquipoVisitante=idganador AND C.nombre='laliga' and Temporada=2019
  group by idEquipoVisitante
union all
select idEquipoVisitante,count(1) as puntos from partidos p
  inner join Competiciones c on c.idCompeticion=p.idcompeticion 
  where idganador is null AND C.nombre='laliga' and Temporada=2019
  group by idEquipoVisitante
) as tabla1
inner join equipos e on e.idequipo=tabla1.idEquipoLocal
group by tabla1.idEquipoLocal,e.nombre
order by sum(puntos) desc


