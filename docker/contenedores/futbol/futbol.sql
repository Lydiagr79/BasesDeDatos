PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''
PRINT 'Cargando datos de  la Futbol,Puede tardar unos minutos....'
PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''

--SET NOCOUNT ON
use master
go
drop database if exists futbol
GO

create database futbol
GO
use futbol
GO


--competition_id,name,type,country_id,country_name,domestic_league_code,confederation,url
--L1,bundesliga,first_tier,40,Germany,L1,europa,https://www.transfermarkt.co.uk/bundesliga/startseite/wettbewerb/L1

create table Competiciones(
   idCompeticion varchar(5) primary key,
   nombre varchar(200),
   tipo varchar(100),
   idPais int,
   Pais varchar(100),
   idCompeticionDomestica varchar(5),
   conferencia varchar(100),
   urlCompeticion varchar(255)
)



--copia el fichero competitions.csv en la carpeta backup de tu contenedor.
GO

BULK INSERT competiciones FROM '/var/opt/mssql/backup/futbol/competitions.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO
--select * from competiciones

--club_id,name,pretty_name,domestic_competition_id,total_market_value,squad_size,average_age,foreigners_number,foreigners_percentage,national_team_players,stadium_name,stadium_seats,net_transfer_record,coach_name,url
--3302,ud-almeria,Ud Almeria,ES1,51.66,25,25.7,10,40.0,2,Estadio de los Juegos Mediterráneos,15274,£-4.82m,Francisco Rodríguez,https://www.transfermarkt.co.uk/ud-almeria/startseite/verein/3302

create table Equipos(
idEquipo int Primary Key,
nombreCorto varchar(100),
nombre varchar(200),
idCompeticion varchar(5),
ValorMarcado decimal(10,2),
squad_size int,
average_age decimal(4,2),
foreigners_number int,
foreigners_percentage decimal(10,2),
national_team_players int,
NombreEstadio varchar(200),
CapacidadEstadio int,
net_transfer_record varchar(200),
Entrenador varchar(200),
urlEquipo varchar(255)
CONSTRAINT fkcompeticion FOREIGN KEY (idCompeticion) REFERENCES competiciones(idCompeticion)
)

GO

BULK INSERT equipos FROM '/var/opt/mssql/backup/futbol/clubs.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO

--player_id,last_season,current_club_id,name,pretty_name,country_of_birth,country_of_citizenship,date_of_birth,position,sub_position,foot,height_in_cm,market_value_in_gbp,highest_market_value_in_gbp,url
--214258,2014,3729,andrey-naletov,Andrey Naletov,Russia,Russia,1996-03-31,Defender,Centre-Back,Right,179,,23000.0,https://www.transfermarkt.co.uk/andrey-naletov/profil/spieler/214258

create table Jugadores(
idjugador int primary key,
ultimatemporada int,
idEquipoActual int,
nombrecorto varchar(200),
nombre varchar(200),
pais varchar(200),
paisNacionalidad varchar(200),
fechaNacimiento datetime,
Posicion varchar(100),
SubPosicion varchar(100),
PieDominante varchar(20),
altura int,
ValorDeMercado varchar(100),
ValorMaximo varchar(100),
url_jugador varchar(255),
constraint fkequipoactual FOREIGN KEY (idEquipoActual) REFERENCES Equipos(idEquipo) 

)
GO

BULK INSERT jugadores FROM '/var/opt/mssql/backup/futbol/players.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO

--game_id,competition_code,season,round,date,home_club_id,away_club_id,home_club_goals,away_club_goals,home_club_position,away_club_position,stadium,attendance,referee,url
--2457642,NLSC,2014,Final,2014-08-03,1269,610,1,0,,,Johan Cruijff ArenA,42000,Danny Makkelie,https://www.transfermarkt.co.uk/spielbericht/index/spielbericht/2457642

create table Partidos(
idPartido int Primary Key,
idCompeticion varchar(5),
Temporada int,
Ronda varchar(30),
fecha datetime,
idEquipoLocal int,
idEquipoVisitante int,
GolesLocales int,
GolesVisitantes int,
PosicionLocal int,
PosicionVisitante int,
stadium varchar(200),
Arbitro varchar(200),
referee varchar(255),
urlPartido varchar(255),

constraint fklocalequipo FOREIGN key (idEquipoLocal) REFERENCES equipos(idEquipo),
constraint fkvisitanteequipo FOREIGN key (idEquipoVisitante) REFERENCES equipos(idEquipo),
constraint fkCompeticionPartido FOREIGN key (idCompeticion) REFERENCES competiciones(idCompeticion)
)


GO

BULK INSERT Partidos FROM '/var/opt/mssql/backup/futbol/games.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO

alter table Partidos add idGanador int

--player_id,game_id,appearance_id,competition_id,player_club_id,goals,assists,minutes_played,yellow_cards,red_cards
--52453,2483937,2483937_52453,RU1,28095,0,0,90,0,0
create table PartidosJugadores(
idJugador int,
idPartido int,
id varchar(100),
idCompeticion Varchar(5),
idEquipo int,
goles int,
asistencias int,
minutosJugadis int,
TarjetasAmarillas int,
TarjetasRojas int,
Primary Key(idPartido,idJugador),
constraint fkjugadorpartido FOREIGN key (idJugador) REFERENCES jugadores(idJugador),
constraint fkpartidojugador FOREIGN key (idPartido) REFERENCES Partidos(idPartido),


)

GO

BULK INSERT PartidosJugadores FROM '/var/opt/mssql/backup/futbol/appearances.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO




SET NOCOUNT OFF

PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''
PRINT 'Base de Datos de la Futbol, cargada correctamente. Gracias por la paciencia'
PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''

alter table competiciones drop COLUMN idcompeticiondomestica
alter table equipos drop column squad_size
alter table equipos drop column average_age
alter table equipos drop column foreigners_number
alter table equipos drop column foreigners_percentage
alter table equipos drop column national_team_players
alter table equipos drop column net_transfer_record
alter table jugadores drop column ultimatemporada
alter table partidos drop column PosicionLocal
alter table partidos drop column PosicionVisitante
alter table partidos drop column stadium
alter table partidos drop column referee
alter table partidosjugadores drop column id
alter table partidosjugadores drop column idCompeticion
alter table partidosjugadores drop column idEquipo
update partidos set idGanador = idEquipoLocal where GolesLocales>GolesVisitantes 
update partidos set idGanador = idEquipoVisitante where GolesLocales<GolesVisitantes 


--alter table Partidos add constraint fkganador FOREIGN key (idGanador) REFERENCES equipos(idEquipo)


