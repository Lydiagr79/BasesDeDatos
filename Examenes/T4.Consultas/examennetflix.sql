
use netflix
--Consulta para sacar las 10 películas favoritas por los usuarios
--(más veces marcada como favorita)


select top 10 titulo,count(1) from Favorito f
inner join pelicula p on f.idPelicula=p.idPelicula
group by p.idPelicula,titulo
order by count(1) desc


--Películas de genero Western, dame el título, la duración, el año
--y el país de la película

select p.titulo,duracion,anyo,Pais from pelicula p
inner join generopelicula gp on gp.idpelicula=p.idPelicula
inner join genero g on g.idGenero =gp.idgenero
where g.nombre ='Western'


--Si pagamos 10€ (neto, sin IVA) por minuto de emisión, calcular
--cuánto hay que pagar a cada película. Calcular cuánto hay que
--pagar a cada película. Quiero, el nombre de la película, el
--número de minutos vistos y la cantidad a pagar, con y sin IVA
--(21%iva)

select p.idPelicula,p.titulo,sum(tiempoVisto),sum(tiempoVisto)*10 as apagar,(sum(tiempoVisto)*10) /1.21 from pelicula p 
inner join EstaViendo v on p.idPelicula =v.idPelicula
group by p.idPelicula,p.titulo


--Listado de los 20 usuarios que más minutos pasan delante la
--pantalla

select top 20 u.nombre,sum(tiempoVisto) from Usuario u
inner join EstaViendo v on u.idUsuario=v.idUsuario
group by u.idUsuario,u.nombre
order by sum(tiempoVisto) desc

--Películas del 2000 de más de 120 minutos que no sean de USA

select * from pelicula where anyo = 2000 AND duracion >120 AND PAIS <> 'USA'


--6. Contenidos no vistos por nadie para cancelar su emisión

SELECT * FROM pelicula P
LEFT JOIN EstaViendo V ON P.idPelicula = V.idPelicula
WHERE V.idUsuario IS NULL 


--7. Los 20 actores que salen en más películas.

SELECT A.idActor,nombre,COUNT(1) FROM ACTOR A
INNER JOIN ActorPelicula AP ON A.idActor = AP.idActor
GROUP BY A.idActor,A.nombre
ORDER BY COUNT(1) DESC


--8 ¿En qué idioma están las películas? Saca un listado con los
--idiomas, la cantidad de películas 

SELECT I.idIdioma,I.nombre,COUNT(1) FROM pelicula P
INNER JOIN IdiomaPeliculA IP ON IP.idpelicula=P.idPelicula
INNER JOIN Idioma I ON I.idIdioma=IP.idIdioma
GROUP BY I.idIdioma,I.nombre
ORDER BY  COUNT(1) DESC



--9. ¿De qué país tengo más clientes?


SELECT TOP 1 PAIS,COUNT(1) FROM Usuario
GROUP BY PAIS
ORDER BY COUNT(1) DESC 


--¿Qué actor ha actuado en películas de más géneros distintos? Por
--ejemplo, Harrison Ford ha actuado en Ciencia Ficción y Acción
--(Indiana Jones y StarWars), en Cambio Jim Carrey siempre hace
--humor.


SELECT A.idActor,NOMBRE,COUNT(1) FROM (
    select DISTINCT idactor,IDGENERO from pelicula p 
    inner join generopelicula    gp on gp.idpelicula=p.idPelicula
    inner join ActorPelicula ap on ap.idpelicula=p.idPelicula
) AS TABLA1
INNER JOIN ACTOR A ON A.idActor=TABLA1.IDACTOR
GROUP BY A.IDACTOR,NOMBRE
ORDER BY COUNT(1) DESC


