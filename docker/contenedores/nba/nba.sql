PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''
PRINT 'Cargando datos de  la NBA,Puede tardar unos minutos....'
PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''

SET NOCOUNT ON

create database nba
GO
use nba
GO
/*
=================================================================================================================================================================
CARGAR DATOS RANDOM para campos desconocidos de jugadores generados con Generate Data https://generatedata.com/generator
====================================================================================================================================================================
*/

drop table if exists rawjugadores

create table rawjugadores(
phone varchar(100),
email varchar(100)
)


--copia el fichero nba.csv en la carpeta backup de tu contenedor.
GO

BULK INSERT rawjugadores FROM '/randomperson.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO





/*
=================================================================================================================================================================
CARGAR DATOS JUGADORES descargados de data world  https://data.world/gmoney/2016-nba-players-by-college
====================================================================================================================================================================
*/
drop table if exists rawdataplayer

create table rawdataplayer(
id int ,
player_name varchar(100),
team_abbreviation varchar(100),
age varchar(100),
player_height decimal(6,2),
player_weight decimal(6,2),
college varchar(100),
country varchar(100),
draft_year varchar(100),
draft_round varchar(100),
draft_number varchar(100),
gp varchar(100),
pts varchar(100),
reb varchar(100),
ast varchar(100),
net_rating varchar(100),
oreb_pct varchar(100),
dreb_pct varchar(100),
usg_pct varchar(100),
ts_pct varchar(100),
ast_pct varchar(100),
season varchar(100)
)


--copia el fichero nba.csv en la carpeta backup de tu contenedor.
GO

BULK INSERT rawdataplayer FROM '/players.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO



drop table if EXISTS rawdata
create table rawdata(
game_id VARCHAR(100),
game_date Date,
OT VARCHAR(100),
H_A VARCHAR(100),
Team_Abbrev VARCHAR(100),
Team_Score int,
Team_pace decimal(6,2),
Team_efg_pct varchar(100),
Team_tov_pct decimal(6,2),
Team_orb_pct decimal(6,2),
Team_ft_rate varchar(100),
Team_off_rtg decimal(6,2),
Inactives VARCHAR(500),
Opponent_Abbrev VARCHAR(4),
Opponent_Score int,
Opponent_pace decimal(6,2),
Opponent_efg_pct varchar(100),
Opponent_tov_pct decimal(6,2),
Opponent_orb_pct decimal(6,2),
Opponent_ft_rate varchar(100),
Opponent_off_rtg decimal(6,2),
player VARCHAR(200),
player_id VARCHAR(100),
starter bit,
mp varchar(100),
fg int,
fga int,
fg_pct VARCHAR(100),
fg3 int,
fg3a int,
fg3_pct VARCHAR(100),
ft int,
fta int,
ft_pct VARCHAR(100),
orb int,
drb int,
trb int,
ast int,
stl int,
blk int,
tov int,
pf int,
pts int,
plus_minus int,
did_not_play int,
is_inactive bit,
ts_pct VARCHAR(100),
efg_pct VARCHAR(100),
fg3a_per_fga_pct VARCHAR(100),
fta_per_fga_pct VARCHAR(100),
orb_pct VARCHAR(100),
drb_pct VARCHAR(100),
trb_pct VARCHAR(100),
ast_pct VARCHAR(100),
stl_pct VARCHAR(100),
blk_pct VARCHAR(100),
tov_pct VARCHAR(100),
usg_pct VARCHAR(100),
off_rtg int,
def_rtg int,
bpm decimal(6,2),
season int,
minutes decimal(18,6),
double_double bit,
triple_double bit,
DKP decimal(6,2),
FDP decimal(6,2),
SDP decimal(6,2),
DKP_per_minute VARCHAR(100),
FDP_per_minute VARCHAR(100),
SDP_per_minute VARCHAR(100),
pf_per_minute VARCHAR(100),
ts VARCHAR(100),
last_60_minutes_per_game_starting VARCHAR(100),
last_60_minutes_per_game_bench VARCHAR(100),
PGpercent VARCHAR(100),
SGpercent VARCHAR(100),
SFpercent VARCHAR(100),
PFpercent VARCHAR(100),
Cpercent VARCHAR(100),
active_position_minutes varchar(5000)
)


--copia el fichero nba.csv en la carpeta backup de tu contenedor.
GO

BULK INSERT rawdata FROM '/nba.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO
drop table if exists JugadoresEquipos
drop table if exists EstadisticasPartidos
drop table if exists Partidos
drop table if exists jugadores
drop table if exists Equipos

create table Equipos
(
   idequipo varchar(3) PRIMARY key,
   nombre varchar(100) not null,
   ciudad varchar(100) not null,
   conferencia char(1) not null,

)

CREATE TABLE jugadores (
   idjugador varchar(10) not null,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(100) NOT NULL,
    email VARCHAR(255)  NOT NULL,
    pais VARCHAR(100)  NULL,
    anyonacimiento int,
    altura decimal(6,2),
    peso decimal(6,2),
    equipoPreNba varchar(100),
    draft_anyo int,
    draft_ronda int,
    draft_posicion int,
    idequipo varchar(3),
    constraint pkjugadores PRIMARY key(idjugador),
    constraint fkequiporedundante FOREIGN key(idequipo) REFERENCES Equipos(idEquipo)
);

alter table jugadores drop CONSTRAINT pkjugadores
INSERT INTO JUGADORES
SELECT T1.player_id,T1.player,PHONE,EMAIL,MAX(p.country),max(cast (left(p.season,4) as int)-cast (left(p.age,2) as int)) as edad,
max(p.player_height),avg(player_weight),max(college),
case when draft_year='Undrafted' then null else cast(draft_year as int) end,
case when draft_round='Undrafted' then null else cast(draft_round as int) end,
case when draft_number='Undrafted' then null else cast(draft_number as int) end,
null


 FROM  ( 
SELECT  ROW_NUMBER() OVER(ORDER BY PLAYER_ID ASC) AS Row#,PLAYER_ID,MAX(PLAYER) AS PLAYER FROM (
SELECT   PLAYER_ID, PLAYER FROM rawdata 
) AS T2 GROUP BY PLAYER_ID

) AS T1
left JOIN (SELECT  ROW_NUMBER() OVER(ORDER BY phone ASC) AS ID ,phone,email from RAWJUGADORES) as R ON R.ID = T1.Row#
left join rawdataplayer p on t1.PLAYER=p.player_name
where p.season not like '%.%' 

GROUP BY T1.player_id,T1.player,PHONE,EMAIL,draft_year,draft_round,draft_number


ORDER BY T1.player_id

delete JUGADORES  where draft_ronda is null and draft_anyo is not null
delete jugadores where draft_posicion=0 or draft_ronda=0
delete jugadores where idjugador in (

select idjugador from jugadores group by idjugador having count(1)>1
) and equipoPreNba='none'
go
alter table jugadores add CONSTRAINT pkjugador PRIMARY key(idjugador)
go


--select * from jugadores
insert into jugadores
SELECT distinct t1.player_id,PLAYER,r.phone,r.email,null,null,null,null,null,null,null,null,null FROM 
(
   SELECT  ROW_NUMBER() OVER(ORDER BY PLAYER_ID ASC) AS Row#,PLAYER_ID,MAX(PLAYER) AS PLAYER 
   FROM (
         SELECT   PLAYER_ID, PLAYER FROM rawdata 
         ) AS T2 GROUP BY PLAYER_ID
) as t1


left join jugadores j on j.idjugador = t1.player_id
inner join (SELECT  ROW_NUMBER() OVER(ORDER BY phone ASC) AS ID ,phone,email from RAWJUGADORES) r on r.id=t1.Row#
where j.idjugador is null




create table Partidos
(
   idpartido varchar(12) PRIMARY key,
   idequipo_local varchar(3),
   CONSTRAINT fklocal FOREIGN key (idequipo_local) REFERENCES Equipos(idequipo),
   idequipo_visitante varchar(3),
   CONSTRAINT fkvisitante FOREIGN key (idequipo_visitante) REFERENCES Equipos(idequipo),
   fecha date not null,
   marcador_local int,
   marcador_visitante int,
   temporada int,
   prorroga int,
   idganador varchar(3),
   CONSTRAINT fkganador FOREIGN key (idganador) REFERENCES equipos(idequipo)

)

create table EstadisticasPartidos
(
   idpartido varchar(12),
   CONSTRAINT fkpartido FOREIGN key (idpartido) REFERENCES Partidos(idpartido),
   idjugador varchar(10),
   CONSTRAINT fkjugador FOREIGN key (idjugador) REFERENCES jugadores(idjugador),
   tiempo_jugado varchar(100),
   puntos int,
   tirosde2 int,
   intentosde2 int,
   triples int,
   intentosTriples int,
   tiroslibres int,
   intentostirosLibros int,
   rebotes int,
   asistencias int,
   robos int,
   tapones int,
   faltaspersonales int,
   dobledoble bit,
   tripledoble bit,
   valoracion int,
   titular bit,
   minutos_jugados int,
   Primary Key(idpartido,idjugador)
)


create table JugadoresEquipos
(
   idjugador varchar(10),
    CONSTRAINT fkjugadorequipo FOREIGN key (idjugador) REFERENCES jugadores(idjugador),
 
   idequipo varchar(3),
 
    CONSTRAINT fkequipojugador FOREIGN key (idequipo) REFERENCES Equipos(idequipo),
 
   fechaDebut date not null,
   PRIMARY key(idjugador,idequipo,fechaDebut)
)



--INSERTAR EQUIPOS A MANO
--SELECT DISTINCT 'INSERT INTO EQUIPOS SELECT '''+TEAM_ABBREV+''','''','''',''''' FROM rawdata

INSERT INTO EQUIPOS SELECT 'ATL','Atlanta Hawks','Atlanta','E'
INSERT INTO EQUIPOS SELECT 'BOS','Boston Celtics','Boston','E'
INSERT INTO EQUIPOS SELECT 'BRK','Brooklin Nets','New York','E'
INSERT INTO EQUIPOS SELECT 'CHI','Chicago Bulls','Chicago','E'
INSERT INTO EQUIPOS SELECT 'CHO','Charlotte Hornets','Charlotte','E'
INSERT INTO EQUIPOS SELECT 'CLE','Cleveland Cavaliers','Clevaland','E'
INSERT INTO EQUIPOS SELECT 'DAL','Dalas Mavericks','Dalas','O'
INSERT INTO EQUIPOS SELECT 'DEN','Denver Nuggets','Denver','O'
INSERT INTO EQUIPOS SELECT 'DET','Detroit Pistons','Detroit','E'
INSERT INTO EQUIPOS SELECT 'GSW','Golden State Warriors','San Francisco','O'
INSERT INTO EQUIPOS SELECT 'HOU','Houston Rockets','Houston','O'
INSERT INTO EQUIPOS SELECT 'IND','Indiana Pacers','Indiana','E'
INSERT INTO EQUIPOS SELECT 'LAC','Los Angeles Clippers','Los Angeles','O'
INSERT INTO EQUIPOS SELECT 'LAL','Los Angeles Lakers','Los Angeles','O'
INSERT INTO EQUIPOS SELECT 'MEM','Memphis Grizzlies','Memphis','O'
INSERT INTO EQUIPOS SELECT 'MIA','Miami Heats','Miami','E'
INSERT INTO EQUIPOS SELECT 'MIL','Milwaukee Bucks','Milwaukee','E'
INSERT INTO EQUIPOS SELECT 'MIN','Minesota Timberwolves','Minesota','O'
INSERT INTO EQUIPOS SELECT 'NOP','New Orleans Pelicans','New Orleans','O'
INSERT INTO EQUIPOS SELECT 'NYK','New York Nicks','New York','E'
INSERT INTO EQUIPOS SELECT 'OKC','Oklahoma City Thunder','Oklahoma','O'
INSERT INTO EQUIPOS SELECT 'ORL','Orlando Magic','Orlando','E'
INSERT INTO EQUIPOS SELECT 'PHI','Philadelphia 76ers','Philadelphia','E'
INSERT INTO EQUIPOS SELECT 'PHO','Phoenix Suns','Phoenix','O'
INSERT INTO EQUIPOS SELECT 'POR','Portland Trail Blazers','Portland','O'
INSERT INTO EQUIPOS SELECT 'SAC','Sacramento Kings','Sacramento','O'
INSERT INTO EQUIPOS SELECT 'SAS','San Antonio Spurs','San Antonio','O'
INSERT INTO EQUIPOS SELECT 'TOR','Toronto Raptors','Toronto','E'
INSERT INTO EQUIPOS SELECT 'UTA','Utah Jazz','Utah','O'
INSERT INTO EQUIPOS SELECT 'WAS','Washington Wizards','Washington','E'


--INSERTAR PARTIDOS

insert into partidos
select distinct GAME_ID,Opponent_Abbrev,Team_Abbrev,game_date,Opponent_Score,Team_Score,season,ot,null from rawdata
where right(game_id,3) =Opponent_Abbrev 
order by game_date desc

--SETEAR ESTADISTICAS PARTIDOS

insert into EstadisticasPartidos
select distinct game_id,player_id,mp,pts,fg-fg3,fga-fg3a,fg3,fg3a,ft,fta,trb,ast,stl,blk ,pf,double_double,triple_double,plus_minus,STARTER,null from rawdata-- WHERE game_id='202201270GSW' AND Opponent_Abbrev='MIN' and player_id = 'curryst01'

--faltan las estadisticas en el fichero rawdata de este jugador en este partido.
insert into EstadisticasPartidos
select '202112170ORL','fordal03','6:46',2,1,3,0,0,0,0,0,0,1,0,0,0,0,0,0,null

--INSERTAR NN JUGADORESEQUIPO
INSERT INTO JugadoresEquipos 
select player_id,Team_Abbrev,MIN(game_date) from rawdata --where player_id='rubiori01'
GROUP BY player_id,Team_Abbrev


---SETEAR EQUIPO ACTUAL JUGADORES
update jugadores set idequipo=tabla1.idequipo 
from jugadores j
inner join (
SELECT je.* FROM JUGADORES j
inner join  JugadoresEquipos je on je.idjugador=j.idjugador    
WHERE 1=1 
and fechadebut= (select max(fechadebut) from JugadoresEquipos t1 where t1.idjugador=j.idjugador  )
) as tabla1
on tabla1.idjugador=j.idjugador



update partidos set idganador=idequipo_local where marcador_local>marcador_visitante
update partidos set idganador=idequipo_visitante where marcador_visitante>marcador_local

update EstadisticasPartidos set minutos_jugados =(select top 1 * from string_split(tiempo_jugado,':'))

drop table if EXISTS rawdata

drop table if EXISTS rawdataplayer

drop table if EXISTS rawjugadores

SET NOCOUNT OFF

PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''
PRINT 'Base de Datos de la NBA, cargada correctamente. Gracias por la paciencia'
PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''