select * from Jugadores

select max(idjugador)+1 from jugadores

insert into jugadores (idjugador,nombre)
select (
select max(idjugador)+1 from jugadores
),'Bernat'
insert into jugadores (idjugador,nombre)
select (
select max(idjugador)+1 from jugadores
),'Goyo'

insert into jugadores (idjugador,nombre)
select (
select max(idjugador)+1 from jugadores
),'Jesus'


insert into jugadores (idjugador,nombre)
select (
select max(idjugador)+1 from jugadores
),'Paco'

insert into jugadores (idjugador,nombre)
select (
select max(idjugador)+1 from jugadores
),'Dani'


insert into jugadores (idjugador,nombre)
select (
select max(idjugador)+1 from jugadores
),'Agueda'


insert into jugadores (idjugador,nombre)
select (
select max(idjugador)+1 from jugadores
),'Ignacio'

insert into jugadores (idjugador,nombre)
select (
select max(idjugador)+1 from jugadores
),'Alfonso'

insert into jugadores (idjugador,nombre)
select (
select max(idjugador)+1 from jugadores
),'JesusKabarity'

insert into jugadores (idjugador,nombre)
select (
select max(idjugador)+1 from jugadores
),'Maripaz'

insert into jugadores (idjugador,nombre)
select (
select max(idjugador)+1 from jugadores
),'Fran'



select top 11 * from jugadores order by idjugador desc


insert into Equipos (idEquipo,nombreCorto)
select (select max(idequipo)+1 from equipos),'ClaustroCesur'

update jugadores set idEquipoActual=(select idequipo from Equipos where nombrecorto='ClaustroCesur')

where idjugador >=971626


--añadirlo a laliga
begin tran
update  Equipos set idCompeticion=(select idCompeticion from Competiciones where nombre='laliga' and pais='spain')
 where nombrecorto='ClaustroCesur'
rollback tran
select * from equipos where nombrecorto='ClaustroCesur'


insert into partidos
select (select max(idpartido)+1 from partidos),idcompeticion,year(getdate()),'',getdate(),
idequipo ,
(select idEquipo from Equipos where nombreCorto like '%betis%'),2,0,1,'sdfsdgws',null
from  Equipos where nombreCorto='ClaustroCesur'

update partidos set idGanador = idEquipoLocal where GolesLocales>GolesVisitantes
update partidos set idGanador = idEquipoVisitante where GolesLocales<GolesVisitantes
update partidos set idGanador = null where GolesLocales=GolesVisitantes
select * from PartidosJugadores
select * from partidos order by idpartido desc

insert into PartidosJugadores
select idjugador,3741060,idEquipo,0,0,90,0,0 from jugadores j
inner join equipos e on j.idEquipoActual= e.idEquipo
where e.nombreCorto='ClaustroCesur'


SELECT * 
from PartidosJugadores pj
inner join jugadores j on pj.idJugador=j.idjugador
where (j.nombre='Bernat' or j.nombre='Goyo') AND idPartido=3741060

begin tran
update PartidosJugadores set goles=1
from PartidosJugadores pj
inner join jugadores j on pj.idJugador=j.idjugador
where (j.nombre='Bernat' or j.nombre='Goyo') AND idPartido=3741060
rollback trAN









select GolesVisitantes,sum(pj.goles),p.idCompeticion,fecha from Partidos p
inner join PartidosJugadores pj on p.idPartido=pj.idPartido and p.idEquipoVisitante = pj.idequipo
group by p.idPartido,GolesVisitantes,p.idCompeticion,p.fecha
having GolesVisitantes!= sum(pj.goles)
order by fecha desc


select GolesLocales,sum(pj.goles),p.idCompeticion from Partidos p
inner join PartidosJugadores pj on p.idPartido=pj.idPartido and p.idEquipoLocal = pj.idequipo
group by p.idPartido,GolesLocales,p.idCompeticion
having GolesLocales!= sum(pj.goles)


begin tran
update partidos set GolesVisitantes = golescalculados
from Partidos p
inner join (
select GolesVisitantes,sum(pj.goles) as golescalculados,p.idCompeticion,fecha,p.idpartido from Partidos p
inner join PartidosJugadores pj on p.idPartido=pj.idPartido and p.idEquipoVisitante = pj.idequipo
group by p.idPartido,GolesVisitantes,p.idCompeticion,p.fecha
having GolesVisitantes!= sum(pj.goles)) as t1 on p.idPartido = t1.idPartido

update partidos set GolesLocales = golescalculados
from Partidos p
inner join (
select GolesLocales,sum(pj.goles) as golescalculados,p.idCompeticion,fecha,p.idpartido from Partidos p
inner join PartidosJugadores pj on p.idPartido=pj.idPartido and p.idEquipoLocal = pj.idequipo
group by p.idPartido,GolesLocales,p.idCompeticion,p.fecha
having GolesLocales!= sum(pj.goles)) as t1 on p.idPartido = t1.idPartido
rollback tran



SELECT * FROM JUGADORES J
LEFT JOIN PartidosJugadores PJ ON J.idjugador=PJ.idJugador
WHERE PJ.idPartido IS  NULL
begin TRAN
DELETE JUGADORES WHERE IDJUGADOR IN(
SELECT J.IDJUGADOR FROM JUGADORES J
LEFT JOIN PartidosJugadores PJ ON J.idjugador=PJ.idJugador
WHERE PJ.idPartido IS  NULL
)
rollback TRAN







create table clasificacion(equipo varchar(100),puntos int)

insert into clasificacion

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


