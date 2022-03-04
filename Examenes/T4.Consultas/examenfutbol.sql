use futbol

--1.- nombre jugadores betis

select j.nombre from Jugadores j
inner join Equipos e on e.idEquipo=j.idEquipoActual
where e.nombre like '%betis%'

--2.- jugadores cumplen años hoy.

select * from Jugadores where day(fechaNacimiento) = day(getdate()) 
and MONTH(fechaNacimiento) = MONTH(getdate()) 

--3.- derbis sevillanos

select p.fecha, elocal.nombre,p.GolesLocales,evisitante.nombre,GolesVisitantes from partidos p
inner join equipos evisitante on evisitante.idEquipo=p.idEquipoVisitante
inner join equipos elocal on elocal.idEquipo=p.idEquipoLocal
where ((evisitante.nombre = 'Fc Sevilla' and elocal.nombre like '%betis%')
OR (elocal.nombre = 'Fc Sevilla' and evisitante.nombre like '%betis%'))
--and GolesLocales=GolesVisitantes -- para saber cuantos han acabado en empate.

--4.- partidos con mas goles

select top 20 goleslocales+ GolesVisitantes as numgoles, * from partidos order by GolesVisitantes+GolesLocales desc

--5,. cambios de nacionalidad

select count(1) from jugadores where paisNacionalidad <>pais

--6.-

select top 10 j.nombre,sum(TarjetasAmarillas) from jugadores j 
inner join Equipos e on j.idEquipoActual = e.idEquipo
inner join PartidosJugadores pj on pj.idJugador=j.idjugador
inner join Partidos p on p.idPartido =pj.idPartido
inner join Competiciones c on c.idCompeticion = p.idCompeticion
where c.nombre ='laliga'
group by j.nombre,j.idjugador
order by sum(TarjetasAmarillas) desc

--7.-

select e.nombre, avg(year(fechaNacimiento)) from jugadores j 
inner join Equipos e on e.idEquipo=j.idEquipoActual
inner join partidos p  on p.idEquipoLocal =e.idEquipo
inner join Competiciones c on p.idCompeticion =c.idCompeticion
where c.nombre ='laliga' and p.Temporada = 2021 and c.Pais='Spain'
group by e.nombre ,e.idEquipo


--8.-

select top 1 j.nombre,j.fechaNacimiento,j.pais,e.nombre from jugadores j
inner join Equipos e on e.idEquipo = j.idEquipoActual
where fechaNacimiento is not null
order by fechaNacimiento 


--9

select c.nombre,c.Pais,p.Temporada,count(1) as numpartidos from  Competiciones c 
inner join partidos p on p.idCompeticion = c.idCompeticion
group by c.nombre,c.Pais,p.Temporada, c.idCompeticion



--10-


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


