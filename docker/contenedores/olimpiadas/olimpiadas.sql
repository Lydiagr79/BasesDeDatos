PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''
PRINT 'Cargando datos de  las olimpiadas,Puede tardar unos minutos....'
PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''

--SET NOCOUNT ON
use master
go
drop database if exists olimpiadas
GO

create database olimpiadas
GO
use olimpiadas
GO

--game_slug,game_end_date,game_start_date,game_location,game_name,game_season,game_year
--tokyo-2020,2021-08-08T14:00:00Z,2021-07-23T11:00:00Z,Japan,Tokyo 2020,Summer,2020

create table rawhost(
game_slug varchar(30),
game_end_date datetime,
game_start_date datetime,
game_location varchar(100),
game_name varchar(100),
game_season varchar(20),
game_year int
)
GO

BULK INSERT rawhost FROM '/var/opt/mssql/backup/olimpiadas/hosts.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO


--athlete_url,athlete_full_name,first_game,athlete_year_birth


--https://olympics.com/en/athletes/dongqi-chen,Dongqi CHEN,Tokyo 2020,1988

create table rawatletas(
athlete_url varchar(255),
athlete_full_name varchar(100),
first_game varchar(100),
athlete_year_birth int
)
GO

BULK INSERT rawatletas FROM '/var/opt/mssql/backup/olimpiadas/athletes.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO



--discipline_title,slug_game,event_title,event_gender,medal_type,participant_type,participant_title,athlete_url,athlete_full_name,country_name,country_code,country_3_letter_code
--Shooting,tokyo-2020,Trap Mixed Team,Mixed,GOLD,GameTeam,Spain,https://olympics.com/en/athletes/fatima-galvez,Fatima GALVEZ,Spain,ES,ESP

create table rawmedals (
discipline_title varchar(100),
slug_game varchar(100),
event_title varchar(100),
event_gender varchar(100),
medal_type varchar(100),
participant_type varchar(100),
participant_title varchar(100),
athlete_url varchar(255),
athlete_full_name varchar(100),
country_name varchar(100),
country_code varchar(100),
country_3_letter_code varchar(100)
)

GO

BULK INSERT rawmedals FROM '/var/opt/mssql/backup/olimpiadas/medals.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO


--discipline_title,event_title,slug_game,participant_type,medal_type,athletes,rank_equal,rank_position,country_name,country_code,country_3_letter_code,athlete_url,athlete_full_name,value_unit,value_type
--Shooting,Trap Mixed Team,tokyo-2020,GameTeam,GOLD,Fatima GALVEZ# https://olympics.com/en/athletes/fatima-galvez|Alberto FERNANDEZ# https://olympics.com/en/athletes/alberto-fernandez-1,False,1,Spain,ES,ESP,,,,

create table rawresults(

discipline_title varchar(200),
event_title varchar(200),
slug_game varchar(200),
participant_type varchar(200),
medal_type varchar(200),
athletes varchar(8000),
rank_equal varchar(20),
rank_position varchar(20),
country_name varchar(200),
country_code varchar(200),
country_3_letter_code varchar(200),
athlete_url varchar(200),
athlete_full_name varchar(200),
value_unit varchar(200),
value_type varchar(200)
)

GO

BULK INSERT rawresults FROM '/var/opt/mssql/backup/olimpiadas/results.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO



CREATE TABLE JuegosOlimpicos(

idJuegos int IDENTITY(1,1) PRIMARY key,
fechaInicio DATETIME,
fechaFin DATETIME,
Pais varchar(100),
Nombre varchar(100),
Tipo varchar(20),
Referencia varchar(50),
Anyo int

)



Create TABLE Atletas(
idAtleta int IDENTITY(1,1) PRIMARY KEY,
nombre varchar(200),
anyoNacimiento int,
idPrimerosJuegos int,
urlAtleta varchar(255),
Pais varchar(200)
CONSTRAINT fkprimerosjuegos FOREIGN KEY (idPrimerosJuegos) REFERENCES JuegosOlimpicos(idJuegos)

)

Create table Deportes(
idDeporte int IDENTITY(1,1) PRIMARY KEY,
Nombre varchar(100)

)
Create Table Competicion(
idCompeticion int IDENTITY(1,1) PRIMARY KEY,
nombre varchar(200),
Genero varchar(200),
idDeporte int,
CONSTRAINT fkDeporte FOREIGN KEY (idDeporte) REFERENCES Deportes(idDeporte)

)
create Table Ganadores(
idJuegos int,
idCompeticion int,
idAtleta int,
Medalla varchar(20)
Primary Key (idJuegos,idCompeticion,idAtleta)
CONSTRAINT fkjuegosganadores FOREIGN KEY (idjuegos) REFERENCES JuegosOlimpicos(idjuegos),
CONSTRAINT fkcompeticionganadores FOREIGN KEY (idCompeticion) REFERENCES Competicion(idCompeticion),
CONSTRAINT fkJganador FOREIGN KEY (idAtleta) REFERENCES Atletas(idAtleta),
)
 

insert into JuegosOlimpicos
select game_start_date,game_end_date,game_location,game_name,game_season,rawhost.game_slug,game_year from rawhost

insert into Atletas
select distinct ra.athlete_full_name,athlete_year_birth,idJuegos,ra.athlete_url, country_name from rawatletas ra
inner join  JuegosOlimpicos j on ra.first_game =j.Nombre
inner join rawresults m on m.athlete_url = ra.athlete_url

insert into Deportes
select distinct discipline_title  from rawmedals


insert into Competicion
select distinct event_title,event_gender,idDeporte from rawmedals m
inner join Deportes d on d.Nombre=m.discipline_title
group by event_title,event_gender,idDeporte


insert into Ganadores
select DISTINCT j.idJuegos,idCompeticion,idAtleta,medal_type from rawmedals m
inner join JuegosOlimpicos j on m.slug_game = j.Referencia
inner join Competicion c on m.event_title =c.nombre and m.event_gender =c.Genero
inner  join Deportes d on c.idDeporte=d.idDeporte and d.Nombre=m.discipline_title
inner join Atletas a on m.athlete_url = a.urlAtleta
--where m.athlete_full_name='David VALERO SERRANO'

UPDATE Atletas SET nombre =REPLACE(NOMBRE,'#',',')
UPDATE Atletas SET Pais = REPLACE(pAIS,'#',',')
UPDATE DEPORTES SET nombre =REPLACE(NOMBRE,'#',',')
UPDATE Competicion SET nombre =REPLACE(NOMBRE,'#',',')
UPDATE JuegosOlimpicos SET nombre =REPLACE(NOMBRE,'#',',')


DROP TABLE rawatletas
DROP TABLE rawhost
DROP TABLE rawmedals
DROP TABLE rawresults


