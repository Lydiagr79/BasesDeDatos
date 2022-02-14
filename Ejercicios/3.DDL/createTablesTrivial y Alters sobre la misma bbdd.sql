create database trivial2
go
use trivial2
GO 
--dfgdfgdfgdfg dvdfb dfg dfçç


--pregunta 1

create table jugador(
    id int primary key,
    nombre varchar(200) not null,
    color varchar(20) not null
)
--pregunta 2
create table categoria(
    id int ,--primary key,
    nombre varchar(200) not null,
    color varchar(20) not null,
    constraint pkcategoria primary key(id)
)
--el color le he puesto un varchar de 2p porque.....
create table tarjeta
(
    id int primary key,
    pregunta varchar(200) not null,
    respuesta varchar(200) not null,
    descripcion varchar(800),
    idcategoria int not null,
    constraint fkcategoria FOREIGN key (idcategoria) REFERENCES categoria(id)
)

create table respuestajugadores(
    idtarjeta int,
    idjugador int,
    acerierto bit,
    quesito bit,
    respuesta varchar(200),
    constraint fktarjeta FOREIGN key (idtarjeta) REFERENCES tarjeta(id),
    constraint fkjugador FOREIGN key (idjugador) REFERENCES jugador(id),
    primary key(idjugador,idtarjeta)
)



-------------------------EJERCICIOS SOBRE LA BBDD TRIVIAL------------------------------




-- modificar el nombre del jugador a un varchar de 3
alter table jugador
    alter column nombre varchar(3)


--añadir un campo email not null con un valor por defecto
alter table jugador add email varchar (150) not null default 'asdsdaf@asda.es'
--borrar campo email del jugador
alter table jugador drop column email

--añadir un campo email como null
alter table jugador add email varchar (150)

--inserto datosde todos los emails y luego modifico el campo email para poner el not null

alter table jugador alter column email varchar(150) not null

-- elimino una constraint PK
alter table categoria drop constraint pkcategoria
--añado una pk a la tabla categoria
alter table categoria add constraint pkcategoria1 primary key (id)


--elimino una fk de la tabla tarjeta
alter table tarjeta drop constraint fkcategoria

-- la vuelvo a añadir
alter table tarjeta add constraint fkcategoria FOREIGN key (idcategoria) references categoria(id)








