go
use master
GO
drop database if exists mutenroshisushi
GO

create database mutenroshisushi
go

use mutenroshisushi

IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('Clientes'))
BEGIN;
    DROP TABLE [Clientes];
END;
GO

CREATE TABLE [Clientes] (
    [idCliente] INTEGER NOT NULL IDENTITY(1, 1),
    [nombre] VARCHAR(255) NULL,
    [telefono] VARCHAR(100) NULL,
    [email] VARCHAR(255) NULL,
    [direccion] VARCHAR(255) NULL,
    [cod_postal] VARCHAR(10) NULL,
    [ComAutonoma] VARCHAR(50) NULL,
    [Pais] VARCHAR(100) NULL,
    [contrasenya] VARCHAR(255) NULL,
    PRIMARY KEY ([idCliente])
);
GO

create table Menu(

idMenu int identity(1,1) Primary Key,
nombre varchar(100) not null,
precio decimal(5,2) not null
)

create table Sushi
(
idSushi int identity(1,1) Primary Key,
nombre varchar(100) not null,
PrecioCosteIngrediente decimal(5,2) not null
)

create table MenuSushi (
idMenu int,
idSushi int,
cantidad int not null,
Primary key (idMenu,idSushi),
CONSTRAINT fkpizza2 FOREIGN KEY (idMenu) REFERENCES Menu(idMenu),
CONSTRAINT fkIngrediente2 FOREIGN KEY (idSushi) REFERENCES Sushi(idSushi)
)


create table Pedidos
(
    idPedido int IDENTITY(1,1) Primary Key,
    fecha datetime,
    idCliente int not null, 
    constraint fkclientes FOREIGN KEY(idcliente) REFERENCES Clientes(idCliente),
    SubTotal decimal(6,2) not null,
    GastosEnvio decimal(6,2) not null,
    Total decimal(6,2) not null,
    direccionEntrega varchar(255),
    telefonoEntrega varchar(100),
    [cod_postalEntrega] VARCHAR(10) NULL,
    [ComAutonomaEntrega] VARCHAR(50) NULL,
)

create table Detalle(
idPedido int,
idMenu int,
Cantidad int,
PrecioUnitario Decimal(5,2)
constraint fkpedidodetalle FOREIGN KEY(idPedido) REFERENCES Pedidos(idPedido),
constraint fkPizzadetalle FOREIGN KEY(idMenu) REFERENCES Menu(idMenu),
PRIMARY KEY(idpedido,idMenu)

)

insert into Menu
values('Menu 1',10.50),
('Menu 2',14.0),
('Menu 3',12.5),
('Menu 4',12.95),
('Menu 5',15.5),
('Menu 6',14.95),
('Menu 7',7.5),
('Menu 8',12.5),
('Menu 9',15.50),
('Menu 10',18.5),
('Menu 11',17.5),
('Menu 12',17.9),
('Menu 13',22.5),
('Menu 14',43.95)

insert into Sushi
values ('nigiris',1),
('uramakis',1.0),
('makis',0.75),
('spring rolls',2.0),
('crunchs',2.5),
('sashimis',0.5),
('gunkans',1.5)

Declare @idmenu int 

set @idmenu=(select idmenu from menu where nombre='Menu 1')
insert into MenuShushi
select @idmenu,idSushi,3 from Sushi 
where nombre in ('nigiris')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('makis')
insert into MenuShushi
select @idmenu,idSushi,3 from Sushi 
where nombre in ('sashimis')


set @idmenu=(select idmenu from menu where nombre='Menu 2')
insert into MenuShushi
select @idmenu,idSushi,6 from Sushi 
where nombre in ('nigiris')
insert into MenuShushi
select @idmenu,idSushi,4 from Sushi 
where nombre in ('uramakis')



set @idmenu=(select idmenu from menu where nombre='Menu 3')
insert into MenuShushi
select @idmenu,idSushi,6 from Sushi 
where nombre in ('nigiris')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('uramakis')


set @idmenu=(select idmenu from menu where nombre='Menu 4')
insert into MenuShushi

select @idmenu,idSushi,8 from Sushi 
where nombre in ('nigiris')
insert into MenuShushi
select @idmenu,idSushi,6 from Sushi 
where nombre in ('uramakis')


set @idmenu=(select idmenu from menu where nombre='Menu 5')
insert into MenuShushi
select @idmenu,idSushi,5 from Sushi 
where nombre in ('nigiris')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('makis')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('uramakis')


set @idmenu=(select idmenu from menu where nombre='Menu 6')
insert into MenuShushi
select @idmenu,idSushi,3 from Sushi 
where nombre in ('nigiris')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('makis')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('uramakis')


set @idmenu=(select idmenu from menu where nombre='Menu 7')
insert into MenuShushi
select @idmenu,idSushi,2 from Sushi 
where nombre in ('nigiris')
insert into MenuShushi
select @idmenu,idSushi,4 from Sushi 
where nombre in ('makis')
insert into MenuShushi
select @idmenu,idSushi,4 from Sushi 
where nombre in ('uramakis')


set @idmenu=(select idmenu from menu where nombre='Menu 8')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('nigiris')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('makis')



set @idmenu=(select idmenu from menu where nombre='Menu 9')
insert into MenuShushi
select @idmenu,idSushi,4 from Sushi 
where nombre in ('nigiris')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('makis')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('crunchs')


set @idmenu=(select idmenu from menu where nombre='Menu 10')
insert into MenuShushi
select @idmenu,idSushi,6 from Sushi 
where nombre in ('nigiris')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('uramakis')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('spring rolls')


set @idmenu=(select idmenu from menu where nombre='Menu 11')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('uramakis')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('makis')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('spring rolls')


set @idmenu=(select idmenu from menu where nombre='Menu 12')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('uramakis')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('makis')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('crunchs')


set @idmenu=(select idmenu from menu where nombre='Menu 13')
insert into MenuShushi
select @idmenu,idSushi,12 from Sushi 
where nombre in ('nigiris')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('makis')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('crunchs')


set @idmenu=(select idmenu from menu where nombre='Menu 14')
insert into MenuShushi
select @idmenu,idSushi,16 from Sushi 
where nombre in ('nigiris')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('makis')
insert into MenuShushi
select @idmenu,idSushi,8 from Sushi 
where nombre in ('uramakis')


INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Burton Mora','(338) 367-6747','burtonmora8911@aol.org','Ap #988-948 At, Av.','60516','Comunitat Valenciana','Spain','TNH94IDA1ZG'),
  ('Amanda Peña','(152) 551-5631','amandapea4041@protonmail.com','4765 Metus. Rd.','37275','Navarra','Spain','SLW13FPE5ZF'),
  ('Sharon Miguel','1-935-571-1242','sharonmiguel3@aol.ca','Ap #358-5808 Interdum St.','49027','Canarias','Spain','FYL29LMV4FO'),
  ('Barbara Navarro','1-806-302-1676','barbaranavarro6161@yahoo.com','Ap #313-3730 Urna Street','35840','Galicia','Spain','IYU03NKP2TW'),
  ('Edan Navarro','(474) 746-7508','edannavarro1814@yahoo.org','Ap #964-5818 Eu Rd.','30424','Comunitat Valenciana','Spain','CFX35EMR1JB'),
  ('Hashim Iglesias','(288) 637-9657','hashimiglesias@aol.org','Ap #682-1614 Semper Road','12391','Murcia','Spain','BLV54QYF6JT'),
  ('Yuri Pascual','1-978-856-5755','yuripascual3135@hotmail.couk','Ap #573-1359 Mus. Street','78354','Andalucía','Spain','GKH22VKH7MW'),
  ('Alika Duran','(855) 698-7433','alikaduran8066@google.edu','P.O. Box 147, 3626 A Street','58645','Comunitat Valenciana','Spain','FMM58RSK7EM'),
  ('Oscar Vila','(751) 108-1562','oscarvila6320@hotmail.edu','803-9688 Urna Av.','47325','La Rioja','Spain','GUQ78POE1IT'),
  ('Charles Diez','1-745-353-1616','charlesdiez@icloud.org','670-3784 Dui. St.','74384','Castilla - La Mancha','Spain','EKI11DTY4GD');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Illana Ramos','(455) 345-0613','illanaramos5523@icloud.org','Ap #766-4139 Vel, Street','03208','Extremadura','Spain','DLY20VNK9IK'),
  ('Sharon Pascual','1-866-328-1961','sharonpascual9563@aol.org','Ap #526-7089 Hendrerit Av.','26734','Illes Balears','Spain','OPF75RUY8MW'),
  ('Garth Medina','(355) 781-6571','garthmedina@yahoo.edu','277-1070 Pharetra St.','12069','Comunitat Valenciana','Spain','PUI13WMF1QF'),
  ('Gannon Nuﾑez','(398) 725-8772','gannonnuez@aol.ca','Ap #886-7356 Pharetra, St.','69519','Aragón','Spain','TWA86TBS7SY'),
  ('Norman Prieto','1-726-768-5356','normanprieto562@yahoo.org','7355 Velit. Road','50158','Extremadura','Spain','JQO77WWZ7CT'),
  ('Ahmed Ramos','1-848-303-1273','ahmedramos@protonmail.net','Ap #160-8359 Dis St.','82413','Melilla','Spain','HOM27CGS4WD'),
  ('Maggie Gimenez','1-375-894-7015','maggiegimenez1778@aol.org','2871 Egestas. Avenue','42446','Navarra','Spain','LTM41CUZ0ZT'),
  ('Dylan Duran','1-828-898-8581','dylanduran@aol.com','P.O. Box 910, 8268 Fames Road','72686','Illes Balears','Spain','TBS53VUX3YM'),
  ('Lev Romero','1-519-479-6920','levromero5003@icloud.edu','Ap #748-2338 Eu Rd.','68587','La Rioja','Spain','BGQ61CGK1FA'),
  ('Reese Nuñez','1-383-835-1879','reesenuez@outlook.org','P.O. Box 591, 5719 Mauris. Avenue','51787','Catalunya','Spain','UMO94ITQ8II');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Jacob Soler','(786) 278-0947','jacobsoler@outlook.org','Ap #281-1400 Consectetuer Street','84635','Galicia','Spain','WMC25CRQ1JK'),
  ('Christopher Pastor','1-973-267-4885','christopherpastor9918@hotmail.org','5552 Vestibulum St.','48961','Navarra','Spain','IBN67MYQ0DW'),
  ('Solomon Dominguez','(324) 803-3753','solomondominguez@hotmail.ca','498-5096 Sollicitudin Av.','47846','Euskadi','Spain','NYQ64DSR4DM'),
  ('Armando Rubio','(718) 482-1351','armandorubio413@icloud.couk','P.O. Box 888, 5881 Vulputate Avenue','49841','Comunitat Valenciana','Spain','GPT78XJI1YA'),
  ('Kimberly Marti','(832) 474-8086','kimberlymarti4908@google.net','Ap #636-3675 Tempor Road','96609','Cantabria','Spain','BTE75KQH7NO'),
  ('Davis Gomez','1-474-364-3855','davisgomez@icloud.org','2397 Eget Rd.','54445','Melilla','Spain','VUE26FYI8NB'),
  ('September Perez','1-667-847-1578','septemberperez8231@hotmail.net','967-1433 In Av.','35522','Madrid','Spain','OZJ13CJX7VE'),
  ('Maya Iba','(495) 766-8991','mayaiba2683@protonmail.com','377-7188 Urna, Street','16279','Canarias','Spain','WDK06TXY8EM'),
  ('Wynter Arias','(575) 978-2622','wynterarias8588@outlook.ca','Ap #973-8544 Odio, St.','10713','Cantabria','Spain','ELL52KLJ6NS'),
  ('Tate Mora','(359) 205-5556','tatemora@hotmail.net','811-1302 Sit Rd.','30766','Andalucía','Spain','EOW82SMS4BB');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Rose Navarro','1-474-767-2475','rosenavarro4298@protonmail.ca','Ap #254-1188 Ut St.','11309','Melilla','Spain','GXT31ITK6EZ'),
  ('Macey Prieto','1-512-955-7387','maceyprieto4474@hotmail.org','167-7865 Vitae Avenue','54406','Principado de Asturias','Spain','SHL37LLA2YT'),
  ('Nicholas Ramirez','(605) 467-7902','nicholasramirez3031@google.com','Ap #663-6504 Parturient St.','14818','Cantabria','Spain','ITY31ETI8JE'),
  ('Demetrius Leon','(898) 481-7562','demetriusleon@outlook.ca','Ap #496-7592 Erat St.','00302','Catalunya','Spain','DOE23JSN1OA'),
  ('Beck Castillo','(663) 558-4707','beckcastillo8199@yahoo.couk','Ap #464-8186 Scelerisque Street','77853','Cantabria','Spain','NKE84VPE7BK'),
  ('Cadman Aguilar','(253) 828-5365','cadmanaguilar4167@google.edu','415-663 Quam Av.','61416','Illes Balears','Spain','TRF91IOC4BJ'),
  ('Hillary Navarro','(858) 506-0741','hillarynavarro@yahoo.org','360-3975 Dolor St.','44238','Catalunya','Spain','YHV24BZX8SF'),
  ('Gareth Cabrera','(433) 862-1455','garethcabrera281@icloud.couk','246-2153 Pede. Rd.','02631','La Rioja','Spain','UYO22STG5HW'),
  ('Quin Hidalgo','(978) 618-0395','quinhidalgo@aol.net','691-1072 Non, Ave','01335','Illes Balears','Spain','BRP52MKW8SR'),
  ('Lacey Muﾑoz','(172) 673-0281','laceymuoz6086@yahoo.com','6245 Aliquet St.','45138','Comunitat Valenciana','Spain','LDP87SYK0BZ');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Kirby Vega','(711) 862-4872','kirbyvega@icloud.net','P.O. Box 391, 5145 Arcu Ave','68267','Navarra','Spain','MRM43FXP5YQ'),
  ('Neville Casado','(547) 724-5792','nevillecasado38@hotmail.edu','Ap #547-5934 Ipsum St.','42710','Euskadi','Spain','EEM68HPT5OS'),
  ('Dorothy Medina','(913) 726-7820','dorothymedina@aol.net','518-3495 Fermentum Road','48342','Canarias','Spain','FKK45UHS7BQ'),
  ('Chester Rodriguez','1-458-522-0117','chesterrodriguez9833@outlook.org','Ap #191-4323 Malesuada St.','43799','Galicia','Spain','MUG55PHF2HB'),
  ('Paloma Prieto','1-187-409-6616','palomaprieto@icloud.org','278-1742 Class Av.','14683','Aragón','Spain','BIK37JKF2YW'),
  ('Chanda Guerrero','(762) 721-7626','chandaguerrero@google.com','571-7096 Ac Avenue','67256','Murcia','Spain','PHS72WZS8MH'),
  ('Hedy Campos','1-383-650-3800','hedycampos@aol.org','707-8516 Augue Rd.','55817','Melilla','Spain','RVS75CXO5OR'),
  ('Colt Soto','(409) 795-3146','coltsoto4200@aol.edu','2674 Commodo Road','88236','Catalunya','Spain','GFI11VJV3YL'),
  ('Kay Calvo','(535) 287-7542','kaycalvo3611@aol.ca','Ap #696-5088 Duis Road','24639','Castilla y León','Spain','NKF52PTD7TY'),
  ('Colt Iglesias','(668) 365-5291','coltiglesias9825@yahoo.com','101-2119 Vulputate, Av.','18812','Catalunya','Spain','LPF25RHQ4UK');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Ezekiel Castro','(513) 844-3776','ezekielcastro4440@google.couk','946-1653 Diam Road','62294','Navarra','Spain','FFX65VCR2PF'),
  ('Caryn Delgado','(419) 511-1829','caryndelgado8286@yahoo.org','Ap #446-8732 Nullam Av.','66250','Comunitat Valenciana','Spain','OVI37LLH4MJ'),
  ('Nicholas Flores','1-456-632-4805','nicholasflores4170@hotmail.edu','P.O. Box 939, 9410 Proin St.','28198','Catalunya','Spain','JXB90FRU9VP'),
  ('Ali Navarro','(209) 666-8568','alinavarro@yahoo.com','391-264 At St.','24327','Andalucía','Spain','YYY27FKL7AH'),
  ('Nola Merino','1-229-880-0267','nolamerino@outlook.com','P.O. Box 596, 3701 Risus. Av.','13525','Castilla - La Mancha','Spain','ICP24RYT8QQ'),
  ('Leah Romero','(325) 917-3317','leahromero@protonmail.com','6917 Sem Ave','16681','La Rioja','Spain','MTK24NZZ6IG'),
  ('Talon Perez','(539) 514-9609','talonperez@aol.edu','Ap #791-9655 Quam Rd.','37521','Andalucía','Spain','YRP56HVO9GO'),
  ('Carol Alonso','(772) 503-3823','carolalonso@google.org','366-6363 Aliquet. Rd.','43755','Extremadura','Spain','KWX64VEV2PI'),
  ('Shay Izquierdo','1-502-887-1772','shayizquierdo7007@hotmail.ca','6110 Odio St.','25955','Canarias','Spain','FIH83HTG3TQ'),
  ('Florence Iba','1-676-613-4574','florenceiba@google.ca','Ap #276-7776 Cubilia Ave','38867','Euskadi','Spain','FLL95QLS5LP');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Dane Redondo','(322) 373-0126','daneredondo5129@protonmail.couk','Ap #650-209 Sed St.','24045','Euskadi','Spain','LHR74QSQ4YK'),
  ('Amity Guerrero','(477) 883-4468','amityguerrero@hotmail.edu','Ap #448-214 Eget Street','58228','Aragón','Spain','DSD07DMP7BS'),
  ('Garrett Andres','1-551-838-6954','garrettandres@outlook.ca','Ap #743-3331 Arcu. St.','71705','Aragón','Spain','KQE04HCH9IB'),
  ('Uriel Vega','1-372-168-8770','urielvega8721@outlook.edu','803-2986 Neque Av.','24766','Murcia','Spain','GJY54GBR8PX'),
  ('Robert Soto','(485) 986-1752','robertsoto@google.couk','657-8558 Mus. Street','16147','Andalucía','Spain','SWI66FUE4OC'),
  ('Mason Vega','1-775-710-7236','masonvega@icloud.edu','672-5685 Id Road','37255','Canarias','Spain','UGE48UUU5NX'),
  ('Aladdin Pascual','(407) 485-6244','aladdinpascual9774@yahoo.ca','385-4107 Vestibulum Rd.','67364','Castilla y León','Spain','RJI27BCV3ZL'),
  ('Brent Saez','1-682-743-7652','brentsaez5150@google.edu','815-7188 Libero Road','97746','Madrid','Spain','VHL39JKM9KC'),
  ('Beck Crespo','1-622-476-1511','beckcrespo8914@yahoo.org','6187 Ligula. St.','47417','Canarias','Spain','CVQ35RFP6BX'),
  ('Joan Ramirez','1-777-435-3236','joanramirez@aol.ca','Ap #207-6127 Quis Road','73161','Madrid','Spain','LSD30EBJ0WU');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Indigo Montero','1-743-472-5859','indigomontero@icloud.ca','P.O. Box 745, 4533 Magna. Avenue','02275','Illes Balears','Spain','VQF72FRZ6TT'),
  ('Warren Prieto','1-127-745-5469','warrenprieto6736@hotmail.ca','7252 Tincidunt Rd.','13542','La Rioja','Spain','VQR51HMC8NC'),
  ('Uriah Mendez','(621) 386-1913','uriahmendez@outlook.net','112-3363 Aliquet Rd.','66263','Cantabria','Spain','NDC17ROI7QX'),
  ('Garth Campos','(568) 625-4376','garthcampos@icloud.couk','P.O. Box 758, 2650 Orci Ave','49123','Illes Balears','Spain','SBH54LHK4KQ'),
  ('Alexis Hidalgo','1-741-718-4172','alexishidalgo5838@google.edu','Ap #350-9668 Class Avenue','66857','Galicia','Spain','FMQ20GIM8ZD'),
  ('Aaron Vila','(518) 361-1178','aaronvila1150@protonmail.org','Ap #476-7279 Luctus St.','46814','Castilla - La Mancha','Spain','IIW78MXU8HH'),
  ('Nadine Moya','1-640-254-9255','nadinemoya@yahoo.ca','958-7952 Volutpat. Av.','86604','Ceuta','Spain','KMN55CER3WN'),
  ('Phillip Peña','(324) 339-3818','phillippea@outlook.com','Ap #811-5758 Donec St.','37007','Madrid','Spain','JET78LUR1TR'),
  ('Kasimir Hidalgo','(552) 438-0744','kasimirhidalgo@google.couk','P.O. Box 832, 4936 Mauris Ave','37806','Comunitat Valenciana','Spain','LFS85NPL8JF'),
  ('Scarlett Castro','(683) 498-5751','scarlettcastro@google.edu','Ap #750-2164 At, St.','66392','La Rioja','Spain','UEA52BIS6ZE');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Jeanette Rubio','(815) 367-9157','jeanetterubio@aol.edu','P.O. Box 753, 8264 Felis Ave','79501','Extremadura','Spain','RDW46KII2II'),
  ('Kenneth Pardo','1-580-422-8472','kennethpardo5733@hotmail.ca','Ap #511-1536 Sociis Ave','93484','Madrid','Spain','UKX77TVF2EX'),
  ('Zachary Santos','1-887-115-1461','zacharysantos@icloud.net','5978 Dolor St.','86736','Principado de Asturias','Spain','QYK83ROC2VY'),
  ('Fritz Vila','1-415-620-6154','fritzvila@google.com','3834 Eu Avenue','36818','Extremadura','Spain','OSR82NTK6SR'),
  ('Marny Vidal','(143) 936-4380','marnyvidal@protonmail.ca','P.O. Box 578, 8545 Sagittis St.','16122','Catalunya','Spain','BOK43MKZ8QP'),
  ('Kirby Carmona','(567) 572-9851','kirbycarmona@yahoo.org','7280 Non St.','23763','Cantabria','Spain','CXF86BKI0ZT'),
  ('Sean Velasco','(277) 735-1217','seanvelasco710@outlook.ca','261-8830 Sem Ave','79611','Canarias','Spain','GVE47NXH8IW'),
  ('Nita Ferrer','1-417-787-5101','nitaferrer3383@aol.ca','854-7044 Eu Ave','23297','Galicia','Spain','ZNX45JDK4WP'),
  ('Miriam Arias','(519) 142-7894','miriamarias@hotmail.org','Ap #962-4790 Sed Ave','57375','Navarra','Spain','CCT69OGX1XP'),
  ('Dana Garrido','(813) 522-0592','danagarrido@outlook.com','497-4788 Ipsum St.','55883','Andalucía','Spain','UBQ21CBJ7PF');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Abel Diaz','(419) 668-8469','abeldiaz@yahoo.couk','2866 Nonummy Rd.','11363','Euskadi','Spain','TZU89EWK7RS'),
  ('Jemima Vila','(281) 468-1272','jemimavila@aol.edu','7974 Etiam St.','41546','Madrid','Spain','FKN86OCJ2FI'),
  ('Owen Merino','1-604-520-3359','owenmerino2962@aol.com','Ap #498-7300 Aliquam St.','63727','Aragón','Spain','NUH71JDL5PC'),
  ('Shaine Jimenez','(878) 522-0085','shainejimenez@aol.com','531-7564 Elit Rd.','76588','Castilla y León','Spain','JSL64CTS0YM'),
  ('Zane Ramos','1-270-264-0545','zaneramos@icloud.ca','995-9029 Viverra. Rd.','38685','Andalucía','Spain','IGQ86HCH3EF'),
  ('Reed Ferrer','(774) 481-7435','reedferrer8265@aol.edu','4276 Parturient Rd.','66446','Galicia','Spain','OVY28OSZ7OW'),
  ('Dawn Mora','1-842-556-1537','dawnmora880@hotmail.com','922-6071 Ornare St.','83757','Navarra','Spain','GTP73XRD1YJ'),
  ('Ezekiel Cano','1-147-536-7376','ezekielcano@aol.edu','265-3329 Justo. Ave','81371','Principado de Asturias','Spain','PYD45BFX6DO'),
  ('Carla Caballero','1-531-480-7266','carlacaballero@aol.edu','Ap #920-8929 Est Av.','51287','Extremadura','Spain','BOF57QFL1FC'),
  ('Harrison Navarro','(824) 561-5384','harrisonnavarro77@outlook.com','661-5231 Dui. St.','77326','Catalunya','Spain','NKS83YTB2UM');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Upton Pastor','1-762-860-1214','uptonpastor7838@protonmail.couk','Ap #303-4197 A Av.','84022','Galicia','Spain','VFG32FKD2FC'),
  ('Dara Vazquez','1-865-228-7400','daravazquez1001@yahoo.com','Ap #615-2934 Pede. St.','83536','Illes Balears','Spain','KGO71QPI3AK'),
  ('Germane Casado','(777) 991-1012','germanecasado7633@protonmail.net','669-5394 Lobortis. St.','83033','Castilla y León','Spain','JUV18RYR6ZY'),
  ('Alfonso Moya','(865) 184-0489','alfonsomoya9718@hotmail.couk','660-6746 Phasellus Avenue','47212','Melilla','Spain','RML93FLH5WI'),
  ('Lila Rubio','1-774-383-7640','lilarubio1626@yahoo.ca','Ap #740-7175 Orci. Street','41777','Madrid','Spain','DHG11XQO1TC'),
  ('Theodore Hidalgo','(781) 464-7478','theodorehidalgo4509@aol.couk','Ap #831-6706 Lorem Street','84210','Extremadura','Spain','KIQ23UBE3SG'),
  ('Candice Gallego','1-343-863-3326','candicegallego@yahoo.net','Ap #778-428 Tempus Road','85066','Illes Balears','Spain','TTY73KND5VO'),
  ('Dustin Nuñez','(351) 886-0617','dustinnuez8646@icloud.org','194-7101 Amet, Rd.','36824','La Rioja','Spain','TNJ93OQW4QE'),
  ('Theodore Nieto','(218) 611-6418','theodorenieto8124@icloud.com','Ap #230-3917 Purus. Rd.','15774','La Rioja','Spain','VDB64TSY0GE'),
  ('Josephine Miguel','(551) 619-6710','josephinemiguel8417@outlook.com','1082 Interdum Rd.','39533','Illes Balears','Spain','PYU89OBG8JX');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Emerson Cruz','1-875-788-4721','emersoncruz2582@icloud.net','Ap #426-7432 Enim. St.','06403','Melilla','Spain','OSY68CFE1CA'),
  ('Maya Garcia','(628) 867-4362','mayagarcia@aol.edu','814-7049 Donec St.','86739','Illes Balears','Spain','SMO86RMI5BR'),
  ('Emi Pastor','1-346-508-8578','emipastor@aol.edu','528-5660 Sem Ave','47623','Madrid','Spain','RXW25WBT4FK'),
  ('Tate Hernandez','1-212-558-1493','tatehernandez3447@aol.org','Ap #979-4027 Class Ave','31320','Andalucía','Spain','DNJ42GDL6XN'),
  ('Pandora Calvo','1-866-142-5828','pandoracalvo@aol.couk','P.O. Box 648, 2116 Ut Av.','60185','Aragón','Spain','LOU92QWL7ZF'),
  ('Asher Muñoz','(598) 432-9667','ashermuoz@protonmail.net','Ap #901-5934 Eu Ave','41277','Canarias','Spain','NKS36RHB1VO'),
  ('Phelan Martin','1-620-723-3914','phelanmartin5310@yahoo.org','Ap #271-2487 Donec Avenue','36038','Extremadura','Spain','SMF20JWP3YZ'),
  ('Andrew Ortiz','1-827-637-6224','andrewortiz8034@outlook.net','Ap #799-7979 Metus. Avenue','41538','Principado de Asturias','Spain','VKC38EWV1XS'),
  ('Wallace Diez','(938) 784-7115','wallacediez@hotmail.ca','162-9933 Nulla. Street','17866','Murcia','Spain','TDX31JIQ7OI'),
  ('Dale Marti','(815) 133-3552','dalemarti@icloud.net','119-2277 Ad Rd.','76672','Castilla - La Mancha','Spain','XKP33HKH2PE');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Cody Martinez','1-834-707-1861','codymartinez@aol.net','P.O. Box 672, 2211 Pharetra, Road','45094','Catalunya','Spain','LQJ37UQY6HH'),
  ('Constance Velasco','1-344-796-1128','constancevelasco@icloud.edu','604-7082 Scelerisque, Rd.','26316','Catalunya','Spain','FUH69UKM4YX'),
  ('Fallon Torres','1-812-363-2681','fallontorres@yahoo.ca','6223 Tempus St.','16428','Comunitat Valenciana','Spain','RCC57TVG3QG'),
  ('Cadman Saez','1-473-307-2526','cadmansaez@aol.couk','Ap #654-9660 Natoque St.','67134','Catalunya','Spain','PCF51TJF5CU'),
  ('Britanney Leon','(613) 384-6454','britanneyleon3662@aol.org','846-1311 Diam Avenue','08812','Navarra','Spain','RWS05SWJ8WJ'),
  ('Tanek Sanz','1-675-567-2966','taneksanz7092@outlook.ca','Ap #811-7114 Nec Avenue','63519','Andalucía','Spain','ARA25NHA1GO'),
  ('Colin Calvo','1-273-522-8063','colincalvo@yahoo.com','Ap #999-8491 Posuere Avenue','06445','Comunitat Valenciana','Spain','WRL48CVD3RC'),
  ('Devin Torres','1-853-233-8352','devintorres187@hotmail.org','P.O. Box 557, 4718 Cras Street','81506','Cantabria','Spain','BAW01IQL1II'),
  ('Candace Carrasco','(458) 266-7334','candacecarrasco@icloud.couk','647-663 Consectetuer Rd.','76226','Canarias','Spain','XKF22TGB4PK'),
  ('Nash Cabrera','(204) 228-6259','nashcabrera@protonmail.com','P.O. Box 644, 2188 At Road','41698','Extremadura','Spain','EFF10WQU9OY');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Burke Romero','1-845-445-8271','burkeromero@protonmail.com','Ap #191-2203 Malesuada Rd.','19534','Comunitat Valenciana','Spain','LYI72QGH7YY'),
  ('Destiny Ortega','1-626-486-7433','destinyortega@outlook.net','Ap #325-3342 Pellentesque Rd.','50358','Andalucía','Spain','EIR63JSY3TE'),
  ('Tasha Reyes','(626) 535-5771','tashareyes@google.ca','Ap #136-9273 Natoque St.','82539','Extremadura','Spain','WRF71QPK4TI'),
  ('Eugenia Gimenez','(702) 528-8441','eugeniagimenez@protonmail.org','P.O. Box 167, 2758 Quam. Avenue','98244','Catalunya','Spain','GJV93HHP5MG'),
  ('Eaton Cano','(295) 675-3652','eatoncano@outlook.com','Ap #262-4533 Turpis. Rd.','31665','Principado de Asturias','Spain','NJF86FUT0SL'),
  ('Oprah Gomez','1-716-613-7787','oprahgomez541@protonmail.ca','9861 Lobortis Street','83479','Madrid','Spain','ZCJ76SVP8BM'),
  ('Hiram Moya','1-743-862-2718','hirammoya@outlook.edu','636-5093 Nec, Rd.','02728','Principado de Asturias','Spain','FDP91HNM8XF'),
  ('Jasmine Fernandez','1-771-534-2161','jasminefernandez3513@google.net','261-266 Vivamus Street','10243','Illes Balears','Spain','NJE88WZM0GF'),
  ('Deirdre Rodriguez','(340) 410-4036','deirdrerodriguez@aol.com','Ap #595-8615 Magna St.','71787','Castilla y León','Spain','GOQ23SGU2ZC'),
  ('Peter Marin','(648) 778-5067','petermarin@outlook.net','Ap #646-1924 Integer Rd.','73595','Aragón','Spain','JIB51BTF1KJ');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Keegan Herrera','(651) 452-4490','keeganherrera@icloud.couk','8739 Amet Avenue','76127','Galicia','Spain','UOF69JWY8XJ'),
  ('Cheyenne Cabrera','(321) 593-2887','cheyennecabrera3769@outlook.com','Ap #429-1706 Diam Avenue','05499','Murcia','Spain','QMW61WQT6JG'),
  ('Connor Soler','1-592-313-3374','connorsoler@aol.org','8823 Nunc, Avenue','52768','Ceuta','Spain','GHB40LIM9OO'),
  ('Kamal Alvarez','1-620-437-8655','kamalalvarez@aol.couk','Ap #422-8147 Pretium St.','83862','Cantabria','Spain','VTO37OJE7YQ'),
  ('Linda Gallego','1-598-215-8285','lindagallego4419@google.org','744-6920 Purus Street','87240','Cantabria','Spain','NKF87EQY1HI'),
  ('Evan Lopez','1-215-717-2147','evanlopez4505@outlook.edu','721-2924 Scelerisque St.','36919','Comunitat Valenciana','Spain','BHL57BRP1QP'),
  ('Dane Izquierdo','(164) 401-0986','daneizquierdo2953@protonmail.com','P.O. Box 683, 9112 Sit St.','36209','Madrid','Spain','BED62EZI2WT'),
  ('Brynn Crespo','(152) 916-3968','brynncrespo@aol.net','P.O. Box 567, 5455 Ultricies St.','84755','Galicia','Spain','EGX85VCZ1BB'),
  ('Benedict Redondo','(904) 165-4902','benedictredondo441@outlook.ca','6372 Justo Avenue','29926','Galicia','Spain','RTM75LOI0SX'),
  ('Asher Carrasco','1-229-134-5431','ashercarrasco@aol.ca','P.O. Box 618, 7659 Magna Street','55471','Andalucía','Spain','THD51TPH2ZA');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Yoshi Fernandez','(210) 212-7863','yoshifernandez3244@protonmail.edu','P.O. Box 579, 2177 Elit. St.','71463','Navarra','Spain','CNK44WCU6UO'),
  ('Virginia Campos','(720) 412-4236','virginiacampos@hotmail.ca','P.O. Box 678, 8538 Enim Street','63794','Comunitat Valenciana','Spain','CUI30OVI3UQ'),
  ('Ava Redondo','1-517-568-1167','avaredondo8571@protonmail.org','5014 Elit, St.','51833','Catalunya','Spain','KVP16JEH7LB'),
  ('Joan Vidal','(265) 910-5756','joanvidal8491@outlook.couk','861-770 Purus Road','88465','La Rioja','Spain','OAT21UXQ6JP'),
  ('Vera Blanco','(395) 487-9317','verablanco2164@yahoo.edu','Ap #273-1157 Est Av.','92377','Ceuta','Spain','UIF89GTV6RO'),
  ('Britanney Torres','1-529-214-2366','britanneytorres@protonmail.ca','491-2772 Erat Ave','48565','Madrid','Spain','PVH21BUO5OX'),
  ('Timothy Leon','(508) 353-6357','timothyleon@yahoo.edu','1175 Auctor Av.','81450','Illes Balears','Spain','MHT76SXK8MS'),
  ('Madaline Cortes','(573) 417-6086','madalinecortes623@google.couk','916-8082 Sed Avenue','57814','Catalunya','Spain','TWN64OVY2JD'),
  ('Dawn Mendez','(769) 110-2615','dawnmendez8262@icloud.org','Ap #129-8138 Et St.','85327','Catalunya','Spain','WCA84FOB7VF'),
  ('Melissa Romero','1-535-752-5643','melissaromero@hotmail.org','768-7910 Nisi Rd.','18388','Melilla','Spain','BCX76GDP5PB');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Signe Campos','(820) 669-7551','signecampos467@icloud.org','207-2878 Et Rd.','11403','Andalucía','Spain','NCE30KPH5FV'),
  ('Nicholas Saez','(320) 625-8038','nicholassaez7407@google.ca','P.O. Box 570, 3260 Risus Street','88016','Illes Balears','Spain','SPR89QBE8LS'),
  ('Fredericka Miguel','(469) 382-2521','frederickamiguel6854@hotmail.ca','118 Urna, Ave','64743','Principado de Asturias','Spain','EYG02COI8RD'),
  ('Zenia Torres','(535) 324-5817','zeniatorres@outlook.ca','Ap #677-1113 Elit. St.','22932','Aragón','Spain','MAY23YGF3WF'),
  ('Germane Vazquez','(833) 668-7169','germanevazquez7982@yahoo.ca','P.O. Box 784, 4051 Erat. St.','94720','Castilla y León','Spain','QEF77XPN9LE'),
  ('Hayley Vila','(542) 434-4869','hayleyvila@protonmail.couk','837-4989 Sodales Rd.','84848','Ceuta','Spain','XXP14NEO3UT'),
  ('Wing Perez','1-248-511-5505','wingperez@yahoo.com','7108 Pede. Avenue','52773','Cantabria','Spain','KNR25DEW1VP'),
  ('Kaseem Peña','(618) 547-6040','kaseempea8730@hotmail.org','634-4325 Id Road','75818','Aragón','Spain','MOQ31TPJ9VY'),
  ('Rhea Carrasco','1-208-142-5372','rheacarrasco@icloud.net','4322 A Av.','53728','Ceuta','Spain','MJE43OFL3GU'),
  ('Natalie Cano','1-253-133-3245','nataliecano2026@protonmail.net','9662 Elit Rd.','81323','Castilla - La Mancha','Spain','COA61EQW2ER');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Wallace Marti','1-904-492-2290','wallacemarti@hotmail.couk','389-2106 Enim Rd.','59347','La Rioja','Spain','FKU41IPI8NO'),
  ('Moana Carrasco','1-940-446-2523','moanacarrasco@outlook.ca','698-5866 Vivamus Street','47081','Euskadi','Spain','DVQ25TRE5NY'),
  ('Alyssa Leon','1-412-267-5456','alyssaleon9876@hotmail.com','378-435 Vitae, St.','52746','Aragón','Spain','VXI78TUI1LD'),
  ('Josiah Ortega','(518) 237-2725','josiahortega@icloud.net','P.O. Box 862, 6925 Fringilla St.','68648','Extremadura','Spain','WHC38FZL4MF'),
  ('Sacha Carrasco','1-283-531-0269','sachacarrasco5438@protonmail.net','P.O. Box 625, 657 Eget Rd.','33648','Illes Balears','Spain','XVN74YMC4XR'),
  ('Hiroko Carrasco','1-431-173-0661','hirokocarrasco@outlook.net','925-3026 In, St.','93616','Illes Balears','Spain','BHX95TOM7NU'),
  ('Wade Prieto','(634) 706-8022','wadeprieto@protonmail.couk','Ap #121-7292 Faucibus St.','65846','Extremadura','Spain','YBB69ZAW5KV'),
  ('Linus Morales','(825) 330-3925','linusmorales9920@aol.edu','Ap #765-9038 Libero St.','15998','Castilla y León','Spain','JEZ97KNS5SQ'),
  ('Hayden Ramos','1-142-463-9150','haydenramos7202@hotmail.org','7051 Quam Avenue','64558','Castilla y León','Spain','VSX54WVB7SW'),
  ('Demetrius Fernandez','(933) 397-6273','demetriusfernandez8844@icloud.couk','P.O. Box 597, 542 Lorem, St.','60766','Navarra','Spain','OSS18VRD7MO');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Basil Iba','1-498-697-5312','basiliba@hotmail.net','459-5509 Porta Rd.','05522','Cantabria','Spain','DOJ17ZCM5DO'),
  ('MacKenzie Lorenzo','1-272-970-7111','mackenzielorenzo@google.edu','Ap #587-6679 Maecenas Avenue','28633','Catalunya','Spain','ODI30XWU3JM'),
  ('Aaron Vicente','(106) 383-4378','aaronvicente@protonmail.net','P.O. Box 250, 1809 Felis Rd.','88596','Galicia','Spain','QOP41DMV2PV'),
  ('Roth Jimenez','(375) 334-6369','rothjimenez@outlook.couk','228-4315 Dolor Road','30056','La Rioja','Spain','EEP07YEN5UC'),
  ('Jaime Delgado','1-798-646-1531','jaimedelgado@protonmail.ca','Ap #272-8162 Feugiat. St.','81473','La Rioja','Spain','OTJ42PXY4UF'),
  ('Cassady Muﾑoz','(885) 794-4868','cassadymuoz@protonmail.couk','P.O. Box 203, 2316 Ornare, Road','77847','Extremadura','Spain','ZMI46HEJ2BL'),
  ('Rajah Sanz','1-756-988-6357','rajahsanz@google.net','Ap #904-7090 Diam Av.','34541','Murcia','Spain','KJD56XWF0UM'),
  ('Martin Fuentes','(409) 891-1748','martinfuentes@yahoo.com','631-7221 Vel Avenue','30166','Cantabria','Spain','FNO65TUJ4NK'),
  ('Carla Torres','(777) 418-6911','carlatorres@outlook.couk','Ap #471-4576 Ultrices. Avenue','78274','La Rioja','Spain','DKI06JRU7FO'),
  ('Hedy Vila','1-484-814-6154','hedyvila@aol.couk','167-1249 In Rd.','76347','Cantabria','Spain','TME22CNB6KM');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Jocelyn Crespo','1-854-286-6202','jocelyncrespo@hotmail.ca','Ap #839-5362 Lorem Rd.','54401','Ceuta','Spain','GHD42WGX5VG'),
  ('Fleur Vazquez','(803) 520-8120','fleurvazquez@aol.edu','Ap #499-2625 Suspendisse Avenue','42805','Madrid','Spain','AUQ46LSE2JU'),
  ('Dorothy Ortega','(460) 206-4516','dorothyortega@aol.net','P.O. Box 135, 2885 Dictum Road','18685','Galicia','Spain','BAI55EBJ0ER'),
  ('Ali Muﾑoz','1-274-743-4159','alimuoz@hotmail.org','833-2464 Urna Avenue','35176','Canarias','Spain','OBL48DRT8XF'),
  ('Kennan Reyes','(327) 922-8845','kennanreyes@google.couk','6886 Nunc Rd.','57330','Cantabria','Spain','SRC21ROE6HX'),
  ('Cheryl Flores','1-385-265-8642','cherylflores3378@aol.couk','P.O. Box 845, 5416 Ut St.','07002','Castilla - La Mancha','Spain','DYG12XLV8MC'),
  ('Bradley Ortega','(553) 810-2838','bradleyortega8525@yahoo.org','P.O. Box 790, 3850 Adipiscing. Road','93875','Murcia','Spain','GXT25SPV3WF'),
  ('Mallory Hidalgo','1-473-377-0177','malloryhidalgo@icloud.edu','2165 Gravida Street','89470','Murcia','Spain','RKL14LQZ2JT'),
  ('Willa Campos','1-125-446-5175','willacampos3087@outlook.org','5371 Aliquam Av.','72426','Andalucía','Spain','XFG71BFO7CU'),
  ('Jasmine Lopez','(867) 773-3333','jasminelopez@hotmail.ca','Ap #888-7359 Maecenas Avenue','24631','Ceuta','Spain','JIB09GCL0IN');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Mufutau Pastor','(537) 446-7489','mufutaupastor@protonmail.com','P.O. Box 655, 3857 Libero. Rd.','48691','Castilla - La Mancha','Spain','BCB18YLE6QC'),
  ('Chandler Rodriguez','(311) 346-7152','chandlerrodriguez@protonmail.com','662-1155 Malesuada Avenue','15581','Navarra','Spain','JMD13QRW3CL'),
  ('Cruz Pastor','(397) 534-8158','cruzpastor7274@yahoo.couk','Ap #570-9587 Quisque Avenue','45876','Melilla','Spain','WAV54TVW1LE'),
  ('Amethyst Carrasco','1-543-647-4631','amethystcarrasco1712@protonmail.edu','Ap #213-4746 Odio Rd.','69147','Ceuta','Spain','OBC24FNE7CY'),
  ('Lael Ramirez','(308) 238-7159','laelramirez@aol.org','8243 Ac Rd.','68543','La Rioja','Spain','JHP25XNV2JL'),
  ('Nash Suarez','(499) 582-8091','nashsuarez@protonmail.edu','706-9205 Tincidunt St.','32564','Principado de Asturias','Spain','QPO48MTY3DO'),
  ('Irma Vila','1-963-804-8120','irmavila6367@yahoo.org','561-6172 Magna. Ave','31762','Comunitat Valenciana','Spain','YTK82ZNC1YE'),
  ('Christine Ferrer','(215) 538-6356','christineferrer8010@yahoo.org','Ap #525-4066 Vitae Av.','26158','Ceuta','Spain','XNR61XBH1XR'),
  ('Hope Iglesias','1-291-256-2172','hopeiglesias1417@google.edu','P.O. Box 225, 6707 Urna, St.','46473','Galicia','Spain','RPT86TYS6QO'),
  ('Iris Iglesias','(444) 411-7210','irisiglesias@aol.com','Ap #852-6447 Eget Ave','07740','Navarra','Spain','USU93JGZ6WR');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Caryn Guerrero','(619) 828-2660','carynguerrero@google.com','Ap #387-6373 Sed St.','57586','La Rioja','Spain','CJF31JCA6IW'),
  ('Knox Gallego','(354) 643-4737','knoxgallego147@icloud.com','P.O. Box 587, 2394 Sed Avenue','12997','Ceuta','Spain','YLC71YMD2QB'),
  ('Quyn Ortiz','(527) 161-5284','quynortiz@aol.org','8997 Malesuada Road','49579','Ceuta','Spain','MNB42TRS7XR'),
  ('Tiger Cano','1-776-489-3516','tigercano@yahoo.org','3749 Scelerisque, St.','24981','Castilla - La Mancha','Spain','GSA28OHU8XD'),
  ('Xavier Marquez','1-449-822-8181','xaviermarquez2176@aol.ca','Ap #471-505 Sed, Rd.','18786','Principado de Asturias','Spain','EYN25HSY5RV'),
  ('Rigel Caballero','1-614-402-5415','rigelcaballero@outlook.com','P.O. Box 389, 6457 Montes, St.','95655','Cantabria','Spain','KMX85XWW3UH'),
  ('Camille Guerrero','(634) 714-6144','camilleguerrero9674@outlook.couk','P.O. Box 907, 6415 Cursus Av.','44149','Catalunya','Spain','VLM01SEW2MJ'),
  ('Scarlett Muﾑoz','(766) 931-3243','scarlettmuoz@hotmail.ca','Ap #255-683 In St.','82626','Comunitat Valenciana','Spain','HBX04SWO3HN'),
  ('Denise Ramos','(558) 786-5313','deniseramos9152@hotmail.net','P.O. Box 131, 5708 Quis Street','73023','Navarra','Spain','DNC32VRS7VA'),
  ('Quinlan Castro','1-951-821-4757','quinlancastro4449@google.org','520-109 Tempus Avenue','52418','Ceuta','Spain','NOJ27QUW7JV');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Sydney Saez','1-678-461-6710','sydneysaez3476@protonmail.com','Ap #681-8119 Vehicula Street','03625','Aragón','Spain','PNF15CAF5CG'),
  ('Hall Izquierdo','(816) 487-6116','hallizquierdo9975@aol.net','777-4681 Senectus Avenue','81070','Navarra','Spain','KWI94SDT5UU'),
  ('Shannon Nuñez','1-312-919-6294','shannonnuez9126@hotmail.edu','Ap #105-4980 Tincidunt Av.','23767','Galicia','Spain','MVP50AEG6EV'),
  ('Hannah Torres','(684) 567-3041','hannahtorres@aol.org','Ap #331-2802 Ac Rd.','17033','Principado de Asturias','Spain','WEP47CWR7JQ'),
  ('Karyn Andres','1-136-705-8648','karynandres@aol.couk','P.O. Box 283, 1893 Mi St.','81275','Melilla','Spain','CJD74UTN3XL'),
  ('Amela Medina','(752) 501-7237','amelamedina3521@google.net','666-949 Fusce Rd.','38127','Castilla - La Mancha','Spain','ILF58LIE4MD'),
  ('Chandler Marti','1-478-771-4119','chandlermarti@google.com','Ap #260-6254 Cursus St.','46656','Castilla - La Mancha','Spain','GDH91ZRA3EJ'),
  ('Jeremy Gil','(503) 517-7497','jeremygil4208@aol.org','1391 Pellentesque St.','85016','Aragón','Spain','JRN32YTR3KV'),
  ('Angelica Saez','1-548-900-7271','angelicasaez9384@outlook.org','9938 Aliquam Avenue','93522','Aragón','Spain','SUT34CDY6QC'),
  ('Summer Lopez','1-367-946-1387','summerlopez@protonmail.com','3463 Tortor Av.','18810','Navarra','Spain','NXG06RNY7HI');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Abra Sanchez','1-481-632-1978','abrasanchez@icloud.net','676-8530 Libero. Road','15477','Principado de Asturias','Spain','SME75IHE5WS'),
  ('Thor Gallego','(447) 718-2726','thorgallego9066@aol.org','4787 Phasellus Rd.','16312','Andalucía','Spain','ZDF22TJX2HM'),
  ('Thor Velasco','(104) 611-3786','thorvelasco8742@protonmail.couk','Ap #954-4063 Mauris, Rd.','11935','La Rioja','Spain','OTP32DFJ3VU'),
  ('Quinlan Peña','1-202-152-1168','quinlanpea@aol.edu','906-9254 In Street','54864','Castilla y León','Spain','VOL71MET9WI'),
  ('Levi Marin','1-457-730-8969','levimarin@yahoo.org','3847 Sed Rd.','12190','Euskadi','Spain','EZO38CWG9GR'),
  ('Jenette Carmona','(433) 954-8437','jenettecarmona@google.couk','Ap #284-3883 Eu Av.','45242','Castilla y León','Spain','FNX19MVU7RC'),
  ('Ross Velasco','1-914-451-1280','rossvelasco3613@hotmail.ca','244-5912 Ac Street','64328','Andalucía','Spain','KKL29EYS1TR'),
  ('Dalton Pardo','1-572-618-6475','daltonpardo@outlook.net','Ap #201-6338 Semper. Road','05237','Extremadura','Spain','UGW45SRM4WQ'),
  ('Dexter Ramirez','1-285-542-4632','dexterramirez7751@outlook.org','5055 Cum Road','85585','Illes Balears','Spain','TSO45HCD5AD'),
  ('Elvis Martinez','(142) 534-2838','elvismartinez8846@icloud.org','Ap #403-367 Ornare, Ave','78034','Canarias','Spain','YEU21EHD1TY');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Adam Prieto','(546) 488-2248','adamprieto@hotmail.edu','281-5979 Enim. St.','81152','Castilla y León','Spain','JYJ58CLC9KJ'),
  ('Kylynn Esteban','(280) 279-1780','kylynnesteban@protonmail.org','Ap #241-2091 Vel, Rd.','51518','Madrid','Spain','NSQ03OOF7YA'),
  ('Lamar Santos','1-193-648-3878','lamarsantos@icloud.org','443-9752 Sed St.','78865','La Rioja','Spain','JEH24JSI3DL'),
  ('Evan Moya','(779) 123-3901','evanmoya9528@protonmail.couk','Ap #292-1835 Duis Road','14258','Galicia','Spain','BXM52MWS6TV'),
  ('Aristotle Cano','(354) 674-7247','aristotlecano@google.org','Ap #186-1232 Enim Rd.','69154','Aragón','Spain','RLL61FJV3MR'),
  ('Camden Gil','(733) 618-6236','camdengil@protonmail.net','700-844 A Rd.','89104','Illes Balears','Spain','ZWC89FPU6IV'),
  ('Slade Duran','1-816-351-7919','sladeduran@yahoo.com','872-9595 Risus. Avenue','97515','La Rioja','Spain','GJR86PON1HP'),
  ('Lee Vazquez','1-407-466-7538','leevazquez3284@protonmail.couk','6848 Nam St.','79386','Castilla y León','Spain','COA61VBV6GV'),
  ('Keelie Ibañez','(117) 754-9582','keelieibaez1770@google.edu','731-3347 Lorem Rd.','98613','Murcia','Spain','VFN83WLR6RD'),
  ('Cade Guerrero','1-886-820-9770','cadeguerrero6961@icloud.com','Ap #433-2662 Mauris. Street','82051','Navarra','Spain','IDC52UPT3EI');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Avram Medina','1-413-758-1243','avrammedina9366@google.edu','Ap #578-8740 Accumsan Rd.','30702','Aragón','Spain','LSQ34OEK6PT'),
  ('Nomlanga Diaz','1-364-670-1345','nomlangadiaz@icloud.com','955-1404 Pharetra Avenue','65333','Cantabria','Spain','SXW62VFY3WQ'),
  ('Karen Vega','(781) 718-4457','karenvega@icloud.couk','127-4393 Eu, Rd.','94218','Madrid','Spain','KPH96UIM4VK'),
  ('Jesse Navarro','(541) 449-5396','jessenavarro@protonmail.ca','P.O. Box 732, 6854 Vitae St.','32203','Navarra','Spain','GOR74TNV5PB'),
  ('Kimberley Marti','(121) 639-6752','kimberleymarti@yahoo.org','1847 Proin Avenue','28664','Murcia','Spain','MNX47YXQ8FO'),
  ('Tanner Diez','(125) 461-1630','tannerdiez1705@aol.edu','6401 Elit. Rd.','86345','Illes Balears','Spain','LZN87IEM8WK'),
  ('Mari Delgado','1-459-359-6112','maridelgado@protonmail.org','P.O. Box 359, 4684 Curae Rd.','71356','Canarias','Spain','DLD30PYY3JS'),
  ('Melyssa Diez','1-464-531-6223','melyssadiez1059@outlook.net','315-4972 Ante Road','21380','La Rioja','Spain','HTX95ECV3SF'),
  ('Gannon Ramirez','1-158-322-5313','gannonramirez3307@outlook.edu','Ap #843-4519 Dolor, St.','25320','Comunitat Valenciana','Spain','AJN79KQZ4SB'),
  ('Ingrid Santana','1-900-439-7614','ingridsantana@google.org','Ap #393-1606 Duis Street','31753','Navarra','Spain','HUO88GXR7LP');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Burke Garcia','1-112-634-9710','burkegarcia1820@aol.org','5917 Tristique Rd.','51885','Ceuta','Spain','VFH02BMZ8AK'),
  ('Damon Ramirez','1-981-563-8358','damonramirez@hotmail.ca','Ap #617-8953 Nascetur Rd.','96773','Murcia','Spain','DBP84LMP5CW'),
  ('Jasmine Prieto','1-641-780-2178','jasmineprieto@hotmail.edu','P.O. Box 114, 5277 Odio Rd.','98752','Aragón','Spain','VKV98SFF9UP'),
  ('Adrienne Redondo','1-926-246-1874','adrienneredondo7272@outlook.edu','P.O. Box 274, 7322 Phasellus Av.','84941','Illes Balears','Spain','MQT45UVT7VN'),
  ('Nathan Guerrero','(936) 796-2662','nathanguerrero999@yahoo.org','511-5738 Tristique St.','63748','Ceuta','Spain','DVB78NCY1AD'),
  ('Xenos Fernandez','1-764-206-3881','xenosfernandez9593@yahoo.com','P.O. Box 824, 2246 Diam. St.','11065','Ceuta','Spain','DTR68OJU9WQ'),
  ('Aspen Casado','1-537-419-6317','aspencasado6961@google.ca','Ap #523-9787 Ipsum. St.','18451','Illes Balears','Spain','FJN82YOM8CX'),
  ('Kennedy Izquierdo','1-506-753-7571','kennedyizquierdo@google.couk','514-5087 Ornare Road','76472','Galicia','Spain','LIO08DCQ7TY'),
  ('Lunea Guerrero','1-744-181-4366','luneaguerrero8859@hotmail.ca','508-5460 A, Rd.','57465','Illes Balears','Spain','UFQ54QWJ7XD'),
  ('Thane Peña','1-897-124-1904','thanepea@aol.org','P.O. Box 138, 294 Neque St.','95768','Galicia','Spain','COU96SCP8NE');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Macey Guerrero','1-471-257-3356','maceyguerrero6670@hotmail.org','P.O. Box 965, 6924 Euismod Avenue','89233','Melilla','Spain','VSV82WPG5SY'),
  ('Aladdin Ortega','1-894-876-5752','aladdinortega2178@yahoo.org','Ap #932-4335 Sit Street','06272','Madrid','Spain','UXJ65AJC6SP'),
  ('Kristen Marti','1-495-565-0014','kristenmarti@google.couk','774-5835 At Street','53832','Ceuta','Spain','YVW84OWV4PC'),
  ('Cruz Castro','1-182-754-3651','cruzcastro2245@google.couk','391-5056 Eu Rd.','21230','La Rioja','Spain','OVH35TYX7PF'),
  ('Cassady Perez','(536) 240-6648','cassadyperez@protonmail.org','593-8088 Erat Av.','65815','Ceuta','Spain','VEC32QBP3XR'),
  ('Phelan Ferrer','(879) 712-5109','phelanferrer@google.edu','P.O. Box 610, 4319 Etiam Av.','48213','Andalucía','Spain','JSQ48ZGZ4AB'),
  ('Lester Leon','1-449-295-7252','lesterleon@aol.org','419-6795 Eu St.','69723','La Rioja','Spain','WBF24GYC6LL'),
  ('Kuame Suarez','1-817-801-9293','kuamesuarez1023@protonmail.couk','8052 Mi Rd.','09188','Galicia','Spain','NIH66HEO4DK'),
  ('Cheyenne Gallego','1-282-236-8394','cheyennegallego@yahoo.net','Ap #526-4089 Nunc St.','43666','Castilla - La Mancha','Spain','EGK76EDZ1ER'),
  ('Avram Muﾑoz','1-537-678-2336','avrammuoz@outlook.edu','P.O. Box 750, 2725 Et Av.','26652','Galicia','Spain','ISH16MAN7SL');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Grant Jimenez','(472) 133-6321','grantjimenez7300@aol.ca','Ap #887-113 Erat, St.','43523','Castilla y León','Spain','TTL48MCE9HQ'),
  ('Nadine Lorenzo','1-131-113-5844','nadinelorenzo@protonmail.ca','872-6437 Cursus Street','49606','Comunitat Valenciana','Spain','XWT38TEB7BH'),
  ('Lana Calvo','(218) 736-1432','lanacalvo@google.couk','362-7714 Id, Road','65575','Andalucía','Spain','PTN37MLA7VM'),
  ('Ursula Castro','1-817-883-8166','ursulacastro@hotmail.edu','P.O. Box 524, 8203 Dui. Av.','97525','Euskadi','Spain','KOK42DYT4HM'),
  ('Cedric Suarez','1-614-558-2842','cedricsuarez2741@protonmail.net','8921 Ut Avenue','80143','Comunitat Valenciana','Spain','VQI86EKN7AT'),
  ('Fatima Rubio','1-678-178-7035','fatimarubio@yahoo.net','894-3817 Et St.','21687','Principado de Asturias','Spain','VFS19OOD8YN'),
  ('Caleb Crespo','(378) 567-2884','calebcrespo4681@outlook.edu','Ap #434-1203 Eu Rd.','32683','Euskadi','Spain','LTQ66UWI2KS'),
  ('Alana Dominguez','(268) 434-2786','alanadominguez3993@aol.couk','7205 Iaculis, Av.','34062','Ceuta','Spain','CEV24SGT5XO'),
  ('Portia Alvarez','1-551-632-6537','portiaalvarez2954@hotmail.couk','886-7671 Magna Rd.','76215','Castilla - La Mancha','Spain','NPL54TBR5KN'),
  ('Richard Ramirez','(762) 587-8149','richardramirez8173@icloud.couk','310-146 Amet, Street','54514','Principado de Asturias','Spain','BDX74KTT5RE');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Conan ﾑez','1-667-616-7365','conanez7299@protonmail.ca','185-9068 Purus. Road','86311','La Rioja','Spain','RIY68BPL7SQ'),
  ('Charles Alonso','(617) 777-5442','charlesalonso5675@hotmail.couk','Ap #286-2538 Adipiscing. Avenue','27858','La Rioja','Spain','KSR55KTI1PL'),
  ('Kerry Marti','(321) 456-4121','kerrymarti@hotmail.edu','9300 Vulputate, Road','24684','Principado de Asturias','Spain','KBJ49TRL7RA'),
  ('Sierra Izquierdo','1-148-759-4257','sierraizquierdo9599@outlook.ca','904-7480 Metus. Road','87316','La Rioja','Spain','RNV52JXI5QX'),
  ('Kibo Prieto','(315) 715-3497','kiboprieto1068@outlook.ca','523-2085 Cras Av.','68833','Navarra','Spain','WFI56QYB6US'),
  ('Xantha Muﾑoz','1-634-441-4351','xanthamuoz@hotmail.ca','Ap #427-5278 Ante Av.','40668','Canarias','Spain','VKR77SLQ3LL'),
  ('Kadeem Pardo','(426) 499-4586','kadeempardo3253@outlook.couk','3082 Nulla Rd.','55753','Canarias','Spain','YQZ73XRA2HO'),
  ('Nicole Montero','(685) 356-1256','nicolemontero9770@hotmail.couk','Ap #317-3941 Rutrum Rd.','93931','Extremadura','Spain','BQU55YAI4OL'),
  ('Wylie Prieto','1-172-648-4903','wylieprieto3929@protonmail.net','991-1486 Ac Rd.','55240','Euskadi','Spain','LHB19DXA5LR'),
  ('Tana Gutierrez','(442) 283-9780','tanagutierrez1889@outlook.org','8011 Quis Avenue','34673','Castilla y León','Spain','QMH45ZYQ2AE');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Cole Sanchez','1-945-396-3765','colesanchez@outlook.org','P.O. Box 348, 8958 Tellus St.','49428','Extremadura','Spain','GMV53DTM6FL'),
  ('Shellie Vidal','1-547-155-6534','shellievidal@protonmail.org','Ap #807-4925 Iaculis Avenue','36918','Madrid','Spain','OJA19IFP6RB'),
  ('Elmo Garrido','(127) 663-5337','elmogarrido@google.edu','Ap #965-9825 Ultricies Ave','33719','Illes Balears','Spain','YCC15MKW7TU'),
  ('Jaime Esteban','1-682-583-7453','jaimeesteban7180@hotmail.net','Ap #139-3446 Nam Av.','33749','Comunitat Valenciana','Spain','HSP75MOM1UW'),
  ('Lois Nieto','1-787-402-0843','loisnieto4345@hotmail.org','Ap #516-9708 Nulla Rd.','53735','Castilla y León','Spain','ELP12WYS4EN'),
  ('Walter Cano','1-582-722-1214','waltercano3315@icloud.org','702-3691 Dui, Avenue','51678','Madrid','Spain','VJM25ZSX3LQ'),
  ('Kalia Garrido','(393) 773-8765','kaliagarrido@aol.org','979-2671 Felis St.','27232','Andalucía','Spain','CLG72WAN5QQ'),
  ('Wesley Molina','(814) 312-8062','wesleymolina5825@hotmail.ca','Ap #365-5746 Orci Road','56342','Navarra','Spain','EUO44QVN3TS'),
  ('Xander Rubio','1-926-447-5643','xanderrubio1227@aol.org','594-7794 Ut Avenue','85279','Euskadi','Spain','ZQL36BIE7XO'),
  ('Gil Lozano','(434) 477-1270','gillozano@yahoo.net','550-340 Ante. Street','81217','Euskadi','Spain','GRP39HQT2DC');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Audrey Andres','1-414-403-4353','audreyandres@protonmail.ca','Ap #805-6460 Quisque Street','58762','Illes Balears','Spain','XYK67VKU3KW'),
  ('Merritt Prieto','(575) 909-5370','merrittprieto@aol.couk','P.O. Box 702, 2014 Per St.','04376','Cantabria','Spain','EWJ84CKQ7YP'),
  ('Randall Lorenzo','1-273-517-1584','randalllorenzo6262@outlook.com','Ap #122-1437 Mollis Rd.','27404','La Rioja','Spain','KGQ59CIG4LO'),
  ('Kelly Cabrera','(303) 223-3213','kellycabrera9882@hotmail.org','Ap #786-1954 Lacus. Avenue','49544','Navarra','Spain','HMR58WSU4UF'),
  ('Dahlia Bravo','(709) 297-2384','dahliabravo@yahoo.ca','Ap #892-2617 Nunc Rd.','96878','Navarra','Spain','NWU82QAQ2XX'),
  ('Alan Campos','1-286-865-2747','alancampos6805@aol.net','357-6362 Urna, St.','42863','Principado de Asturias','Spain','MAM01UBY8XX'),
  ('Upton Ramirez','(744) 839-2718','uptonramirez5776@aol.com','8516 Semper Avenue','93184','Galicia','Spain','SKX93TWD1DD'),
  ('Yuri Muﾑoz','(768) 352-8912','yurimuoz4505@google.com','6295 Egestas Road','85772','Madrid','Spain','PNE50BCN7SI'),
  ('Randall Perez','(583) 623-6789','randallperez@icloud.couk','367-2687 Pharetra, Rd.','32342','Castilla - La Mancha','Spain','RQR20OSK3GL'),
  ('Valentine Lozano','1-267-853-8372','valentinelozano130@hotmail.ca','256-5384 Dolor. St.','56343','Andalucía','Spain','VWP78TRU3TS');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Eve Nuﾑez','1-511-363-6517','evenuez@aol.edu','2930 Erat, Street','51388','Galicia','Spain','VEM32TUP2VH'),
  ('Quin Ortiz','(845) 536-2771','quinortiz@protonmail.net','Ap #329-6656 Mauris Av.','69098','Catalunya','Spain','XPX52LRT5ET'),
  ('Mira Fernandez','(839) 746-4415','mirafernandez@icloud.net','Ap #746-3161 Magna. Street','53858','Catalunya','Spain','FXS18BGG7YO'),
  ('Yoshi Castro','1-368-797-1166','yoshicastro@protonmail.couk','2290 Aliquam Road','81663','Euskadi','Spain','GEL33CRP1DH'),
  ('Daquan Iglesias','(677) 692-4415','daquaniglesias8717@outlook.couk','P.O. Box 611, 3122 Pellentesque Road','72973','Euskadi','Spain','VTE46NGD4YR'),
  ('Connor Calvo','(168) 303-3447','connorcalvo@outlook.com','135-708 Nunc Road','49253','Madrid','Spain','KVK44FTA5LI'),
  ('Jaquelyn Calvo','1-371-626-6676','jaquelyncalvo1412@aol.edu','P.O. Box 729, 5628 Justo Road','99075','Comunitat Valenciana','Spain','RYO11QKH6WN'),
  ('Rogan Herrero','1-133-874-4148','roganherrero@protonmail.net','830-5381 Orci, Avenue','27592','Andalucía','Spain','DQO68DVH7QO'),
  ('Ahmed Gomez','(725) 889-6937','ahmedgomez7@yahoo.ca','P.O. Box 770, 9136 Nascetur Rd.','77105','Illes Balears','Spain','IAI35GVK7BM'),
  ('Ora Lorenzo','1-614-886-4081','oralorenzo@hotmail.com','811-3901 Aliquet, Street','11725','Aragón','Spain','GAA86SST4FR');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Maia Serrano','1-355-947-5340','maiaserrano@outlook.couk','P.O. Box 491, 4677 Mauris Rd.','34341','Extremadura','Spain','OUT62ODG3MU'),
  ('Fredericka Molina','1-610-980-1398','frederickamolina3922@google.ca','555-5002 Libero Rd.','78356','Principado de Asturias','Spain','TKQ47FHJ8VN'),
  ('Theodore Gomez','(703) 210-3656','theodoregomez678@hotmail.couk','Ap #225-8180 Sem Road','22990','Comunitat Valenciana','Spain','DPE55LBI8XB'),
  ('Mikayla Vidal','(513) 311-2852','mikaylavidal@google.ca','Ap #215-7864 Aliquam Av.','15363','Illes Balears','Spain','MTZ53NNG1CU'),
  ('Felicia Andres','1-219-224-3363','feliciaandres@aol.edu','882-9759 Ipsum Road','83024','Melilla','Spain','CNE34LVC8ST'),
  ('Rinah Casado','1-753-495-9039','rinahcasado3374@aol.edu','Ap #560-2498 Nibh. Street','79949','Catalunya','Spain','LTC77FWM4KZ'),
  ('Ruth Mendez','(855) 774-5133','ruthmendez220@outlook.org','126-5137 Enim Rd.','81159','Madrid','Spain','AKX63KMJ5IB'),
  ('Hasad Muñoz','(964) 628-8445','hasadmuoz@hotmail.com','859 Amet, St.','43237','Cantabria','Spain','PPT74ELI1UP'),
  ('Camilla Martinez','1-535-546-6465','camillamartinez7220@icloud.ca','Ap #352-7562 Odio. Avenue','33656','La Rioja','Spain','NLE61VZL1OQ'),
  ('Alvin Cano','1-875-825-6227','alvincano4669@icloud.org','Ap #440-332 Lorem, Av.','49065','Catalunya','Spain','LEO93RXB3XJ');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Idona Pastor','1-151-560-2282','idonapastor3104@yahoo.org','673-3442 Fermentum Ave','58239','Catalunya','Spain','VTU78QRW5DB'),
  ('Frances Prieto','(267) 337-9246','francesprieto@icloud.couk','833-1020 Gravida. Av.','26750','Navarra','Spain','DSD85IWV1PI'),
  ('Upton Pastor','(793) 558-6432','uptonpastor@hotmail.edu','610-7968 Suspendisse Ave','44220','La Rioja','Spain','PSL03JHX8EM'),
  ('Anjolie Merino','1-667-271-2182','anjoliemerino@hotmail.org','P.O. Box 703, 8290 Nunc Av.','65163','Comunitat Valenciana','Spain','JNF74VKL4MT'),
  ('Ian Molina','1-278-961-3131','ianmolina5737@aol.couk','Ap #381-3953 Lectus. Street','32022','Comunitat Valenciana','Spain','CUG81VUA7PL'),
  ('Rahim Dominguez','(266) 344-3734','rahimdominguez6730@outlook.edu','777-7063 Sit Rd.','53581','Murcia','Spain','WXN12ORB8ES'),
  ('Tamara Andres','1-624-767-6575','tamaraandres4562@icloud.net','579-9560 Est. Street','39982','Comunitat Valenciana','Spain','DQB93OHJ0JH'),
  ('Perry Marin','(674) 717-3518','perrymarin3055@icloud.couk','5468 Urna. St.','25877','Illes Balears','Spain','GLI13PKM2QK'),
  ('Raphael Cruz','1-258-667-8815','raphaelcruz6503@protonmail.org','328-333 Fermentum Rd.','77322','Euskadi','Spain','VIV16EBS1NQ'),
  ('Emmanuel Vidal','(204) 840-3647','emmanuelvidal9591@protonmail.com','P.O. Box 327, 4829 Orci, St.','25249','Ceuta','Spain','HVN15JDI7WD');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Ariana Delgado','1-745-386-1141','arianadelgado9768@protonmail.com','P.O. Box 354, 9206 Enim. St.','27875','Extremadura','Spain','FNH34FQT4OK'),
  ('Channing Saez','(561) 108-3062','channingsaez1069@yahoo.net','Ap #617-1083 Elit. Street','99437','Andalucía','Spain','HXH62SIY4BZ'),
  ('Leslie Marti','1-574-505-9984','lesliemarti@yahoo.org','P.O. Box 645, 8230 Praesent Road','88658','Comunitat Valenciana','Spain','BRU94TXL0FN'),
  ('Ronan Pardo','1-324-525-5769','ronanpardo4441@protonmail.com','474-5117 Quisque Avenue','96572','La Rioja','Spain','GXL72UDY6WT'),
  ('Shea Nuﾑez','1-232-271-0894','sheanuez@google.com','P.O. Box 290, 6486 Et Road','13713','Euskadi','Spain','LVR55PMO3MS'),
  ('Avram Santos','1-314-226-6425','avramsantos7784@icloud.couk','P.O. Box 575, 3012 Turpis. Rd.','40268','Cantabria','Spain','VYG51IYO3JO'),
  ('Olympia Vila','(781) 214-1064','olympiavila8372@google.ca','176-5952 Neque Rd.','83216','Canarias','Spain','PVL91WXS4EG'),
  ('Maya Iba','1-223-319-7558','mayaiba7785@protonmail.edu','503-234 Odio Ave','36408','Principado de Asturias','Spain','AIW01EQS8PP'),
  ('Constance Moreno','(252) 384-0848','constancemoreno5765@yahoo.edu','Ap #773-4095 Montes, Road','74119','Madrid','Spain','DKL05OMP1MT'),
  ('Gannon Moreno','1-164-680-2160','gannonmoreno@hotmail.ca','959-268 Netus Rd.','19744','Cantabria','Spain','IJU95FKB1CC');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Daphne Muñoz','(610) 314-9521','daphnemuoz@outlook.ca','Ap #161-8997 Gravida Av.','37548','Murcia','Spain','PFX81FYP7BU'),
  ('Skyler Pascual','1-516-590-6997','skylerpascual@hotmail.ca','5107 Ornare, St.','86261','Extremadura','Spain','ODD75BIY1QM'),
  ('Hakeem Gomez','(344) 417-2449','hakeemgomez3417@hotmail.com','969-9149 Maecenas Rd.','33327','Euskadi','Spain','HAD68VLJ2NU'),
  ('Cade Delgado','(660) 811-3554','cadedelgado@yahoo.org','Ap #751-4780 Libero. Rd.','49060','Principado de Asturias','Spain','FES35JQC8GL'),
  ('Bruno Vicente','1-354-564-7136','brunovicente@aol.edu','Ap #659-8629 Magna. Av.','90251','Euskadi','Spain','COJ68CQV7BV'),
  ('Kai Andres','1-842-404-2841','kaiandres5201@hotmail.couk','883-3246 Consequat Ave','58855','Comunitat Valenciana','Spain','HYX11WEL7QG'),
  ('Malachi Lorenzo','(260) 816-4178','malachilorenzo4155@hotmail.couk','2969 Pulvinar Rd.','60765','Navarra','Spain','UPN41YHG9ZQ'),
  ('Felicia Casado','1-815-557-1906','feliciacasado1379@aol.edu','Ap #763-2284 Sit Avenue','32699','Illes Balears','Spain','GYB43IFA4WN'),
  ('Unity Serrano','1-306-705-8258','unityserrano@protonmail.org','3653 Elementum Rd.','44254','Castilla y León','Spain','LJU77ECK3HJ'),
  ('Eliana Diez','1-512-825-3387','elianadiez4819@google.net','P.O. Box 594, 899 Nec St.','25684','Murcia','Spain','TFY32PTI8OB');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Erasmus Carrasco','1-633-878-0487','erasmuscarrasco4443@yahoo.ca','734-2803 Cras Road','37993','Euskadi','Spain','ARW35TFE8VG'),
  ('Kessie Merino','(251) 173-0253','kessiemerino@protonmail.com','P.O. Box 375, 7925 Eu, Road','42541','Extremadura','Spain','FYY74OKB8XB'),
  ('Germane Torres','1-320-573-3499','germanetorres@icloud.couk','9990 Eget Rd.','67526','Ceuta','Spain','REO27THX8SL'),
  ('Carly Pascual','1-580-336-4487','carlypascual@google.com','Ap #960-3313 Quis Road','98954','Principado de Asturias','Spain','UIB71DTH2WF'),
  ('Louis Vila','(885) 840-2105','louisvila@outlook.com','Ap #965-9178 Massa. Av.','39816','Aragón','Spain','BJY69PRL5UE'),
  ('Aretha Prieto','1-845-792-5647','arethaprieto@google.edu','852-4402 Mollis. St.','27886','Euskadi','Spain','GTW56UNQ7JE'),
  ('Olga ﾑez','(662) 173-1825','olgaez5092@yahoo.ca','3805 Porttitor Street','22832','Murcia','Spain','QYR49DFX5MW'),
  ('Adrienne Nuﾑez','(215) 870-3655','adriennenuez@yahoo.edu','9981 Risus. St.','77166','Castilla y León','Spain','MJS33VVN3QM'),
  ('Malik Miguel','1-411-264-5324','malikmiguel@google.org','P.O. Box 732, 5992 Vulputate St.','18263','Illes Balears','Spain','HLP51NOI2EK'),
  ('Echo Nuﾑez','(468) 375-2583','echonuez@icloud.net','888-6340 Malesuada Avenue','14428','Murcia','Spain','YNY64DUH9ET');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Zachary Garrido','(125) 860-7075','zacharygarrido@outlook.ca','2275 Fames Rd.','64351','Comunitat Valenciana','Spain','KOP56CKF6ZE'),
  ('Gary Andres','(614) 647-1132','garyandres6535@outlook.couk','P.O. Box 209, 9969 Tellus, St.','45201','Euskadi','Spain','LXJ43HEC9PL'),
  ('Lunea Casado','(775) 432-7287','luneacasado4053@outlook.edu','6211 Integer St.','29302','Cantabria','Spain','CFA53WBR2DM'),
  ('Alexa Leon','1-267-509-4656','alexaleon1713@protonmail.ca','895-6657 Risus. Rd.','54684','Canarias','Spain','DCD66OLJ4PK'),
  ('Kevin Martin','1-442-593-6611','kevinmartin9640@outlook.ca','707 Ipsum. Av.','43898','Comunitat Valenciana','Spain','BHB57FBN1CE'),
  ('Alma Fuentes','1-533-902-7707','almafuentes7125@yahoo.net','P.O. Box 804, 969 Nam Ave','42588','Ceuta','Spain','ZVO17YWB1PR'),
  ('Harriet Marti','(205) 846-4151','harrietmarti3629@google.org','867-6051 Malesuada Av.','61154','Galicia','Spain','HLN44GVS5KC'),
  ('Felicia Gimenez','(227) 505-8962','feliciagimenez@icloud.net','P.O. Box 450, 662 Ipsum Rd.','86481','Navarra','Spain','RPP02CXV2WF'),
  ('Barclay Ortega','1-577-749-6681','barclayortega8229@aol.net','247-5757 Fringilla Av.','14430','Ceuta','Spain','XIE59ATQ4IC'),
  ('Raymond ﾑez','(706) 829-8554','raymondez@aol.ca','884-5495 At, St.','75366','Euskadi','Spain','NBS85NKK3SM');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Ethan Hidalgo','1-914-977-5883','ethanhidalgo@outlook.ca','3244 At, St.','72683','Castilla - La Mancha','Spain','OIZ82OMZ1YD'),
  ('Raven Esteban','(224) 288-2236','ravenesteban@aol.edu','P.O. Box 716, 8681 Mi, Rd.','51277','Extremadura','Spain','POM57YXI4CZ'),
  ('Whoopi Medina','1-843-553-8387','whoopimedina@google.net','767-1992 Et Street','41260','Aragón','Spain','TQN91MGW8IS'),
  ('Anastasia Ramirez','(460) 614-1826','anastasiaramirez7330@outlook.com','4351 Vestibulum St.','85370','Castilla y León','Spain','WEM83UMQ4TI'),
  ('Harper Sanchez','1-319-658-5868','harpersanchez@outlook.couk','9246 Vulputate, Ave','41322','Navarra','Spain','USS55DBT1CR'),
  ('Anjolie Vila','(676) 888-9419','anjolievila@hotmail.net','968-291 Mi St.','18034','La Rioja','Spain','WXM59CQY0PO'),
  ('Acton Romero','(832) 242-3533','actonromero9709@yahoo.org','7313 Tellus St.','15757','Castilla y León','Spain','HOG92MGN3TN'),
  ('Phillip Carrasco','1-346-485-6676','phillipcarrasco@hotmail.ca','Ap #487-1336 Faucibus Ave','37317','Madrid','Spain','BPF53OJF1RC'),
  ('Ethan Rodriguez','(433) 371-9880','ethanrodriguez@aol.net','Ap #975-5802 Ligula Rd.','26785','Catalunya','Spain','THP72RFH1TQ'),
  ('Ima Suarez','(316) 574-2493','imasuarez@hotmail.net','Ap #644-8853 Erat Av.','54362','Ceuta','Spain','SRL57AFF7PP');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Kirsten Gutierrez','(335) 371-1154','kirstengutierrez@protonmail.net','Ap #996-1318 Aliquam Av.','63328','Navarra','Spain','WGL21HQY6VK'),
  ('Jason Nuñez','1-973-245-1585','jasonnuez@hotmail.edu','793 Donec Rd.','87507','Castilla - La Mancha','Spain','RJI14PED3WG'),
  ('Isaiah Garrido','(167) 355-1241','isaiahgarrido@aol.edu','Ap #256-8576 Lacinia. Rd.','43428','Melilla','Spain','LQR71SDS0ID'),
  ('Aimee Ibañez','1-275-317-4164','aimeeibaez8828@yahoo.ca','867-3873 Montes, Rd.','76555','Illes Balears','Spain','GGY78OEY3OG'),
  ('Tanner Gil','1-681-355-5796','tannergil@hotmail.couk','914-7934 Sed Road','60547','Comunitat Valenciana','Spain','BRO37AVA3UV'),
  ('Violet Santana','(724) 277-8252','violetsantana2626@yahoo.net','730-9546 Felis, St.','58839','Euskadi','Spain','DKJ11JOQ4MB'),
  ('Wylie Caballero','(695) 614-2978','wyliecaballero285@aol.couk','141-7213 Fusce St.','45693','Aragón','Spain','YPO12PYW5SY'),
  ('Lani Diaz','1-769-597-2758','lanidiaz@outlook.net','Ap #834-361 Porttitor Rd.','47853','Cantabria','Spain','KIW84QSI8MG'),
  ('Kelsie Herrera','(971) 265-7150','kelsieherrera5526@hotmail.com','Ap #239-7815 In St.','25898','Aragón','Spain','NGW42RUB5WJ'),
  ('Amena Fuentes','(621) 822-7738','amenafuentes@google.couk','125-7163 Nec St.','67048','Castilla y León','Spain','FHU31WUV5XT');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Leila Soler','1-182-446-2478','leilasoler8259@aol.edu','Ap #190-9851 Urna Rd.','52373','Principado de Asturias','Spain','QDH70XZA3HB'),
  ('Georgia Diaz','1-836-825-7348','georgiadiaz1076@aol.ca','Ap #967-6798 Mauris, St.','57080','Andalucía','Spain','ZHN73FUN8XG'),
  ('Jade Moya','1-225-329-1083','jademoya@hotmail.org','P.O. Box 864, 2037 Id Avenue','51851','Aragón','Spain','POW61EGZ2HU'),
  ('Thane Andres','(276) 453-1391','thaneandres7277@google.net','986-4496 Nullam St.','82886','Murcia','Spain','QSC35UMT3SM'),
  ('Lareina Nuñez','1-376-427-2737','lareinanuez8086@aol.net','Ap #351-8626 Est. Avenue','86757','Murcia','Spain','TUX22XLJ8GI'),
  ('Felicia Carrasco','(932) 772-8167','feliciacarrasco601@yahoo.couk','P.O. Box 436, 2188 Risus Street','73924','Galicia','Spain','KPX72HUG2QK'),
  ('Quinn Medina','(505) 692-7574','quinnmedina4310@protonmail.couk','861-515 Proin Rd.','31366','Comunitat Valenciana','Spain','NPF94XOT8CD'),
  ('Adara Moya','(811) 220-3821','adaramoya@outlook.ca','Ap #874-1663 Sit Avenue','85526','Principado de Asturias','Spain','TPG53UQD7OP'),
  ('Cullen Pardo','(456) 241-8187','cullenpardo9740@aol.ca','788 Dolor Street','00694','Euskadi','Spain','XPH03EBG1JH'),
  ('Wyatt ﾑez','1-835-476-4330','wyattez7558@yahoo.net','813-7525 Sed, Rd.','17482','Aragón','Spain','UNY83LEE5YT');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Giselle Iglesias','1-881-775-6472','giselleiglesias2764@google.net','Ap #911-3237 Magna Avenue','02158','Murcia','Spain','MBX63RUE3WB'),
  ('Hasad Mendez','1-347-867-9654','hasadmendez@yahoo.org','692-804 Non St.','80172','Madrid','Spain','QXR82FOG2NI'),
  ('Quentin Castillo','1-687-342-6282','quentincastillo@yahoo.org','P.O. Box 152, 2271 Sed St.','44819','Canarias','Spain','KTO46LMO4RH'),
  ('Nero Soler','1-862-867-1303','nerosoler@outlook.org','490-4680 Neque. Ave','90065','Castilla y León','Spain','TIO17KXL2AK'),
  ('Anne Leon','1-776-548-8787','anneleon@outlook.com','695-9400 Lorem, Ave','28204','Euskadi','Spain','UVQ22KYG3YB'),
  ('Clark Romero','(986) 873-1462','clarkromero@aol.net','173-872 Ante. Rd.','11584','Galicia','Spain','DKF70TRZ8UK'),
  ('Cooper Ferrer','(745) 947-2255','cooperferrer@aol.ca','412-1911 Quis Av.','91056','Extremadura','Spain','KBZ39KOY1PJ'),
  ('Alfonso Nuﾑez','(261) 842-2780','alfonsonuez9167@google.couk','5984 Diam Rd.','35523','Principado de Asturias','Spain','UBW53JOU8FM'),
  ('Audra Ramirez','(818) 663-9881','audraramirez4272@aol.edu','900-4302 Malesuada St.','45893','Aragón','Spain','KGQ41IZQ2LF'),
  ('Carson Marin','1-675-570-1843','carsonmarin1150@icloud.edu','782-7920 Pharetra Road','38874','Castilla y León','Spain','VGG29IJL6PB');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Plato Diaz','1-552-885-6737','platodiaz362@outlook.couk','Ap #364-403 Placerat, Rd.','58457','Canarias','Spain','CGE36PCL3SV'),
  ('Yen Iba','(137) 832-7371','yeniba@hotmail.com','Ap #598-7110 Parturient St.','62087','Madrid','Spain','KEC56KBG6VB'),
  ('Demetria Gonzalez','(347) 471-2538','demetriagonzalez@icloud.net','232-2070 A, Rd.','43968','Navarra','Spain','CDQ82WLY1FH'),
  ('Ava Molina','1-450-325-5440','avamolina3737@outlook.net','Ap #621-2287 Eu, St.','70221','Cantabria','Spain','VJS93HLE3JD'),
  ('Nasim Vazquez','(240) 485-3832','nasimvazquez9304@icloud.ca','864-1818 Etiam Street','20721','Euskadi','Spain','DYN89UNE4YI'),
  ('Moses Sanchez','1-578-921-7684','mosessanchez@yahoo.couk','P.O. Box 361, 2491 Egestas Rd.','64782','Comunitat Valenciana','Spain','XJM07VCN1VC'),
  ('Lyle Ibañez','(201) 552-8513','lyleibaez404@hotmail.edu','316-2115 Tellus. Av.','01429','Canarias','Spain','WDQ65WPL1RI'),
  ('Jana Nuñez','1-788-462-8724','jananuez@google.ca','6795 Egestas Avenue','29171','Navarra','Spain','NFY79QPH6HS'),
  ('Quin Perez','(232) 812-3120','quinperez7857@aol.couk','200-7161 Nunc Rd.','19938','Melilla','Spain','DSB96OKO0AJ'),
  ('Veda Santana','1-416-980-8541','vedasantana7859@hotmail.net','Ap #156-3375 Sed Rd.','23062','Catalunya','Spain','OLN32UFV5WC');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Sean Miguel','(894) 113-2487','seanmiguel@google.edu','415-2964 Euismod Av.','26512','Catalunya','Spain','NWJ38BXR2SP'),
  ('Micah Vazquez','(469) 719-4182','micahvazquez@yahoo.net','P.O. Box 939, 6128 Tortor, St.','71118','Extremadura','Spain','MTD27SPT5IO'),
  ('Hilary Cortes','(667) 198-5556','hilarycortes5173@google.net','Ap #946-5859 Mi Rd.','92305','Illes Balears','Spain','JLO61RQU8YS'),
  ('Shaeleigh Montero','(431) 466-7333','shaeleighmontero@google.org','Ap #502-5868 Porta Road','84218','Andalucía','Spain','PPX30OPG4KM'),
  ('Thor Moya','(615) 248-4238','thormoya@aol.com','6731 Lacus. St.','96502','Comunitat Valenciana','Spain','GRT26JLU0VM'),
  ('Hanna Calvo','1-829-537-0221','hannacalvo@google.com','P.O. Box 814, 4957 Phasellus St.','30159','Illes Balears','Spain','QDE32GRP2BI'),
  ('Craig Morales','1-159-743-3829','craigmorales3308@aol.ca','4256 Mollis Road','49684','Illes Balears','Spain','FMP58HTG1VW'),
  ('Travis Castro','1-787-431-5520','traviscastro@aol.ca','Ap #221-6702 Augue Avenue','13413','Murcia','Spain','EZL74RNU9XG'),
  ('Steel Fuentes','1-256-454-9627','steelfuentes@aol.edu','Ap #662-4657 Quisque Avenue','89748','Extremadura','Spain','HZD25UST6CM'),
  ('Lucas Esteban','(414) 504-6372','lucasesteban@protonmail.net','P.O. Box 482, 3465 Luctus, St.','31577','Castilla - La Mancha','Spain','CRA68VQQ3KO');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Fulton Fernandez','1-267-142-1551','fultonfernandez2091@yahoo.net','7690 Fermentum Ave','41858','La Rioja','Spain','OPE10XNN9OW'),
  ('Paki Iglesias','1-230-259-6088','pakiiglesias@icloud.org','969 Et Avenue','45749','Murcia','Spain','AIA07EBC7FH'),
  ('Keely Ortega','(704) 276-9393','keelyortega@protonmail.edu','Ap #956-1717 Faucibus Avenue','81065','Castilla - La Mancha','Spain','FEN46GJI1CJ'),
  ('Hyatt Cortes','1-810-426-3727','hyattcortes@aol.edu','P.O. Box 953, 6847 Sociis St.','41935','Andalucía','Spain','UMU76JAM8LI'),
  ('Owen Merino','(306) 130-8458','owenmerino@yahoo.org','Ap #638-5890 Vulputate Av.','91026','Andalucía','Spain','QHH13OBE5NM'),
  ('Uriel Ibañez','(376) 664-0515','urielibaez7737@aol.com','Ap #722-803 Nisi. Avenue','12416','Principado de Asturias','Spain','JIM86TSU1EV'),
  ('Violet Jimenez','1-628-377-1580','violetjimenez@hotmail.com','4581 Duis Rd.','92380','Castilla - La Mancha','Spain','TJV47MCJ6IM'),
  ('Stone Pastor','(203) 298-4474','stonepastor8254@aol.couk','Ap #618-6283 Sapien, Rd.','92668','Aragón','Spain','LTN10WQL5DY'),
  ('Colton Gutierrez','(759) 893-8454','coltongutierrez2519@icloud.net','Ap #394-3077 A, Rd.','61431','Aragón','Spain','OPN27FND6YT'),
  ('Courtney Vicente','1-173-531-1932','courtneyvicente@aol.com','814-2101 Quisque St.','81641','Galicia','Spain','GQG10KUE1WC');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Cameran Prieto','(142) 457-2841','cameranprieto3790@outlook.ca','Ap #193-7893 Mattis. Av.','91767','Catalunya','Spain','KJK64JMQ6SE'),
  ('Kaseem Merino','(343) 128-8839','kaseemmerino@yahoo.net','P.O. Box 863, 9780 Amet, Av.','17870','Canarias','Spain','DRP10JTC2DU'),
  ('Leo Medina','1-276-125-1756','leomedina6836@hotmail.org','Ap #892-6775 Est, Street','44137','Principado de Asturias','Spain','OII28VXG4UT'),
  ('Rogan Iba','(423) 840-5011','roganiba@protonmail.net','Ap #267-1942 Lacus Avenue','45505','Euskadi','Spain','FOJ95IRK2HS'),
  ('Wing Aguilar','1-715-354-1471','wingaguilar@outlook.edu','174-1187 Nec, Ave','71600','Extremadura','Spain','HOL73TKY9LQ'),
  ('Wynter Castro','(831) 563-0282','wyntercastro3844@hotmail.ca','Ap #157-4143 Enim. Ave','46741','La Rioja','Spain','KPB64CUG6WO'),
  ('Chadwick Diaz','1-825-248-1811','chadwickdiaz@icloud.couk','451-4321 Pellentesque Av.','46592','Principado de Asturias','Spain','FFQ33PXY8RM'),
  ('Kasper Esteban','(515) 850-0574','kasperesteban@protonmail.com','Ap #452-4110 Congue, Ave','89864','Melilla','Spain','HMC71EIB1OT'),
  ('Prescott Navarro','(221) 126-0965','prescottnavarro3048@protonmail.com','Ap #768-9730 Velit Street','87806','Euskadi','Spain','YMH53FQE6ND'),
  ('Kiayada Ortega','1-575-379-4924','kiayadaortega6694@protonmail.ca','5032 Erat St.','05388','Navarra','Spain','MIP83UPN8ZB');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Jemima Moreno','(120) 787-6934','jemimamoreno7637@icloud.net','Ap #252-2696 Vitae Avenue','33335','Andalucía','Spain','MDW86THM5UO'),
  ('Jeanette Alonso','(398) 404-5873','jeanettealonso@outlook.com','5076 Molestie Rd.','43169','Canarias','Spain','HHI97KSJ1BR'),
  ('Hannah Herrera','(899) 324-1798','hannahherrera@hotmail.edu','Ap #677-8151 Non Street','18668','Aragón','Spain','KGF90RYH3EX'),
  ('Cailin Calvo','1-938-457-5105','cailincalvo2741@aol.ca','308 Nulla. Street','43414','Cantabria','Spain','GSP67ZAQ4XP'),
  ('Burke Cruz','1-442-447-3261','burkecruz3774@yahoo.edu','Ap #229-7276 Adipiscing Rd.','14551','Ceuta','Spain','BTH54WJW6LF'),
  ('Duncan Velasco','(818) 607-2256','duncanvelasco3431@google.couk','8732 Scelerisque, Av.','18954','Castilla - La Mancha','Spain','LMR79EOI7SY'),
  ('Henry Casado','1-728-418-5676','henrycasado@aol.net','168-6989 Quis, Road','57185','Andalucía','Spain','ZUM33BTN8AW'),
  ('Roanna Gonzalez','1-469-647-4518','roannagonzalez@protonmail.edu','Ap #379-8298 Vivamus Avenue','68887','Murcia','Spain','HBB92FCS7CB'),
  ('Angela Delgado','(115) 253-6712','angeladelgado@google.ca','165-6829 Aliquet St.','26352','Extremadura','Spain','GFE34KXG4SE'),
  ('Shannon Santos','(702) 411-2247','shannonsantos4568@protonmail.couk','501-1752 Lorem Rd.','08814','Galicia','Spain','LSV56WKF7SJ');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Cadman Bravo','1-733-857-8782','cadmanbravo@protonmail.edu','Ap #764-8480 Fusce Rd.','38320','Galicia','Spain','HSP62URD2SR'),
  ('Lance Flores','(721) 562-2160','lanceflores@yahoo.org','Ap #374-4472 Ut Street','75253','Castilla - La Mancha','Spain','CMQ43WHG7NT'),
  ('Elvis Jimenez','1-875-643-3778','elvisjimenez79@outlook.com','Ap #316-2929 Aliquet Street','72333','Andalucía','Spain','JGM06JFT6EQ'),
  ('Karen Casado','(837) 800-5171','karencasado2225@protonmail.org','195-2931 Posuere Rd.','56904','Castilla y León','Spain','ROK13LKF7UP'),
  ('Denton Cortes','1-362-422-2863','dentoncortes1979@aol.org','P.O. Box 433, 4240 Libero Street','77288','Euskadi','Spain','NXS35XXG9TN'),
  ('Eagan Ortiz','1-535-784-9467','eaganortiz1326@aol.edu','2998 Non Street','84147','Euskadi','Spain','NJU18VWI6PH'),
  ('Kessie Morales','1-354-240-0557','kessiemorales9771@icloud.org','147-6514 Tellus Street','05257','Catalunya','Spain','PRT13APT2TG'),
  ('Unity Fernandez','1-464-642-2487','unityfernandez6141@hotmail.com','799-1118 Blandit Rd.','65389','Andalucía','Spain','UQX05BBL0WK'),
  ('Barrett Sanchez','1-530-352-6514','barrettsanchez@google.couk','4721 Mus. Av.','83862','Principado de Asturias','Spain','MWP53JLK2CH'),
  ('Amal Moreno','1-916-284-8427','amalmoreno8685@google.ca','554-2805 Id, Street','66701','Extremadura','Spain','VRK53XQH4DB');
INSERT INTO [Clientes] (nombre,telefono,email,direccion,cod_postal,ComAutonoma,Pais,contrasenya)
VALUES
  ('Conan Moya','(822) 889-4346','conanmoya@icloud.ca','431-8916 Ante. Rd.','73145','Comunitat Valenciana','Spain','ZZC63DRC4CJ'),
  ('Brittany Muñoz','1-631-278-8120','brittanymuoz1432@outlook.edu','9567 Libero. St.','61545','Murcia','Spain','GVD92PLO5IJ'),
  ('Jonas Aguilar','1-844-942-1030','jonasaguilar@protonmail.edu','P.O. Box 407, 6193 Amet Ave','06874','Canarias','Spain','VJO87QPE4CM'),
  ('Clayton Nieto','1-526-777-2916','claytonnieto7168@yahoo.couk','295-5052 Aliquam St.','18835','Andalucía','Spain','ZUF46YBH5NW'),
  ('Kai Gil','(772) 641-6825','kaigil@icloud.couk','Ap #853-2334 In Avenue','38228','Canarias','Spain','IEP36TPV2MX'),
  ('Ahmed Gimenez','(800) 744-2473','ahmedgimenez@google.ca','167-2821 Velit Rd.','52860','Galicia','Spain','QRV52GEJ4RM'),
  ('Oleg Casado','(624) 366-8974','olegcasado@aol.edu','P.O. Box 216, 566 Quis Avenue','23691','Melilla','Spain','DFU10SYJ7BO'),
  ('Shelly Esteban','(784) 714-3550','shellyesteban7528@google.org','158-5434 Nulla Rd.','74295','Castilla - La Mancha','Spain','VPT63BPK2RD'),
  ('Wylie Suarez','(614) 687-8834','wyliesuarez@protonmail.com','Ap #813-1153 Amet Street','63357','Euskadi','Spain','RYW17PGH3GX'),
  ('Macey Marin','(363) 760-5039','maceymarin9446@google.edu','Ap #304-1767 Eget Road','03751','Galicia','Spain','FHH12ABO2DY');


select * from pedidos
DECLARE @Date1 datetime
SET @Date1 = '1/01/2021'

declare @contador as int= 0

while @contador<5000
BEGIN
  INSERT INTO Pedidos
  select DATEADD(DAY, cast(RAND(CHECKSUM(NEWID())) * 365*( cast(RAND(CHECKSUM(NEWID())) * 2 as INT)) as INT), @Date1),
  idCliente,0,2.99,0,direccion,telefono,cod_postal,ComAutonoma from clientes where idCliente =cast(RAND(CHECKSUM(NEWID())) * 500 as INT)+1
  set @contador=@contador +1
END



declare @idpedido as int=1

while @idpedido<5001
BEGIN
    declare @nummenus as int =cast(RAND(CHECKSUM(NEWID())) * 2 as INT)+1
 
    while @nummenus >0
    BEGIN
        insert into Detalle
        select @idpedido,idMenu,cast(RAND(CHECKSUM(NEWID())) * 2 as INT)+1,precio from menu where idmenu=cast(RAND(CHECKSUM(NEWID())) * (select count(1) from menu) as INT)+1
        set @nummenus =@nummenus-1
    END
    set @idpedido=@idpedido+1
END


update pedidos set SubTotal=t1.totalcalculado
from pedidos p
inner join (

select p.idPedido,sum(Cantidad*PrecioUnitario) as totalcalculado from pedidos p
inner join Detalle d on p.idPedido=d.idPedido
group by p.idPedido
) as t1 on t1.idPedido=p.idPedido


update pedidos set Total=GastosEnvio+SubTotal


update clientes set contrasenya ='BLV54QYF6JT' where idcliente in (34,176)

update clientes set contrasenya ='QWERTYUIOPA' where idcliente in (87,356)




insert into Sushi select 'Temaki',2.25
 

alter table clientes  alter column nombre varchar(255) not null

alter table clientes  alter column telefono varchar(100) not null


alter table clientes  alter column email varchar(255) not null

alter table clientes  alter column direccion varchar(255) not null

alter table clientes  alter column cod_postal varchar(255) not null


alter table clientes  alter column contrasenya varchar(255) not null



alter table detalle  alter column cantidad int not null

alter table detalle  alter column precioUnitario decimal(5,2) not null
alter table pedidos  alter column telefonoentrega varchar(100) not null
alter table pedidos  alter column fecha datetime not null

insert into MenuSushi
select idmenu,idSushi,cantidad from  menushushi

drop table MenuShushi