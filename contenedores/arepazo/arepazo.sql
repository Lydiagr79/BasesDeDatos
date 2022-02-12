PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''
PRINT "Cargando bbdd Arepazo... Esto puede tardar unos minutos..."
PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''
SET NOCOUNT ON
GO

CREATE DATABASE arepazo
GO

USE arepazo
GO

DROP TABLE IF EXISTS  TipoAlimento 

CREATE TABLE TipoAlimento (
Id int IDENTITY(1,1) PRIMARY KEY,
Descripcion Varchar(100) NOT NULL,
IVA int NOT NULL
)

INSERT INTO TipoAlimento
values('Comida','4')

INSERT INTO TipoAlimento
values('Postres','16')

INSERT INTO TipoAlimento
values('Bebidas','21')

DROP TABLE IF EXISTs CategoriasMenu
CREATE TABLE CategoriasMenu(
Id int IDENTITY(1,1) PRIMARY KEY,
Descripcion Varchar(100) NOT NULL,

)
INSERT INTO CategoriasMenu
values ('Arepas')

INSERT INTO CategoriasMenu
values ('Cachapas')


INSERT INTO CategoriasMenu
values ('Tapas')

INSERT INTO CategoriasMenu
values ('Batidos')

DROP TABLE IF EXISTS  Menu 

CREATE TABLE Menu (
Id int IDENTITY(1,1) PRIMARY KEY,
Nombre Varchar(100) NOT NULL,
Descripcion nvarchar(500) NOT NULL,
Tipo  int NOT NULL,
Categoria int NULL,
PrecioVenta decimal(18,2) NOT NULL,
CONSTRAINT fktipomenu FOREIGN KEY (Tipo) REFERENCES TipoAlimento(Id),
CONSTRAINT fkcategoria FOREIGN KEY (Categoria) REFERENCES CategoriasMenu(Id)
)


DROP TABLE IF EXISTS  Ingredientes 

CREATE TABLE Ingredientes (
Id int IDENTITY(1,1) PRIMARY KEY,
Nombre varchar(100),
PrecioKg decimal(18,2)
)

INSERT INTO Ingredientes
Values ('Masa arepa',10.00)

INSERT INTO Ingredientes
Values ('Aguacate',3.98)

INSERT INTO Ingredientes
Values ('Tomate',1.12)

INSERT INTO Ingredientes
Values ('Queso',10.00)


INSERT INTO Ingredientes
Values ('Pollo Mechado',2.99)


INSERT INTO Ingredientes
Values ('Ternera Mechada',6.99)

INSERT INTO Ingredientes
Values ('Caballa',12.00)


INSERT INTO Ingredientes
Values ('York',6.99)

INSERT INTO Ingredientes
Values ('Frijoles',2.65)

INSERT INTO Ingredientes
Values ('Lechuga',1.99)

INSERT INTO Ingredientes
Values ('Huevo',1.00)

INSERT INTO Ingredientes
Values ('Salsa Cocktel',3.07)

INSERT INTO Ingredientes
Values ('Mayonesa',6.23)

INSERT INTO Ingredientes
Values ('Ternera asada',8.99)

INSERT INTO Ingredientes
Values ('Masa Cachapa',10.00)

INSERT INTO Ingredientes
Values ('Maduro',3.44)

INSERT INTO Ingredientes
Values ('Alitas Pollo',3.83)

INSERT INTO Ingredientes
Values ('Harina',10.00)

INSERT INTO Ingredientes
Values ('Manzana',1.33)

INSERT INTO Ingredientes
Values ('Helado',1.00)

INSERT INTO Ingredientes
Values ('Platano',1.99)

INSERT INTO Ingredientes
Values ('Chocolate',4.53)

INSERT INTO Ingredientes
Values ('Refresco',2.00)

INSERT INTO Ingredientes
Values ('Agua',0.50)


INSERT INTO Ingredientes
Values ('Cerveza',0.99)

INSERT INTO Ingredientes
Values ('Leche',1.00)

INSERT INTO Ingredientes
Values ('Guayaba',14.90)

INSERT INTO Ingredientes
Values ('Fresa',6.99)

INSERT INTO Ingredientes
Values ('Mora',7.87)

INSERT INTO Ingredientes
Values ('Piña',2.34)

INSERT INTO Ingredientes
Values ('Tomate Arbol',2.00)

INSERT INTO Ingredientes
Values ('Mango',11.47)

INSERT INTO Ingredientes
Values ('Tequeños',9.50)

INSERT INTO Ingredientes
Values ('Yuca',2.25)
INSERT INTO Ingredientes
Values ('Crema Catalana',3.99)
INSERT INTO Ingredientes
Values ('Panela',3.25)



DROP TABLE IF EXISTS  Receta 

CREATE TABLE Receta (
idMenu int NOT NULL,
idIngredientes int NOT NULL,
CantidadEnKg  decimal(18,2) NOT NULL,
CONSTRAINT fkrecetamenu FOREIGN KEY (idMenu) REFERENCES Menu(Id),
CONSTRAINT fkIngredienteReceta FOREIGN KEY (idIngredientes) REFERENCES Ingredientes(Id),
PRIMARY KEY(IdMenu,IdIngredientes)
)

--arepas
INSERT INTO Menu 
Values ('Albina', '(Arepa con Queso Blanco',1,1,3.00)
INSERT INTO Receta
VALUES (1,1,0.10)
INSERT INTO Receta
VALUES (1,4,0.10)

INSERT INTO Menu 
Values ('Pajaro Albino', '(Arepa con queso blanci y cABALLA)',1,1,3.00)

INSERT INTO Receta
VALUES (2,1,0.10)
INSERT INTO Receta
VALUES (2,4,0.05)
INSERT INTO Receta
VALUES (2,7,0.05)

INSERT INTO Menu 
Values ('Domino', '(Arepa con Queso y frijoles',1,1,3.00)
INSERT INTO Receta
VALUES (3,1,0.10)
INSERT INTO Receta
VALUES (3,4,0.05)
INSERT INTO Receta
VALUES (3,9,0.05)


INSERT INTO Menu 
Values ('New York', '(Arepa con Queso Blanco y York',1,1,3.00)

INSERT INTO Receta
VALUES (4,1,0.10)
INSERT INTO Receta
VALUES (4,4,0.05)
INSERT INTO Receta
VALUES (4,8,0.05)


INSERT INTO Menu 
Values ('Catira', '(Arepa con pollo mechado',1,1,3.00)
INSERT INTO Receta
VALUES (5,1,0.10)
INSERT INTO Receta
VALUES (5,5,0.10)

INSERT INTO Menu 
Values ('Pelua', '(Arepa con ternera mechada',1,1,3.00)
INSERT INTO Receta
VALUES (6,1,0.10)
INSERT INTO Receta
VALUES (6,6,0.10)


INSERT INTO Menu 
Values ('Arepazo', '(Arepa con pollo y ternera mechada, aguatate y queso',1,1,4.00)
INSERT INTO Receta
VALUES (7,1,0.10)
INSERT INTO Receta
VALUES (7,5,0.05)
INSERT INTO Receta
VALUES (7,6,0.05)
INSERT INTO Receta
VALUES (7,4,0.05)
INSERT INTO Receta
VALUES (7,2,0.05)

INSERT INTO Menu 
Values ('Arepazo Venezuela', '(Arepa con Ternera mechada,frijoles negros, aguatate y queso',1,1,4.00)
INSERT INTO Receta
VALUES (8,1,0.10)
INSERT INTO Receta
VALUES (8,6,0.05)
INSERT INTO Receta
VALUES (8,2,0.05)
INSERT INTO Receta
VALUES (8,4,0.05)
INSERT INTO Receta
VALUES (8,9,0.05)





INSERT INTO Menu 
Values ('Vegatariana', '(Arepa con Queso, huevo,lechuga y tomate',1,1,3.00)
INSERT INTO Receta
VALUES (9,1,0.10)
INSERT INTO Receta
VALUES (9,4,0.05)
INSERT INTO Receta
VALUES (9,11,0.10)
INSERT INTO Receta
VALUES (9,10,0.05)
INSERT INTO Receta
VALUES (9,3,0.05)

INSERT INTO Menu 
Values ('Reina Pepiada', '(Arepa pollo mechado,Aguacate y Mahonesa',1,1,3.50)

INSERT INTO Receta
VALUES (10,1,0.10)

INSERT INTO Receta
VALUES (10,5,0.10)

INSERT INTO Receta
VALUES (10,2,0.10)

INSERT INTO Receta
VALUES (10,13,0.02)


INSERT INTO Menu 
Values ('Sabrosita', '(Arepa con queso,york,tomate,lechuga y salsa coctel',1,1,3.00)

INSERT INTO Receta
VALUES (11,1,0.10)

INSERT INTO Receta
VALUES (11,12,0.05)
INSERT INTO Receta
VALUES (11,10,0.03)
INSERT INTO Receta
VALUES (11,3,0.05)
INSERT INTO Receta
VALUES (11,4,0.05)
INSERT INTO Receta
VALUES (11,8,0.05)

INSERT INTO Menu 
Values ('La Guara', '(Arepa con maduro,aguacate,queso fresco',1,1,3.50)

INSERT INTO Receta
VALUES (12,1,0.10)
INSERT INTO Receta
VALUES (12,16,0.05)
INSERT INTO Receta
VALUES (12,2,0.05)
INSERT INTO Receta
VALUES (12,4,0.05)

INSERT INTO Menu 
Values ('La Viuda', '(Arepa con queso blanco',1,1,3.00)
INSERT INTO Receta
VALUES (13,1,0.10)



INSERT INTO Menu 
Values ('La Criollita', '(Arepa con queso, ternera asada,aguacate y tomate',1,1,3.00)
INSERT INTO Receta
VALUES (14,1,0.10)
INSERT INTO Receta
VALUES (14,4,0.05)
INSERT INTO Receta
VALUES (14,2,0.05)
INSERT INTO Receta
VALUES (14,14,0.05)
INSERT INTO Receta
VALUES (14,3,0.05)

--cachapas
INSERT INTO Menu 
Values ('Sola', 'Cachapa solitaria',1,2,2.00)
INSERT INTO Receta
VALUES (15,15,0.10)

INSERT INTO Menu 
Values ('Arepazo', 'Cachapa con quesi,ternera y pollo mechado y aguacate',1,2,5.00)
INSERT INTO Receta
VALUES (16,15,0.10)
INSERT INTO Receta
select 16,idIngredientes,cantidadEnKg FROM Receta WHERE idMenu=7 AND idIngredientes<>1

INSERT INTO Menu 
Values ('Criolla', 'Cachapa con ternera asada, aguacate, tomate y queso',1,2,5.00)
INSERT INTO Receta
VALUES (17,16,0.10)
INSERT INTO Receta
select 17,idIngredientes,cantidadEnKg FROM Receta WHERE idMenu=14 AND idIngredientes<>1

INSERT INTO Menu 
Values ('Vegana', 'Cachapa con Maduro,aguacate tomate y lechuga',1,2,4.50)
INSERT INTO Receta
VALUES (18,16,0.10)
INSERT INTO Receta
select 18,idIngredientes,cantidadEnKg FROM Receta WHERE idMenu=9 AND idIngredientes<>1

--tapas
INSERT INTO Menu 
Values ('Tequeños', '6 unidades de riquisimos Tequeños rellenos de queso',1,3,4.50)
INSERT INTO Receta
VALUES (19,33,0.3)

INSERT INTO Menu 
Values ('Patacon Mixto', 'Maduro frito con quesi y pollo mechado',1,3,4.50)
INSERT INTO Receta
VALUES (20,16,0.3)
INSERT INTO Receta
VALUES (20,4,0.3)
INSERT INTO Receta
VALUES (20,5,0.3)


INSERT INTO Menu 
Values ('Yuca frita', 'Yuca frita, nuestras patatas fritas',1,3,4.50)
INSERT INTO Receta
VALUES (21,34,0.6)

INSERT INTO Menu 
Values ('Maduro', 'Maduro con quesi',1,3,4.50)
INSERT INTO Receta
VALUES (22,16,0.5)
INSERT INTO Receta
VALUES (22,4,0.5)


INSERT INTO Menu 
Values ('Alitas de Pollo', 'Por si te quedas con hambre',1,3,5.99)

INSERT INTO Receta
VALUES (23,17,0.75)


--postres

INSERT INTO Menu 
Values ('Tarta de queso', 'Casera, especialidad de la casa',2,NULL,3.49)
INSERT INTO Receta
VALUES (24,18,0.20)
INSERT INTO Receta
VALUES (24,4,0.20)
INSERT INTO Receta
VALUES (24,11,0.10)

INSERT INTO Menu 
Values ('Tarta de manzana', 'Casera',2,NULL,2.99)

INSERT INTO Receta
VALUES (25,18,0.20)
INSERT INTO Receta
VALUES (25,19,0.20)
INSERT INTO Receta
VALUES (25,11,0.10)

INSERT INTO Menu 
Values ('Crema catalana', 'Deliciosa crema quemada',2,NULL,2.99)

INSERT INTO Receta
VALUES (26,35,0.5)

INSERT INTO Menu 
Values ('Helado', '3 bolas de fresa,chocolate y nata',2,NULL,2.49)
INSERT INTO Receta
VALUES (27,20,0.6)


INSERT INTO Menu 
Values ('Yogurt con Panela', 'Con rica panela para endulzar',2,NULL,1.99)
INSERT INTO Receta
VALUES (28,20,0.6)
INSERT INTO Receta
VALUES (28,36,0.1)

INSERT INTO Menu 
Values ('Platano con chocolate', 'para chuparse los dedos',2,NULL,2.99)
INSERT INTO Receta
VALUES (29,21,0.5)
INSERT INTO Receta
VALUES (29,22,0.2)
--bebidas
INSERT INTO Menu 
Values ('Agua grande', 'botella 1,5 l',3,NULL,0.99)
INSERT INTO Receta
VALUES (30,24,1.5)

INSERT INTO Menu 
Values ('Agua pequeña', 'botella 0,5 l',3,NULL,0.49)
INSERT INTO Receta
VALUES (31,24,0.5)

INSERT INTO Menu 
Values ('Caña', 'botella 1,5 l',3,NULL,1.49)
INSERT INTO Receta
VALUES (32,25,0.2)
INSERT INTO Menu 
Values ('Refresco Cola', 'Lata CoceCola',3,NULL,1.49)
INSERT INTO Receta
VALUES (33,23,0.33)

INSERT INTO Menu 
Values ('Refresco Naranja', 'Lata Fante Naranja',3,NULL,1.49)
INSERT INTO Receta
VALUES (34,23,0.33)


INSERT INTO Menu 
Values ('Refresco Limón', 'Lata Fante Limón',3,NULL,1.49)
INSERT INTO Receta
VALUES (35,23,0.33)

--batidos
INSERT INTO Menu 
Values ('Fresa con leche', 'Vaso 0.5 l',3,3,3.99)

INSERT INTO Receta
VALUES (36,26,0.33)

INSERT INTO Receta
VALUES (36,28,0.33)

INSERT INTO Menu 
Values ('Mora con leche', 'Vaso 0.5 l',3,3,3.99)
INSERT INTO Receta
VALUES (37,26,0.33)

INSERT INTO Receta
VALUES (37,29,0.33)
INSERT INTO Menu 
Values ('Guayaba con leche', 'Vaso 0.5 l',3,3,3.99)
INSERT INTO Receta
VALUES (38,26,0.33)
INSERT INTO Receta
VALUES (38,27,0.33)

INSERT INTO Menu 
Values ('Piña con leche', 'Vaso 0.5 l',3,3,3.99)
INSERT INTO Receta
VALUES (39,26,0.33)
INSERT INTO Receta
VALUES (39,30,0.33)

INSERT INTO Menu 
Values ('Tomate de arbol con leche', 'Vaso 0.5 l',3,3,3.99)
INSERT INTO Receta
VALUES (40,26,0.33)
INSERT INTO Receta
VALUES (40,31,0.33)

INSERT INTO Menu 
Values ('Mango con leche', 'Vaso 0.5 l',3,3,3.99)
INSERT INTO Receta
VALUES (41,26,0.33)
INSERT INTO Receta
VALUES (41,32,0.33)

--batidos
INSERT INTO Menu 
Values ('Fresa con hielo', 'Vaso 0.5 l',3,3,3.49)
INSERT INTO Receta
VALUES (42,24,0.33)
INSERT INTO Receta
VALUES (42,28,0.33)

INSERT INTO Menu 
Values ('Mora con hielo', 'Vaso 0.5 l',3,3,3.49)
INSERT INTO Receta
VALUES (43,24,0.33)
INSERT INTO Receta
VALUES (43,29,0.33)

INSERT INTO Menu 
Values ('Guayaba con hielo', 'Vaso 0.5 l',3,3,3.49)
INSERT INTO Receta
VALUES (44,24,0.33)
INSERT INTO Receta
VALUES (44,27,0.33)


INSERT INTO Menu 
Values ('Piña con hielo', 'Vaso 0.5 l',3,3,3.49)
INSERT INTO Receta
VALUES (45,24,0.33)
INSERT INTO Receta
VALUES (45,30,0.33)




INSERT INTO Menu 
Values ('Tomate de arbol con hielo', 'Vaso 0.5 l',3,3,3.49)
INSERT INTO Receta
VALUES (46,24,0.33)
INSERT INTO Receta
VALUES (46,31,0.33)

INSERT INTO Menu 
Values ('Mango con hielo', 'Vaso 0.5 l',3,3,3.49)
INSERT INTO Receta
VALUES (47,24,0.33)
INSERT INTO Receta
VALUES (47,32,0.33)


IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('Clientes'))
BEGIN;
    DROP TABLE [Clientes];
END;
GO

CREATE TABLE [Clientes] (
    [id] INTEGER NOT NULL IDENTITY(1, 1),
    [Nombre] VARCHAR(255) NULL,
    [Apellido] VARCHAR(255) NULL,
    [Email] VARCHAR(255) NULL,
    [Telefono] VARCHAR(100) NULL,
    [Direccion] VARCHAR(255) NULL,
    [Pais] VARCHAR(100) NULL,
    [ComunidadAutonoma] VARCHAR(50) NULL,
    [Cod_Postal] VARCHAR(10) NULL,
    [FechaNacimiento] VARCHAR(255) NULL,
    PRIMARY KEY ([id])
);
GO

INSERT INTO [Clientes] (Nombre,Apellido,Email,Telefono,Direccion,Pais,ComunidadAutonoma,Cod_Postal,FechaNacimiento)
VALUES
  ('Lucas','Gil','fusce@yahoo.couk','(786) 712-0186','Ap #351-3060 Sit Ave','Spain','Canarias','62984','12/15/1993'),
  ('Jaime','Sanz','fringilla.porttitor.vulputate@google.ca','(858) 511-5138','235-8554 Aliquam Ave','Spain','Catalunya','04251','06/08/1976'),
  ('Shad','Ruiz','ullamcorper.magna@google.edu','(655) 579-2283','P.O. Box 367, 1811 Bibendum St.','Spain','Aragón','41944','06/05/1973'),
  ('Tobias','Miguel','praesent.interdum.ligula@outlook.com','(439) 873-6821','351-3103 Malesuada Avenue','Spain','Galicia','58711','06/19/2001'),
  ('Demetrius','Bravo','eu.sem.pellentesque@outlook.org','(533) 607-8577','P.O. Box 218, 5098 Per Road','Spain','Illes Balears','42265','11/11/1960'),
  ('Yetta','Serrano','dolor@icloud.org','(382) 131-4336','826 Interdum Avenue','Spain','La Rioja','45463','11/02/1952'),
  ('Herrod','Herrero','scelerisque.scelerisque@yahoo.ca','(741) 128-6759','273-5290 Rutrum. Avenue','Spain','Cantabria','31849','05/12/1956'),
  ('Aquila','Duran','placerat.eget.venenatis@yahoo.edu','(868) 410-7650','768-4246 Aenean Rd.','Spain','Canarias','12862','12/23/1960'),
  ('Timothy','Rubio','commodo.tincidunt.nibh@aol.com','(252) 876-5132','Ap #638-8062 In Avenue','Spain','Comunitat Valenciana','75412','06/06/1953'),
  ('Hyacinth','Izquierdo','vestibulum.neque@hotmail.edu','(668) 223-5351','Ap #225-7122 Elit Avenue','Spain','Comunitat Valenciana','22262','09/09/1994'),
  ('Candace','Castillo','ut.aliquam.iaculis@protonmail.net','(315) 827-2149','630-8909 Purus, Rd.','Spain','Ceuta','46225','10/01/2001'),
  ('Lyle','Sanchez','fringilla.est.mauris@icloud.com','(219) 129-2819','Ap #621-7785 Magna Avenue','Spain','Castilla y León','80835','12/22/1976'),
  ('Lani','Garrido','nam.tempor@icloud.ca','(689) 330-3147','Ap #670-205 Congue Rd.','Spain','Extremadura','32457','03/07/1963'),
  ('Scott','Diez','purus.accumsan@outlook.couk','(718) 334-6643','P.O. Box 892, 5634 Libero St.','Spain','Castilla y León','83843','07/23/1996'),
  ('Basil','Iba','curae@protonmail.couk','(830) 996-8862','198-9059 A St.','Spain','Catalunya','02437','12/07/1978'),
  ('Maryam','Moya','molestie.pharetra.nibh@icloud.org','(484) 627-8188','P.O. Box 445, 8940 Aliquam Av.','Spain','Murcia','99440','10/21/1993'),
  ('Kevyn','Carrasco','litora@aol.edu','(420) 590-3646','Ap #338-8478 Accumsan Avenue','Spain','Navarra','78707','12/20/1992'),
  ('Francis','Alonso','erat.nonummy@yahoo.couk','(638) 923-8133','881-7061 Nunc Rd.','Spain','Principado de Asturias','96466','07/03/1953'),
  ('Rigel','Ramos','ipsum.dolor.sit@protonmail.edu','(251) 382-9434','182-4704 Dolor, Ave','Spain','Catalunya','18354','04/22/1961'),
  ('Hasad','Alonso','non@google.ca','(336) 743-3284','397-3247 Sed Ave','Spain','Melilla','18551','07/06/1981'),
  ('Cole','Ramos','posuere.enim@protonmail.com','(856) 676-8891','5930 Et, St.','Spain','Melilla','76015','11/24/1998'),
  ('Claire','Molina','odio@google.couk','(622) 281-7132','4369 Interdum Ave','Spain','Canarias','85414','10/03/1982'),
  ('Micah','Vazquez','auctor@google.couk','(239) 774-7926','258-4444 Lobortis St.','Spain','Extremadura','58660','05/06/1956'),
  ('Martin','Lorenzo','urna.convallis@protonmail.net','(982) 448-7611','P.O. Box 586, 3804 Consectetuer St.','Spain','Euskadi','79246','10/19/1950'),
  ('Judah','Caballero','pede.praesent@icloud.org','(597) 777-8786','930-3529 Natoque Street','Spain','Extremadura','91510','08/04/1979'),
  ('Jameson','Pastor','suscipit.nonummy.fusce@outlook.couk','(731) 516-9088','Ap #245-4748 Tortor Rd.','Spain','Euskadi','16493','02/18/1976'),
  ('Sade','Moya','dictum@hotmail.edu','(322) 398-7320','654-8444 Rutrum Ave','Spain','Castilla y León','91574','11/01/1993'),
  ('Stephanie','Arias','adipiscing.elit@outlook.com','(831) 387-2684','514-5845 Sagittis. St.','Spain','La Rioja','03597','12/18/1981'),
  ('Kane','Herrero','elit.erat@icloud.org','(551) 557-2811','499 Habitant Avenue','Spain','Illes Balears','61654','06/11/1955'),
  ('Evangeline','Alonso','sed.malesuada.augue@protonmail.org','(624) 881-1521','848-154 Sit St.','Spain','Illes Balears','81452','02/23/1952'),
  ('Ginger','Mora','ut.eros@google.edu','(214) 686-3587','7841 Tincidunt Avenue','Spain','Melilla','83248','09/25/1993'),
  ('Basia','Alvarez','adipiscing@protonmail.edu','(648) 872-4224','Ap #907-2252 Sodales Rd.','Spain','Comunitat Valenciana','77961','11/23/1999'),
  ('Tyrone','Soler','libero@protonmail.couk','(321) 325-7024','942-9264 Augue Rd.','Spain','Andalucía','06709','03/20/1975'),
  ('Aurelia','Bravo','et@google.ca','(670) 326-4886','673-2909 Donec Street','Spain','Castilla - La Mancha','67146','04/30/2002'),
  ('Bruno','Blanco','lacus@aol.org','(776) 674-9086','917-5223 Arcu St.','Spain','Andalucía','71810','04/26/1997'),
  ('Xander','Ruiz','velit.pellentesque@hotmail.net','(401) 472-4625','Ap #719-2855 Tristique Road','Spain','Aragón','44725','07/08/1987'),
  ('Kasper','Lorenzo','ornare@protonmail.edu','(728) 516-0739','5420 Nunc Road','Spain','Melilla','17714','05/12/1962'),
  ('Erin','Duran','donec.egestas@outlook.org','(625) 639-5827','659-785 Aliquam Avenue','Spain','Illes Balears','51817','10/26/1984'),
  ('Ignacia','Leon','cras.eget.nisi@yahoo.org','(283) 143-4227','Ap #188-4258 Laoreet Rd.','Spain','Extremadura','73470','04/24/1966'),
  ('Aurora','Blanco','est@protonmail.org','(783) 239-3918','114-8277 Lobortis, Ave','Spain','Euskadi','31117','11/25/1964'),
  ('Gail','Saez','auctor.vitae@google.org','(584) 439-5520','P.O. Box 270, 8211 Sem St.','Spain','Extremadura','97663','05/13/1971'),
  ('Lilah','Blanco','at.egestas@protonmail.net','(647) 644-1724','Ap #143-1317 Dictum Road','Spain','Galicia','62177','07/06/1998'),
  ('Adele','Lorenzo','vivamus@protonmail.com','(282) 658-7797','Ap #473-5876 Curabitur St.','Spain','Euskadi','90596','10/18/1975'),
  ('Kyle','Gallego','maecenas.malesuada@aol.com','(230) 604-0131','7544 Pede Rd.','Spain','Ceuta','71353','03/12/2000'),
  ('Montana','Vega','dictum.cursus@outlook.com','(653) 443-2773','3081 Nostra, Road','Spain','Comunitat Valenciana','38144','02/24/1961'),
  ('Colorado','Merino','euismod.urna@aol.net','(783) 114-1564','Ap #201-2590 Vestibulum Street','Spain','Castilla y León','30542','07/12/1961'),
  ('Hadley','Esteban','nunc.sed.libero@hotmail.com','(224) 704-2380','132-1386 Cras St.','Spain','Canarias','41417','12/09/1986'),
  ('Xantha','Duran','nulla@aol.ca','(562) 635-4391','604-8202 In Avenue','Spain','Madrid','25561','07/20/1997'),
  ('Nevada','Perez','aliquam@aol.org','(509) 555-2545','Ap #319-641 Ac Street','Spain','Ceuta','07397','12/28/1979'),
  ('Salvador','Gonzalez','mollis.vitae@google.net','(337) 589-8952','925-503 Tristique Road','Spain','Aragón','78911','11/15/1995');
INSERT INTO [Clientes] (Nombre,Apellido,Email,Telefono,Direccion,Pais,ComunidadAutonoma,Cod_Postal,FechaNacimiento)
VALUES
  ('Nero','Flores','a.auctor@icloud.couk','(161) 162-2026','480-9362 Nec, Rd.','Spain','Madrid','87028','12/05/2002'),
  ('Grace','Nuñez','dolor.sit.amet@outlook.ca','(210) 917-1780','Ap #486-2043 Purus. Rd.','Spain','Castilla - La Mancha','86285','12/16/1987'),
  ('Cruz','Rubio','amet.ultricies.sem@outlook.org','(655) 286-3422','Ap #231-9253 Massa. Av.','Spain','Catalunya','03781','09/07/1992'),
  ('Robin','Crespo','non.justo@yahoo.net','(759) 313-7115','976-2010 Arcu. Rd.','Spain','Melilla','22955','06/28/1978'),
  ('Thane','Redondo','libero.nec.ligula@aol.org','(657) 346-1681','801-6135 Sed Avenue','Spain','Cantabria','26325','04/21/1975'),
  ('Oleg','Castillo','vitae.semper@hotmail.org','(532) 453-8464','P.O. Box 404, 6774 Consequat Av.','Spain','Comunitat Valenciana','59576','01/14/1960'),
  ('Stephen','Rubio','metus@google.net','(408) 788-0447','Ap #748-8075 Dolor Ave','Spain','Melilla','25440','01/10/1952'),
  ('Caldwell','Ramos','ad.litora.torquent@aol.net','(324) 567-9005','9588 Nec Av.','Spain','Galicia','64765','06/16/1998'),
  ('Damian','Duran','risus.donec@hotmail.ca','(747) 685-6291','Ap #756-3741 Arcu Rd.','Spain','Comunitat Valenciana','15745','11/23/1973'),
  ('Germane','Nuñez','nascetur.ridiculus.mus@icloud.org','(620) 798-2247','Ap #541-2260 Blandit Av.','Spain','Andalucía','81411','11/14/1952'),
  ('Graham','Sanz','mus.donec@icloud.net','(242) 483-9937','777-559 Sit Av.','Spain','Comunitat Valenciana','64541','07/20/1986'),
  ('Devin','Crespo','fusce.mollis.duis@google.couk','(580) 483-3998','Ap #349-8263 Magna Rd.','Spain','Illes Balears','57007','06/20/1952'),
  ('Nero','Serrano','iaculis@protonmail.ca','(567) 819-2850','871-1424 Lacinia Avenue','Spain','Canarias','34617','05/27/1964'),
  ('Erica','Serrano','non.luctus@icloud.org','(614) 210-6431','Ap #278-3798 Eros Road','Spain','Cantabria','83484','03/08/1970'),
  ('Cole','Crespo','duis.ac@yahoo.couk','(526) 302-2155','P.O. Box 473, 1111 Donec Road','Spain','Ceuta','95484','10/03/1991'),
  ('Upton','Soler','duis.sit@yahoo.ca','(165) 617-8331','Ap #335-9684 Ligula Road','Spain','Melilla','71277','01/29/1963'),
  ('Honorato','Vazquez','vitae.semper@hotmail.com','(241) 686-8837','Ap #398-9371 Commodo Ave','Spain','Aragón','37324','06/28/1977'),
  ('Kibo','Carrasco','odio.semper.cursus@aol.net','(679) 426-5826','668 Non Rd.','Spain','Melilla','82823','05/03/1987'),
  ('Shafira','Velasco','sit.amet@hotmail.edu','(621) 581-2283','Ap #491-7397 Nulla Avenue','Spain','Ceuta','32115','09/09/1970'),
  ('Joel','Diez','in.mi.pede@aol.edu','(596) 558-8427','474-182 Sapien, Street','Spain','Euskadi','86864','08/12/2004'),
  ('Savannah','Bravo','eu.nibh.vulputate@aol.edu','(828) 578-3668','P.O. Box 843, 1465 Eget Rd.','Spain','Euskadi','12684','11/21/1976'),
  ('Briar','Pardo','ligula.tortor@icloud.ca','(430) 893-1862','462-3762 Eget Avenue','Spain','Madrid','42895','04/02/1953'),
  ('Kadeem','Torres','aliquet.vel@protonmail.net','(325) 228-5580','9845 Ligula. Street','Spain','Catalunya','66967','02/17/1964'),
  ('Hedy','Ortiz','lectus.justo.eu@aol.org','(465) 763-3717','Ap #215-102 Sem Street','Spain','Euskadi','27415','08/01/1986'),
  ('Nelle','Cortes','proin.sed@aol.couk','(864) 318-1343','Ap #184-9736 Integer Rd.','Spain','Aragón','73808','08/16/1956'),
  ('Lance','Perez','amet.ornare@icloud.org','(140) 662-8323','Ap #644-9707 Sed Avenue','Spain','Galicia','42606','01/30/1989'),
  ('Anthony','Lopez','enim.diam.vel@aol.edu','(284) 188-6867','Ap #997-5956 Donec Ave','Spain','Madrid','26140','04/14/1968'),
  ('Rajah','Gimenez','morbi.quis@google.edu','(554) 848-9886','112-4201 Laoreet Av.','Spain','Comunitat Valenciana','62742','09/26/1970'),
  ('Aileen','Gomez','eu@yahoo.couk','(224) 258-0545','436-7611 Phasellus St.','Spain','Galicia','23054','09/17/1993'),
  ('Colette','Vila','turpis.egestas.fusce@yahoo.org','(232) 105-1207','702-3480 Donec Road','Spain','Ceuta','59604','12/12/1981'),
  ('Hayley','Marin','dignissim.lacus@outlook.edu','(961) 684-6187','1254 Hendrerit. Av.','Spain','Castilla y León','11228','01/24/1980'),
  ('Buffy','Nuﾑez','ut.cursus@protonmail.org','(718) 963-9466','P.O. Box 421, 653 Cras Rd.','Spain','Canarias','64911','01/15/2002'),
  ('Desiree','Fernandez','lorem.ipsum@aol.org','(311) 963-4003','336-469 Iaculis, Street','Spain','Galicia','56244','10/17/2000'),
  ('Riley','Ramirez','curabitur@yahoo.couk','(491) 637-5711','Ap #874-5454 Congue Road','Spain','Comunitat Valenciana','49210','01/16/1960'),
  ('Jakeem','Iba','laoreet.lectus@aol.net','(813) 789-3253','920-4359 Sit St.','Spain','Canarias','34737','05/14/1967'),
  ('Asher','Marin','nisi.nibh.lacinia@outlook.com','(333) 717-7245','3102 Lacus. Road','Spain','Extremadura','56747','01/21/1988'),
  ('Zephania','Diaz','nascetur.ridiculus.mus@icloud.couk','(255) 524-7062','4682 Diam St.','Spain','La Rioja','38259','06/09/1961'),
  ('Hammett','Montero','mollis@hotmail.org','(700) 740-5217','P.O. Box 519, 6081 Ac Ave','Spain','Castilla - La Mancha','52288','03/13/1955'),
  ('Briar','Izquierdo','cras.eu@yahoo.couk','(472) 660-7765','Ap #166-2087 Nunc Avenue','Spain','Catalunya','53372','01/04/2000'),
  ('Neville','Flores','risus.nunc@hotmail.net','(665) 347-2284','873-7088 Nibh. Rd.','Spain','Navarra','91524','08/24/2005'),
  ('Flynn','Ibañez','malesuada.id@google.net','(215) 975-2187','Ap #746-2607 In Rd.','Spain','Galicia','21197','09/13/2001'),
  ('Kitra','Flores','pharetra.quisque@icloud.org','(241) 858-0782','150-4852 Mauris Rd.','Spain','Illes Balears','14216','12/27/1990'),
  ('Alan','Gimenez','lobortis.augue@google.com','(846) 422-2086','Ap #812-425 Donec Avenue','Spain','Catalunya','43633','12/11/2002'),
  ('Dillon','Castro','nunc.sed@outlook.com','(117) 173-3354','P.O. Box 489, 6006 Magna. Street','Spain','Euskadi','32572','01/24/2006'),
  ('Macy','Perez','mauris.sapien@aol.com','(254) 979-4115','Ap #152-1280 Interdum. Road','Spain','Catalunya','46444','03/05/1974'),
  ('Denton','Izquierdo','et.ultrices@google.com','(382) 843-6883','Ap #784-1078 Tincidunt, Rd.','Spain','Aragón','35297','08/14/1987'),
  ('Tyler','Marti','nisi.a.odio@yahoo.edu','(741) 842-0762','P.O. Box 634, 5047 Tristique Ave','Spain','La Rioja','77753','05/15/1983'),
  ('Timon','Vidal','justo.eu.arcu@hotmail.edu','(528) 918-5289','534-9239 Consequat Ave','Spain','Murcia','23858','08/02/1958'),
  ('Azalia','Mora','ullamcorper.velit@hotmail.edu','(712) 751-2691','764-2193 Nibh St.','Spain','Murcia','17373','07/15/1956'),
  ('Colton','Andres','orci.tincidunt.adipiscing@outlook.com','(757) 567-8833','270-4522 Pede, Ave','Spain','Catalunya','78861','02/28/1957');
INSERT INTO [Clientes] (Nombre,Apellido,Email,Telefono,Direccion,Pais,ComunidadAutonoma,Cod_Postal,FechaNacimiento)
VALUES
  ('Amanda','Campos','netus.et@icloud.org','(891) 253-6643','P.O. Box 202, 6431 Ornare St.','Spain','Ceuta','60210','03/08/1998'),
  ('Kennan','Montero','lorem.eu@icloud.net','(883) 287-0745','Ap #202-3107 Nonummy. St.','Spain','Principado de Asturias','70848','07/09/1988'),
  ('Austin','Martinez','facilisis.facilisis@icloud.org','(479) 446-8281','324-7741 Auctor St.','Spain','Cantabria','28068','04/16/1956'),
  ('Upton','Rubio','phasellus@protonmail.ca','(207) 693-3887','Ap #909-136 Imperdiet, Av.','Spain','Cantabria','50705','04/17/2004'),
  ('Ariel','Campos','risus@protonmail.edu','(517) 216-4932','Ap #282-8666 At Street','Spain','Galicia','47954','10/28/1970'),
  ('Portia','Gimenez','nulla.tincidunt.neque@yahoo.org','(743) 331-2366','897-1446 Eleifend Rd.','Spain','Castilla y León','43877','08/15/2004'),
  ('Emma','Soto','lacinia.sed.congue@aol.net','(383) 451-5808','P.O. Box 419, 5529 Rutrum St.','Spain','Castilla y León','75446','03/31/1955'),
  ('Mia','Duran','diam.luctus@hotmail.couk','(517) 320-2475','Ap #514-877 Ante Road','Spain','Murcia','81721','01/25/1956'),
  ('Galena','Rubio','tempus.risus@outlook.com','(951) 835-9768','265 Arcu. Rd.','Spain','Comunitat Valenciana','67176','10/30/1991'),
  ('Shea','Carrasco','et.magnis@yahoo.couk','(828) 516-4873','900-2137 Interdum Ave','Spain','Cantabria','01475','12/30/1962'),
  ('Uta','Ibañez','dui.lectus@outlook.com','(623) 697-4827','P.O. Box 496, 8506 Commodo Rd.','Spain','Castilla - La Mancha','03122','09/20/1965'),
  ('Sybil','Mora','adipiscing.elit@hotmail.org','(136) 966-3755','P.O. Box 252, 7680 Interdum. Road','Spain','Andalucía','21929','02/01/1954'),
  ('Slade','Muﾑoz','donec.porttitor@google.edu','(913) 494-3645','199-7584 Pellentesque Road','Spain','Comunitat Valenciana','62663','12/01/1987'),
  ('Flynn','Vega','dignissim.maecenas@google.net','(322) 243-5387','P.O. Box 424, 8808 Nibh Rd.','Spain','La Rioja','70066','06/23/1961'),
  ('Lois','Gallego','blandit.congue@hotmail.edu','(591) 527-1986','623-4774 A, Rd.','Spain','Illes Balears','51680','04/01/1960'),
  ('Kaye','Mendez','dictum.eu@outlook.couk','(282) 641-8952','682-5799 Arcu. St.','Spain','Madrid','85941','03/07/1994'),
  ('Evangeline','Serrano','velit.eget@protonmail.couk','(782) 605-9242','Ap #333-6059 Auctor, Av.','Spain','Melilla','73553','07/17/1958'),
  ('Ramona','Arias','neque.venenatis@protonmail.com','(344) 166-4284','Ap #223-2800 Velit. Rd.','Spain','Castilla y León','64596','02/13/1969'),
  ('Ginger','Marti','mi@protonmail.org','(246) 862-6421','Ap #898-5436 Proin Av.','Spain','Extremadura','45595','10/30/1977'),
  ('Jakeem','Crespo','neque@protonmail.com','(831) 501-4413','2505 Vitae Avenue','Spain','Principado de Asturias','38414','10/21/1951'),
  ('Britanni','Sanchez','gravida@hotmail.couk','(245) 874-7825','P.O. Box 470, 1490 Porta Ave','Spain','Castilla y León','24672','03/13/1988'),
  ('Nichole','Vidal','luctus.curabitur@outlook.net','(486) 753-6313','971-2306 Neque. Rd.','Spain','Canarias','37018','04/14/1989'),
  ('Logan','Caballero','enim.mi.tempor@yahoo.couk','(788) 437-7244','508-588 Adipiscing Street','Spain','Aragón','99707','02/28/1973'),
  ('Jillian','Campos','sem@outlook.ca','(485) 584-4118','6364 Nulla. Ave','Spain','Aragón','27381','12/09/1997'),
  ('Fletcher','Rodriguez','nunc.mauris@hotmail.couk','(826) 636-9530','123-1405 Orci Rd.','Spain','Euskadi','38622','02/25/1972'),
  ('Elvis','Casado','arcu.ac@outlook.com','(457) 745-4271','880-7689 Ridiculus Road','Spain','Canarias','43250','01/22/1966'),
  ('Bradley','Diaz','quisque@aol.org','(372) 760-7363','P.O. Box 254, 2657 Congue. Av.','Spain','Aragón','81696','05/15/2005'),
  ('Bradley','Fernandez','facilisis@google.net','(984) 449-4541','495-9122 Massa. Rd.','Spain','Comunitat Valenciana','16115','09/24/1982'),
  ('Aristotle','Carrasco','sem.magna@outlook.edu','(662) 844-6283','Ap #411-6840 Non Av.','Spain','La Rioja','83665','12/08/1969'),
  ('Amir','Cabrera','lorem.ipsum.dolor@icloud.edu','(755) 873-5657','Ap #703-8069 Phasellus St.','Spain','Castilla - La Mancha','49272','01/18/1972'),
  ('Britanni','Castillo','eros.turpis@hotmail.net','(252) 325-5346','117-3263 Integer Avenue','Spain','La Rioja','35657','12/29/2001'),
  ('Melanie','Rubio','purus.sapien.gravida@icloud.org','(133) 840-3874','P.O. Box 780, 7878 Donec Av.','Spain','Madrid','80628','10/09/1970'),
  ('Rajah','Sanchez','euismod.enim@protonmail.edu','(265) 413-3881','104-9557 Cursus St.','Spain','Canarias','51569','11/24/1962'),
  ('Rhonda','Aguilar','ipsum.phasellus@yahoo.ca','(523) 573-1341','892-8966 Nullam Street','Spain','Cantabria','84451','11/16/2005'),
  ('Garth','Bravo','ipsum.dolor.sit@protonmail.couk','(565) 986-9407','635-4414 Blandit Rd.','Spain','Ceuta','23335','06/12/1951'),
  ('Liberty','Gutierrez','non.massa@outlook.com','(557) 438-5681','4701 Nisl. Av.','Spain','Euskadi','31975','02/02/1993'),
  ('Cairo','Bravo','bibendum.donec@google.org','(765) 883-1121','769-5775 Semper Rd.','Spain','Andalucía','41833','04/24/1999'),
  ('Violet','Leon','ad.litora@hotmail.org','(826) 331-4756','Ap #830-6494 Tempor Road','Spain','Navarra','82736','05/28/2002'),
  ('Kennan','Merino','lobortis.nisi@aol.org','(457) 831-3238','Ap #788-6495 Erat Rd.','Spain','Extremadura','58019','07/31/1962'),
  ('Idola','Alvarez','lorem.lorem@protonmail.ca','(763) 409-4143','8690 Ut, Rd.','Spain','Canarias','21729','04/11/1962'),
  ('Hyacinth','Soto','donec@protonmail.couk','(636) 749-0146','715-6012 Ultrices. Rd.','Spain','Extremadura','76467','07/24/1970'),
  ('James','Delgado','fusce@outlook.couk','(766) 960-1245','Ap #419-7560 Mus. Street','Spain','Catalunya','27362','12/24/1987'),
  ('Claire','Gonzalez','donec@protonmail.com','(761) 250-7291','154-7984 Lobortis St.','Spain','Comunitat Valenciana','32071','09/10/2001'),
  ('Timon','Martin','dolor.sit@icloud.edu','(287) 853-2317','P.O. Box 385, 9247 Amet St.','Spain','Illes Balears','66998','12/03/1981'),
  ('Aristotle','Campos','lacus.aliquam@icloud.com','(397) 183-1635','Ap #954-1329 Sapien, Ave','Spain','Illes Balears','33970','04/13/1962'),
  ('Kyle','Soler','phasellus.fermentum@icloud.com','(281) 517-5161','P.O. Box 721, 9381 Elit, Road','Spain','Aragón','68226','10/07/1990'),
  ('Cara','Rubio','non.lacinia.at@yahoo.edu','(445) 831-5012','Ap #388-9725 Mauris Road','Spain','Galicia','17529','10/25/1984'),
  ('Darrel','Santos','non.justo@icloud.couk','(795) 737-2377','755-7350 Eget Rd.','Spain','Melilla','71254','11/25/1955'),
  ('Roth','Ramirez','duis.ac@outlook.org','(699) 413-4450','3005 Aliquam Ave','Spain','La Rioja','81851','01/17/1966'),
  ('Grady','Rodriguez','felis.ullamcorper.viverra@protonmail.com','(285) 782-3281','303-5313 Eros. Rd.','Spain','Cantabria','74683','07/25/1971');
INSERT INTO [Clientes] (Nombre,Apellido,Email,Telefono,Direccion,Pais,ComunidadAutonoma,Cod_Postal,FechaNacimiento)
VALUES
  ('Wylie','Dominguez','tempus.eu.ligula@google.net','(187) 452-0623','837-7972 Pede. Avenue','Spain','Extremadura','64769','12/14/1958'),
  ('Elton','Rubio','mauris.integer@aol.org','(435) 827-4815','225-8904 Donec St.','Spain','Murcia','95785','04/30/1970'),
  ('Irma','Pardo','amet.orci@icloud.com','(537) 966-8086','Ap #890-2312 Feugiat Rd.','Spain','Murcia','31667','04/27/1957'),
  ('Iliana','Moreno','nisl@icloud.org','(381) 698-1061','2570 Convallis St.','Spain','Cantabria','77655','06/14/1976'),
  ('Sydney','Moya','at.egestas@aol.edu','(221) 713-5485','P.O. Box 564, 7969 Penatibus Street','Spain','Madrid','30771','12/18/1957'),
  ('Evangeline','Miguel','ut.pharetra@outlook.ca','(787) 856-1423','P.O. Box 435, 2156 Ligula Rd.','Spain','Castilla - La Mancha','90180','08/03/2004'),
  ('Cameron','Hidalgo','ultrices.duis@aol.couk','(816) 469-4835','Ap #486-6088 Aliquet Av.','Spain','Andalucía','62815','03/13/1982'),
  ('Jennifer','Medina','eget@protonmail.ca','(734) 853-4126','Ap #156-5893 Non Rd.','Spain','Castilla y León','13711','06/26/1983'),
  ('Stephanie','Ferrer','eget@protonmail.org','(832) 483-1436','P.O. Box 766, 4029 Non Road','Spain','Navarra','35838','06/03/1991'),
  ('Gannon','Gimenez','magna.cras@aol.couk','(604) 337-3601','Ap #815-2303 Pharetra. Av.','Spain','Principado de Asturias','98471','07/21/1984'),
  ('Aladdin','Ruiz','orci.consectetuer.euismod@icloud.couk','(530) 133-1852','P.O. Box 985, 7512 Tincidunt. Rd.','Spain','Castilla - La Mancha','45129','01/09/1982'),
  ('Shafira','Miguel','scelerisque.scelerisque@aol.net','(595) 265-5098','748-6209 Vivamus Road','Spain','Ceuta','45084','06/04/1970'),
  ('Iona','Ramirez','nec.malesuada@icloud.edu','(154) 338-2578','Ap #772-387 Sagittis. Street','Spain','Castilla y León','35205','12/04/1992'),
  ('Christopher','Calvo','purus.ac.tellus@google.net','(184) 658-8598','P.O. Box 128, 5025 Nec, Rd.','Spain','La Rioja','35521','01/09/1956'),
  ('Sydnee','Flores','sit.amet@aol.ca','(399) 740-2817','Ap #777-2838 Vel Rd.','Spain','Navarra','73422','07/20/1992'),
  ('Raja','Crespo','egestas@outlook.com','(213) 371-2009','Ap #740-5648 Amet Ave','Spain','Aragón','21416','04/10/1978'),
  ('Nola','Serrano','ligula.consectetuer@icloud.ca','(353) 618-7501','3012 Magna. Avenue','Spain','Cantabria','32083','03/24/1977'),
  ('Thomas','Romero','neque@hotmail.com','(292) 361-6741','650-5204 Consectetuer, Ave','Spain','Cantabria','06769','07/25/1963'),
  ('Linda','Miguel','dictum.proin@outlook.org','(361) 940-5571','514-2138 Enim St.','Spain','Castilla y León','53378','08/08/1984'),
  ('April','Bravo','ipsum.dolor@aol.ca','(777) 239-5438','426-5242 Sed Av.','Spain','Euskadi','12501','06/20/1952'),
  ('Ronan','Gonzalez','lorem.tristique@outlook.com','(566) 444-0163','387-7323 Metus St.','Spain','Navarra','25771','04/23/1981'),
  ('Preston','Vazquez','urna@aol.org','(188) 672-6239','Ap #904-7923 Lobortis Ave','Spain','Madrid','20751','05/24/1996'),
  ('Aimee','Diaz','ullamcorper.viverra.maecenas@aol.couk','(999) 333-8812','952-2627 Tempor Street','Spain','Madrid','83204','10/01/1991'),
  ('Quinlan','Gonzalez','a.scelerisque@protonmail.net','(323) 487-7794','Ap #110-1821 Nibh. Street','Spain','Extremadura','01388','03/15/1972'),
  ('Lev','Marti','euismod.mauris@google.couk','(153) 488-0774','721-121 Et Road','Spain','Castilla - La Mancha','66383','07/12/1995'),
  ('Quyn','Miguel','lorem@icloud.org','(264) 663-5485','413-5890 Volutpat. Av.','Spain','Murcia','43944','07/01/1989'),
  ('Gavin','Santos','malesuada.fames@aol.com','(748) 767-8413','168-8576 Quis, St.','Spain','Murcia','67643','12/22/1991'),
  ('Raya','Delgado','cursus.integer.mollis@hotmail.couk','(145) 805-8323','6118 Vitae St.','Spain','Aragón','82338','09/14/1957'),
  ('Aquila','Saez','malesuada.fames@yahoo.couk','(877) 921-2451','Ap #288-7096 Dictum Street','Spain','Illes Balears','84682','11/25/1998'),
  ('Boris','Calvo','nulla.facilisi.sed@protonmail.com','(398) 399-0715','895-7234 Ultrices St.','Spain','Murcia','74838','05/19/1976'),
  ('Chelsea','Muﾑoz','ultricies.sem@google.couk','(953) 795-6883','Ap #314-920 Fusce Ave','Spain','Canarias','53290','02/02/1952'),
  ('Ruth','Hidalgo','arcu@google.org','(203) 186-8167','Ap #286-6015 Nec Rd.','Spain','Aragón','69468','10/28/1999'),
  ('Clinton','Serrano','in.consectetuer@hotmail.net','(543) 991-1866','P.O. Box 128, 7136 Mi St.','Spain','Cantabria','75089','07/18/1956'),
  ('Baxter','Vega','sed.pede.nec@protonmail.couk','(765) 253-4347','270-2630 Egestas St.','Spain','Galicia','44745','11/24/1966'),
  ('Desiree','ﾑez','pharetra.sed.hendrerit@icloud.couk','(657) 371-9466','355-3945 Sem St.','Spain','Principado de Asturias','38620','11/28/1962'),
  ('Grace','Guerrero','fusce.aliquet@outlook.org','(987) 364-8802','P.O. Box 500, 7363 Gravida Street','Spain','Castilla - La Mancha','62062','04/23/1959'),
  ('Maxine','Montero','velit.egestas@icloud.couk','(820) 641-2472','P.O. Box 831, 4284 Integer Rd.','Spain','Principado de Asturias','72185','12/13/2004'),
  ('Ruby','Campos','eros.turpis@outlook.org','(658) 327-3819','P.O. Box 543, 4092 Neque. Road','Spain','Principado de Asturias','25077','09/18/2005'),
  ('Dexter','Campos','tristique@icloud.org','(879) 775-6344','689-143 Integer Road','Spain','La Rioja','46284','05/21/1984'),
  ('Allegra','Cortes','risus.nunc.ac@outlook.org','(366) 980-3868','779-769 Dolor, Avenue','Spain','Castilla y León','68792','12/05/1992'),
  ('Rhea','Gallego','magnis.dis@outlook.org','(476) 982-2892','P.O. Box 676, 4158 In St.','Spain','Murcia','23181','08/16/1994'),
  ('TaShya','Gil','elementum.purus@hotmail.org','(932) 245-2811','Ap #751-1457 Massa Avenue','Spain','La Rioja','11007','02/10/1988'),
  ('Carson','Iglesias','hendrerit.donec.porttitor@hotmail.org','(283) 873-2865','P.O. Box 182, 1514 Et, Rd.','Spain','Aragón','91879','04/18/1974'),
  ('Noah','Herrera','lectus.ante@google.com','(257) 629-6650','Ap #504-8132 Neque St.','Spain','Madrid','67671','02/18/1997'),
  ('Kristen','Romero','nostra.per@google.edu','(660) 631-7555','9499 Velit. Road','Spain','Illes Balears','18677','11/22/1996'),
  ('Zelda','Marquez','lacus.mauris@yahoo.edu','(583) 387-5654','5361 Eget Street','Spain','Melilla','32803','05/06/1971'),
  ('Hyacinth','Gutierrez','cras.convallis@google.couk','(197) 479-6631','Ap #785-414 Id Street','Spain','Canarias','57830','07/13/1976'),
  ('Peter','Izquierdo','urna.suscipit.nonummy@protonmail.edu','(594) 486-8127','P.O. Box 347, 5345 Amet Rd.','Spain','Ceuta','84904','05/27/2005'),
  ('Hermione','Bravo','neque.sed@icloud.edu','(451) 932-4460','459-9745 A Avenue','Spain','Principado de Asturias','78711','03/22/1956'),
  ('Gisela','Flores','semper.erat@outlook.com','(113) 367-0245','8109 Diam St.','Spain','Extremadura','62137','09/04/1998');
INSERT INTO [Clientes] (Nombre,Apellido,Email,Telefono,Direccion,Pais,ComunidadAutonoma,Cod_Postal,FechaNacimiento)
VALUES
  ('Drake','Medina','aenean.sed@hotmail.com','(762) 187-5457','6029 Diam St.','Spain','Madrid','38725','09/13/1979'),
  ('Buckminster','Serrano','purus.maecenas.libero@google.com','(360) 551-2692','Ap #557-7907 Egestas Avenue','Spain','Aragón','69554','09/22/1950'),
  ('Whoopi','Ibañez','velit.cras@outlook.edu','(826) 329-7449','695-9193 Tristique Av.','Spain','Castilla - La Mancha','81946','04/08/1954'),
  ('Olivia','Hidalgo','lectus.nullam@yahoo.ca','(645) 641-5777','847-9794 Interdum. Rd.','Spain','La Rioja','22638','10/17/1980'),
  ('Lamar','Garrido','metus.in.lorem@aol.org','(335) 616-6827','Ap #364-5147 Hendrerit Rd.','Spain','Principado de Asturias','51227','02/13/1951'),
  ('Athena','Vega','suspendisse@aol.ca','(426) 315-7315','289-9579 Eget, St.','Spain','Principado de Asturias','52048','03/06/1953'),
  ('Adele','Diez','erat.volutpat.nulla@yahoo.edu','(373) 728-9544','154-3756 Nec, Rd.','Spain','Melilla','99876','05/31/1986'),
  ('Philip','Jimenez','tristique.aliquet.phasellus@protonmail.com','(972) 685-5757','Ap #587-7285 Lobortis Rd.','Spain','Principado de Asturias','38541','01/22/1966'),
  ('Rina','Vicente','senectus.et@outlook.edu','(207) 382-0521','503-6226 Duis Road','Spain','Castilla y León','86736','02/23/1957'),
  ('Blaze','Romero','ut@protonmail.org','(674) 831-6318','Ap #397-1713 Est Av.','Spain','Canarias','43657','11/15/1982'),
  ('Latifah','Cabrera','hendrerit.a@outlook.couk','(138) 578-0183','285-1328 Erat Road','Spain','Extremadura','87822','03/29/1972'),
  ('Preston','Izquierdo','eros.proin@aol.edu','(238) 178-0557','152-1746 Malesuada Street','Spain','Navarra','62180','01/06/1957'),
  ('Jacob','Santana','nec.diam@google.com','(342) 282-0130','P.O. Box 935, 4805 Velit. Av.','Spain','Canarias','07608','11/16/1968'),
  ('Lee','Prieto','sed@outlook.ca','(114) 684-8234','Ap #177-4202 Dapibus Av.','Spain','Navarra','81451','05/15/1956'),
  ('Jerry','Gallego','morbi.tristique.senectus@icloud.com','(214) 542-3915','Ap #854-4941 Lobortis Av.','Spain','Cantabria','51336','05/08/1989'),
  ('Adele','Iba','ligula.nullam@icloud.net','(345) 339-7171','726-3167 Adipiscing. Rd.','Spain','Catalunya','63477','09/12/1997'),
  ('Kuame','Bravo','ipsum.donec@outlook.org','(285) 788-5616','Ap #594-5071 Convallis, Rd.','Spain','Madrid','01957','08/14/1950'),
  ('Quynn','Izquierdo','gravida.non.sollicitudin@outlook.com','(325) 434-6846','7413 Elit, Ave','Spain','Cantabria','17505','07/22/1981'),
  ('Matthew','Moya','dolor@protonmail.com','(489) 543-7578','429-5391 Molestie St.','Spain','Principado de Asturias','60852','09/29/1999'),
  ('Wing','Iba','fermentum.arcu@icloud.com','(938) 447-4998','357-4518 Pulvinar St.','Spain','Euskadi','11639','06/08/1974'),
  ('Bruce','Ruiz','lorem.vitae.odio@google.org','(394) 858-5486','574-9825 Nullam Road','Spain','Aragón','36493','06/03/1988'),
  ('Austin','Pascual','mauris@google.edu','(588) 592-9411','801-792 Libero St.','Spain','Extremadura','11776','05/20/1994'),
  ('Craig','Fuentes','dapibus.id@yahoo.com','(464) 406-4332','296-6603 Aliquam Rd.','Spain','Extremadura','34178','08/31/1981'),
  ('Serena','Vazquez','quam.dignissim@outlook.net','(674) 870-4073','P.O. Box 138, 2495 Aliquam St.','Spain','Aragón','98842','01/07/1985'),
  ('Gwendolyn','Duran','convallis.est@hotmail.couk','(925) 598-1742','8274 Enim St.','Spain','Cantabria','31023','06/15/1958'),
  ('Piper','Gimenez','ullamcorper.velit@hotmail.net','(234) 993-2035','2367 Montes, St.','Spain','Melilla','64863','01/18/1983'),
  ('Leonard','Sanchez','libero.donec@google.edu','(471) 262-7440','P.O. Box 247, 4452 Faucibus St.','Spain','La Rioja','88414','02/11/1976'),
  ('Kasimir','Lorenzo','semper.tellus@protonmail.ca','(402) 354-4915','758-8907 Ligula St.','Spain','Illes Balears','58430','12/05/2000'),
  ('Suki','Gutierrez','penatibus.et.magnis@google.edu','(486) 276-4621','8231 Enim St.','Spain','Melilla','77371','01/26/1986'),
  ('Perry','Crespo','euismod@yahoo.org','(848) 161-6858','Ap #150-2730 Lectus, Street','Spain','Euskadi','14212','01/28/2006'),
  ('Tanek','Velasco','mi.lorem.vehicula@aol.org','(984) 723-8113','Ap #911-8716 Dictum Road','Spain','Ceuta','19741','02/16/2002'),
  ('Eaton','Muñoz','mauris.ipsum.porta@aol.couk','(687) 536-7563','9951 Dolor. Ave','Spain','Castilla - La Mancha','06808','02/12/1985'),
  ('TaShya','Herrera','sodales.purus@yahoo.org','(924) 731-5368','P.O. Box 877, 8626 Sollicitudin Street','Spain','Extremadura','45254','05/09/1956'),
  ('Wendy','Ruiz','aliquet.sem@icloud.net','(332) 466-6845','Ap #811-8777 Nunc St.','Spain','Andalucía','75938','07/07/1979'),
  ('Odette','Izquierdo','varius@yahoo.ca','(857) 510-3743','269-4754 Quis Av.','Spain','Navarra','42179','01/29/2002'),
  ('Selma','Muñoz','aliquet@aol.net','(508) 452-5672','4093 Non St.','Spain','Melilla','58488','09/17/1962'),
  ('Hayfa','Duran','non.sapien@protonmail.com','(235) 725-6455','Ap #105-4576 Dis Street','Spain','Canarias','71191','06/06/1982'),
  ('Larissa','Romero','eget.varius.ultrices@yahoo.edu','(223) 459-6308','400 Erat Rd.','Spain','La Rioja','76337','06/13/2005'),
  ('Jaime','Lorenzo','euismod.ac@google.ca','(114) 426-3472','Ap #615-1663 Mollis Road','Spain','Comunitat Valenciana','86024','07/13/1981'),
  ('Rudyard','Iba','eu.odio@icloud.net','(640) 522-7530','Ap #181-8158 Facilisis Rd.','Spain','Comunitat Valenciana','57764','04/07/1963'),
  ('Phillip','Muﾑoz','orci.adipiscing@aol.edu','(277) 595-3227','776-6681 Magna St.','Spain','Andalucía','23023','10/30/1964'),
  ('Sybil','Moya','ipsum.primis.in@aol.couk','(388) 722-2747','879-5788 Nunc Rd.','Spain','Castilla - La Mancha','78222','07/10/1996'),
  ('Jasper','Izquierdo','facilisis@yahoo.couk','(543) 216-1116','699-9260 Per Rd.','Spain','Galicia','91584','10/12/2002'),
  ('Heather','Saez','erat.volutpat@icloud.couk','(354) 879-5029','297-9673 Metus. Road','Spain','Aragón','61033','09/20/1976'),
  ('Hector','Delgado','euismod.ac@google.edu','(684) 692-4628','185-8668 Orci. St.','Spain','Catalunya','91495','10/24/1983'),
  ('Jordan','Ortega','tincidunt.tempus@google.couk','(846) 741-2205','148-5222 Hendrerit Rd.','Spain','Madrid','81364','08/24/1983'),
  ('Tamara','Bravo','donec@aol.org','(222) 266-6703','P.O. Box 173, 9265 Elementum Rd.','Spain','Aragón','56565','07/06/1982'),
  ('Sydney','Mora','metus@outlook.ca','(519) 159-6376','P.O. Box 622, 638 Et Rd.','Spain','Castilla - La Mancha','77669','06/05/1995'),
  ('Caleb','Vila','lobortis@yahoo.ca','(610) 534-4103','Ap #949-5364 Lobortis, Ave','Spain','Melilla','37141','02/01/1974'),
  ('Xena','Gil','lacus.nulla.tincidunt@aol.ca','(843) 964-2355','Ap #384-3020 Ornare Road','Spain','Castilla - La Mancha','17529','01/12/1995');
INSERT INTO [Clientes] (Nombre,Apellido,Email,Telefono,Direccion,Pais,ComunidadAutonoma,Cod_Postal,FechaNacimiento)
VALUES
  ('Heidi','Ferrer','diam.eu.dolor@hotmail.edu','(574) 248-7626','6808 Nec Ave','Spain','Castilla y León','20883','03/18/1958'),
  ('Cruz','Herrera','ultrices.posuere@protonmail.org','(521) 427-8943','Ap #834-7268 Quisque Ave','Spain','Comunitat Valenciana','38528','05/24/1958'),
  ('Vivien','Vidal','at.augue@icloud.org','(425) 293-8513','833-5055 Mauris Street','Spain','Melilla','61843','09/18/1988'),
  ('Macon','Santana','ligula.elit.pretium@outlook.edu','(488) 406-4364','Ap #592-3210 Aliquam Av.','Spain','Comunitat Valenciana','96219','03/02/1988'),
  ('Caldwell','Hernandez','consectetuer.ipsum@google.ca','(521) 337-6826','1404 Donec Road','Spain','Melilla','79300','02/15/1953'),
  ('Dawn','Peña','in@protonmail.ca','(562) 655-4397','P.O. Box 893, 4596 Eget, Ave','Spain','Madrid','26614','12/20/1966'),
  ('Cullen','Ruiz','lorem.eu.metus@hotmail.com','(873) 708-7302','P.O. Box 328, 4564 Aliquam St.','Spain','Canarias','88965','07/14/1993'),
  ('Ivy','Perez','phasellus.nulla.integer@yahoo.net','(238) 865-4253','5359 Vel, Rd.','Spain','Madrid','80164','06/06/1992'),
  ('Madaline','Carmona','eu.placerat@icloud.com','(622) 659-1693','Ap #964-1952 Et Rd.','Spain','Catalunya','16125','07/23/1978'),
  ('Mason','Jimenez','pede.et@outlook.org','(901) 544-6442','676-4046 Diam Avenue','Spain','Andalucía','63215','10/26/1960'),
  ('Haviva','Cortes','leo.cras.vehicula@icloud.org','(858) 758-4850','Ap #601-4733 Quam Road','Spain','La Rioja','74325','10/28/1955'),
  ('Forrest','Redondo','molestie.in.tempus@protonmail.org','(413) 549-3270','383-6819 Luctus Avenue','Spain','Extremadura','81771','01/10/1997'),
  ('Emery','Marin','donec.at.arcu@google.net','(147) 177-9653','4120 Eleifend Street','Spain','Melilla','10356','12/27/1972'),
  ('Eagan','Marti','turpis.in@outlook.ca','(396) 364-6979','Ap #281-7318 Mauris. St.','Spain','Castilla - La Mancha','78155','06/09/1950'),
  ('Sarah','Garrido','class.aptent@yahoo.com','(759) 582-2385','Ap #465-4394 Sem Av.','Spain','Madrid','20278','03/26/1997'),
  ('Echo','Torres','ut.sem@yahoo.edu','(786) 160-4189','807 Integer Ave','Spain','Extremadura','96256','11/20/1965'),
  ('Ferdinand','Sanz','mauris@outlook.couk','(787) 524-2326','1845 Auctor Av.','Spain','Ceuta','32009','03/24/1964'),
  ('Sonia','Miguel','odio.phasellus@google.net','(285) 639-2112','195-4809 Quisque St.','Spain','Comunitat Valenciana','35325','06/24/1957'),
  ('Wing','Ramirez','aliquam.rutrum@google.ca','(466) 271-3278','Ap #337-3974 Sit Avenue','Spain','Andalucía','54505','11/12/1956'),
  ('Aiko','Moreno','facilisis.lorem@outlook.com','(346) 723-6444','156-2954 Duis St.','Spain','Aragón','05852','03/30/1950'),
  ('Natalie','Mora','luctus.et@hotmail.ca','(762) 660-9866','Ap #388-6910 Nisi. St.','Spain','Comunitat Valenciana','47185','01/02/1984'),
  ('Ivory','Castillo','sem.molestie@google.ca','(376) 884-3246','P.O. Box 173, 5255 Mus. Av.','Spain','Melilla','48584','07/09/1989'),
  ('Quemby','Calvo','integer.aliquam@google.edu','(988) 230-8148','Ap #962-2022 Vitae Av.','Spain','Madrid','43059','04/27/2002'),
  ('Quail','Bravo','cras.eget@protonmail.ca','(323) 414-6675','594-5731 Dolor Street','Spain','Principado de Asturias','15648','10/29/1951'),
  ('Alma','Gonzalez','est.nunc.ullamcorper@yahoo.net','(948) 265-0853','977-6283 Ante St.','Spain','Euskadi','94116','08/25/2004'),
  ('Lawrence','Caballero','aliquam.enim.nec@yahoo.edu','(887) 329-6775','Ap #366-6355 Diam St.','Spain','Principado de Asturias','48276','06/08/1966'),
  ('Lucy','Fuentes','sociosqu.ad@icloud.edu','(657) 840-8362','821-1698 Pellentesque Ave','Spain','Melilla','50643','10/21/1967'),
  ('Meghan','Flores','hendrerit.id@outlook.com','(450) 548-6557','Ap #735-778 Egestas Ave','Spain','Navarra','51421','01/06/2003'),
  ('Hiram','Gonzalez','in.consectetuer@hotmail.com','(520) 842-2478','P.O. Box 112, 1819 Tristique St.','Spain','Madrid','57883','04/18/1979'),
  ('Thaddeus','Alvarez','vivamus.euismod.urna@hotmail.net','(892) 118-5687','930-3531 Curabitur Rd.','Spain','Navarra','28504','07/18/1978'),
  ('Alma','Mora','enim.suspendisse@outlook.com','(735) 776-7968','P.O. Box 197, 8841 Tempus Rd.','Spain','Madrid','91787','05/20/1950'),
  ('Cathleen','Vila','pharetra@hotmail.edu','(113) 747-6805','P.O. Box 629, 6882 Arcu. Street','Spain','Castilla y León','23566','12/03/2003'),
  ('Astra','Serrano','ipsum.primis@icloud.couk','(511) 727-2341','219-4477 A St.','Spain','Canarias','77430','04/22/1961'),
  ('Samantha','Castro','curabitur.massa.vestibulum@outlook.net','(743) 368-7153','P.O. Box 224, 1169 Amet Road','Spain','Euskadi','88861','06/06/1977'),
  ('Wade','Herrera','tempus@protonmail.com','(522) 934-2235','P.O. Box 713, 4167 Proin St.','Spain','La Rioja','05265','04/23/1963'),
  ('Jin','Casado','quis.accumsan@yahoo.couk','(800) 742-1271','Ap #705-4723 Sed Avenue','Spain','Catalunya','10988','01/30/1961'),
  ('Urielle','Nuñez','egestas.duis@protonmail.couk','(725) 583-7132','Ap #244-5475 Primis Ave','Spain','Galicia','12262','12/14/1992'),
  ('Delilah','Andres','donec.vitae.erat@protonmail.com','(821) 754-5671','535-5660 Convallis Ave','Spain','Extremadura','61020','03/06/1991'),
  ('Kevin','Diaz','purus@yahoo.org','(430) 964-0284','Ap #605-642 Mi Street','Spain','Ceuta','02788','01/30/2005'),
  ('Thaddeus','Lopez','feugiat.non@hotmail.net','(876) 740-2287','169-5691 Aliquet Street','Spain','Principado de Asturias','42210','11/03/1973'),
  ('Dale','Mendez','lacinia.sed@google.com','(499) 736-4622','7173 Integer Avenue','Spain','Extremadura','82189','08/23/2005'),
  ('Igor','Molina','massa.mauris.vestibulum@hotmail.edu','(355) 847-7772','P.O. Box 364, 3280 Ut Rd.','Spain','Galicia','71522','03/05/1953'),
  ('Frances','Navarro','vulputate.dui@protonmail.org','(982) 529-7345','Ap #402-7000 Elementum St.','Spain','Castilla - La Mancha','44536','07/13/1979'),
  ('Irene','Muﾑoz','lacus@icloud.couk','(766) 257-8087','741-3638 Congue, St.','Spain','Principado de Asturias','83810','04/23/1998'),
  ('Laura','Fuentes','arcu.vestibulum@outlook.org','(892) 517-1647','Ap #492-3817 Ante. Street','Spain','Castilla - La Mancha','36489','07/11/2002'),
  ('Zorita','Vila','eu@aol.couk','(460) 915-1123','Ap #189-8208 Cum Ave','Spain','Murcia','86818','02/08/1972'),
  ('Teegan','Perez','montes.nascetur.ridiculus@aol.couk','(549) 279-1558','P.O. Box 576, 2348 Molestie Ave','Spain','Melilla','39859','03/08/1971'),
  ('Jaime','Fuentes','adipiscing.mauris.molestie@icloud.ca','(844) 538-6252','3968 Lorem, St.','Spain','Madrid','64364','05/03/1983'),
  ('Rae','Garrido','ipsum.phasellus@yahoo.couk','(573) 616-0506','P.O. Box 799, 2821 Enim Ave','Spain','Castilla - La Mancha','12734','12/06/1952'),
  ('Yeo','Jimenez','orci.ut@google.couk','(928) 766-0545','193-1319 A, Ave','Spain','Extremadura','48972','04/13/1964');
INSERT INTO [Clientes] (Nombre,Apellido,Email,Telefono,Direccion,Pais,ComunidadAutonoma,Cod_Postal,FechaNacimiento)
VALUES
  ('Tad','Mendez','pellentesque.habitant@protonmail.com','(650) 341-8952','P.O. Box 902, 7886 Luctus Road','Spain','Euskadi','21146','09/15/1952'),
  ('Brynn','Santana','vivamus@hotmail.org','(926) 395-6545','6512 Mauris Avenue','Spain','Euskadi','17663','06/26/1994'),
  ('Portia','Alvarez','dis.parturient@icloud.couk','(823) 380-1345','Ap #554-7785 Fermentum Ave','Spain','Galicia','35797','04/08/1993'),
  ('India','Martin','et.ipsum@yahoo.ca','(895) 736-7483','494-8213 Arcu. Avenue','Spain','Galicia','01192','06/16/1970'),
  ('Martin','Diez','lacus.aliquam@aol.net','(557) 308-9750','Ap #332-1642 Interdum Av.','Spain','Cantabria','28663','01/08/1995'),
  ('Tanisha','Duran','cursus.nunc.mauris@google.couk','(845) 848-4638','7824 Consequat Avenue','Spain','Principado de Asturias','48833','09/08/1959'),
  ('Perry','Herrera','aenean.euismod@yahoo.ca','(742) 563-3516','P.O. Box 349, 4099 Magna Rd.','Spain','Principado de Asturias','76055','02/26/1971'),
  ('Ferris','Alonso','diam.proin@yahoo.net','(312) 670-2909','370-4560 Dapibus Rd.','Spain','Principado de Asturias','13255','04/17/2003'),
  ('MacKenzie','Lorenzo','ornare.sagittis@aol.com','(880) 727-6860','Ap #581-245 At St.','Spain','Cantabria','07128','10/09/1960'),
  ('Mechelle','Garrido','rutrum.fusce@outlook.edu','(358) 756-1947','363-6830 Nullam Av.','Spain','Principado de Asturias','53829','03/03/1995'),
  ('Hector','Sanchez','sed.et.libero@outlook.net','(866) 471-8465','Ap #634-4596 Dolor Ave','Spain','Ceuta','15882','05/12/1966'),
  ('Azalia','Castillo','sodales.mauris@yahoo.couk','(191) 517-4118','Ap #712-8095 Egestas Street','Spain','Murcia','22248','07/23/1981'),
  ('Todd','Santana','fringilla.est.mauris@aol.ca','(747) 204-0957','P.O. Box 189, 8700 Vitae, Rd.','Spain','Navarra','56283','06/21/1984'),
  ('Wendy','Crespo','quis.lectus@aol.org','(513) 348-7636','9052 Sollicitudin Ave','Spain','La Rioja','41136','02/23/1955'),
  ('Lyle','Carmona','aliquam.vulputate.ullamcorper@aol.couk','(542) 750-9528','9650 Et St.','Spain','Comunitat Valenciana','91776','08/25/2004'),
  ('Cara','Pascual','pellentesque@google.net','(870) 584-9304','356-368 Metus. Road','Spain','Comunitat Valenciana','56664','01/22/1990'),
  ('Phoebe','Delgado','eu.ultrices.sit@protonmail.couk','(250) 115-1826','P.O. Box 163, 4620 Rutrum St.','Spain','Castilla y León','16177','10/05/1990'),
  ('Pascale','Suarez','neque.tellus@google.net','(872) 458-3852','2552 Velit. Av.','Spain','Illes Balears','50696','01/02/1957'),
  ('Gretchen','Gomez','lacinia.vitae@icloud.couk','(838) 577-3352','822-9907 Taciti Street','Spain','Illes Balears','16347','06/04/2000'),
  ('Malcolm','Fernandez','nulla.integer@outlook.ca','(522) 333-9958','P.O. Box 737, 6563 Per Avenue','Spain','Ceuta','34358','06/13/2003'),
  ('Katelyn','Navarro','massa.lobortis@yahoo.couk','(268) 148-4520','P.O. Box 882, 3212 Pellentesque Rd.','Spain','Melilla','78771','05/14/2000'),
  ('Kalia','Redondo','morbi.accumsan@outlook.org','(832) 386-6967','160-9311 Per St.','Spain','Aragón','53233','08/05/1981'),
  ('Pandora','Reyes','imperdiet.non.vestibulum@protonmail.ca','(416) 568-1639','247-4826 Vivamus Rd.','Spain','Castilla - La Mancha','76838','07/16/1960'),
  ('Randall','Garrido','quisque@google.ca','(395) 316-0197','Ap #230-9834 Odio Ave','Spain','Galicia','96613','11/29/1985'),
  ('Moana','Sanz','pede@hotmail.couk','(404) 715-2243','204-3625 Suspendisse Road','Spain','Madrid','25750','10/16/1959'),
  ('Bryar','Blanco','neque@hotmail.com','(371) 968-7232','Ap #539-5506 Mi Rd.','Spain','Murcia','65573','06/13/1952'),
  ('Lars','Ferrer','ipsum@yahoo.ca','(274) 683-3442','Ap #789-4145 Scelerisque Road','Spain','Illes Balears','85359','09/12/1972'),
  ('Rahim','Herrera','id@icloud.net','(634) 627-8205','9953 Neque Ave','Spain','Melilla','10963','09/13/1988'),
  ('Martena','Muñoz','dapibus.quam.quis@google.net','(464) 994-9538','3401 Fusce Rd.','Spain','La Rioja','89107','08/10/1952'),
  ('Quentin','Iba','lobortis.augue.scelerisque@google.org','(556) 804-4931','328-284 Ac, Street','Spain','Melilla','68486','10/04/1952'),
  ('Haviva','Campos','nisl@google.org','(191) 786-4838','Ap #799-3099 Semper Rd.','Spain','Murcia','54150','07/24/1953'),
  ('Kelsey','Saez','augue@aol.net','(641) 587-5184','P.O. Box 656, 8923 Aliquet. St.','Spain','Castilla - La Mancha','07714','03/18/1953'),
  ('Hadley','Moreno','nisi.magna.sed@protonmail.ca','(875) 521-6043','Ap #812-9434 Porttitor Ave','Spain','Melilla','27685','06/12/1974'),
  ('Eve','Soler','non.ante@yahoo.couk','(276) 391-8167','P.O. Box 491, 8712 Velit Av.','Spain','Extremadura','61045','12/12/1960'),
  ('Fletcher','Ramos','cursus.et.magna@protonmail.couk','(469) 658-0605','Ap #924-9663 Quisque Street','Spain','Andalucía','08354','03/10/1992'),
  ('Kennedy','Cabrera','curabitur.dictum@outlook.com','(885) 173-7990','7551 Feugiat Rd.','Spain','Extremadura','54724','04/28/1953'),
  ('Shay','Muñoz','feugiat@outlook.com','(414) 562-8231','P.O. Box 923, 7353 In Rd.','Spain','Cantabria','59145','03/29/1955'),
  ('Audrey','Ruiz','fringilla@yahoo.net','(263) 487-2726','Ap #632-5186 Placerat Ave','Spain','Ceuta','18363','11/29/1955'),
  ('Kaye','Leon','arcu.sed.et@protonmail.edu','(723) 666-2557','P.O. Box 539, 4357 Luctus Avenue','Spain','Navarra','29154','11/06/1952'),
  ('Lareina','Alonso','quisque.nonummy.ipsum@aol.edu','(441) 296-1737','288-6302 In Avenue','Spain','Catalunya','69345','11/14/1984'),
  ('Nevada','Mora','sollicitudin.commodo@aol.couk','(533) 917-8591','6484 Dis Rd.','Spain','Castilla y León','74448','01/02/1989'),
  ('Lacota','Garrido','aliquam.ultrices.iaculis@aol.org','(335) 436-5340','1958 Adipiscing Road','Spain','Andalucía','84434','07/26/1963'),
  ('Caleb','Cano','non@aol.edu','(964) 654-2868','Ap #867-7715 Aliquam Ave','Spain','Madrid','68043','06/26/1979'),
  ('Oliver','Cruz','ut.sem@hotmail.org','(918) 617-4742','P.O. Box 380, 2142 Interdum Street','Spain','Madrid','37538','03/26/1958'),
  ('Timon','Guerrero','quisque.tincidunt@protonmail.com','(856) 587-7357','Ap #663-4372 Erat. Road','Spain','Catalunya','75752','05/04/1950'),
  ('Amethyst','Ferrer','eu.odio@icloud.ca','(283) 390-7448','222 Tincidunt Ave','Spain','Ceuta','80990','10/04/1989'),
  ('Cole','Jimenez','facilisis.non@yahoo.net','(454) 312-4943','6379 Elit, St.','Spain','Andalucía','12648','09/03/1961'),
  ('Derek','Mora','aliquam.arcu@google.couk','(260) 729-6584','Ap #236-8738 Nunc Rd.','Spain','La Rioja','71160','09/25/1986'),
  ('Shoshana','Gonzalez','velit.eget@yahoo.ca','(487) 375-5088','P.O. Box 302, 4040 Mi. Ave','Spain','Andalucía','15831','12/11/2003'),
  ('Shay','Marti','nisi@hotmail.edu','(553) 184-5125','436-793 Aliquam Avenue','Spain','Cantabria','17275','05/18/1965');
INSERT INTO [Clientes] (Nombre,Apellido,Email,Telefono,Direccion,Pais,ComunidadAutonoma,Cod_Postal,FechaNacimiento)
VALUES
  ('Jason','Serrano','faucibus.ut@protonmail.com','(254) 675-2487','Ap #531-4315 Ornare, Avenue','Spain','La Rioja','18423','07/24/1953'),
  ('Colton','Gil','adipiscing.elit@hotmail.com','(484) 224-7474','P.O. Box 882, 5162 Quam Av.','Spain','La Rioja','51007','06/09/1970'),
  ('Acton','Iba','amet.risus@outlook.edu','(537) 582-2676','1572 Amet Ave','Spain','Euskadi','50173','07/17/1984'),
  ('Xavier','Cortes','velit.sed@google.net','(851) 897-6303','Ap #990-6709 Sed Road','Spain','Madrid','84516','12/02/1992'),
  ('Iola','Jimenez','ac@yahoo.couk','(325) 187-3905','159-6115 Risus, Rd.','Spain','Murcia','75778','01/10/2005'),
  ('Mikayla','Esteban','dui@yahoo.ca','(557) 848-5554','P.O. Box 936, 5900 Malesuada. Av.','Spain','Comunitat Valenciana','71383','03/23/1996'),
  ('Orla','Torres','ut@icloud.net','(464) 547-7965','7697 Volutpat. St.','Spain','Navarra','65319','08/02/1971'),
  ('Melinda','Torres','tristique.pharetra@protonmail.couk','(963) 738-9258','551 Magna. Avenue','Spain','Principado de Asturias','45819','07/02/1993'),
  ('Calvin','Vega','neque@protonmail.ca','(954) 513-1643','165-9865 Bibendum. Street','Spain','Castilla y León','77216','12/12/1961'),
  ('Quin','Muñoz','arcu@outlook.couk','(112) 426-7965','975-4948 Lorem St.','Spain','Andalucía','38578','02/27/1993'),
  ('Sage','Ruiz','at.lacus@icloud.com','(517) 467-4768','3745 Sem St.','Spain','Cantabria','85291','10/06/1955'),
  ('Raphael','Leon','turpis.in.condimentum@outlook.net','(384) 402-7198','416-6683 Nunc Avenue','Spain','Andalucía','28875','03/16/2005'),
  ('Alexa','Carmona','ac@icloud.edu','(557) 674-4093','Ap #618-1861 Turpis Road','Spain','Catalunya','05507','06/09/1977'),
  ('Julie','ﾑez','cursus@icloud.ca','(664) 160-1282','Ap #662-9430 Eget, Ave','Spain','Murcia','67260','05/14/1966'),
  ('Alika','Alonso','vivamus@yahoo.net','(507) 478-8928','705-9854 Morbi Road','Spain','Galicia','45231','01/27/1961'),
  ('Risa','Reyes','ac.fermentum.vel@hotmail.com','(428) 821-9740','P.O. Box 671, 4139 Sit Road','Spain','Murcia','59315','03/22/1963'),
  ('Hasad','Castro','feugiat@yahoo.org','(721) 205-8568','Ap #372-3264 Pede. St.','Spain','Extremadura','92399','01/15/1980'),
  ('Charles','Ibañez','ut.cursus@google.edu','(522) 596-8274','3836 Arcu. St.','Spain','Madrid','57686','11/25/1963'),
  ('Moana','Crespo','sem.egestas@yahoo.org','(433) 456-7643','642-2321 Magnis Road','Spain','Illes Balears','65465','08/05/1965'),
  ('Chantale','Esteban','neque.nullam.ut@hotmail.couk','(419) 456-9810','P.O. Box 691, 6384 Hendrerit Avenue','Spain','Ceuta','11802','07/11/1961'),
  ('Marsden','Merino','ligula.nullam@google.edu','(568) 446-7981','Ap #168-9009 Amet, Rd.','Spain','Comunitat Valenciana','56875','09/17/1988'),
  ('Nichole','Lorenzo','diam.proin@hotmail.com','(842) 732-7966','Ap #972-4718 Elementum, Street','Spain','Melilla','96244','02/05/1980'),
  ('Randall','Hidalgo','erat.sed@yahoo.ca','(204) 223-1317','938-7013 Pede Road','Spain','Murcia','83812','02/16/1995'),
  ('Andrew','Santos','a@outlook.edu','(313) 326-7271','P.O. Box 879, 2774 Lacus. Road','Spain','Catalunya','89241','08/05/1952'),
  ('Jeanette','Reyes','eleifend.nunc@aol.ca','(624) 286-8554','P.O. Box 568, 906 Magna. St.','Spain','Principado de Asturias','93046','08/16/1968'),
  ('Emmanuel','Arias','integer.vulputate@icloud.ca','(267) 557-5276','Ap #437-5967 Aliquam Rd.','Spain','Cantabria','78423','08/09/1967'),
  ('Tad','Herrero','fusce.diam@google.couk','(288) 868-1881','Ap #167-9753 Imperdiet Rd.','Spain','Canarias','86446','09/01/1972'),
  ('Patricia','Santana','lorem.ipsum.dolor@outlook.com','(253) 723-5631','7217 Orci Av.','Spain','Euskadi','87414','07/28/1990'),
  ('Yoshi','Castro','egestas.a.dui@icloud.couk','(338) 819-2879','7668 Massa. Rd.','Spain','Madrid','17315','11/13/1959'),
  ('Shannon','Moreno','adipiscing.elit@outlook.edu','(873) 778-8975','Ap #923-185 Sollicitudin Avenue','Spain','Canarias','83366','05/29/1980'),
  ('Ivy','Navarro','mattis@icloud.ca','(263) 888-7389','961-9614 Rutrum, St.','Spain','Galicia','36555','03/04/1954'),
  ('Beau','Blanco','sem.vitae@protonmail.com','(382) 784-5134','Ap #868-4654 Vehicula Road','Spain','Canarias','73430','03/02/1985'),
  ('Rosalyn','Miguel','sit.amet@protonmail.ca','(171) 743-7468','Ap #866-5161 Dolor Rd.','Spain','Madrid','06257','08/06/1969'),
  ('Lael','Jimenez','non.egestas@icloud.net','(897) 411-9554','291-5649 Aliquam Road','Spain','Castilla - La Mancha','02838','04/08/1954'),
  ('Noel','Sanz','pretium.et.rutrum@aol.org','(582) 654-3114','303-6249 Cursus Av.','Spain','Madrid','46587','03/03/1972'),
  ('Ila','Cruz','fusce.mi@hotmail.edu','(895) 162-3308','Ap #529-9081 Metus Road','Spain','Ceuta','53747','01/08/1952'),
  ('Lucas','Garrido','ac.fermentum@icloud.com','(667) 459-0313','6034 A, Av.','Spain','Comunitat Valenciana','13613','05/23/1960'),
  ('Indira','Ferrer','quisque.varius@google.ca','(317) 866-3555','Ap #704-8337 Urna. Av.','Spain','Castilla - La Mancha','86245','04/26/1990'),
  ('Sydney','Garcia','dolor@outlook.org','(367) 497-4845','P.O. Box 362, 344 Montes, Av.','Spain','Galicia','12927','06/25/1952'),
  ('Burton','Morales','nulla@hotmail.net','(275) 417-2483','626-2593 Eros. Rd.','Spain','Canarias','47689','11/26/1980'),
  ('Gray','Mora','justo@yahoo.com','(294) 322-4348','Ap #866-6527 Integer Av.','Spain','Canarias','77328','12/30/1959'),
  ('Emi','Carmona','ante.dictum@outlook.com','(688) 895-3708','9203 Etiam St.','Spain','Madrid','73515','07/03/1991'),
  ('Natalie','Romero','mattis.ornare@hotmail.edu','(309) 541-6165','392 Ut Av.','Spain','Principado de Asturias','26086','02/18/1974'),
  ('Willow','Montero','tellus.justo@hotmail.ca','(466) 412-4728','Ap #867-4217 At St.','Spain','Cantabria','11536','05/15/1978'),
  ('Christen','Nieto','mollis.vitae@yahoo.edu','(722) 971-6987','820-1143 Sed Rd.','Spain','Andalucía','53592','10/21/1986'),
  ('John','Prieto','cursus.luctus@outlook.ca','(583) 623-2240','P.O. Box 713, 1776 Elit, Av.','Spain','Melilla','40373','07/04/1985'),
  ('Emerald','Velasco','tincidunt.tempus.risus@google.edu','(248) 540-6387','P.O. Box 325, 5180 Donec Street','Spain','Cantabria','58273','03/21/1990'),
  ('Alfonso','Alvarez','urna.et@hotmail.ca','(295) 977-6354','P.O. Box 608, 8785 Magnis Ave','Spain','Principado de Asturias','35431','12/01/1971'),
  ('Kyle','Pascual','metus@google.edu','(139) 426-3952','958-1251 Cursus. Rd.','Spain','Canarias','02987','02/21/1964'),
  ('Xavier','Vidal','erat@google.couk','(459) 935-3117','P.O. Box 826, 4290 Turpis St.','Spain','Ceuta','81332','09/10/2004');
INSERT INTO [Clientes] (Nombre,Apellido,Email,Telefono,Direccion,Pais,ComunidadAutonoma,Cod_Postal,FechaNacimiento)
VALUES
  ('Beau','Gallego','duis@icloud.net','(640) 535-1978','938-5252 Nibh. St.','Spain','Navarra','78104','12/06/1973'),
  ('Angelica','Vidal','donec.at@outlook.net','(530) 640-4761','P.O. Box 176, 4661 Amet Av.','Spain','Ceuta','31623','03/11/2005'),
  ('Daria','Cabrera','elementum.dui.quis@hotmail.couk','(223) 364-8408','Ap #443-1497 Lorem Av.','Spain','Navarra','49673','04/03/2000'),
  ('Kelly','Gil','hendrerit.consectetuer@protonmail.org','(387) 378-4547','7319 Ullamcorper, Av.','Spain','Euskadi','44850','02/22/1983'),
  ('Florence','Nieto','dui.fusce@yahoo.com','(546) 983-6246','631-2240 Sed, St.','Spain','Castilla y León','23661','01/30/1960'),
  ('Nicole','Hidalgo','lacus.quisque@outlook.org','(671) 722-2167','P.O. Box 797, 1296 Fringilla Av.','Spain','Principado de Asturias','19236','10/08/1950'),
  ('Melyssa','Vazquez','nec.quam@aol.org','(819) 233-5735','4759 Rutrum Road','Spain','Aragón','04886','07/13/1966'),
  ('Bert','Ortega','pharetra.ut@yahoo.org','(710) 502-2888','Ap #845-6005 Pharetra Road','Spain','Euskadi','11058','08/26/1953'),
  ('Hector','Morales','tempor@hotmail.net','(424) 985-1249','P.O. Box 850, 6322 Nulla St.','Spain','Murcia','63325','01/22/1973'),
  ('Stella','Molina','orci@aol.ca','(458) 660-7557','911-1222 Gravida. Av.','Spain','Cantabria','13534','12/27/1985'),
  ('Victoria','Aguilar','eros.nam@aol.org','(645) 947-3928','P.O. Box 306, 1777 Nibh. St.','Spain','Canarias','61487','05/15/1961'),
  ('Hyacinth','Pascual','est@outlook.ca','(951) 763-6658','P.O. Box 772, 907 Ac Road','Spain','Ceuta','07164','12/15/2005'),
  ('Michael','Torres','nulla@hotmail.edu','(278) 871-0371','8798 Pharetra, Av.','Spain','Cantabria','57716','10/17/1974'),
  ('Amethyst','Prieto','nulla.at.sem@google.com','(524) 763-9228','6393 Erat Av.','Spain','Melilla','76355','02/15/1951'),
  ('Autumn','Cabrera','tempor.erat.neque@yahoo.org','(272) 502-4723','2658 Commodo Rd.','Spain','Galicia','53768','11/04/1977'),
  ('Brenden','Izquierdo','semper.cursus@icloud.org','(874) 245-5380','2999 Sapien. St.','Spain','Navarra','27389','10/25/2000'),
  ('Lunea','Serrano','amet@icloud.edu','(877) 661-5686','644-5426 Interdum. Rd.','Spain','Canarias','74882','06/21/1959'),
  ('Thane','Castro','id.blandit@protonmail.com','(420) 651-6457','Ap #813-2397 Cras Rd.','Spain','Andalucía','66232','10/13/1981'),
  ('Rylee','Gil','quam@google.com','(287) 757-2197','Ap #705-4656 Aliquam Ave','Spain','Melilla','35286','12/04/1969'),
  ('Devin','Perez','nunc.nulla@google.org','(373) 243-2053','2229 Mauris St.','Spain','Catalunya','56528','09/21/1953'),
  ('Shad','Pastor','lacus.ut@protonmail.couk','(190) 752-7583','128-6620 Nunc Ave','Spain','Cantabria','67234','12/05/1970'),
  ('Ariel','Serrano','cursus.integer.mollis@icloud.couk','(342) 256-3271','Ap #937-4110 In Street','Spain','Comunitat Valenciana','70788','02/05/1977'),
  ('Claire','Molina','fames.ac@protonmail.ca','(153) 829-1525','Ap #861-9207 Eros Av.','Spain','Castilla y León','58332','11/10/1955'),
  ('Reuben','Prieto','habitant.morbi@hotmail.net','(501) 122-7765','149-3018 Fermentum Street','Spain','Aragón','55526','08/14/1974'),
  ('Cedric','Nuﾑez','integer@protonmail.couk','(735) 562-4539','979-1538 Non Rd.','Spain','Principado de Asturias','64835','08/07/1955'),
  ('Zane','Lopez','odio.etiam.ligula@google.net','(555) 688-5285','Ap #684-2087 Euismod St.','Spain','Aragón','11888','01/19/1977'),
  ('Macaulay','Gil','gravida.sit.amet@yahoo.edu','(997) 718-5560','955-8322 Ipsum Avenue','Spain','Castilla - La Mancha','95886','11/23/1965'),
  ('Dora','Garrido','duis.volutpat@aol.ca','(579) 925-6616','340-8367 Vel Rd.','Spain','Madrid','79926','03/02/1986'),
  ('Kerry','Santos','natoque.penatibus@outlook.org','(852) 251-3396','650 Donec Street','Spain','Euskadi','96812','06/16/1956'),
  ('Ryan','Mendez','purus@google.edu','(297) 535-4211','928-3702 Vehicula Avenue','Spain','Canarias','74726','06/21/1964'),
  ('Sage','Castillo','mollis.dui@icloud.ca','(358) 737-0777','P.O. Box 913, 927 Semper Road','Spain','Comunitat Valenciana','58054','12/08/1953'),
  ('Lydia','Pardo','feugiat.sed@outlook.net','(727) 601-3773','Ap #886-5021 Etiam Rd.','Spain','Castilla y León','66565','07/17/1987'),
  ('Jameson','Torres','pretium.aliquet@aol.org','(672) 874-8714','Ap #237-6951 Nullam Avenue','Spain','La Rioja','78910','10/13/1962'),
  ('Benjamin','Diaz','sed.eu@outlook.net','(788) 324-3112','Ap #528-7664 Tincidunt Road','Spain','Murcia','13534','06/12/1957'),
  ('Benjamin','Morales','sapien.gravida.non@protonmail.ca','(424) 164-3435','P.O. Box 559, 2886 Libero Rd.','Spain','Castilla y León','67757','08/06/2000'),
  ('Rae','Garrido','tortor.integer@aol.net','(284) 308-6939','3261 Turpis. St.','Spain','Ceuta','94666','06/11/1952'),
  ('Sara','Sanz','ut.ipsum@yahoo.net','(120) 732-7018','5331 Lorem St.','Spain','Extremadura','35536','04/19/1994'),
  ('Rashad','Gimenez','id.nunc.interdum@outlook.com','(298) 860-6263','Ap #687-8107 Eu Road','Spain','Comunitat Valenciana','15681','06/23/1961'),
  ('Isabella','Arias','morbi.sit@protonmail.couk','(499) 681-3347','819-1052 Malesuada St.','Spain','Castilla - La Mancha','42771','03/31/1954'),
  ('Daniel','Ortega','nostra@aol.net','(132) 791-8428','Ap #971-9962 Convallis, Road','Spain','Principado de Asturias','61418','08/23/2002'),
  ('Rosalyn','Cabrera','nulla.magna.malesuada@icloud.couk','(154) 651-5553','241-638 Dui Road','Spain','Catalunya','36772','12/03/1989'),
  ('Tana','Nieto','magna.cras.convallis@protonmail.ca','(613) 871-2994','126-7406 Ante Av.','Spain','Canarias','91224','02/14/1971'),
  ('Lael','Redondo','sem.elit@yahoo.ca','(457) 917-5643','Ap #737-9967 Arcu. Street','Spain','Melilla','34593','10/30/1985'),
  ('Ramona','Delgado','sem.nulla@outlook.net','(553) 430-9516','P.O. Box 183, 1402 Nisi Ave','Spain','Comunitat Valenciana','85412','06/06/1951'),
  ('Eagan','Diaz','eu.tellus@protonmail.edu','(288) 613-5918','558-2372 Purus. Street','Spain','Castilla - La Mancha','18122','10/26/1979'),
  ('Dante','Leon','neque.et@aol.ca','(243) 183-8821','414-4455 Magna Av.','Spain','Cantabria','41915','09/20/1983'),
  ('Lee','Carmona','malesuada.id.erat@hotmail.edu','(811) 318-7356','Ap #288-3297 Tristique Ave','Spain','Navarra','01653','04/01/1972'),
  ('Chandler','Gallego','eu.nulla.at@outlook.couk','(310) 758-8922','Ap #454-6573 Tellus Road','Spain','Castilla y León','18542','07/28/1958'),
  ('Marcia','Ortiz','fermentum.risus@outlook.org','(555) 473-7161','5377 Arcu. Road','Spain','Galicia','75158','12/12/1975'),
  ('Timon','Medina','magnis.dis@google.com','(475) 827-1921','814-8550 Et Avenue','Spain','Navarra','20886','01/29/1989');
INSERT INTO [Clientes] (Nombre,Apellido,Email,Telefono,Direccion,Pais,ComunidadAutonoma,Cod_Postal,FechaNacimiento)
VALUES
  ('Margaret','Navarro','donec.tempor.est@yahoo.edu','(684) 234-7212','P.O. Box 458, 4482 Scelerisque Rd.','Spain','Galicia','41878','06/10/1966'),
  ('Indira','Moya','in.faucibus@protonmail.org','(607) 148-4214','115-8365 Ipsum. St.','Spain','Andalucía','81381','06/29/1957'),
  ('Olga','Saez','volutpat.nunc.sit@yahoo.net','(613) 868-9225','984-5471 Gravida Avenue','Spain','Principado de Asturias','28266','12/08/1976'),
  ('Rylee','Sanchez','lorem.luctus.ut@icloud.couk','(427) 570-3050','Ap #650-4432 Aliquet, Avenue','Spain','Aragón','72930','07/03/1988'),
  ('Abdul','Merino','nulla@google.ca','(281) 334-1525','743-2974 Ornare Rd.','Spain','Catalunya','61315','01/27/1967'),
  ('Wesley','Merino','ipsum.dolor.sit@aol.com','(304) 826-4045','Ap #821-7079 Turpis. Ave','Spain','Murcia','83183','04/19/1989'),
  ('Jaden','Fernandez','sociis.natoque@hotmail.net','(237) 208-8542','Ap #458-9915 Sed, Rd.','Spain','Euskadi','85524','01/26/1957'),
  ('Nora','Montero','lobortis@outlook.couk','(354) 723-5352','356-8661 Tempor Road','Spain','Castilla y León','18619','09/04/1993'),
  ('Yasir','Alvarez','nunc.in@outlook.couk','(346) 832-3517','172-1262 Nisl. Av.','Spain','Ceuta','44684','06/07/1987'),
  ('Justina','Martin','cursus.integer.mollis@hotmail.com','(309) 875-8952','Ap #562-7749 Nunc Street','Spain','Principado de Asturias','25537','06/17/1963'),
  ('Portia','Redondo','lorem.vehicula.et@outlook.com','(568) 666-7360','Ap #575-4782 Tortor, Road','Spain','Madrid','17913','03/13/1975'),
  ('Holly','Fuentes','sapien@icloud.couk','(884) 202-6719','P.O. Box 467, 2824 Quisque Avenue','Spain','Illes Balears','53470','09/29/1964'),
  ('Alyssa','Diaz','nam@hotmail.com','(348) 284-3483','P.O. Box 342, 5857 Luctus Av.','Spain','Madrid','87326','06/15/1967'),
  ('Josiah','Romero','facilisis.eget@icloud.couk','(707) 467-6458','113-7554 Enim. St.','Spain','Illes Balears','86099','09/09/1956'),
  ('Zane','Rubio','accumsan@protonmail.org','(483) 755-7127','795-8462 Vestibulum Ave','Spain','Canarias','69692','04/18/1969'),
  ('Hadassah','Sanz','ornare.lectus.ante@google.couk','(392) 859-4134','412-8761 Sapien. Av.','Spain','Canarias','77152','03/21/1953'),
  ('Cleo','Martinez','et@yahoo.net','(750) 159-2010','881-4934 Tristique Rd.','Spain','Navarra','88544','01/30/1954'),
  ('Noelle','Pastor','et.euismod.et@protonmail.couk','(511) 266-8078','P.O. Box 520, 8942 Suspendisse Street','Spain','Cantabria','12364','05/02/1990'),
  ('Zachery','Gimenez','nonummy@aol.couk','(535) 230-7322','P.O. Box 818, 6729 Porttitor Rd.','Spain','Murcia','24355','02/12/1994'),
  ('Axel','Santana','lectus@yahoo.com','(377) 535-1384','Ap #890-9315 Lectus Av.','Spain','Canarias','96327','02/09/1968'),
  ('Hector','Blanco','pede@outlook.ca','(401) 348-6626','Ap #184-3750 Interdum Ave','Spain','Illes Balears','83732','10/22/1987'),
  ('Seth','Esteban','proin@google.net','(665) 620-1565','Ap #527-8732 Cursus Street','Spain','Navarra','85553','03/07/2004'),
  ('Hollee','Montero','ultrices.posuere@google.edu','(827) 717-5655','554-848 Amet Street','Spain','Catalunya','85301','04/03/1996'),
  ('Dalton','Ibañez','magnis.dis@aol.edu','(287) 117-0103','875-4739 Nulla Rd.','Spain','Ceuta','76387','04/14/1963'),
  ('Daquan','Mora','nec.diam.duis@icloud.com','(444) 722-6688','P.O. Box 287, 1761 Vitae, St.','Spain','Illes Balears','46857','04/04/1975'),
  ('Tanek','Garrido','velit@icloud.org','(659) 597-2724','Ap #466-791 Pede. Road','Spain','Comunitat Valenciana','26257','08/22/1996'),
  ('Yuli','Vicente','gravida.nunc@hotmail.com','(786) 313-8598','Ap #911-1255 Massa St.','Spain','Galicia','78652','02/25/1991'),
  ('Gray','Ortega','quis.diam.pellentesque@google.com','(174) 604-1832','403-8697 Facilisis Rd.','Spain','Catalunya','69573','11/17/1955'),
  ('Remedios','Jimenez','phasellus.at@icloud.couk','(394) 379-6556','Ap #125-4465 Commodo Road','Spain','Navarra','83221','09/26/1963'),
  ('Jorden','Alonso','auctor.nunc@icloud.net','(678) 224-9666','Ap #754-5013 Non, Avenue','Spain','Madrid','31041','11/25/1993'),
  ('Madaline','Suarez','feugiat.tellus@yahoo.net','(877) 314-3434','Ap #728-4602 Dictum Avenue','Spain','Navarra','77113','03/24/1990'),
  ('Zena','Andres','phasellus.elit@icloud.com','(354) 516-5636','Ap #892-3273 Bibendum Av.','Spain','Extremadura','27381','08/04/2000'),
  ('Ivan','Hernandez','sagittis.duis@aol.edu','(539) 749-0342','Ap #650-9407 Vivamus Rd.','Spain','La Rioja','66071','01/24/2002'),
  ('Katell','Carmona','nunc.ullamcorper.velit@yahoo.com','(966) 677-2484','355-4245 Enim Av.','Spain','Aragón','74256','02/16/1995'),
  ('Abel','Iba','sociis.natoque@hotmail.net','(555) 960-4994','P.O. Box 117, 2379 Adipiscing Rd.','Spain','Melilla','71277','12/19/1952'),
  ('Dolan','Herrera','adipiscing.enim@yahoo.couk','(721) 383-8486','7095 Elit, Road','Spain','Illes Balears','85304','10/19/2004'),
  ('Lesley','Muñoz','ante.nunc@outlook.org','(438) 438-1317','P.O. Box 723, 1426 Feugiat Street','Spain','Principado de Asturias','73657','02/02/1986'),
  ('Blossom','Ortiz','enim.consequat.purus@outlook.com','(891) 855-4948','367-9414 Libero Avenue','Spain','Murcia','84825','06/01/1990'),
  ('Tucker','Fuentes','quam.curabitur.vel@google.net','(344) 777-7196','9275 Suspendisse St.','Spain','Navarra','96473','12/01/2005'),
  ('Maisie','Romero','nunc@icloud.net','(763) 524-7624','Ap #312-7180 Et Avenue','Spain','Melilla','13475','04/02/1987'),
  ('Dylan','Nieto','in@protonmail.edu','(603) 878-3032','661 Odio, St.','Spain','Aragón','32632','05/13/1968'),
  ('Marcia','Herrero','cursus.nunc@icloud.net','(330) 376-4866','Ap #230-9658 Proin St.','Spain','Galicia','15365','09/17/1973'),
  ('Galvin','Lozano','sed.turpis@google.edu','(832) 726-3278','Ap #602-7556 Ac Av.','Spain','Cantabria','07772','08/11/1957'),
  ('Lewis','Alvarez','ullamcorper.magna.sed@yahoo.couk','(646) 843-5314','Ap #272-6278 Donec Road','Spain','Castilla - La Mancha','24465','05/12/1975'),
  ('Keefe','Moya','nisi.a.odio@icloud.net','(701) 309-7035','1274 Porttitor Avenue','Spain','Andalucía','33478','03/18/1950'),
  ('Hop','Garrido','nisi.dictum@outlook.couk','(668) 421-5042','6988 Enim. Rd.','Spain','Cantabria','05879','10/27/1958'),
  ('Victoria','Delgado','eros.nam.consequat@icloud.couk','(520) 923-7592','Ap #671-2187 Nascetur Street','Spain','Cantabria','72463','11/28/1997'),
  ('Alana','Cortes','faucibus.ut@aol.org','(111) 690-8454','P.O. Box 304, 1063 Velit. St.','Spain','Comunitat Valenciana','67477','09/19/1963'),
  ('Jessica','Gil','litora.torquent.per@aol.edu','(436) 857-1619','Ap #795-7056 Commodo Ave','Spain','Catalunya','58974','06/28/1959'),
  ('Chester','Ramos','proin.dolor@yahoo.ca','(658) 573-3726','Ap #558-1102 Arcu. Rd.','Spain','Aragón','34152','01/05/1965');

DROP TABLE IF EXISTS  Pedidos 

CREATE TABLE Pedidos (
Id int IDENTITY(1,1) PRIMARY KEY,
Fecha_pedido DATETIME NOT NULL,
Total Decimal(18,2) NOT NULL,
GastosEnvio Decimal(18,2) NOT NULL,
SubTotal Decimal(18,2) NOT NULL,
IdCliente INT NOT NULL,
Telefono varchar(200) NOT NULL,
Direccion varchar(100) NOT NULL,
Cod_Postal varchar(100) NOT NULL,
Provincia varchar(100) NOT NULL,
CONSTRAINT fkClientePedido FOREIGN KEY (IdCliente) REFERENCES Clientes(id)
)
DECLARE @Date1 datetime
SET @Date1 = '1/01/2018'

declare @contador as int= 0

while @contador<5000
BEGIN
  INSERT INTO Pedidos
  VALUES(DATEADD(DAY, cast(RAND(CHECKSUM(NEWID())) * 365*( cast(RAND(CHECKSUM(NEWID())) * 5 as INT)) as INT), @Date1),0,0,0,
  cast(RAND(CHECKSUM(NEWID())) * 500 as INT)+1,'','','','')
  set @contador=@contador +1
END

UPDATE Pedidos SET Telefono =c.Telefono,Direccion=c.Direccion,Cod_Postal=c.Cod_Postal
FROM Pedidos p
INNER JOIN Clientes c ON c.id=p.IdCliente
UPDATE pedidos set GastosEnvio=9.99
UPDATE pedidos SET GastosEnvio =6.99 WHERE Cod_Postal not like '41%'
UPDATE pedidos SET GastosEnvio =4.99 WHERE Cod_Postal like '410%'

DROP TABLE IF EXISTS  PedidosLinea 

CREATE TABLE PedidosLinea (
Id int IDENTITY(1,1) PRIMARY KEY,
IdPedido int NOT NULL,
IdMenu Int NOT NULL,
Cantidad Int NOT NULL,
PrecioVentaUnitario Decimal(18,2) NOT NULL,
IVA int NOT NULL,
CONSTRAINT fklineapedido FOREIGN KEY (IdPedido) REFERENCES Pedidos(id),
CONSTRAINT fkmenuPedido FOREIGN KEY (IdMenu) REFERENCES Menu(id)
)

INSERT INTO PedidosLinea
Values (1,1,1,0.0,1)
INSERT INTO PedidosLinea
Values (1,5,1,0.0,1)
INSERT INTO PedidosLinea
Values (1,16,1,0.0,1)
INSERT INTO PedidosLinea
Values (1,20,1,0.0,1)
INSERT INTO PedidosLinea
Values (1,21,1,0.0,1)
INSERT INTO PedidosLinea
Values (1,32,4,0.0,1)

INSERT INTO PedidosLinea
Values (2,17,2,0.0,1)

INSERT INTO PedidosLinea
Values (2,19,1,0.0,1)
INSERT INTO PedidosLinea
Values (2,19,1,0.0,1)
INSERT INTO PedidosLinea
Values (2,24,1,0.0,1)
INSERT INTO PedidosLinea
Values (2,33,1,0.0,1)


INSERT INTO PedidosLinea
Values (3,7,3,0.0,1)
INSERT INTO PedidosLinea
Values (3,12,1,0.0,1)
INSERT INTO PedidosLinea
Values (3,14,1,0.0,1)

INSERT INTO PedidosLinea
Values (3,19,1,0.0,1)

INSERT INTO PedidosLinea
Values (3,20,1,0.0,1)
INSERT INTO PedidosLinea
Values (3,21,2,0.0,1)
INSERT INTO PedidosLinea
Values (3,22,1,0.0,1)



INSERT INTO PedidosLinea
Values (4,3,1,0.0,1)
INSERT INTO PedidosLinea
Values (4,13,1,0.0,1)
INSERT INTO PedidosLinea
Values (4,13,1,0.0,1)
INSERT INTO PedidosLinea
Values (4,38,1,0.0,1)
INSERT INTO PedidosLinea
Values (4,45,1,0.0,1)

INSERT INTO PedidosLinea
Values (5,2,1,0.0,1)
INSERT INTO PedidosLinea
Values (5,6,1,0.0,1)
INSERT INTO PedidosLinea
Values (5,9,5,0.0,1)
INSERT INTO PedidosLinea
Values (5,12,1,0.0,1)

INSERT INTO PedidosLinea
Values (5,44,3,0.0,1)
INSERT INTO PedidosLinea
Values (5,38,6,0.0,1)

INSERT INTO PedidosLinea
Values (5,32,10,0.0,1)

INSERT INTO PedidosLinea
Values (6,32,4,0.0,1)
INSERT INTO PedidosLinea
Values (6,19,1,0.0,1)
INSERT INTO PedidosLinea
Values (6,20,1,0.0,1)
INSERT INTO PedidosLinea
Values (6,23,1,0.0,1)


INSERT INTO PedidosLinea
Values (7,30,1,0.0,1)
INSERT INTO PedidosLinea
Values (7,4,1,0.0,1)
INSERT INTO PedidosLinea
Values (7,8,2,0.0,1)
INSERT INTO PedidosLinea
Values (7,16,3,0.0,1)
INSERT INTO PedidosLinea
Values (7,24,1,0.0,1)
INSERT INTO PedidosLinea
Values (7,25,1,0.0,1)
INSERT INTO PedidosLinea
Values (7,26,1,0.0,1)
INSERT INTO PedidosLinea
Values (7,27,1,0.0,1)
INSERT INTO PedidosLinea
Values (7,28,1,0.0,1)

INSERT INTO PedidosLinea
Values (8,15,1,0.0,1)
INSERT INTO PedidosLinea
Values (8,19,1,0.0,1)
INSERT INTO PedidosLinea
Values (8,25,1,0.0,1)
INSERT INTO PedidosLinea
Values (8,34,1,0.0,1)


INSERT INTO PedidosLinea
Values (9,16,2,0.0,1)
INSERT INTO PedidosLinea
Values (9,21,2,0.0,1)
INSERT INTO PedidosLinea
Values (9,25,2,0.0,1)
INSERT INTO PedidosLinea
Values (9,35,2,0.0,1)

INSERT INTO PedidosLinea
Values (10,8,2,0.0,1)
INSERT INTO PedidosLinea
Values (10,32,2,0.0,1)


INSERT INTO PedidosLinea
Values (11,4,2,0.0,1)
INSERT INTO PedidosLinea
Values (11,30,2,0.0,1)
INSERT INTO PedidosLinea
Values (11,19,2,0.0,1)


INSERT INTO PedidosLinea
Values (12,2,2,0.0,1)
INSERT INTO PedidosLinea
Values (12,13,2,0.0,1)
INSERT INTO PedidosLinea
Values (12,21,2,0.0,1)

INSERT INTO PedidosLinea
Values (12,29,2,0.0,1)
INSERT INTO PedidosLinea
Values (12,30,2,0.0,1)
INSERT INTO PedidosLinea
Values (12,35,2,0.0,1)


INSERT INTO PedidosLinea
Values (13,17,4,0.0,1)
INSERT INTO PedidosLinea
Values (13,25,2,0.0,1)
INSERT INTO PedidosLinea
Values (13,24,2,0.0,1)
INSERT INTO PedidosLinea
Values (13,34,4,0.0,1)


INSERT INTO PedidosLinea
Values (14,15,1,0.0,1)
INSERT INTO PedidosLinea
Values (14,34,1,0.0,1)

INSERT INTO PedidosLinea
Values (15,11,10,0.0,1)


INSERT INTO PedidosLinea
Values (16,1,1,0.0,1)
INSERT INTO PedidosLinea
Values (16,2,1,0.0,1)
INSERT INTO PedidosLinea
Values (16,3,1,0.0,1)
INSERT INTO PedidosLinea
Values (16,4,1,0.0,1)
INSERT INTO PedidosLinea
Values (16,32,8,0.0,1)

INSERT INTO PedidosLinea
Values (17,32,4,0.0,1)

INSERT INTO PedidosLinea
Values (18,7,2,0.0,1)
INSERT INTO PedidosLinea
Values (18,17,2,0.0,1)
INSERT INTO PedidosLinea
Values (18,31,4,0.0,1)

INSERT INTO PedidosLinea
Values (19,8,1,0.0,1)
INSERT INTO PedidosLinea
Values (19,9,1,0.0,1)
INSERT INTO PedidosLinea
Values (19,18,1,0.0,1)

INSERT INTO PedidosLinea
Values (19,21,1,0.0,1)
INSERT INTO PedidosLinea
Values (19,22,1,0.0,1)
INSERT INTO PedidosLinea
Values (19,33,3,0.0,1)

INSERT INTO PedidosLinea
Values (20,12,5,0.0,1)

INSERT INTO PedidosLinea
Values (21,10,1,0.0,1)
INSERT INTO PedidosLinea
Values (21,10,1,0.0,1)
INSERT INTO PedidosLinea
Values (21,32,1,0.0,1)
INSERT INTO PedidosLinea
Values (21,34,1,0.0,1)

INSERT INTO PedidosLinea
Values (22,17,1,0.0,1)
INSERT INTO PedidosLinea
Values (22,19,1,0.0,1)
INSERT INTO PedidosLinea
Values (22,39,1,0.0,1)
INSERT INTO PedidosLinea
Values (22,38,1,0.0,1)



GO
declare @numPedidos as int =23
declare @maxPedidos as int =(select max(id) from pedidos)


while (@numPedidos<=@maxPedidos)
BEGIN 

insert into PedidosLinea
select @numPedidos,idMenu,Cantidad,PrecioVentaUnitario,iva from PedidosLinea
WHERE IdPedido=cast(RAND(CHECKSUM(NEWID())) * 23 as INT)

set @numPedidos = @numPedidos+1
END

UPDATE PedidosLinea SET PrecioVentaUnitario=m.PrecioVenta,IVA=t.IVA
FROM PedidosLinea p 
INNER JOIN MEnu m on m.Id=p.IdMenu
INNER JOIN TipoAlimento t on t.Id = m.Tipo


UPDATE Pedidos SET SubTotal = t1.subtotal
FROM Pedidos 
INNER join 
(SELECT p.id, SUM(l.Cantidad*l.PrecioVentaUnitario) as subtotal
FROM Pedidos p 
INNER JOIN PedidosLinea l on l.IdPedido=p.Id
GROUP BY p.id
) as t1 on Pedidos.Id= t1.Id

UPDATE Pedidos set total = SubTotal + GastosEnvio


Create table Correos
(
Cod_postal Varchar(5),
Provincia  Varchar(30)

)
insert into  Correos
Select '01','Álava'

insert into  Correos
Select '02','Albacete'

insert into  Correos
Select '03','Alicante'

insert into  Correos
Select '04','Almería'

insert into  Correos
Select '05','Ávila'

insert into  Correos
Select '06','Badajoz'

insert into  Correos
Select '07','Baleares'

insert into  Correos
Select '08','Barcelona'

insert into  Correos
Select '09','Burgos'

insert into  Correos
Select '10','Cáceres'

insert into  Correos
Select '11','Cádiz'

insert into  Correos
Select '12','Castellón'

insert into  Correos
Select '13','Ciudad Real'

insert into  Correos
Select '14','Córdoba'

insert into  Correos
Select '15','La Coruña'

insert into  Correos
Select '16','Cuenca'

insert into  Correos
Select '17','Girona'

insert into  Correos
Select '18','Granada'

insert into  Correos
Select '19','Guadalajara'

insert into  Correos
Select '20','Guipúzcoa'

insert into  Correos
Select '21','Huelva'

insert into  Correos
Select '22','Huesca'

insert into  Correos
Select '23','Jaén'

insert into  Correos
Select '24','León'

insert into  Correos
Select '25','Lleida'

insert into  Correos
Select '26','La Rioja'

insert into  Correos
Select '27','Lugo'

insert into  Correos
Select '28','Madrid'

insert into  Correos
Select '29','Málaga'

insert into  Correos
Select '30','Murcia'

insert into  Correos
Select '31','Navarra'

insert into  Correos
Select '32','Orense'

insert into  Correos
Select '33','Asturias'

insert into  Correos
Select '34','Palencia'

insert into  Correos
Select '35','Las Palmas'

insert into  Correos
Select '36','Pontevedra'

insert into  Correos
Select '37','Salamanca'

insert into  Correos
Select '38','Santa Cruz de Tenerife'

insert into  Correos
Select '39','Cantabria'

insert into  Correos
Select '40','Segovia'

insert into  Correos
Select '41','Sevilla'

insert into  Correos
Select '42','Soria'

insert into  Correos
Select '43','Tarragona'

insert into  Correos
Select '44','Teruel'

insert into  Correos
Select '45','Toledo'

insert into  Correos
Select '46','Valencia'

insert into  Correos
Select '47','Valladolid'

insert into  Correos
Select '48','Vizcaya'

insert into  Correos
Select '49','Zamora'

insert into  Correos
Select '50','Zaragoza'

insert into  Correos
Select '51','Ceuta'

insert into  Correos
Select '52','Melilla'

GO
Alter table Clientes add Provincia Varchar(30)
GO
update clientes set Provincia = Correos.Provincia
from clientes 
inner join Correos on Left(clientes.Cod_Postal,2)=Correos.Cod_postal
update pedidos set Provincia = Correos.Provincia
from pedidos 
inner join Correos on Left(pedidos.Cod_Postal,2)=Correos.Cod_postal

SET NOCOUNT OFF
PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''
PRINT 'Base de Datos del Arepazo, cargada correctamente. Gracias por la paciencia'
PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''
