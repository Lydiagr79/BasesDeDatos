PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''
PRINT 'Cargando datos de  la Spitify,Puede tardar unos minutos....'
PRINT ''
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT '###########################################################################'
PRINT ''

SET NOCOUNT ON

--create database spitify
GO
use spitify
GO
/*
=================================================================================================================================================================
CARGAR DATOS RANDOM para campos desconocidos de jugadores generados con Generate Data https://generatedata.com/generator
====================================================================================================================================================================
*/

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
    [pais] VARCHAR(100) NULL,
    [contrasenya] VARCHAR(255) NULL,
    PRIMARY KEY ([idCliente])
);
GO

INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Ocean Barnes','(889) 551-0068','luctus@protonmail.couk','Vietnam','ITS74VDU4VF'),
  ('Wynne Barnes','1-227-881-1372','consequat.purus@icloud.net','United Kingdom','PTT38NXR2ST'),
  ('Aimee Mccarty','1-723-554-6555','elementum.at@icloud.ca','Italy','OKG05YZN2VM'),
  ('Sacha Dennis','(509) 642-8378','nulla.integer@protonmail.couk','Ukraine','JKT45CMK8RV'),
  ('Hayes Foreman','1-868-646-8486','mauris.a@aol.couk','Costa Rica','MRV25JGY5UN'),
  ('Rinah Yates','1-875-670-8285','neque.sed@aol.couk','Norway','KCS96FHX9GD'),
  ('Dora Ruiz','(467) 621-7742','parturient.montes@hotmail.edu','Indonesia','HTK75AMW5SL'),
  ('Rhea Henderson','1-465-534-2220','pede@aol.edu','New Zealand','GJG05GET6RQ'),
  ('Quentin Daniels','(205) 438-6137','ipsum@yahoo.net','Chile','MGX68RUC1QF'),
  ('Hermione Cash','(278) 208-1161','lorem.ipsum@icloud.couk','Italy','PJT72TCF8FS');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Callie Davenport','1-571-697-6359','consequat@outlook.com','Spain','ODU41TZA7NC'),
  ('Alfreda Griffith','(347) 797-6129','mauris.magna@outlook.net','United States','CRO46DKI0SW'),
  ('Axel Elliott','(563) 435-3814','elit.elit.fermentum@protonmail.com','Singapore','XVQ63FQA3LT'),
  ('Jack Cardenas','(232) 554-2943','a.malesuada@google.org','South Africa','OGG26IJZ1YW'),
  ('Colin Padilla','(191) 308-1629','elementum@yahoo.com','South Africa','HFW32WAV6YG'),
  ('Malik Jacobs','(972) 145-1377','tristique@outlook.com','Austria','ZSU47DJC2QT'),
  ('Basia Lindsay','(210) 965-7741','egestas.duis@hotmail.ca','Singapore','NCF81KLG8FF'),
  ('Tamara Rose','1-269-488-2867','cras.dictum@google.net','Norway','SSW73CUC4RM'),
  ('Igor Goodman','1-733-875-6056','faucibus.ut@google.org','Italy','VOL48DBL1ZV'),
  ('Ariel Sharpe','(288) 568-2895','lobortis.quam@aol.com','Germany','DNL21CNY3FH');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Chancellor Goodman','(273) 952-7757','nunc.mauris@protonmail.couk','Spain','QBR33TVY1MB'),
  ('Forrest Mullins','(608) 243-0717','metus.in@hotmail.net','South Korea','KAV62JJI6EI'),
  ('Deanna Jenkins','(382) 532-5760','dolor.fusce@protonmail.edu','Spain','WLN63FEO8RD'),
  ('Aaron Osborn','(866) 118-6713','lobortis@protonmail.edu','Russian Federation','QTC13GOR4KZ'),
  ('Igor Duke','(698) 523-6319','leo@yahoo.org','Pakistan','TCV41VRH8SB'),
  ('Aurora Cannon','1-322-324-2333','convallis@google.edu','Italy','SUU22APT4JU'),
  ('Jonas Nelson','(508) 284-3577','gravida.nunc@icloud.net','Indonesia','RNN58RNI7JN'),
  ('Moses Medina','(281) 991-1040','sed.diam@icloud.couk','Spain','STM28YCT8SJ'),
  ('Nero Callahan','1-548-744-3985','dui.nec.urna@google.ca','Canada','NNS89SLU9LM'),
  ('Colleen Cruz','1-762-328-1482','pharetra@outlook.org','Netherlands','LCI15RNY4SA');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Odysseus Knowles','1-785-713-3557','sed.eu@icloud.net','India','BCV97KOK2LV'),
  ('Dustin Carver','1-775-808-3038','at@yahoo.org','Germany','HBP29PLO8RN'),
  ('Judah Camacho','1-516-371-6843','cras.vehicula.aliquet@icloud.com','South Africa','AGC69WMR9GH'),
  ('Fletcher Bryant','1-833-694-5505','luctus.ipsum@google.org','Canada','NMY06TXS5VV'),
  ('Bo Oneal','1-602-806-3193','ut.odio.vel@icloud.com','France','UUW33YLH4FT'),
  ('Tasha Campbell','1-626-975-6921','at.libero.morbi@outlook.com','Ukraine','KXD48JSQ1JR'),
  ('Virginia Riggs','1-561-787-5761','eget.varius.ultrices@protonmail.ca','Turkey','CNC45JKK3ON'),
  ('Dominique Owen','1-524-525-8133','at@yahoo.couk','Chile','OVJ51PPB6BB'),
  ('Kirestin Guthrie','(713) 504-5863','consectetuer.adipiscing@hotmail.org','Austria','FNF69YBE5BK'),
  ('Ronan Mcpherson','1-332-429-7973','convallis.erat@protonmail.ca','Canada','RAR70QKR4GK');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Imani Blake','1-990-299-6932','dolor.sit@google.edu','Norway','FHC53VQL2BG'),
  ('Clare Clemons','1-876-337-5100','nec.cursus.a@google.org','Turkey','EQV26YQP6LQ'),
  ('Unity Copeland','(682) 857-2634','massa.mauris.vestibulum@outlook.org','Peru','VLR46CWK7PF'),
  ('Phoebe Murphy','(686) 571-5598','arcu.curabitur@google.net','Canada','QLJ84CPS6LK'),
  ('Jolene Tucker','1-919-863-8753','enim@hotmail.edu','Sweden','GKD53MZS3CV'),
  ('Karly Terry','(449) 580-7875','neque.in.ornare@icloud.ca','France','DKA55CKU0RH'),
  ('Kieran Alvarez','1-656-468-5038','nulla@google.org','Indonesia','REV71BHR0VV'),
  ('Yen Schwartz','1-339-968-6531','semper.tellus@icloud.edu','Ukraine','JYA73WKJ7VR'),
  ('Maxine Puckett','1-318-363-7503','quisque@outlook.net','Ireland','FVH84IZT8BU'),
  ('Benedict Blankenship','(566) 835-1388','sit@outlook.net','Turkey','QSI44MVY9QV');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Donovan Fuentes','1-811-384-1203','ornare.placerat.orci@hotmail.org','Spain','HZU17NYF1NO'),
  ('Alexander Hill','(410) 568-9837','sit.amet@google.org','Pakistan','ZGO42LUQ0MB'),
  ('Kieran Mcclain','1-989-602-4816','et.eros.proin@icloud.net','Ireland','QYF76LSB8TK'),
  ('Lesley Murphy','1-172-825-3376','volutpat.ornare.facilisis@aol.com','France','DDH88DYX3TK'),
  ('Reagan Davis','(745) 474-4172','vitae.purus@hotmail.ca','United States','XJU66GEC6VK'),
  ('Rebecca Brock','(562) 135-4134','sociis@protonmail.org','Austria','ZWM76EYG8TU'),
  ('Brody Branch','(149) 625-4176','a@yahoo.net','Russian Federation','GXG83HOR6TJ'),
  ('May Cole','(358) 247-5876','dolor.fusce.feugiat@yahoo.com','Belgium','HLI87NCC3PI'),
  ('Christian Callahan','1-461-153-5495','senectus@outlook.edu','Canada','QZT67BRT4LB'),
  ('Hilda Macias','1-501-667-3232','diam.proin.dolor@yahoo.ca','Italy','LHM97NKM7UM');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Leandra Fox','1-814-702-6744','sit.amet@aol.edu','India','ROU93EIN4DG'),
  ('Brenna Roberts','1-689-877-0466','at.libero.morbi@protonmail.com','France','QKQ37DDG8TU'),
  ('Elijah Villarreal','(983) 551-8897','auctor.odio@google.net','India','FZF01TLH8WC'),
  ('Moana Cabrera','1-668-886-3998','suspendisse.eleifend@google.net','Philippines','RGY74VIV2SE'),
  ('Barry Decker','(276) 697-2153','varius.et.euismod@hotmail.ca','Indonesia','EJX94JOR3TD'),
  ('Clark Washington','1-584-285-3326','risus.at.fringilla@google.edu','Spain','XWQ61VPR2RQ'),
  ('MacKensie Hayes','(533) 210-3745','fermentum@icloud.ca','Netherlands','GCP23JXM9LI'),
  ('Velma Merrill','(272) 762-4426','mi@outlook.couk','Norway','RWW81FUB7BS'),
  ('Shana Gibson','(324) 585-8686','eleifend@outlook.edu','Poland','IQX42GVD1WA'),
  ('Berk Suarez','1-677-558-5834','sed.orci@aol.com','Turkey','WND66UBT1JA');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Cody Lawson','1-945-574-8829','tristique.senectus@icloud.com','Indonesia','ZBY18TWL1EW'),
  ('Judah Shields','1-668-827-3460','mi.enim.condimentum@protonmail.ca','Singapore','SWW91WMW1VU'),
  ('Nelle Ray','(251) 586-4183','ipsum@aol.couk','South Africa','SWV84QHN7IP'),
  ('William Giles','(224) 673-2736','dolor@yahoo.couk','South Korea','KJM87LHV2BM'),
  ('Charde Mann','1-223-272-8848','sem.magna@google.com','Costa Rica','DSF64SHY7JS'),
  ('Stuart Cohen','1-176-845-2757','natoque.penatibus@aol.couk','South Africa','BOX73HYY2TU'),
  ('Baxter Zimmerman','1-662-735-1614','per.inceptos@google.ca','Canada','JYJ61VGF3FQ'),
  ('Kevyn Tyler','(778) 241-5558','nec.tempus@protonmail.org','Vietnam','JMO49JBX5OO'),
  ('Macon Whitehead','1-795-465-2511','a.dui.cras@protonmail.ca','Netherlands','KGP06LHR7JE'),
  ('Harriet Sheppard','(481) 419-8016','est@google.org','Colombia','ULX17YNI3JU');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Steven Kemp','1-781-128-0925','vulputate@aol.com','Poland','AJS22TLZ2GB'),
  ('Herrod Bishop','(665) 795-0786','mi@hotmail.org','United Kingdom','YVD35IYV4GD'),
  ('Thane Craft','1-134-871-3376','suspendisse@outlook.com','Colombia','OCL67LHC8ZK'),
  ('Dustin Melton','1-629-481-3143','praesent@icloud.couk','Mexico','YIY64QIC7GE'),
  ('Drew Bartlett','1-782-957-1319','bibendum@protonmail.ca','Italy','MEO23SSY5DG'),
  ('Sasha Walters','(331) 212-4471','etiam@hotmail.com','Sweden','YMR70UID2FZ'),
  ('Hu Daniels','(852) 263-0172','mus.proin.vel@protonmail.edu','Colombia','YDR55PDR3OP'),
  ('Robin Simon','(128) 953-4575','amet.risus@hotmail.net','Netherlands','OLG18VFY3KW'),
  ('Victoria Gray','(461) 223-1164','malesuada.fringilla@google.org','Netherlands','ZUH35HSN4WD'),
  ('Alec Raymond','1-686-838-4239','duis.risus@aol.com','Vietnam','FGP15GZK5GU');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Tallulah Mercado','1-917-439-3236','dis.parturient@outlook.org','New Zealand','NWD62KFP6HS'),
  ('Hop Hensley','1-505-715-1110','elementum@outlook.org','France','IVK72GCO9XP'),
  ('Kelsie Glass','1-924-788-7775','commodo.tincidunt.nibh@aol.couk','Nigeria','RDB34OOY0OR'),
  ('Fletcher Lott','1-797-666-8284','ac.tellus@aol.couk','Australia','GKO74JGI2TL'),
  ('Joseph Payne','1-994-819-9235','adipiscing.mauris@aol.com','Italy','JMY34BUN3PC'),
  ('Garrett Erickson','1-724-617-3227','purus.maecenas@google.net','Spain','MMI62EBR0DG'),
  ('Francis Chambers','(454) 352-9138','felis.nulla@aol.net','Singapore','NLX41KWM5VQ'),
  ('Illiana Burt','1-338-577-1548','laoreet.ipsum.curabitur@google.org','Ireland','RPY61SFU7TD'),
  ('Lillith Cunningham','(320) 395-8554','dolor.sit.amet@yahoo.couk','Vietnam','SXD97WVO7MI'),
  ('Raven Nelson','1-387-416-3608','enim@yahoo.net','Costa Rica','KZO01XYA9RN');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Ruby Coffey','(406) 768-1588','faucibus.orci@protonmail.ca','Italy','TTP53DTQ8RP'),
  ('Neve Strickland','1-404-161-8443','bibendum.donec@aol.edu','Philippines','QIH12LMW5PQ'),
  ('Gloria Alston','1-665-571-8788','nisl.maecenas@protonmail.couk','South Africa','YTX15DYB7AX'),
  ('Dolan Weeks','1-687-696-0372','felis.nulla@aol.com','South Korea','FSL79BUU7GQ'),
  ('Shelby Branch','1-556-775-1482','ante@hotmail.com','Ukraine','WTB73FRT2DD'),
  ('Alfonso Schultz','1-365-727-4475','nunc.risus@hotmail.com','Canada','FMN66DAD2QG'),
  ('Armand Mayo','1-758-503-5414','a.malesuada.id@yahoo.com','Brazil','NPH03TGP7RB'),
  ('Ignatius Ochoa','(586) 758-8552','est.arcu@yahoo.org','Pakistan','LHB42JPW5TD'),
  ('Garrett Sherman','(718) 145-5214','purus.duis@aol.org','Germany','DFP77PNH3LM'),
  ('Zeus Barry','(383) 292-7126','arcu.vivamus@outlook.ca','France','WFS96HDY4SB');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Jeremy Massey','(456) 411-4118','ut.eros@protonmail.edu','United States','JFO38FMM4RH'),
  ('Herman Long','1-404-735-0813','est@icloud.org','Ireland','KDI70FST7YV'),
  ('Ashely Griffin','1-624-586-4176','et.magnis.dis@yahoo.net','Nigeria','QTO71KXK2IV'),
  ('Lara Powell','(182) 558-4619','molestie.tortor@icloud.ca','Australia','BXT49GBH2WF'),
  ('Len Walters','1-376-347-4536','convallis.convallis@outlook.net','Pakistan','MUP15XDK5FY'),
  ('Lani Harrison','1-823-129-3858','urna.justo@google.edu','Belgium','KIW51AKW0QL'),
  ('Rachel Stark','1-106-741-3371','urna.et.arcu@hotmail.ca','Netherlands','OBW68DKY1RC'),
  ('Emmanuel Miller','1-770-617-2535','dui.quis@hotmail.ca','Chile','GFQ12JVS1PS'),
  ('Hashim Ross','1-663-716-5813','nisi.aenean.eget@yahoo.org','Vietnam','KJJ53SVS8QN'),
  ('Myles Potter','1-643-642-8625','justo.sit@hotmail.edu','Philippines','NGJ83JEA4WK');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Martin Garrison','(107) 966-7684','adipiscing.elit@aol.net','Poland','PLJ55UHM3AL'),
  ('Raya Byers','(448) 226-3287','aliquet.libero@yahoo.net','Chile','PCZ42VOU5ED'),
  ('Lee Daniels','(805) 762-6344','vulputate.ullamcorper.magna@google.ca','Germany','LKH37YRD5QF'),
  ('Eagan Santiago','1-886-219-4566','sed.dolor@hotmail.net','Australia','KFC84MXH6AN'),
  ('Hadassah Gibson','1-414-724-9672','amet.diam@yahoo.org','Poland','TRW03ETD3WD'),
  ('Keiko Whitfield','(641) 445-6812','dolor.elit@icloud.org','Canada','VWT57LQX5XH'),
  ('Anika Rosa','1-854-856-5488','fringilla.donec.feugiat@google.org','Italy','QGZ55ETS7BT'),
  ('Christian Day','1-321-964-7153','vivamus.nisi@outlook.org','Norway','USH63TGN6JN'),
  ('Grady Sullivan','(772) 745-2541','sociis.natoque.penatibus@protonmail.net','France','AJN83ZXI1FR'),
  ('Garrett Thornton','1-244-746-7260','enim@google.com','United Kingdom','VGW29KCA4RR');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Igor Sexton','1-225-476-3890','dictum@yahoo.couk','Indonesia','RRE64KKQ4EC'),
  ('Hall Baldwin','(210) 291-2317','malesuada.vel.venenatis@aol.com','Nigeria','MWX37ASE3WQ'),
  ('Noah Powell','1-540-476-3965','purus@protonmail.net','United States','AEW40FJZ9FZ'),
  ('Ria Perez','1-769-803-4663','felis@hotmail.org','Ukraine','IIV78IYX0BF'),
  ('Porter Dalton','(738) 617-7405','natoque@aol.ca','Indonesia','SWN84DUZ6EG'),
  ('Roanna Huber','(561) 441-3772','risus@google.com','Ireland','TSX33XUR5CI'),
  ('Moana Cherry','1-465-632-2177','nec.quam@icloud.org','South Africa','ETR01WGO0BH'),
  ('Cara Mitchell','(439) 760-8721','rutrum.eu@icloud.net','Ukraine','IWL29LZJ7XH'),
  ('Jayme Becker','(204) 171-3312','sapien.imperdiet.ornare@icloud.edu','Germany','GYU58FLQ6GV'),
  ('Velma Morris','1-523-642-8378','vulputate.eu@google.ca','United States','MYE21PBE5SC');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Katell Parks','1-751-806-2714','rutrum.justo@aol.couk','New Zealand','BFB37PRH2HT'),
  ('Holly Hendricks','1-847-879-8860','aliquet.diam.sed@outlook.com','Poland','EUK98FGS8XI'),
  ('Orla Burke','(828) 866-3656','rutrum.justo@icloud.com','Australia','SWR15RTF6HI'),
  ('Hu Beard','(587) 772-8939','duis.volutpat.nunc@google.com','Belgium','QMH23YIR9AJ'),
  ('Jessica Pope','1-387-212-8516','pellentesque.massa@google.org','Spain','MER42SDB6PR'),
  ('Aladdin Robles','1-370-253-2824','faucibus@outlook.couk','Germany','BJQ65QOJ8NG'),
  ('Simon Erickson','(584) 974-3548','ut@aol.ca','Austria','OEA84ZUN3HO'),
  ('Olivia Kennedy','1-877-555-3117','faucibus.leo@outlook.net','Chile','YNO16GPX1QB'),
  ('Halee Tate','1-533-462-3550','natoque@yahoo.couk','Poland','MUS86DMF3YG'),
  ('Laura Rosa','(566) 534-1448','non@yahoo.edu','Ireland','MHQ07GQS5VV');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Justin Valentine','1-438-663-4936','mauris.a@outlook.net','Sweden','CXI43WGC4CE'),
  ('Halla Chapman','(268) 724-7402','blandit.viverra@icloud.ca','Norway','UVK31WWQ3OY'),
  ('Damon Robbins','(473) 237-2135','tempor@yahoo.com','United Kingdom','IPM67TBG9BQ'),
  ('Clare Mclean','1-806-371-5921','at.risus.nunc@google.couk','Canada','WVR81MNE0OG'),
  ('Phelan Douglas','1-363-539-4390','class.aptent.taciti@aol.ca','China','IIF45CLS2AH'),
  ('Jordan Talley','(481) 771-9826','viverra.donec@google.org','Ireland','KIQ63VYS2JA'),
  ('Quinlan Morgan','(744) 212-3642','iaculis@aol.net','Sweden','XTA30SLP8LE'),
  ('Dorothy Lyons','1-437-656-7442','cursus.vestibulum.mauris@google.net','United Kingdom','OPW62CNN1EY'),
  ('Serina Drake','1-555-257-2576','phasellus.elit.pede@outlook.org','Poland','UHX37XEM5CN'),
  ('Anne Parks','(503) 878-9469','penatibus.et@yahoo.couk','South Africa','AOT71ZUN8CE');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Armand Bonner','1-741-782-7974','placerat.cras@google.net','Peru','CWF83TCK6ER'),
  ('Carissa Hubbard','1-352-452-6687','dolor@yahoo.edu','Colombia','GWB24YKW1UJ'),
  ('Clark Romero','1-489-461-4860','non@yahoo.org','Canada','GDG04HYQ9AN'),
  ('Duncan Aguirre','1-876-441-3882','proin.vel@yahoo.edu','Chile','JGQ52TSX2OV'),
  ('Chastity Roth','(858) 292-9011','dignissim.tempor.arcu@yahoo.com','Costa Rica','YFC45TPR0PD'),
  ('Ainsley Higgins','1-317-427-8229','aliquet.odio@protonmail.org','Spain','MWV68WED7LP'),
  ('Venus Stephenson','1-334-479-4110','pede.nec@hotmail.net','Turkey','FQO28CFS8KB'),
  ('Alfonso Johnson','1-605-722-4375','fermentum@aol.edu','Canada','ZDM83EYV3BQ'),
  ('Kyle Vinson','(325) 528-2124','placerat.cras@aol.net','Philippines','YUP19OLT1QT'),
  ('Guy Mclaughlin','1-535-516-4851','id@icloud.edu','Colombia','RJM14DHS4JX');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Quail Hood','1-841-446-4389','accumsan.neque@aol.ca','Philippines','UBM81MKM0LT'),
  ('Ayanna Gilbert','(704) 378-8395','ultrices.a.auctor@hotmail.net','Germany','CEB44DGY7SQ'),
  ('Caldwell Goff','(282) 433-1282','dignissim.maecenas@yahoo.edu','Singapore','UNY74KLY4XI'),
  ('Stella Glover','(731) 465-7013','molestie@outlook.com','Costa Rica','LPX70GMV7MY'),
  ('Alden Kennedy','1-853-797-6651','ut.molestie@yahoo.net','Austria','ULA02MLR0KM'),
  ('Harriet Soto','(935) 477-3183','hendrerit@google.com','Pakistan','VBK38EPL7EC'),
  ('Geraldine Hahn','(437) 646-6283','leo.cras.vehicula@protonmail.net','Mexico','KPF23JPK5VR'),
  ('Hadley Frank','1-928-562-8690','sed.malesuada.augue@google.net','Peru','HTU18KZQ9LF'),
  ('Ocean Cunningham','(766) 287-4332','amet.nulla.donec@google.org','Indonesia','YMT32KJP2CB'),
  ('Rose Schmidt','1-852-162-2499','euismod.et@hotmail.edu','Colombia','LNO47RLY2GM');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Illiana Good','(759) 470-3874','erat.vivamus@protonmail.ca','Netherlands','UTP77VKS0YC'),
  ('Piper Burris','(676) 475-9438','lacus@protonmail.org','Russian Federation','FKH59QUF2DP'),
  ('Evan Burns','1-776-641-8682','at.velit@google.edu','Chile','DFW52RXB0PS'),
  ('Joseph Giles','1-226-390-8327','lorem.eget.mollis@hotmail.net','China','LYO50SIU1SL'),
  ('Ahmed Sawyer','(215) 559-0740','elit.fermentum.risus@aol.ca','Brazil','LHF18IBF3CQ'),
  ('Alfreda Klein','1-455-626-5856','iaculis.nec.eleifend@icloud.couk','Peru','NCU04ODF1RQ'),
  ('Raya Acosta','1-376-211-2734','ornare.sagittis@hotmail.org','Pakistan','HJS42WBM2JP'),
  ('Heidi Britt','(477) 919-5142','ut.mi.duis@hotmail.couk','Nigeria','FXF70KST6IS'),
  ('Russell Bryant','(258) 390-6864','augue.id@icloud.edu','Costa Rica','YTY36JED5VE'),
  ('Thomas Boone','1-801-845-0889','quisque.ac@aol.ca','Mexico','KOU13CMC0BT');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Yoshio Raymond','1-771-728-4268','mattis.ornare@outlook.org','France','SEE39BAE9BV'),
  ('Colt Leonard','1-312-585-0108','eleifend.nec@hotmail.couk','Ireland','HNU52XGW8FQ'),
  ('Abigail Everett','1-395-313-9608','tellus.justo.sit@hotmail.ca','United States','QGD25BJN8IA'),
  ('Ronan Gould','1-935-656-1479','nec.tellus.nunc@google.couk','France','SIK01QAF5NQ'),
  ('Maxwell Snow','1-405-288-1448','parturient@hotmail.edu','Spain','FCQ39CWT4JX'),
  ('Xander Serrano','1-964-421-6832','commodo.hendrerit@google.ca','Austria','RBT75KJV3NO'),
  ('Claudia Delaney','1-757-111-0826','risus@protonmail.net','Netherlands','ATU40OSM6YI'),
  ('Leslie Santos','1-167-294-6683','turpis.vitae@yahoo.org','India','HSP13MLS5XB'),
  ('Colorado Nguyen','1-516-616-2546','et@outlook.com','Russian Federation','NJG24WGC2HE'),
  ('Slade Snider','(843) 682-7827','sit.amet@hotmail.org','Russian Federation','TQX81YRM4VK');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Sybil Leach','(465) 826-9411','ut.molestie@outlook.com','France','BQX68ODF3OJ'),
  ('Naomi Knight','1-416-409-8913','enim.mi.tempor@hotmail.edu','Colombia','UUF99MPJ6SU'),
  ('Yen Hutchinson','1-460-474-6194','sem.nulla@protonmail.net','Colombia','JPV68WPU3HF'),
  ('Julian Petty','1-445-598-3333','luctus@hotmail.ca','Singapore','MFE76LPV5FQ'),
  ('Molly Garrett','1-768-599-5650','nunc.mauris.elit@aol.org','Poland','JKE93PKK8YQ'),
  ('Remedios Petersen','(459) 477-4067','tortor.integer@google.ca','Sweden','SOI22GJO5PI'),
  ('Rhonda Golden','(841) 555-6966','vitae.sodales@protonmail.ca','Pakistan','FJT88NKW5BF'),
  ('Alfonso Hale','(142) 758-5501','integer.tincidunt@yahoo.com','United Kingdom','PEP48MLP4JC'),
  ('Fredericka Cunningham','(127) 932-6245','lorem.auctor.quis@outlook.net','Italy','SCN75TVB6AN'),
  ('Idola Thompson','1-462-795-5315','ullamcorper.nisl.arcu@hotmail.ca','Philippines','IXT76GFC3HX');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Debra Snow','1-692-324-3487','neque.in@aol.edu','Sweden','CSI24QIT7UC'),
  ('Abel Carver','1-405-551-3821','et.magnis@google.com','Mexico','WYZ62LED3OI'),
  ('Lance Santana','(891) 841-1339','imperdiet.erat.nonummy@aol.ca','Russian Federation','QTA87TGU1FJ'),
  ('Madaline Walton','(286) 626-7528','id.libero@icloud.couk','Spain','PTS56JFH7BQ'),
  ('Lee Joyce','(467) 513-2585','urna@icloud.ca','United States','KSE23OUO6XS'),
  ('Ifeoma Rivers','(133) 484-5713','pharetra.quisque@hotmail.net','Colombia','TER92TXK3HH'),
  ('May Cain','1-338-522-8687','vestibulum.mauris@yahoo.couk','Russian Federation','LXG83EUH3UC'),
  ('Dillon Cook','1-736-604-2848','magna.lorem@icloud.edu','South Korea','OIU96FOX7HV'),
  ('Keane Moody','1-527-864-5129','venenatis.vel.faucibus@icloud.couk','Pakistan','IPM32JQB6OK'),
  ('Mohammad Stevenson','1-468-813-0881','fames.ac@outlook.net','Singapore','RHW53CDT2TX');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Quemby Cobb','1-597-180-6247','velit.aliquam@yahoo.edu','Canada','GSC17YFO8CH'),
  ('Akeem Barton','(182) 609-6116','facilisis.eget.ipsum@yahoo.com','France','VBW27JKK1NX'),
  ('Cadman Norton','(258) 825-7152','lacinia.orci@protonmail.ca','Indonesia','ZXL13RWQ5YX'),
  ('Kamal Maldonado','(866) 213-2261','arcu.iaculis@protonmail.net','Spain','RQZ61LNF6BK'),
  ('Hedda Drake','1-632-174-7106','scelerisque@google.org','Spain','RRT12BJS9PY'),
  ('Jordan Bauer','(868) 527-5317','dui.cras@aol.couk','Poland','AFP23USF1KM'),
  ('Harriet Sheppard','1-285-487-8348','elementum.lorem.ut@outlook.net','Turkey','IKO55VQP1BP'),
  ('Gray Gill','1-242-305-7321','a@hotmail.org','Norway','MMH55RBQ7EO'),
  ('Geraldine Ward','(511) 478-5232','suspendisse.eleifend.cras@google.org','Peru','RCG81FYC6PM'),
  ('Bradley Kirk','(685) 669-3498','quam.dignissim.pharetra@outlook.ca','Ukraine','SFU64AJQ5VI');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Justina Santana','1-504-856-1623','fermentum.convallis@aol.org','Vietnam','THJ22RLW9SE'),
  ('Fulton Anthony','(722) 477-7427','euismod.et.commodo@outlook.net','Canada','NYD70TNL8JN'),
  ('Miriam Davis','1-646-394-4461','est.mauris.eu@hotmail.org','South Korea','EBT92JXQ5WD'),
  ('Halee Lloyd','(246) 746-9867','mus@hotmail.couk','France','POX91JGK3ET'),
  ('Tanisha Waller','(818) 792-5836','mi.ac@hotmail.ca','China','OQJ46OLS8HK'),
  ('Nicole Waters','1-659-502-7340','nec.tempus.scelerisque@google.ca','Chile','INH21OLE2TD'),
  ('Kaye Briggs','(575) 275-3938','et@aol.com','Belgium','RRM80MSK4MI'),
  ('Jesse Smith','(475) 407-7542','est.ac@outlook.couk','Canada','GVS58VSV0AU'),
  ('Gareth Nelson','(717) 406-7286','faucibus@outlook.ca','Chile','GES01UJF3QD'),
  ('Gail Leonard','(226) 827-5320','cras.convallis.convallis@yahoo.couk','United Kingdom','YTL00XTQ6RM');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Berk Lambert','1-837-457-2509','auctor.nunc.nulla@outlook.edu','Netherlands','RCQ22VHU0FC'),
  ('Nita Hurst','1-350-624-9372','orci.ut@hotmail.com','Pakistan','NKL53EWD5LU'),
  ('Judith Ewing','1-949-716-2774','quis@aol.net','Norway','HHD83TKJ7OZ'),
  ('Sage Le','1-663-830-7278','nam.nulla@icloud.couk','Ukraine','JWQ59XNF4TR'),
  ('Colorado Boyle','(698) 732-2328','luctus.vulputate@protonmail.couk','Chile','MTW48EFL7DX'),
  ('Murphy Romero','(611) 282-5329','auctor@google.couk','Singapore','UHW46RZP6PJ'),
  ('Rhea Guzman','(253) 345-4518','nec.urna@protonmail.couk','United States','PCF28BVC1WW'),
  ('Nelle Carr','(532) 509-7260','eu@protonmail.couk','India','WHJ43SIW1UJ'),
  ('Mollie Davis','1-248-849-3845','risus@google.ca','Netherlands','PWT14GHE3RN'),
  ('Tarik Talley','(216) 464-1733','metus@aol.com','Brazil','JLC69OFM2II');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Carissa Neal','1-427-253-2731','in@protonmail.org','Pakistan','GHI04CXU0TG'),
  ('Summer Campbell','1-398-162-2837','tincidunt.orci@hotmail.couk','France','VDS81VHY7DN'),
  ('Illiana Gilbert','(142) 342-7286','ipsum@aol.net','New Zealand','GHE46FDZ8LD'),
  ('Jenna Perkins','1-653-521-4274','purus.accumsan.interdum@google.org','Nigeria','VWD85JOI3XP'),
  ('Jenna Frye','1-981-853-6646','egestas.duis@yahoo.edu','Netherlands','NEU59LUB8XT'),
  ('Venus Gillespie','(377) 464-5391','pede@icloud.couk','Peru','VFW66XLL3IG'),
  ('Lilah Hall','(616) 264-3660','lacinia.at.iaculis@icloud.com','Brazil','CYN46QYT9FS'),
  ('Kenyon Steele','(515) 327-2585','magna.ut@google.couk','Costa Rica','CQS04FSS1IJ'),
  ('Courtney Trujillo','(634) 336-2455','vivamus.nibh.dolor@icloud.net','United States','NEM55COB6XG'),
  ('Idona Hobbs','(898) 414-2458','ante.maecenas.mi@google.edu','South Korea','BMO52MBP1JD');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Caleb Santos','1-756-215-3778','proin@yahoo.couk','New Zealand','MCR21RRI4CA'),
  ('Joseph Reynolds','1-755-558-5744','aliquet.phasellus@google.org','China','DFJ85KVH5EY'),
  ('Rooney Butler','(474) 356-3841','sed.sem@protonmail.ca','Netherlands','LOU88LXW0UY'),
  ('Elton Pace','(864) 803-4020','tempor.erat.neque@yahoo.org','Italy','OBN86PVR6TX'),
  ('Rinah Mckinney','1-289-453-1867','ante.bibendum.ullamcorper@yahoo.edu','Germany','XXK12TEF1KH'),
  ('Mohammad Watts','1-185-388-2086','metus@protonmail.couk','Peru','LBY84GGE3XC'),
  ('Christine Frank','(347) 574-6761','libero.est.congue@icloud.com','Austria','TMW34GJN5VS'),
  ('Liberty Rivers','(823) 389-7831','vitae.orci@hotmail.edu','Colombia','VIX00OEQ2OU'),
  ('Zachery Kemp','(274) 516-3737','nec.luctus.felis@aol.com','Vietnam','JPS40OQI6UU'),
  ('Christopher Guy','1-547-963-6869','diam@hotmail.ca','Peru','TOB71YRX1OR');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Cooper Lewis','(935) 559-5135','ipsum.curabitur@outlook.org','United Kingdom','JYZ14PKM4KS'),
  ('Uriel Bird','(287) 832-6522','consequat.enim.diam@aol.edu','Mexico','HKD70EFL2HP'),
  ('Bruce Gillespie','(515) 508-3477','morbi.quis@icloud.ca','Ireland','NWS82SMG8PQ'),
  ('Tasha Holland','(595) 164-8211','id.enim@yahoo.org','Pakistan','EKG61HXB4HD'),
  ('Kelly Doyle','(861) 408-0984','sem.pellentesque@icloud.edu','Philippines','OJT39MLD5GZ'),
  ('Talon Pugh','1-657-404-5846','molestie.tellus@icloud.edu','Brazil','IKU72QGY7LT'),
  ('Colette Maldonado','(480) 518-2580','ac.libero@hotmail.org','Canada','NNX36UQB2WE'),
  ('Quinlan Rodgers','(826) 760-3903','tristique.neque.venenatis@aol.edu','Vietnam','DKS64FCQ6PG'),
  ('Maia Green','(441) 952-4362','fusce.fermentum@aol.couk','India','BHE08UOS2GV'),
  ('Ryder French','(354) 257-3850','ac.tellus@hotmail.ca','Peru','WPQ41PMB7JY');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Buckminster Morales','1-415-902-6832','lorem.vehicula@protonmail.org','South Korea','WWJ59CIW8IG'),
  ('Garrett Dominguez','1-835-251-8541','scelerisque.mollis@icloud.net','China','TWG68LWC7YN'),
  ('Kimberley Ashley','1-111-711-4810','pellentesque@outlook.ca','China','OQM75LWQ9NK'),
  ('Ryan Mann','(662) 766-3567','lobortis.mauris@outlook.org','Ukraine','YGL77HGV0EX'),
  ('Helen Conner','1-729-149-5021','non.enim.mauris@outlook.couk','China','YLS02MSC5PV'),
  ('Eve Melendez','(168) 867-4768','nascetur.ridiculus@outlook.ca','Turkey','DIB86WFS1IX'),
  ('Lysandra Silva','1-275-432-8164','nec.cursus@outlook.net','Australia','UPL13IPK3DE'),
  ('Adam Albert','1-123-127-2324','enim.mi@google.com','Germany','NJP86WRR4QY'),
  ('Brandon Farley','(637) 585-7405','tincidunt.neque.vitae@outlook.net','Mexico','VNS74WTW5NC'),
  ('Fallon Gill','1-455-577-5824','in@icloud.com','Poland','VGF31BJD3QP');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Joy Downs','(845) 346-4102','felis@google.com','Italy','ULS43RPE2UK'),
  ('Rebekah Hurst','1-421-224-5758','litora.torquent@google.org','Chile','PBL45SWY2MS'),
  ('Athena Phelps','(353) 744-2752','et.commodo@aol.org','Italy','VGK32KBE7NM'),
  ('Tyler Larson','1-508-822-9245','elit.fermentum.risus@hotmail.edu','Turkey','SUN15DXG4PZ'),
  ('Conan Sharp','(569) 552-5712','neque.sed@protonmail.couk','Italy','OVU83UVF7JT'),
  ('Quynn Logan','(894) 790-9295','nunc.nulla.vulputate@aol.ca','Australia','XPP18WKH5YO'),
  ('Phelan Mendoza','1-152-822-8042','consequat.enim@outlook.net','Sweden','JXT44SLE8SI'),
  ('Vernon Robertson','(395) 314-4514','arcu.iaculis@protonmail.ca','China','SYM43VQT6KB'),
  ('Kessie Chan','(990) 552-6575','tempor.lorem@outlook.net','Germany','VWZ76RFD1YR'),
  ('Stacey Castillo','(362) 825-5106','mi.ac@google.com','Mexico','ZCR47USF2WT');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Tad Allen','(490) 543-3266','mattis.ornare@google.org','New Zealand','EAI18TJM5OT'),
  ('Flavia Maldonado','(833) 714-6903','sit.amet@protonmail.net','Italy','EZB73OUG1DE'),
  ('Hall Bryant','1-633-871-2126','nam.ac.nulla@protonmail.org','Germany','NJS79ELM1CL'),
  ('Flynn Boyle','1-737-168-0187','scelerisque.neque.nullam@google.net','Vietnam','TPQ73TFW9WL'),
  ('Kirestin Carson','1-909-413-1628','molestie.tortor.nibh@aol.couk','Poland','NNP82UCX4QQ'),
  ('Medge Henry','(962) 922-3877','accumsan.laoreet@yahoo.net','India','QHU73PTC9DN'),
  ('Bertha Castro','(116) 801-6339','aliquet.diam@yahoo.com','Ireland','IDY48JLY7BC'),
  ('Fredericka Justice','(695) 264-1344','lectus.rutrum.urna@hotmail.net','New Zealand','XJR26SVD4CD'),
  ('Maisie Workman','1-977-870-6339','magna.phasellus.dolor@google.edu','China','ICI74EYY4NP'),
  ('Adrian Rowe','1-310-174-7742','donec.est.nunc@protonmail.edu','Costa Rica','MHC61RWT2IE');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Francis Battle','1-301-340-5921','ridiculus@aol.com','Russian Federation','MPY08VTY6ND'),
  ('Kane Oneal','1-668-352-1613','eu.nibh@aol.ca','China','MTB84DJE7VJ'),
  ('Perry Summers','1-813-961-8651','metus.vivamus.euismod@protonmail.ca','Vietnam','FHL69REE8EK'),
  ('Sopoline Jones','1-145-756-8844','gravida.sagittis@google.net','Philippines','PPX76ICE4NZ'),
  ('Ryan Foreman','(797) 392-5665','turpis.non@google.org','Chile','LHW42EPG0XS'),
  ('Zachary Mack','(651) 287-7529','purus.gravida@hotmail.edu','South Africa','UTM91TTR8CR'),
  ('Celeste Curry','(721) 744-1725','fermentum.vel@outlook.com','France','RHI56XVN0TJ'),
  ('Britanni Waller','(578) 465-8793','vel.est.tempor@hotmail.com','Mexico','JWP79OPB9NC'),
  ('Porter Perkins','(459) 251-4061','aenean@hotmail.edu','Italy','MNS12BFK6VX'),
  ('Reese Fox','(496) 894-3337','cras.eu.tellus@protonmail.com','Peru','HCT59NQO8IM');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Channing Pittman','(308) 702-2863','ut@google.couk','Belgium','DQP90FON2SC'),
  ('Rina Rios','(467) 378-5871','id.blandit@icloud.couk','Russian Federation','HZH43KDM2HV'),
  ('Sonya Holman','1-617-825-3262','dis.parturient@yahoo.ca','Colombia','QCH94WST5XD'),
  ('Hoyt Burns','1-745-556-1224','aliquet@yahoo.edu','Nigeria','HCW58JSW1GU'),
  ('Macon Vasquez','1-720-470-6223','pede@hotmail.net','France','YEU63AJQ8QY'),
  ('Caryn Gray','(807) 653-2853','pharetra.nibh@protonmail.org','India','ZLJ42MYP1IM'),
  ('Nora Aguirre','1-222-583-7417','nonummy.ac@hotmail.ca','Germany','BLJ92CGZ8OA'),
  ('Mia Frazier','1-926-276-8524','vulputate.velit@protonmail.couk','Poland','STV05SUM5VR'),
  ('Shana Burks','(654) 389-3533','ornare.lectus.ante@outlook.org','Chile','SXL71MIH4IK'),
  ('Eagan Carrillo','(751) 458-1447','cursus.integer@hotmail.couk','Spain','GWR21RLY1HA');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Ignacia Beck','1-411-753-9676','mattis.integer.eu@protonmail.net','Philippines','RSD91YWR2TX'),
  ('Lila Elliott','1-665-843-1165','tristique.senectus@outlook.edu','United Kingdom','CWX15KAN5LP'),
  ('Shad Potts','(836) 742-1186','eget.volutpat@aol.couk','Spain','PQK53UMC8TY'),
  ('Wyoming Farrell','1-611-548-9624','non@icloud.net','Netherlands','TFS35TIB1TT'),
  ('Jared Graves','1-854-882-7236','metus.eu@hotmail.com','Peru','LUL55KGG5TN'),
  ('Odette Dominguez','1-825-537-2546','tincidunt@icloud.com','Poland','NVM42GAE3RD'),
  ('Otto Hahn','1-357-853-3038','auctor@hotmail.net','Australia','EOT06NQK0CX'),
  ('Athena Lowe','1-364-227-9952','semper.erat@aol.couk','Pakistan','RSO73RJT2BW'),
  ('Shafira Wiggins','(227) 720-1835','pulvinar@google.com','Russian Federation','QNN27HYB2XN'),
  ('Francis Atkinson','1-914-228-1408','neque.sed@hotmail.com','Pakistan','LEG59RQM1EX');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Amela Albert','(619) 322-7236','aliquam.nec@google.org','Ireland','LGY94IDB8NY'),
  ('Ebony Mckay','1-652-363-7453','suspendisse.non@aol.com','South Africa','HOR80CBB5AB'),
  ('Jamalia Kemp','(555) 504-5438','eleifend@hotmail.net','Indonesia','FDG86HOD1YO'),
  ('Elijah Mcintyre','(561) 569-3082','ipsum.ac@protonmail.com','United States','KWW27MHN1MP'),
  ('Fitzgerald Patrick','(401) 386-2135','natoque.penatibus@icloud.couk','Italy','HRQ95ZWP3GY'),
  ('Elton Talley','(344) 756-0975','fames.ac.turpis@protonmail.com','Turkey','SBM12MFO1KZ'),
  ('Dahlia Mills','1-677-612-8215','felis.orci.adipiscing@google.org','United States','PVB13SQH7IC'),
  ('Raven Hickman','(828) 516-1711','risus@aol.com','Austria','MTQ75KGV1FX'),
  ('Hammett Lambert','(491) 478-8150','ac@aol.edu','China','VPE13WGE8DV'),
  ('Quynn Britt','1-824-709-3514','sociis.natoque@hotmail.edu','China','UWH07QFQ3XP');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Mollie Wilcox','(898) 839-6742','quisque.ac@protonmail.edu','Vietnam','DXR77QTE6TX'),
  ('Evelyn Delaney','1-895-407-7942','leo@yahoo.com','Sweden','HFA58GBB6WT'),
  ('Stone Fields','(691) 135-1654','fames@aol.com','Mexico','OYM34WRB3TQ'),
  ('Omar Mckenzie','(411) 277-5253','molestie.pharetra.nibh@protonmail.edu','United Kingdom','EDB93QMJ9FN'),
  ('Gage O''brien','1-701-228-2434','interdum@hotmail.ca','Turkey','QCS57UTI5IW'),
  ('Derek Glass','1-618-797-3580','quis.diam.pellentesque@protonmail.net','Poland','QTB82QIR4DB'),
  ('Hillary Bradford','(574) 888-4128','eros.nam@google.net','Ireland','SFX34QCN8TO'),
  ('Colton Combs','(326) 809-2046','orci.luctus@yahoo.ca','Chile','SBF14LSQ5FA'),
  ('Galena Spencer','1-637-547-1658','aliquet.phasellus@aol.net','Indonesia','MBF96ZER4MO'),
  ('Charity Moore','(320) 271-4417','varius.nam@icloud.couk','Netherlands','FBH44VOG1HK');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Austin Tucker','(819) 919-3540','aliquet.nec@yahoo.com','Italy','TRQ29QEF2DX'),
  ('Eve Yates','1-626-629-4983','luctus.et.ultrices@outlook.couk','Australia','MHX22UTS1AJ'),
  ('Shad Parrish','1-474-133-8471','orci.sem@aol.edu','Norway','LPK41BBX1TI'),
  ('Shad Miranda','(354) 339-7115','imperdiet.erat@hotmail.ca','Austria','RSO47BPF3SG'),
  ('Griffin Taylor','(217) 686-8342','orci.sem.eget@hotmail.net','China','MSP89JCF5SN'),
  ('Genevieve Walton','1-432-646-1197','nec.imperdiet@protonmail.ca','Spain','SPM72RSZ0BZ'),
  ('Ezekiel Church','1-274-731-5866','duis.sit@hotmail.couk','Belgium','HGC42SCL4SZ'),
  ('Jolene Bradford','(646) 389-2414','ipsum@yahoo.ca','Peru','OQG45UNN2ZL'),
  ('Gavin Perez','1-335-821-7916','aliquam.iaculis.lacus@hotmail.com','India','GEJ04WCO0XR'),
  ('Charles Bowen','(192) 666-2671','vulputate.velit.eu@google.ca','Sweden','YZI55EUZ8JX');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Vanna Pacheco','1-927-376-1408','bibendum.ullamcorper@yahoo.com','New Zealand','DWB31HRO6NL'),
  ('Ingrid Sharpe','(814) 571-3950','aliquam.ultrices.iaculis@outlook.edu','Australia','KRT86MPF7PE'),
  ('Davis Hull','(279) 414-6331','consectetuer.ipsum@google.org','France','BSD47YMF9LH'),
  ('Jocelyn Vance','(860) 149-8337','lobortis@outlook.edu','Indonesia','WLF43XKO5WJ'),
  ('Bernard Norton','1-435-831-1301','metus.urna@aol.edu','India','NGP85OPH2NV'),
  ('Samantha Gonzales','1-560-613-3630','velit.sed@hotmail.com','Pakistan','QFB28FIL8GJ'),
  ('Oprah Carson','1-276-726-5230','auctor.quis.tristique@protonmail.ca','South Korea','BHE11CPL5RB'),
  ('John Hogan','1-321-124-5159','sed.dictum.eleifend@hotmail.ca','Chile','JPK38ZIY5NG'),
  ('Cherokee Reeves','(560) 685-2637','amet.dapibus@outlook.net','Colombia','UQL09MYZ6DT'),
  ('Serena Melendez','(269) 404-5635','dolor@icloud.couk','Turkey','KNK34GEC7HM');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Wendy Oneal','(283) 371-5757','mauris@yahoo.org','Spain','LQG82DUU5NB'),
  ('Kamal Cole','1-213-235-0346','nunc@aol.couk','Ukraine','SSH93RYM5PN'),
  ('Marah Paul','1-805-537-8143','convallis.convallis@outlook.ca','Nigeria','MOJ43VYD5HW'),
  ('Benedict Riley','(777) 115-8641','nulla.facilisis@aol.couk','Italy','OWR20IOJ1IW'),
  ('Helen Meyers','1-314-591-2647','ligula.aenean@yahoo.net','Netherlands','SMC58UHG2XA'),
  ('Ivy Cunningham','1-230-488-2986','nunc.mauris@google.couk','United States','DJY25MZF8TT'),
  ('Scarlett Buckner','1-242-990-9522','velit.pellentesque.ultricies@hotmail.org','Poland','FRL68MKK6TV'),
  ('Deirdre Sweet','1-973-547-7387','vel.faucibus@hotmail.couk','Turkey','JZL94WZP7IC'),
  ('Giselle Gates','1-218-905-3457','natoque.penatibus@icloud.edu','New Zealand','XXL12PIY7KO'),
  ('Kylie Lancaster','1-282-153-5535','duis.gravida@aol.ca','Peru','MQK37IDT1MV');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Daria Mccormick','(445) 879-4956','enim.suspendisse.aliquet@hotmail.couk','France','JMD24RJB3DY'),
  ('Aristotle Hardin','1-866-779-7535','non.lobortis@protonmail.net','Germany','BRE16DIH5CS'),
  ('Glenna Francis','1-788-690-3781','lacus@icloud.com','South Africa','TRI09NLT6LO'),
  ('Ryan Williamson','1-756-299-8342','a@icloud.edu','Vietnam','KSJ28CKP6DE'),
  ('Kelsie Bender','1-308-152-2828','molestie.orci.tincidunt@google.org','Russian Federation','VUM61GJW4NB'),
  ('Hanae Mccarty','1-464-523-1377','elementum@hotmail.couk','Colombia','WKV57VSU3YR'),
  ('Plato Merrill','(565) 443-3456','mi@google.ca','Poland','WTC16ODI4PT'),
  ('Alea Mckenzie','1-538-448-9382','magna@google.edu','Canada','SLQ67LFV5UI'),
  ('Noah Rasmussen','1-960-601-6803','ornare@google.couk','South Africa','COM38RTX6UM'),
  ('Neville Pickett','(705) 767-8676','neque.morbi.quis@google.net','Pakistan','UXD16TZT0LV');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Chaim Shaw','1-975-168-6223','duis.at.lacus@icloud.edu','Nigeria','HPF43HTE8ZV'),
  ('Inez Nguyen','(681) 577-0133','diam@google.edu','Philippines','YKW88LRQ7QR'),
  ('Fletcher Brock','1-378-628-7187','erat@yahoo.org','Indonesia','PZG96EPA4OF'),
  ('Brenna Cole','(138) 852-2947','adipiscing@outlook.ca','Austria','KPE61TAR9PI'),
  ('Caleb Blake','1-751-179-0655','purus.maecenas@icloud.couk','South Korea','TPG70FLL8LN'),
  ('Venus Lopez','(923) 469-8454','venenatis.vel.faucibus@icloud.edu','Norway','JXD84CCI2BU'),
  ('Amery Ward','1-808-778-3235','tristique.ac@yahoo.ca','Germany','CGT15LIL2MI'),
  ('Hasad Hoover','1-321-801-4550','aliquam.tincidunt@protonmail.com','Chile','CQR35DDM1AY'),
  ('Tobias Black','1-844-876-1257','elit.pellentesque@icloud.com','Belgium','JFQ96BJV6FR'),
  ('Alfreda Hahn','1-388-657-7304','amet.ornare@protonmail.edu','United Kingdom','FOQ27CBT1JL');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Hashim Garcia','(220) 854-3954','in.lobortis@outlook.org','Nigeria','ONG67JEC8GS'),
  ('Howard Wong','(554) 416-7522','amet.dapibus@google.net','Russian Federation','SNP49QIP5GL'),
  ('Zane Marks','1-134-534-8318','nibh.donec@aol.net','New Zealand','GDK30EWG6RJ'),
  ('Lynn Campos','1-682-781-4546','malesuada.malesuada@google.ca','New Zealand','CWZ23HCY8HG'),
  ('Steel Lott','1-472-769-5253','non@outlook.org','United States','JOO84FXE7BE'),
  ('William Steele','1-286-725-6324','mollis.non@icloud.couk','United States','NUR37UYI0VR'),
  ('Noelle Barr','(641) 636-4263','quam.dignissim.pharetra@protonmail.com','Belgium','MFU69UAW5KI'),
  ('Jermaine Mercer','1-251-543-0326','integer.id@aol.org','France','QNO79SBJ1XI'),
  ('Tobias Albert','1-949-869-1088','a@icloud.com','Italy','CTO22SSE7TG'),
  ('Cain Mcdonald','1-658-655-4434','sit@yahoo.net','Norway','HLS64XLN3GW');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Plato Farrell','1-733-217-9918','non@protonmail.com','Pakistan','GSN01SEE3MW'),
  ('Chester Shelton','1-326-496-6814','ac@yahoo.edu','Singapore','AMY15BVW7ZI'),
  ('Galena Vance','(835) 218-5560','cras.interdum.nunc@protonmail.edu','Austria','QFW88SHA2CI'),
  ('Alvin Leach','(457) 994-6819','adipiscing.elit.etiam@protonmail.com','United States','RYW18DNA2CR'),
  ('Maxine Woodward','(731) 207-6157','suscipit@aol.org','United Kingdom','WGM14CRA8OJ'),
  ('Solomon Pace','(826) 732-0234','lorem.luctus.ut@icloud.net','Ireland','TWP06AMQ2FI'),
  ('Kaye Peck','(452) 383-7686','non.feugiat@icloud.com','China','EIT32YWS4XD'),
  ('Kuame Fields','(526) 574-5154','feugiat.placerat.velit@outlook.couk','Nigeria','IUC66YQS3CU'),
  ('Francis Trevino','1-526-722-1465','aliquet.odio@protonmail.ca','France','VAD64YLT6JM'),
  ('Uta Weeks','(207) 974-0791','a.mi@icloud.com','Canada','JVD02VUX3VO');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Sage Floyd','(911) 258-1605','parturient.montes@protonmail.edu','Ukraine','YJD47VOB7YH'),
  ('Uriah Rowland','1-125-584-3785','mauris.blandit@hotmail.edu','Norway','OLU57GEO0LX'),
  ('Imelda Wiggins','(736) 335-6416','purus.sapien.gravida@icloud.ca','Indonesia','UNQ15LWX6LM'),
  ('Paula Harris','(616) 656-4467','nibh.dolor@hotmail.couk','Norway','VOC82UAD3TW'),
  ('Dillon Cooley','(736) 886-8620','tortor@google.net','Belgium','NLV59IGR7OT'),
  ('Quyn Love','(550) 913-8274','elit@protonmail.org','Pakistan','FNP17UJR6TU'),
  ('Jerry Benton','1-972-851-7874','ipsum.dolor.sit@google.net','United States','RBL82OJC5TP'),
  ('Julian Greer','1-886-823-6113','nunc.sed.libero@icloud.org','South Korea','UQS47YBR5KC'),
  ('Aurora Fuentes','(856) 281-4421','a@hotmail.edu','United Kingdom','IDO25CTJ6TX'),
  ('William Shelton','(414) 553-2659','lacinia.sed.congue@google.ca','Peru','BVO04KTA3DH');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Felix Snider','(746) 754-2326','ac.mattis@protonmail.ca','New Zealand','NRH93VDE1LX'),
  ('Amos Hanson','(284) 671-3913','massa@yahoo.net','Mexico','MKH48BJK2CJ'),
  ('Myra Mcdowell','(860) 827-4875','nec.imperdiet@outlook.org','Brazil','HMY84MEX3MB'),
  ('Lila Calhoun','(882) 507-5376','facilisis.facilisis@aol.net','Turkey','EDE34AKK6LL'),
  ('Carly Delaney','(412) 833-4602','orci.luctus.et@icloud.edu','South Korea','NCJ26YYC2UM'),
  ('Orla Brennan','(331) 538-4332','sit.amet@google.net','Brazil','KSR10AYM0XS'),
  ('Matthew Stanton','(808) 223-0450','nec.tempus@hotmail.com','France','IZG28LWY7GH'),
  ('Olympia Maddox','1-137-374-4714','lobortis.class.aptent@outlook.net','South Africa','ZMO76HNJ7GK'),
  ('Nina Delaney','(654) 229-5552','blandit@google.couk','Ukraine','BVV07EIV4KH'),
  ('Phoebe Harrell','1-223-281-8777','massa.vestibulum@protonmail.com','Poland','MUY58NRQ1UL');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Guy Allen','1-310-884-9067','risus.duis@yahoo.couk','Italy','WLR38BCU6TJ'),
  ('Barbara Roy','(784) 751-7478','praesent.interdum.ligula@google.com','United States','ZPO40LJI3PK'),
  ('Hashim Anderson','(287) 383-3349','convallis.dolor.quisque@yahoo.edu','Poland','QMV77SXD8CO'),
  ('Azalia Barnes','(117) 521-2872','etiam.vestibulum@yahoo.couk','Poland','EUF37CNK6BH'),
  ('Hammett Dale','(550) 614-6205','nec@hotmail.org','New Zealand','NMO73OEX1PT'),
  ('Farrah Benjamin','(308) 633-1755','eu@hotmail.edu','United States','OSK31GPP2EO'),
  ('Buckminster Banks','1-561-542-5216','eu@protonmail.net','France','OUK06SBS9QU'),
  ('Lamar Heath','(507) 361-1464','dictum.eleifend.nunc@yahoo.net','Nigeria','XGK55YNY5SK'),
  ('Zachary Clayton','(127) 474-6889','amet.massa@icloud.ca','Austria','QCU37NQO3JK'),
  ('Zachery Donovan','1-781-296-8821','nonummy.ac@google.ca','Singapore','BNB66HNZ6XL');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Connor Freeman','(968) 857-8181','et.nunc@protonmail.edu','Vietnam','MCC44SNN2DU'),
  ('Aphrodite Walsh','(488) 811-6426','placerat.cras.dictum@icloud.edu','Brazil','OGJ12YRS9DL'),
  ('Jason Barrera','(863) 174-7051','metus.sit.amet@yahoo.couk','United States','VDT14XKH6HC'),
  ('Lucas Velez','1-285-531-5745','sit.amet@protonmail.com','South Africa','EBH62YTC6SF'),
  ('Jaquelyn Smith','1-861-410-6725','felis.purus@protonmail.com','Peru','YUG30DYK7KQ'),
  ('Rashad Stevenson','1-665-572-9448','ante.lectus@aol.org','Indonesia','UIY63QCV3PQ'),
  ('Benedict Le','1-316-785-9237','proin.vel.arcu@yahoo.com','Italy','GKH20WPV4MU'),
  ('Flynn Horne','1-235-442-3551','vel.convallis.in@aol.net','New Zealand','DQU43VSJ9VT'),
  ('Kevin Tyson','(318) 244-8620','at@protonmail.ca','United Kingdom','QXU34CKA0UC'),
  ('Stuart Trujillo','(863) 280-8571','et.tristique@protonmail.org','Russian Federation','CJX47RGJ1BW');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Leonard Quinn','(134) 221-4955','mauris@outlook.net','United Kingdom','JIA15SOQ5LB'),
  ('Clare Spencer','1-915-542-6918','facilisis.non@hotmail.net','Turkey','KFE32ULN5FN'),
  ('Cody Owens','(472) 238-2872','ullamcorper.duis@hotmail.ca','United Kingdom','GCI23WFK3GX'),
  ('Megan Cunningham','1-186-174-2162','consequat.lectus@icloud.couk','Ukraine','FUV25WYU3IP'),
  ('Steel Hensley','(578) 483-0381','aliquet.lobortis.nisi@icloud.couk','Colombia','NQR56XRO8XC'),
  ('Stephen Blair','1-388-842-7748','ipsum.cursus.vestibulum@icloud.org','United States','NGQ29DVS4OC'),
  ('Sandra Sanders','1-910-816-6607','quisque.imperdiet@yahoo.net','South Korea','XMJ52DGK3VN'),
  ('Ava Travis','(643) 656-6621','at.risus.nunc@aol.couk','Spain','XWJ91IBM2YM'),
  ('Nayda Bowers','1-464-522-6462','in.mi.pede@protonmail.ca','China','KQB00DEG3IS'),
  ('Jael Lara','(346) 407-3164','hendrerit.donec.porttitor@outlook.edu','Philippines','QPI11MCK8LV');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Jeanette Richardson','(638) 361-5315','est.tempor.bibendum@aol.couk','Turkey','CWV97NJR5JC'),
  ('Regan Haney','(389) 439-1564','non.dapibus@hotmail.ca','South Africa','FNZ62QXT3HH'),
  ('Luke Dorsey','(821) 174-6852','nullam.ut@icloud.com','Chile','SOW57TPR6QW'),
  ('Arden Pope','1-383-321-8227','lorem.luctus@icloud.net','Italy','HFV43WJM7EI'),
  ('Levi Martinez','(635) 863-5274','et.malesuada@hotmail.com','Colombia','LPG66UGN8WJ'),
  ('Lydia Whitaker','1-653-655-6346','nisl.elementum.purus@outlook.org','New Zealand','ZNZ53KMG4DJ'),
  ('Jack Guthrie','(879) 276-7386','ut@outlook.edu','China','GPF68LKQ1YN'),
  ('Calista Tran','(650) 717-3643','risus.nunc@google.net','Ukraine','PXZ07GDV2GH'),
  ('Fulton Cervantes','1-547-164-5189','rutrum.fusce@aol.org','China','FSO41SQW0ST'),
  ('Dennis Tillman','(367) 626-2792','cursus.et@icloud.com','Pakistan','NPK36FGZ1VO');
INSERT INTO [Clientes] (nombre,telefono,email,pais,contrasenya)
VALUES
  ('Chester Norton','1-336-288-4253','arcu.aliquam@yahoo.net','Poland','PSH55DDY3HD'),
  ('Jordan Sharp','(251) 958-4513','justo@aol.ca','Poland','HFO94DPA6AJ'),
  ('Zelenia Waters','(746) 258-2665','elit.dictum@hotmail.edu','Canada','VCV17GJJ3IO'),
  ('Baxter Battle','(770) 992-4282','sollicitudin.orci@yahoo.net','Indonesia','HTV14ULV7GZ'),
  ('Nelle Mclaughlin','(726) 878-1865','ullamcorper.duis@protonmail.ca','Vietnam','COT16DCN7MP'),
  ('Harding Castillo','1-830-347-2413','sagittis@hotmail.edu','India','RFL07GOI8XN'),
  ('Patrick Walters','(521) 953-6546','lectus.sit@icloud.com','South Korea','LNB68JUB7EU'),
  ('Libby Rollins','(863) 644-7381','nulla.at.sem@hotmail.com','Ukraine','YCJ83CPP1LD'),
  ('Gage Mitchell','(251) 857-7764','duis@protonmail.couk','South Korea','HIR28TUB5LM'),
  ('Dustin Weber','(444) 671-8486','cras.dolor@yahoo.couk','Italy','YYU82GQQ6EW');





/*
=================================================================================================================================================================
CARGAR DATOS JUGADORES descargados de data world  https://data.world/gmoney/2016-nba-players-by-college
====================================================================================================================================================================
*/
drop table if exists rawdataplayer



drop table if EXISTS rawalbums
create table rawalbums(
id VARCHAR(100),
tipo VARCHAR(100),
nombre VARCHAR(1000),
anyo int,
idnum int)


--copia el fichero nba.csv en la carpeta backup de tu contenedor.
GO

BULK INSERT rawalbums FROM '/var/opt/mssql/backup/spitify/albums.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO

update rawalbums set nombre = REPLACE(nombre,'|',',')




drop table if EXISTS rawartist
create table rawartist(
id VARCHAR(100),
tipo VARCHAR(100),
nombre VARCHAR(1000))

GO

BULK INSERT rawartist FROM '/var/opt/mssql/backup/spitify/artist.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO



drop table if EXISTS rawEDGES
create table rawEDGES(
id VARCHAR(100),
ID2 VARCHAR(100),
tipo VARCHAR(100),
nombre VARCHAR(1000))

GO

BULK INSERT rawEDGES FROM '/var/opt/mssql/backup/spitify/EDGES.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO


drop table if EXISTS rawgenre
create table rawgenre(
id VARCHAR(100),
tipo VARCHAR(100),
nombre VARCHAR(1000))

GO

BULK INSERT rawgenre FROM '/var/opt/mssql/backup/spitify/genre.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO


drop table if EXISTS rawsubgenre
create table rawsubgenre(
id VARCHAR(100),
tipo VARCHAR(100),
nombre VARCHAR(1000))

GO

BULK INSERT rawsubgenre FROM '/var/opt/mssql/backup/spitify/subgenre.csv'
   WITH (
      FIELDTERMINATOR = ',',
      ROWTERMINATOR = '0x0a'
);
GO




drop table if exists Favoritos
drop table if exists EstaEscuchando

drop table if exists GenerosDisco
drop table if exists Discos
drop table if exists Artistas
drop table if exists Generos





--select top 10 * from movies

Create table Artistas(

idArtista int IDENTITY(1,1) PRIMARY key,
nombre varchar(500),
ref varchar(100)  
)

create table Discos(
idDisco int IDENTITY(1,1) PRIMARY key,
titulo varchar(500),
anyo int,
idArtista int,
ref varchar(100),
CONSTRAINT fkArtista FOREIGN KEY (idArtista) REFERENCES Artistas(idArtista),

)

create table generos(
idGenero int IDENTITY(1,1) PRIMARY key,
nombre varchar(200),
ref varchar(100)
)

create table GenerosDisco(
idgenero int,
idDisco int,
PRIMARY key(idgenero,idDisco),
CONSTRAINT fkgenero FOREIGN KEY (idgenero) REFERENCES generos(idGenero),
CONSTRAINT fkalbum FOREIGN KEY (idDisco) REFERENCES Discos(idDisco)

)

create table Favoritos(
idCliente int,
idDisco int,
PRIMARY key(idCliente,idDisco),
CONSTRAINT fkcliente FOREIGN KEY (idCliente) REFERENCES Clientes(IdCliente),
CONSTRAINT fkalbum2 FOREIGN KEY (idDisco) REFERENCES Discos(idDisco)

)

create table EstaEscuchando(
idCliente int,
idDisco int,
minutoEscuchado int not null
PRIMARY key(idCliente,idDisco),
CONSTRAINT fkcliente2 FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
CONSTRAINT fkalbum3 FOREIGN KEY (idDisco) REFERENCES Discos(idDisco)

)

insert into Artistas
select nombre,id from rawartist

insert into discos
select a.nombre,anyo,aa.idArtista,A.id--,
from rawalbums a
inner join rawEDGES artist on artist.nombre like '%hasArtist%' and a.id=artist.id2
inner join artistas aa on trim(aa.ref) =trim(artist.TIPO)

INSERT INTO generos
SELECT NOMBRE,ID FROM rawgenre


insert into GenerosDisco
SELECT g.idGenero,d.idDisco FROM rawEDGES R
INNER JOIN DISCOS D ON R.ID2 = D.REF
INNER JOIN GENEROS G ON G.ref = R.tipo

declare @contador as int= 0

while @contador<5000
BEGIN
declare @idClientes int = cast(RAND(CHECKSUM(NEWID())) * 500 as INT)+1
declare @idDisco int =cast(RAND(CHECKSUM(NEWID())) * 500 as INT)+1

  INSERT INTO Favoritos
  VALUES(@idClientes,@idDisco)

  set @contador=@contador +1
END

set @contador = 0

while @contador<5000
BEGIN
declare @idClientes2 int = cast(RAND(CHECKSUM(NEWID())) * 500 as INT)+1
declare @idDisco2 int =cast(RAND(CHECKSUM(NEWID())) * 500 as INT)+1
declare @minutos int  =cast(RAND(CHECKSUM(NEWID())) * 20 as INT)+1
  INSERT INTO EstaEscuchando
  VALUES(@idClientes2,@idDisco2,@minutos)

  set @contador=@contador +1
END



drop table rawalbums
drop table rawartist
drop TABLE rawEDGES
drop table rawgenre
drop TABLE rawsubgenre
alter table discos drop column ref
alter table artistas drop column ref
alter table generos drop column ref
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