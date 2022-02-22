PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''
PRINT 'Cargando datos de  la Netflix,Puede tardar unos minutos....'
PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''

SET NOCOUNT ON
use master
go
drop database if exists netflix
GO

create database netflix
GO
use netflix
GO
--name,phone,email,address,postalZip,region,country


create table rawClientes(
nombre varchar(200),
telefono varchar(100),
email varchar(100),
direccion varchar(300),
codPostal varchar(40),
region varchar(200),
pais varchar(200)

)

GO

BULK INSERT rawClientes FROM '/var/opt/mssql/backup/oscars/randomperson.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO


--Title,Year,Rated,Released,Runtime,Genre,Director,Writer,Actors,Plot,Language,Country,
--Awards,Poster,Ratings.Source,Ratings.Value,Metascore,imdbRating,imdbVotes,imdbID,Type,DVD,BoxOffice,Production,Website,Response,tomatoURL,,
--Code Name: K.O.Z.,2015,NOT RATED,13 Feb 2015,114 min,Crime| Mystery,Celal Çimen,N/A,Cem Kurtoglu| Hakan Ural| Hazim Körmükçü| Tolga Karel,A look at the 17-25 December 2013 corruption scandal in Turkey| from the viewpoint of the Erdogan government.,Turkish,Turkey,N/A,https://images-na.ssl-images-amazon.com/images/M/MV5BMDhkOTQzN2UtZDJhMi00ZTkzLWJmYjctNmE0MjdmZDlmYjJlXkEyXkFqcGdeQXVyNTQzNzQ5OTE@._V1_SX300.jpg,Internet Movie Database,1.6/10,N/A,1.6,24|6,tt4458206,movie,N/A,N/A,N/A,N/A,True,N/A,,
drop table if EXISTS movies
create table movies(

titulo varchar(200),
anyo varchar(100),
released varchar(30),
fecha varchar(30),
duracion varchar(20),
genero varchar(200),
director varchar(500),
Guionista varchar(5000),
actores varchar(1000),
plot varchar(8000),
Idioma varchar(1000),
pais varchar(1000),
Awards varchar(200),
Poster varchar(500),
Ratings varchar(200),
Source varchar(200),
RatingsValue varchar(200),
Metascore varchar(200),
imdbRating varchar(200),
imdbVotes varchar(200),
imdbID varchar(200),
Type varchar(200),
DVD varchar(200),
BoxOffice varchar(200),
Production varchar(200),
Website varchar(200),
Response varchar(200),
tomatoURL varchar(2000)


)


GO

BULK INSERT movies FROM '/var/opt/mssql/backup/oscars/movies.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO

GO

BULK INSERT movies FROM '/var/opt/mssql/backup/oscars/movies2.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO
UPDATE MOVIES SET anyo =LEFT(anyo,4)

--select titulo,anyo,count(1) from movies group by titulo,anyo --having count(1)>1
--order by titulo


--select titulo from movies,(SELECT   value FROM STRING_SPLIT(genero, '|') )

create table  rawgenerotitulo(

   titulo varchar(1000),
   anyo int,
   genero varchar(299)
)
go

DECLARE @genero AS varchar(299)
declare @anyo as int
DECLARE @tit AS varchar(100)
DECLARE cGenero CURSOR FOR SELECT genero,titulo,anyo FROM movies

OPEN cGenero

FETCH NEXT FROM cGenero INTO @genero,@tit,@anyo

WHILE @@fetch_status = 0

BEGIN
   insert into rawgenerotitulo
   SELECT @tit,@anyo , trim(value) FROM STRING_SPLIT(@genero, '|') 
   -- PRINT @Description
FETCH NEXT FROM cGenero INTO @genero,@tit,@anyo
END
CLOSE cGenero
DEALLOCATE cGenero


--autores

create table  rawautorespelis(

   titulo varchar(1000),
   anyo int,
   autores varchar(299)
)

go
DECLARE @actor AS varchar(299)
declare @anyo as int
DECLARE @tit AS varchar(100)
DECLARE cAutor CURSOR FOR SELECT actores,titulo,anyo FROM movies

OPEN cAutor

FETCH NEXT FROM cAutor INTO @actor,@tit,@anyo

WHILE @@fetch_status = 0

BEGIN
   insert into rawautorespelis
   SELECT @tit,@anyo , trim(value) FROM STRING_SPLIT(@actor, '|') 
   -- PRINT @Description
FETCH NEXT FROM cAutor INTO @actor,@tit,@anyo
END
CLOSE cAutor
DEALLOCATE cAutor






--select top 10 * from movies
create table pelicula(
idPelicula int IDENTITY(1,1) PRIMARY key,
titulo varchar(500),
anyo int,
duracion int,
director varchar(500),
descripcion varchar(8000),
Idioma varchar(200),
Pais varchar(200),
Poster varchar(500),
)

create table genero(
idGenero int IDENTITY(1,1) PRIMARY key,
nombre varchar(200)
)

create table generopelicula(
idgenero int,
idpelicula int,
PRIMARY key(idgenero,idpelicula),
CONSTRAINT fkgenero FOREIGN KEY (idgenero) REFERENCES genero(idGenero),
CONSTRAINT fkpelicula FOREIGN KEY (idpelicula) REFERENCES pelicula(idPelicula)

)

create table Actor(
idActor int IDENTITY PRIMARY key,
nombre varchar(200)
)

create table ActorPelicula(
idActor int,
idpelicula int,
PRIMARY key(idActor,idpelicula),
CONSTRAINT fkautor FOREIGN KEY (idActor) REFERENCES Actor(idActor),
CONSTRAINT fkpelicula2 FOREIGN KEY (idpelicula) REFERENCES pelicula(idPelicula)


)


create table Idioma(

   idIdioma int IDENTITY(1,1) PRIMARY key,
   nombre varchar(200)
)

create table IdiomaPelicula(
idIdioma int,
idpelicula int,
PRIMARY key(idIdioma,idpelicula),
CONSTRAINT fkidioma FOREIGN KEY (idIdioma) REFERENCES Idioma(idIdioma),
CONSTRAINT fkpelicula2werwer FOREIGN KEY (idpelicula) REFERENCES pelicula(idPelicula)

)

insert into genero 
select distinct genero from rawgenerotitulo
insert into Actor 
select distinct autores from rawautorespelis



update movies set duracion =null where duracion='N/A' or duracion like '%h%'

insert into pelicula
select  titulo,anyo,replace(duracion,'min',''),director,replace(plot,'|',','),idioma, (SELECT TOP 1 value FROM STRING_SPLIT(PAIS, '|')) ,poster from movies


insert into generopelicula
select distinct g.idGenero,p.idPelicula from pelicula p
inner join rawgenerotitulo gt on gt.titulo=p.titulo and gt.anyo=p.anyo
inner join genero g on gt.genero =g.nombre


insert into ActorPelicula
select distinct g.idactor,p.idPelicula from pelicula p
inner join rawautorespelis gt on gt.titulo=p.titulo and gt.anyo=p.anyo
inner join Actor g on gt.autores =g.nombre






create table Usuario(
idUsuario int IDENTITY(1,1) PRIMARY KEY,   
nombre varchar(200),
telefono varchar(100),
email varchar(100),
direccion varchar(300),
codPostal varchar(40),
region varchar(200),
pais varchar(200)

)
insert into Usuario
select * from rawClientes


create TABLE EstaViendo(
idUsuario INt,
idPelicula int,
tiempoVisto int,
PRIMARY key (idUsuario,idpelicula),
CONSTRAINT fkusuario FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
CONSTRAINT fkpelicula3 FOREIGN KEY (idpelicula) REFERENCES pelicula(idPelicula)

)


create TABLE Favorito(
idUsuario INt,
idPelicula int,
PRIMARY key (idUsuario,idpelicula),
CONSTRAINT fkusuario2 FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
CONSTRAINT fkpelicula4 FOREIGN KEY (idpelicula) REFERENCES pelicula(idPelicula)

)
declare @contador as int= 0

while @contador<50000
BEGIN
declare @idusuario int = cast(RAND(CHECKSUM(NEWID())) * 500 as INT)+1
declare @idpelicula int =cast(RAND(CHECKSUM(NEWID())) * 7964 as INT)+1

  INSERT INTO favorito
  VALUES(@idusuario,@idpelicula)

  set @contador=@contador +1
END

set @contador=0

while @contador<50000
BEGIN
declare @idusuario2 int = cast(RAND(CHECKSUM(NEWID())) * 500 as INT)+1
declare @idpelicula2 int =cast(RAND(CHECKSUM(NEWID())) * 7964 as INT)+1

   declare @duracion int = (select duracion from pelicula where idPelicula=@idpelicula)

 
   SET @duracion = @duracion - cast(RAND(CHECKSUM(NEWID())) * (@DURACION -10) as INT)

  INSERT INTO EstaViendo
  VALUES(@idusuario2,@idpelicula2,@DURACION)
  set @contador=@contador +1
END



select * from Favorito




--idiomas

create table  rawidiomapelis(

   ididioma int,
   idioma varchar(299)
)


go
DECLARE @idioma AS varchar(299)
declare @idpelicula as int
DECLARE cidioma CURSOR FOR SELECT Idioma,idPelicula FROM pelicula

OPEN cidioma

FETCH NEXT FROM cidioma INTO @idioma,@idpelicula

WHILE @@fetch_status = 0

BEGIN
   insert into rawidiomapelis
   SELECT @idpelicula , trim(value) FROM STRING_SPLIT(@idioma, '|') 
   -- PRINT @Description
FETCH NEXT FROM cidioma INTO @idioma,@idpelicula

END
CLOSE cidioma
DEALLOCATE cidioma

insert into Idioma
select distinct trim( Idioma) from rawidiomapelis

insert into IdiomaPelicula
select DISTINCT i.ididioma,r.ididioma from Idioma i
inner join rawidiomapelis r on trim(r.idioma)=i.nombre


SET NOCOUNT OFF

PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''
PRINT 'Base de Datos de la netflix, cargada correctamente. Gracias por la paciencia'
PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''

--update Actor set nombre = trim(nombre)

--update genero set nombre = trim(nombre)
delete IdiomaPelicula where idpelicula in (select idpelicula from pelicula where left(poster,4)<>'http')
delete Favorito where idpelicula in (select idpelicula from pelicula where left(poster,4)<>'http')
delete EstaViendo where idpelicula in (select idpelicula from pelicula where left(poster,4)<>'http')
delete ActorPelicula where idpelicula in (select idpelicula from pelicula where left(poster,4)<>'http')
delete generopelicula where idpelicula in (select idpelicula from pelicula where left(poster,4)<>'http')
delete from pelicula where left(poster,4)<>'http' 

delete  from Idioma where ididioma in 
(
   select idioma.ididioma from idioma
left join idiomapelicula on idiomapelicula.ididioma=idioma.ididioma
where idpelicula is null
)

alter table pelicula drop COLUMN idioma
drop table rawClientes
drop table rawautorespelis
drop table rawgenerotitulo
drop table movies