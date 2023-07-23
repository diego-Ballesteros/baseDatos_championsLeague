/*pOSICIONESdEjUGADORES*/
insert into PosiciónDeJugadores values ('1','Portero');
insert into PosiciónDeJugadores values ('2','Central Derecho');
insert into PosiciónDeJugadores values ('3','Central Izquierdo');
insert into PosiciónDeJugadores values ('4','Lateral Derecho');
insert into PosiciónDeJugadores values ('5','Lateral Izquierdo');
insert into PosiciónDeJugadores values ('6','Mediocentro Derecho');
insert into PosiciónDeJugadores values ('7','Mediecentro Izquierdo');
insert into PosiciónDeJugadores values ('8','MediaPunta');
insert into PosiciónDeJugadores values ('9','Extremo Derecho');
insert into PosiciónDeJugadores values ('10','Extremo Izquierdo');
insert into PosiciónDeJugadores values ('11','Delantero');



insert into Árbitros values ('1',' Ropain Munive',7440976, '12');
insert into Árbitros values ('2','Ernesto Galvis',6927649, '2');
insert into Árbitros values ('3','Daniel Polo',4857464, '5');
insert into Árbitros values ('4','Eimar Perez',2134988, '8');
insert into Árbitros values ('5','Deud Soto',8439988, '6');
insert into Árbitros values ('6','Daniel Llinaz',6324008, '10');



insert into TiposÁrbitro(descripción) values ('Central');
insert into TiposÁrbitro(descripción) values ('Banderin Derecho');
insert into TiposÁrbitro(descripción) values ('Banderin Izquierdo');
insert into TiposÁrbitro(descripción) values ('Var');


insert into TipoÁrbitroEnPartido values('1','1','1','1'); 
insert into TipoÁrbitroEnPartido values('2','2','2','1');
insert into TipoÁrbitroEnPartido values('3','3','3','1');
insert into TipoÁrbitroEnPartido values('4','4','4','1');
insert into TipoÁrbitroEnPartido values('5','1','1','2');
insert into TipoÁrbitroEnPartido values('6','6','2','2');
insert into TipoÁrbitroEnPartido values('7','2','3','2');
insert into TipoÁrbitroEnPartido values('8','5','4','2');


/*______________JUGADORES PSG______________*/
insert into Personas values ('2','Lionel Messi','24/06/1987','16/10/2004','8','16','1');
insert into Personas values ('3','Edinson Cavani','14/05/1987','27/04/2005','9','24','1');
insert into Personas values ('4','Keylor Navas','15/12/1986','06/11/2005','20','25','1');
insert into Personas values ('5','Sergio Ramos','30/03/1986','26/03/2003','2','27','1');
insert into Personas values ('6','Marquinhos', '14/03/1994','17/11/2013','7','26','1');
insert into Personas values ('7','Neymar Jr','05/02/1992','07/03/2009','7','26','1');
insert into Personas values ('8','Kylian Mbappé','20/12/1998','25/03/2017','1','3','1');
insert into Personas values ('9','Vitor Ferreira','13/02/2000','11/07/20019','13','28','1');
insert into Personas values ('10','Marco Verratti','05/11/1992','20/05/2008','5','29','1');
insert into Personas values ('11','Danilo Pereira','09/09/1991','08/03/2010','21','30','1');
insert into Personas values ('12','Sergio Rico','01/09/1993','05/03/201','2','31','1');
insert into Personas values ('13','Timothée Pembélé', '09/09/2002','11/07/2007','1','32','1');
insert into Personas values ('14','Fabián Ruiz', '03/04/1996','07/06/2014','2','33','1');
insert into Personas values ('15','Metehan Güçlü', '02/04/1999','11/07/2007','1','34','1');
/*______________TECNICOS PSG______________*/
insert into Personas values ('16','Christophe Galtier', '23/08/1966','20/05/1999','1','35','2');

/*______________JUGADORES RMD______________*/
insert into Personas values ('17','Diego Altube','22/02/2000','01/01/2009','2','6','1');
insert into Personas values ('18','Thibaut Courtois','11/05/1992','17/05/2011','22','36','1');
insert into Personas values ('19','Daniel Carvajal','11/01/1992','27/04/2010','2','37','1');
insert into Personas values ('20','Éder Militão','18/01/1998','06/11/2015','7','38','1');
insert into Personas values ('21','David Alaba','24/06/1992','26/03/2009','19','39','1');
insert into Personas values ('22','Nacho', '18/01/1990','17/11/2010','6','2','1');
insert into Personas values ('23','Toni Kroos','04/01/1990','07/03/2007','12','40','1');
insert into Personas values ('24','Luka Modrić','09/09/1985','25/03/2008','23','41','1');
insert into Personas values ('25','Eduardo Camavinga','10/11/2002','11/07/20018','24','43','1');
insert into Personas values ('26','Lucas Vázquez','01/07/1991','20/05/2014','2','44','1');
insert into Personas values ('27','Dani Ceballos','07/08/1996 ','08/03/2013','2','46','1');
insert into Personas values ('28','Eden Hazard','01/09/1993','05/03/2017','25','48','1');
insert into Personas values ('29','Karim Benzema', '19/12/1987','11/07/2005','1','49','1');
insert into Personas values ('30','Marco Asensio', '21/01/1996','07/06/2015','2','50','1');
insert into Personas values ('31','Vinícius Júnior', '12/07/2000','11/07/2017','7','13','1');
/*______________TECNICOS RMD______________*/
insert into Personas values ('32','Carlo Ancelotti', '10/06/1959','20/05/1992','5','55','2');

/*______________JUGADORES LIVERPOOL______________*/
insert into Personas values ('33','Alisson Becker','02/10/1992','01/01/2015','7','60','1');
insert into Personas values ('34','Adrián',' 03/01/1987','17/05/2012','2','31','1');
insert into Personas values ('35','Joe Gomez','23/05/1997','27/04/2015','4','66','1');
insert into Personas values ('36','Virgil van Dijk','08/07/1991','06/11/2015','3','67','1');
insert into Personas values ('37','Ibrahima Konaté','25/05/1999','26/03/2016','4','68','1');
insert into Personas values ('38','James Milner', '04/01/1986','17/11/2003','6','2','1');
insert into Personas values ('39','Trent Alexander-Arnold','07/10/1998 ','07/03/20016','4','9','1');
insert into Personas values ('40','Roberto Firmino','02/10/1991',null,'7','61','1');
insert into Personas values ('41','Diogo Jota','04/12/1996',null,'13','23','1');
insert into Personas values ('42','Luis Diaz','13/01/1997',null,'10','62','1');
insert into Personas values ('43','Darwin Nuñez','24/06/1999',null,'9','63','1');
insert into Personas values ('44','Henderson','17/06/1990',null,'4','64','1');
insert into Personas values ('45','Fabinho','26/10/1993',null,'7','26','1');
insert into Personas values ('46','Harvey Elliott','04/04/2003',null,'4','69','1');
insert into Personas values ('47','Arthur','12/08/1996','17/11/2016','7','71','1');
/*______________TECNICOS LIVERPOOL______________*/
insert into Personas values ('48','Jürgen Klopp', '16/06/1967','27/02/2001','12','70','2');

/*______________JUGADORES BARCELONA______________*/
insert into Personas values ('1','Luis Suarez','24/01/1987','01/01/2003','9','24','1');
Insert into Personas values ('49','Ousmane Dembele','15/05/1997',null,'1','42','1');
Insert into Personas values ('50','Jordi Alba','15/07/1989',null,'2','45','1');
Insert into Personas values ('51','Pique','02/02/1987',null,'2','5','1');
Insert into Personas values ('52','Araujo','07/03/1999',null,'9','47','1');
Insert into Personas values ('53','Dani Alves','15/09/1983',null,'7','51','1');
Insert into Personas values ('54','Marc Teo Stegen','15/09/1992',null,'12','52','1');
Insert into Personas values ('55','Depay','13/02/1994',null,'3','54','1');
Insert into Personas values ('56','Frankie De Jong','12/05/1997',null,'3','56','1');
Insert into Personas values ('57','Pedri','25/11/2002',null,'2','57','1');
Insert into Personas values ('58','Gavi','5/08/2004',null,'2','58','1');
Insert into Personas values ('59','Ansu Fati','31/10/2004',null,'2','59','1');
Insert into Personas values ('60','Sergio Busquets','16/07/1988',null,'2','73','1');
insert into Personas values ('61','Xavi', '25/01/1980','27/02/1991','2','2','1','27/02/2021');
/*______________TECNICOS BARCELONA______________*/
insert into Personas values ('62','Xavi', '25/01/1980','27/02/2021','2','2','2',null);
insert into Personas values ('92','Quique Setién', '21/03/1963','27/02/1997','3','7','2');



/*______________TECNICOS______________*/
insert into Personas values ('63','Ivan', '25/01/1981','27/02/2021','2','5','2');
insert into Personas values ('64','Pedro', '25/01/1982','27/02/2021','2','6','2');
insert into Personas values ('65','Juan', '25/01/1983','27/02/2021','2','5','2');
insert into Personas values ('66','Moises', '25/01/1984','27/02/2021','3','7','2');
insert into Personas values ('67','Judas', '25/01/1985','27/02/2021','3','7','2');
insert into Personas values ('68','Noe', '25/01/1986','27/02/2021','3','7','2');
insert into Personas values ('69','Antonio', '25/01/1987','27/02/2021','4','8','2');
insert into Personas values ('70','Miguel', '25/01/1988','27/02/2021','4','9','2');
insert into Personas values ('71','Elian', '25/01/1989','27/02/2021','4','8','2');
insert into Personas values ('72','Diego', '25/01/1981','27/02/2021','5','10','2');
insert into Personas values ('73','Jose', '25/01/1982','27/02/2021','5','11','2');
insert into Personas values ('74','Pablo', '25/01/1983','27/02/2021','5','10','2');
insert into Personas values ('75','Sergio', '25/01/1984','27/02/2021','5','11','2');
insert into Personas values ('76','elkin', '25/01/1985','27/02/2021','6','12','2');
insert into Personas values ('77','Manuel', '25/01/1986','27/02/2021','6','12','2');
insert into Personas values ('78','Victor', '25/01/1987','27/02/2021','6','12','2');
insert into Personas values ('79','David', '25/01/1988','27/02/2021','7','13','2');
insert into Personas values ('80','Rodrigo', '25/01/1989','27/02/2021','7','14','2');
insert into Personas values ('81','Carlos', '25/01/1981','27/02/2021','7','13','2');
insert into Personas values ('82','Julio', '25/01/1982','27/02/2021','8','15','2');
insert into Personas values ('83','Petro', '25/01/1983','27/02/2021','8','16','2');
insert into Personas values ('84','Uribe', '25/01/1984','27/02/2021','8','15','2');
insert into Personas values ('85','Duque', '25/01/1985','27/02/2021','9','17','2');
insert into Personas values ('86','Maduro', '25/01/1986','27/02/2021','9','17','2');
insert into Personas values ('87','Carlos Nelson', '25/01/1987','27/02/2021','9','17','2');
insert into Personas values ('88','Enrique', '25/01/1988','27/02/2021','10','1','2');
insert into Personas values ('89','Ropain', '25/01/1989','27/02/2021','10','2','2');
insert into Personas values ('90','Samuel', '25/01/1981','27/02/2021','10','1','2');


/* mesi lesionado, neymar suspendido, mbape lesionado */
insert into EstadosDePersonas values ('1','20/07/2021','16/09/2021','2','1');
insert into EstadosDePersonas values ('2','16/02/2022','16/03/2022','7','2');
insert into EstadosDePersonas values ('4','16/02/2022','16/03/2022','5','2');
insert into EstadosDePersonas values ('5','16/02/2022','16/03/2022','6','2');
insert into EstadosDePersonas values ('3','16/02/2022','16/03/2022','8','1');


insert into Grupos values ('1','A','1');
insert into Grupos values ('2','B','1');
insert into Grupos values ('3','C','1');
insert into Grupos values ('4','D','1');
insert into Grupos values ('5','E','1');
insert into Grupos values ('6','F','1');
insert into Grupos values ('7','G','1');
insert into Grupos values ('8','H','1');
insert into Grupos values ('9','A','2');
insert into Grupos values ('10','B','2');
insert into Grupos values ('11','C','2');
insert into Grupos values ('12','D','2');
insert into Grupos values ('13','E','2');
insert into Grupos values ('14','F','2');
insert into Grupos values ('15','G','2');
insert into Grupos values ('16','H','2');


insert into Países(nombre) values ('Francia');
insert into Países(nombre) values ('España');
insert into Países(nombre) values ('Holanda');
insert into Países(nombre) values ('Inglaterra');
insert into Países(nombre) values ('Italia');
insert into Países(nombre) values ('Grecia');
insert into Países(nombre) values ('Brasil');
insert into Países(nombre) values ('Argentina');
insert into Países(nombre) values ('Uruguay');
insert into Países(nombre) values ('Colombia');
insert into Países(nombre) values ('Mexico');
insert into Países(nombre) values ('Alemania');
insert into Países(nombre) values ('Portugal');
insert into Países(nombre) values ('Turquia'); 16
insert into Países values ('19','Austria');
insert into Países values ('20','Costa Rica');
insert into Países values ('21','Guinea');
insert into Países values ('22','Belgica');
insert into Países values ('23','Croacia');
insert into Países values ('24','Angola');
insert into Países values ('25','Bélgica');


insert into Ciudades(nombre, idPaís) values ('Barranquilla','10');
insert into Ciudades(nombre, idPaís) values ('Cucuta','10');
insert into Ciudades(nombre, idPaís) values ('Paris','1');
insert into Ciudades(nombre, idPaís) values ('Monaco','1');
insert into Ciudades(nombre, idPaís) values ('Barcelona','2');
insert into Ciudades(nombre, idPaís) values ('Madrid','2');
insert into Ciudades(nombre, idPaís) values ('Amsterdam','3');
insert into Ciudades(nombre, idPaís) values ('Manchester','4');
insert into Ciudades(nombre, idPaís) values ('Liverpool','4');
insert into Ciudades(nombre, idPaís) values ('Napoles','5');
insert into Ciudades(nombre, idPaís) values ('Roma','5');
insert into Ciudades(nombre, idPaís) values ('Atenas','6');
insert into Ciudades(nombre, idPaís) values ('Rio de Janeiro','7');
insert into Ciudades(nombre, idPaís) values ('Belo Horizonte','7');
insert into Ciudades(nombre, idPaís) values ('Buenos Aires','8');
insert into Ciudades(nombre, idPaís) values ('Rosario','8');
insert into Ciudades(nombre, idPaís) values ('Montevideo','9');
insert into Ciudades(nombre, idPaís) values ('Monterrey','11');
insert into Ciudades(nombre, idPaís) values ('Guadalajara','11');
insert into Ciudades(nombre, idPaís) values ('Berlin','12');
insert into Ciudades(nombre, idPaís) values ('Munich','12');
insert into Ciudades(nombre, idPaís) values ('Lisboa','13');
insert into Ciudades(nombre, idPaís) values ('Oporto','13');
insert into Ciudades values ('24','Salto','9');
insert into Ciudades values ('25','San Isidro de El General','20');
insert into Ciudades values ('26','Sao Paulo','7');
insert into Ciudades values ('27','Camas','2');
insert into Ciudades values ('28','Santo Tirso','13');
insert into Ciudades values ('29','Pescara','5');
insert into Ciudades values ('30','Bisáu','21');
insert into Ciudades values ('31','Sevilla','2');
insert into Ciudades values ('32','Beaumont','1');
insert into Ciudades values ('33','Los Palacios y Villafranca','2');
insert into Ciudades values ('34','Montfermeil','1');
insert into Ciudades values ('35','Marsella','1');
insert into Ciudades values ('36','Bree','22');
insert into Ciudades values ('37','Leganés','2');
insert into Ciudades values ('38','Sertãozinho','7');
insert into Ciudades values ('39','Viena','19');
insert into Ciudades values ('40','Greifswald','12');
insert into Ciudades values ('41','Zadar','23');
insert into Ciudades values ('42','Vernon','1');
insert into Ciudades values ('43','Cabinda','24');
insert into Ciudades values ('44','Curtis','2');
insert into Ciudades values ('45','Hospitalet de Llobregat','2');
insert into Ciudades values ('46','Utrera','2');
insert into Ciudades values ('47','Rivera','9'); 
insert into Ciudades values ('48','Louvière','25');
insert into Ciudades values ('49','Lyon','1');
insert into Ciudades values ('50','Palma de Mallorca','2');
insert into Ciudades values ('51','Juazeiro','7'); 
insert into Ciudades values ('52','Monchengladbach','12'); 
insert into Ciudades values ('53','Martorell','2'); 
insert into Ciudades values ('54','Moordrecht','3'); 
insert into Ciudades values ('55','Reggiolo','5');
insert into Ciudades values ('56','Arkel','3'); 
insert into Ciudades values ('57','Bajamar','2'); 
insert into Ciudades values ('58','Los Palacios','2');
insert into Ciudades values ('59','Bisau','2');
insert into Ciudades values ('60','Novo Hamburgo','7');
insert into Ciudades values ('61','Maceio','7'); 
insert into Ciudades values ('62','Barrancas','10'); 
insert into Ciudades values ('63','Artigas','9'); 
insert into Ciudades values ('64','Sunderland','4'); 
insert into Ciudades values ('65','San Pietro','5');
insert into Ciudades values ('66','Londres','2');
insert into Ciudades values ('67','Breda','3');
insert into Ciudades values ('68','Wortley','4');
insert into Ciudades values ('69','Chertsey','4'); 
insert into Ciudades values ('70','Stuttgart','12');
insert into Ciudades values ('71','Goiânia','7');
insert into Ciudades values ('73','Sabadell','2');
insert into Ciudades(nombre, idPaís) values ('Milan','5');
insert into Ciudades(nombre, idPaís) values ('Londres','4');
insert into Ciudades(nombre, idPaís) values ('Turin','5');
insert into Ciudades(nombre, idPaís) values ('Dortmund','12'); 
insert into Ciudades(nombre, idPaís) values ('Besiktas','15');
insert into Ciudades(nombre, idPaís) values ('Donetsk','16');
insert into Ciudades(nombre, idPaís) values ('kiev','16');
insert into Ciudades(nombre, idPaís) values ('Villarreal','2');
insert into Ciudades(nombre, idPaís) values ('Bérgamo','5');
insert into Ciudades(nombre, idPaís) values ('Sevilla','2');
insert into Ciudades(nombre, idPaís) values ('tottenham','4');
insert into Ciudades(nombre, idPaís) values ('San sebastian','2');


insert into Clubes values ('1','Manchester City','8');
insert into Clubes values ('2','París Saint Germain','3');
insert into Clubes values ('3','Atlético Madrid','6');
insert into Clubes values ('4','Liverpool','9');
insert into Clubes values ('5','Oporto','23');
insert into Clubes values ('6','Milan','74');
insert into Clubes values ('7','Inter Milán','74');
insert into Clubes values ('8','Bayern Múnich','21');
insert into Clubes values ('9','Barcelona','5');
insert into Clubes values ('10','Manchester United','8');
insert into Clubes values ('11','Chelsea','75');
insert into Clubes values ('12','Benfica','22');
insert into Clubes values ('13','Juventus','5');
insert into Clubes values ('14','Borussia Dortmund  ','77');
insert into Clubes values ('15','Ajax','7');
insert into Clubes values ('16','Besiktas','78');
insert into Clubes values ('18','Real Madrid','6');
insert into Clubes values ('19','Shakhtar Donetsk','77');
insert into Clubes values ('20','Dinamo Kiev','79');
insert into Clubes values ('21','Villarreal','80');
insert into Clubes values ('22','Atalanta','81');
insert into Clubes values ('23','Young Boys','77');
insert into Clubes values ('24','Lille','79');
insert into Clubes values ('25','Sevilla','82');
insert into Clubes values ('26','Salzburgo','81');
insert into Clubes values ('27','Wolfsburgo','82');
insert into Clubes values ('28','Zenit San Petersburgo','82');
insert into Clubes values ('29','Malmoe','77');
insert into Clubes values ('30','Petro fc','10');
insert into Clubes values ('31','Rayo vallecano','6');
insert into Clubes values ('32','Everton','9');
insert into Clubes values ('17','Real sociedad','84');



2020
A 
insert into ClubesEnGrupoPorTemporada values ('1','1','1');
insert into ClubesEnGrupoPorTemporada values ('2','2','1');
insert into ClubesEnGrupoPorTemporada values ('3','6','1');
insert into ClubesEnGrupoPorTemporada values ('4','7','1');
B
insert into ClubesEnGrupoPorTemporada values ('5','3','2');
insert into ClubesEnGrupoPorTemporada values ('6','4','2');
insert into ClubesEnGrupoPorTemporada values ('7','5','2');
insert into ClubesEnGrupoPorTemporada values ('8','8','2');
C
insert into ClubesEnGrupoPorTemporada values ('9','9','3');
insert into ClubesEnGrupoPorTemporada values ('10','10','3');
insert into ClubesEnGrupoPorTemporada values ('11','11','3');
insert into ClubesEnGrupoPorTemporada values ('12','12','3');
D
insert into ClubesEnGrupoPorTemporada values ('13','13','4');
insert into ClubesEnGrupoPorTemporada values ('14','14','4');
insert into ClubesEnGrupoPorTemporada values ('15','15','4');
insert into ClubesEnGrupoPorTemporada values ('16','16','4');
E
insert into ClubesEnGrupoPorTemporada values ('17','17','5');
insert into ClubesEnGrupoPorTemporada values ('18','18','5');
insert into ClubesEnGrupoPorTemporada values ('19','19','5');
insert into ClubesEnGrupoPorTemporada values ('20','20','5');
F
insert into ClubesEnGrupoPorTemporada values ('21','21','6');
insert into ClubesEnGrupoPorTemporada values ('22','22','6');
insert into ClubesEnGrupoPorTemporada values ('23','23','6');
insert into ClubesEnGrupoPorTemporada values ('24','24','6');
G
insert into ClubesEnGrupoPorTemporada values ('25','25','7');
insert into ClubesEnGrupoPorTemporada values ('26','26','7');
insert into ClubesEnGrupoPorTemporada values ('27','27','7');
insert into ClubesEnGrupoPorTemporada values ('28','28','7');
H
insert into ClubesEnGrupoPorTemporada values ('29','29','8');
insert into ClubesEnGrupoPorTemporada values ('30','30','8');
insert into ClubesEnGrupoPorTemporada values ('31','31','8');
insert into ClubesEnGrupoPorTemporada values ('32','32','8');

2021

A 
insert into ClubesEnGrupoPorTemporada values ('33','10','9');
insert into ClubesEnGrupoPorTemporada values ('34','9','9');
insert into ClubesEnGrupoPorTemporada values ('35','8','9');
insert into ClubesEnGrupoPorTemporada values ('36','7','9');
B
insert into ClubesEnGrupoPorTemporada values ('37','6','10');
insert into ClubesEnGrupoPorTemporada values ('38','30','10');
insert into ClubesEnGrupoPorTemporada values ('39','5','10');
insert into ClubesEnGrupoPorTemporada values ('40','3','10');
C
insert into ClubesEnGrupoPorTemporada values ('41','1','11');
insert into ClubesEnGrupoPorTemporada values ('42','13','11');
insert into ClubesEnGrupoPorTemporada values ('43','31','11');
insert into ClubesEnGrupoPorTemporada values ('44','12','11');
D
insert into ClubesEnGrupoPorTemporada values ('45','2','12');
insert into ClubesEnGrupoPorTemporada values ('46','18','12');
insert into ClubesEnGrupoPorTemporada values ('47','15','12');
insert into ClubesEnGrupoPorTemporada values ('48','20','12');
E
insert into ClubesEnGrupoPorTemporada values ('49','17','13');
insert into ClubesEnGrupoPorTemporada values ('50','14','13');
insert into ClubesEnGrupoPorTemporada values ('51','19','13');
insert into ClubesEnGrupoPorTemporada values ('52','16','13');
F
insert into ClubesEnGrupoPorTemporada values ('53','21','14');
insert into ClubesEnGrupoPorTemporada values ('54','27','14');
insert into ClubesEnGrupoPorTemporada values ('55','23','14');
insert into ClubesEnGrupoPorTemporada values ('56','28','14');
G
insert into ClubesEnGrupoPorTemporada values ('57','25','15');
insert into ClubesEnGrupoPorTemporada values ('58','26','15');
insert into ClubesEnGrupoPorTemporada values ('59','22','15');
insert into ClubesEnGrupoPorTemporada values ('60','24','15');
H
insert into ClubesEnGrupoPorTemporada values ('61','29','16');
insert into ClubesEnGrupoPorTemporada values ('62','4','16');
insert into ClubesEnGrupoPorTemporada values ('63','11','16');
insert into ClubesEnGrupoPorTemporada values ('64','32','16');


insert into EntrenadoresEnClubes values ('1','09/02/2020','07/05/22','2','16');
Insert into EntrenadoresEnClubes values ('2','09/02/2020','07/05/22','18','32');
Insert into EntrenadoresEnClubes values ('3','09/02/2020','07/05/22','4','48');
Insert into EntrenadoresEnClubes values ('4','09/02/2020','07/05/22','9','62');
Insert into EntrenadoresEnClubes values ('5','02/02/2020','07/05/22','1','1');
Insert into EntrenadoresEnClubes values ('6','03/02/2020','07/06/22','29','3');
Insert into EntrenadoresEnClubes values ('7','04/02/2020','07/07/22','3','5');
Insert into EntrenadoresEnClubes values ('8','04/06/2020','07/08/22','31','6');
Insert into EntrenadoresEnClubes values ('9','04/05/2020','07/09/22','5','7');
Insert into EntrenadoresEnClubes values ('10','04/06/2020','07/10/22','6','8');
Insert into EntrenadoresEnClubes values ('11','05/06/2020','07/11/22','7','10');
Insert into EntrenadoresEnClubes values ('12','05/06/2020','07/12/22','8','11');
Insert into EntrenadoresEnClubes values ('13','05/12/2020','07/01/22','32','12');
Insert into EntrenadoresEnClubes values ('14','05/02/2020','07/02/22','10','13');
Insert into EntrenadoresEnClubes values ('15','05/02/2020','07/03/22','11','14');
Insert into EntrenadoresEnClubes values ('16','05/06/2020','07/04/22','12','15');
Insert into EntrenadoresEnClubes values ('17','05/02/2020','07/05/22','13','16');
Insert into EntrenadoresEnClubes values ('18','06/06/2020','07/06/22','14','17');
Insert into EntrenadoresEnClubes values ('19','07/02/2020','07/07/22','15','19');
Insert into EntrenadoresEnClubes values ('20','01/06/2020','07/08/22','16','20');
Insert into EntrenadoresEnClubes values ('21','18/12/2020','07/09/22','17','21');
Insert into EntrenadoresEnClubes values ('22','08/06/2020','07/01/22','30','22');
Insert into EntrenadoresEnClubes values ('23','09/06/2020','07/02/22','19','23');
Insert into EntrenadoresEnClubes values ('24','03/05/2020','07/03/22','20','24');
Insert into EntrenadoresEnClubes values ('25','02/03/2020','07/04/22','21','25');
Insert into EntrenadoresEnClubes values ('26','04/09/2020','07/05/22','22','26');
Insert into EntrenadoresEnClubes values ('27','05/09/2020','07/06/22','23','27');
Insert into EntrenadoresEnClubes values ('28','09/06/2020','07/07/22','24','28');
Insert into EntrenadoresEnClubes values ('29','09/04/2020','07/08/22','25','29');
Insert into EntrenadoresEnClubes values ('30','09/07/2020','07/09/22','26','30');
Insert into EntrenadoresEnClubes values ('31','09/07/2020','07/10/22','27','31');
Insert into EntrenadoresEnClubes values ('32','09/02/2020','07/1/22','28','32');


insert into Contratos values('1','25/01/2007','25/06/2021','2','9'); 
insert into Contratos values('2','01/07/2021',null ,'2','2'); 

insert into Contratos values('3','01/07/2019',null ,'3','2');

insert into Contratos values('18','25/01/2007','25/06/2021','4','18'); 
insert into Contratos values('4','25/06/2021',null ,'4','2');

insert into Contratos values('5','01/07/2019',null ,'5','2');
insert into Contratos values('6','01/07/2019',null ,'6','2');
insert into Contratos values('7','01/07/2019',null ,'7','2');
insert into Contratos values('8','01/07/2019',null ,'8','2');
insert into Contratos values('9','01/07/2019',null ,'9','2');
insert into Contratos values('10','01/07/2019',null ,'10','2');
insert into Contratos values('11','01/07/2019',null ,'11','2');
insert into Contratos values('12','01/07/2019',null ,'12','2');
insert into Contratos values('13','01/07/2019',null ,'13','2');
insert into Contratos values('14','01/07/2019',null ,'14','2');
insert into Contratos values('15','01/07/2019',null ,'15','2');



/* psg */
insert into PosiciónDeJugadoresEnPartido values('1','2','10','1','2');
insert into PosiciónDeJugadoresEnPartido values('2','3','11','1','2');
insert into PosiciónDeJugadoresEnPartido values('3','4','1','1','2');
insert into PosiciónDeJugadoresEnPartido values('4','5','3','1','2');
insert into PosiciónDeJugadoresEnPartido values('5','6','2','1','2');
insert into PosiciónDeJugadoresEnPartido values('6','7','9','1','2');
insert into PosiciónDeJugadoresEnPartido values('7','8','7','1','2');
insert into PosiciónDeJugadoresEnPartido values('8','9','6','1','2');
insert into PosiciónDeJugadoresEnPartido values('9','10','8','1','2');
insert into PosiciónDeJugadoresEnPartido values('10','11','4','1','2');
insert into PosiciónDeJugadoresEnPartido values('11','12','5','1','2');

/* BARCA */
insert into PosiciónDeJugadoresEnPartido values('12','1','11','1','9');
insert into PosiciónDeJugadoresEnPartido values('13','49','10','1','9');
insert into PosiciónDeJugadoresEnPartido values('14','50','5','1','9');
insert into PosiciónDeJugadoresEnPartido values('15','51','2','1','9');
insert into PosiciónDeJugadoresEnPartido values('16','52','3','1','9');
insert into PosiciónDeJugadoresEnPartido values('17','53','4','1','9');
insert into PosiciónDeJugadoresEnPartido values('18','54','1','1','9');
insert into PosiciónDeJugadoresEnPartido values('19','55','8','1','9');
insert into PosiciónDeJugadoresEnPartido values('20','56','6','1','9');
insert into PosiciónDeJugadoresEnPartido values('21','57','7','1','9');
insert into PosiciónDeJugadoresEnPartido values('22','58','9','1','9');

/* PSG */
insert into PosiciónDeJugadoresEnPartido values('23','2','10','2','2');
insert into PosiciónDeJugadoresEnPartido values('24','3','11','2','2');
insert into PosiciónDeJugadoresEnPartido values('25','4','1','2','2');
insert into PosiciónDeJugadoresEnPartido values('26','15','9','2','2');
insert into PosiciónDeJugadoresEnPartido values('27','14','2','2','2');
insert into PosiciónDeJugadoresEnPartido values('28','13','3','2','2');
insert into PosiciónDeJugadoresEnPartido values('29','5','4','2','2');
insert into PosiciónDeJugadoresEnPartido values('30','6','5','2','2');
insert into PosiciónDeJugadoresEnPartido values('31','7','6','2','2');
insert into PosiciónDeJugadoresEnPartido values('32','8','7','2','2');
insert into PosiciónDeJugadoresEnPartido values('33','9','8','2','2');

/* LIVERPOOL */
insert into PosiciónDeJugadoresEnPartido values('34','33','1','2','4');
insert into PosiciónDeJugadoresEnPartido values('35','34','6','2','4');
insert into PosiciónDeJugadoresEnPartido values('36','35','3','2','4');
insert into PosiciónDeJugadoresEnPartido values('37','36','2','2','4');
insert into PosiciónDeJugadoresEnPartido values('38','37','4','2','4');
insert into PosiciónDeJugadoresEnPartido values('39','38','8','2','4');
insert into PosiciónDeJugadoresEnPartido values('40','39','7','2','4');
insert into PosiciónDeJugadoresEnPartido values('41','40','11','2','4');
insert into PosiciónDeJugadoresEnPartido values('42','41','9','2','4');
insert into PosiciónDeJugadoresEnPartido values('43','42','10','2','4');
insert into PosiciónDeJugadoresEnPartido values('44','43','6','2','4');


insert into Estadios(nombre, CapacidadAforo, idCiudad) values ('Parque de los Principes',48000,'3');
insert into Estadios(nombre, CapacidadAforo, idCiudad) values ('Camp Nou',100000,'5');
insert into Estadios(nombre, CapacidadAforo, idCiudad) values ('Santiago Bernabeu',82000,'6');
insert into Estadios(nombre, CapacidadAforo, idCiudad) values ('Old Trafford',76000,'8');
insert into Estadios(nombre, CapacidadAforo, idCiudad) values ('Olimpico',74000,'20');
insert into Estadios(nombre, CapacidadAforo, idCiudad) values ('Allianz Arena',70000,'21');
insert into Estadios(nombre, CapacidadAforo, idCiudad) values ('Anfield',55000,'9');
insert into Estadios(nombre, CapacidadAforo, idCiudad) values ('Estadio Unimag',300,'1');


insert into EstadiosDeclubes values ('1','04/05/2004',null,'2','1');
insert into EstadiosDeclubes values ('2','04/05/2004',null,'9','2');
insert into EstadiosDeclubes values ('3','04/05/2004',null,'18','3');
insert into EstadiosDeclubes values ('4','04/05/2004',null,'10','4');
insert into EstadiosDeclubes values ('5','04/05/2004',null,'11','5');
insert into EstadiosDeclubes values ('6','04/05/2004',null,'8','6');
insert into EstadiosDeclubes values ('7','04/05/2004',null,'4','7');
insert into EstadiosDeclubes values ('8','04/05/2004',null,'18','8');


insert into EstadiosDeshabilitados values ('1', '26/06/2021', '26/08/2021','Renovacion', '3');
insert into EstadiosDeshabilitados values ('2', '15/08/2020', '26/02/2021','Disturbios', '2');
insert into EstadiosDeshabilitados values ('3', '01/08/2020', '01/09/2020','Renovaion', '2');


insert into TiposPartido(nombre) values ('Fase de grupos');
insert into TiposPartido(nombre) values ('Octavos');
insert into TiposPartido(nombre) values ('Cuartos');
insert into TiposPartido(nombre) values ('Semifinal');
insert into TiposPartido(nombre) values ('Final');


insert into Partidos values ('1','21:30:00.00','2','2','9','1','1', '5','20/10/2020 20:00:00.00','3'); /* Paris vs Barcelona */
insert into Partidos values ('3','22:30:00.00','9','0','18','1','2', '2','16/02/2021 21:00:00.00','3');
insert into Partidos values ('5','21:30:00.00','18','0','2','1','3', '3','06/04/2021 20:00:00.00','3');
insert into Partidos values ('7','21:30:00.00','4','0','2','1','7', '4','27/04/2021 20:00:00.00','3');
insert into Partidos values ('9','21:30:00.00','2','4','4','0','1', '1','29/05/2021 20:00:00.00','3');
---
insert into Partidos values ('2','21:30:00.00','2','1','4','2','1', '5','21/10/2021 20:00:00.00','3');/*París vs Liverpool*/
insert into Partidos values ('4','22:30:00.00','18','1','2','0','3', '2','17/02/2022 21:00:00.00','3');
insert into Partidos values ('6','21:30:00.00','4','2','2','4','7', '3','07/04/2022 20:00:00.00','3');
insert into Partidos values ('8','21:30:00.00','9','1','2','0','2', '4','28/04/2022 20:00:00.00','3');
insert into Partidos values ('10','21:30:00.00','4','2','18','3','7', '1','20/05/2022 20:00:00.00','3');



/* psg */
insert into PosiciónDeJugadoresEnPartido values('1','2','10','1','2');
insert into PosiciónDeJugadoresEnPartido values('2','3','11','1','2');
insert into PosiciónDeJugadoresEnPartido values('3','4','1','1','2');
insert into PosiciónDeJugadoresEnPartido values('4','5','3','1','2');
insert into PosiciónDeJugadoresEnPartido values('5','6','2','1','2');
insert into PosiciónDeJugadoresEnPartido values('6','7','9','1','2');
insert into PosiciónDeJugadoresEnPartido values('7','8','7','1','2');
insert into PosiciónDeJugadoresEnPartido values('8','9','6','1','2');
insert into PosiciónDeJugadoresEnPartido values('9','10','8','1','2');
insert into PosiciónDeJugadoresEnPartido values('10','11','4','1','2');
insert into PosiciónDeJugadoresEnPartido values('11','12','5','1','2');

/* BARCA */
insert into PosiciónDeJugadoresEnPartido values('12','1','11','1','9');
insert into PosiciónDeJugadoresEnPartido values('13','49','10','1','9');
insert into PosiciónDeJugadoresEnPartido values('14','50','5','1','9');
insert into PosiciónDeJugadoresEnPartido values('15','51','2','1','9');
insert into PosiciónDeJugadoresEnPartido values('16','52','3','1','9');
insert into PosiciónDeJugadoresEnPartido values('17','53','4','1','9');
insert into PosiciónDeJugadoresEnPartido values('18','54','1','1','9');
insert into PosiciónDeJugadoresEnPartido values('19','55','8','1','9');
insert into PosiciónDeJugadoresEnPartido values('20','56','6','1','9');
insert into PosiciónDeJugadoresEnPartido values('21','57','7','1','9');
insert into PosiciónDeJugadoresEnPartido values('22','58','9','1','9');

/* PSG */
insert into PosiciónDeJugadoresEnPartido values('23','2','10','2','2');
insert into PosiciónDeJugadoresEnPartido values('24','3','11','2','2');
insert into PosiciónDeJugadoresEnPartido values('25','4','1','2','2');
insert into PosiciónDeJugadoresEnPartido values('26','15','9','2','2');
insert into PosiciónDeJugadoresEnPartido values('27','14','2','2','2');
insert into PosiciónDeJugadoresEnPartido values('28','13','3','2','2');
insert into PosiciónDeJugadoresEnPartido values('29','5','4','2','2');
insert into PosiciónDeJugadoresEnPartido values('30','6','5','2','2');
insert into PosiciónDeJugadoresEnPartido values('31','7','6','2','2');
insert into PosiciónDeJugadoresEnPartido values('32','8','7','2','2');
insert into PosiciónDeJugadoresEnPartido values('33','9','8','2','2');


/* LIVERPOOL */
insert into PosiciónDeJugadoresEnPartido values('34','33','1','2','4');
insert into PosiciónDeJugadoresEnPartido values('35','34','6','2','4');
insert into PosiciónDeJugadoresEnPartido values('36','35','3','2','4');
insert into PosiciónDeJugadoresEnPartido values('37','36','2','2','4');
insert into PosiciónDeJugadoresEnPartido values('38','37','4','2','4');
insert into PosiciónDeJugadoresEnPartido values('39','38','8','2','4');
insert into PosiciónDeJugadoresEnPartido values('40','39','7','2','4');
insert into PosiciónDeJugadoresEnPartido values('41','40','11','2','4');
insert into PosiciónDeJugadoresEnPartido values('42','41','9','2','4');
insert into PosiciónDeJugadoresEnPartido values('43','42','10','2','4');
insert into PosiciónDeJugadoresEnPartido values('44','43','6','2','4');


insert into MarcasPatroncinadoras(nombreMarca) values ('Heineken');
insert into MarcasPatroncinadoras(nombreMarca) values ('Lays');
insert into MarcasPatroncinadoras(nombreMarca) values ('UniCredit');
insert into MarcasPatroncinadoras(nombreMarca) values ('Playstation');
insert into MarcasPatroncinadoras(nombreMarca) values ('Gazprom');
insert into MarcasPatroncinadoras(nombreMarca) values ('Nissan');
insert into MarcasPatroncinadoras(nombreMarca) values ('Adidas');
insert into MarcasPatroncinadoras(nombreMarca) values ('Nike');
insert into MarcasPatroncinadoras(nombreMarca) values ('Adidas');
insert into MarcasPatroncinadoras(nombreMarca) values ('Puma');
insert into MarcasPatroncinadoras(nombreMarca) values ('Gillette');
insert into MarcasPatroncinadoras(nombreMarca) values ('EA Sports');
insert into MarcasPatroncinadoras(nombreMarca) values ('Santander');
insert into MarcasPatroncinadoras(nombreMarca) values ('Volkswagen');
insert into MarcasPatroncinadoras(nombreMarca) values ('Panini');
insert into MarcasPatroncinadoras(nombreMarca) values ('Samsung');
insert into MarcasPatroncinadoras(nombreMarca) values ('Lotto');
insert into MarcasPatroncinadoras(nombreMarca) values ('Under Armour');
insert into MarcasPatroncinadoras(nombreMarca) values ('Umbro');

/*______________MESSI______________*/
insert into PatrociniosPorPersona values ('1','03/09/2012','03/06/2021','6','2');
insert into PatrociniosPorPersona values ('2','03/09/2012',null,'7','2');
insert into PatrociniosPorPersona values ('3','03/09/2012',null,'1','2');
insert into PatrociniosPorPersona values ('4','03/09/2012',null,'12','2');
insert into PatrociniosPorPersona values ('5','03/06/2021',null,'14','2');
/*______________MBAPE______________*/
insert into PatrociniosPorPersona values ('6','03/09/2012',null,'8','8');
insert into PatrociniosPorPersona values ('7','03/09/2012',null,'16','8');
/*______________NEYMAR______________*/
insert into PatrociniosPorPersona values ('8','03/09/2012','03/06/2021','8','7');
insert into PatrociniosPorPersona values ('9','03/06/2021',null,'10','7');
/*______________Christophe Galtier______________*/
insert into PatrociniosPorPersona values ('10','03/09/2012','03/06/2021','8','16');


/*equipo con mas marcas patrocinadoras actuales, marca que mas equipos patrocina*/
/*city*/
insert into PatrociniosPorClubes values ('1','03/09/2018','03/09/2019','1','1');
insert into PatrociniosPorClubes values ('2','03/09/2019',null,'2','1');
/*psg*/
insert into PatrociniosPorClubes values ('3','03/09/2018','03/09/2019','8','2');
insert into PatrociniosPorClubes values ('4','03/09/2019',null,'4','2');
insert into PatrociniosPorClubes values ('5','03/09/2019',null,'11','2');
insert into PatrociniosPorClubes values ('6','03/09/2019',null,'12','2');
insert into PatrociniosPorClubes values ('7','03/09/2019',null,'6','2');
/*real madrid*/
insert into PatrociniosPorClubes values ('8','03/09/2017','03/09/2018','12','18');
insert into PatrociniosPorClubes values ('9','03/09/2018',null,'7','18');
insert into PatrociniosPorClubes values ('10','03/09/2019',null,'11','18');
/*Barcelona*/
insert into PatrociniosPorClubes values ('11','03/09/2018','03/09/2019','14','9');
insert into PatrociniosPorClubes values ('12','03/09/2019',null,'8','9');
/*Bayer*/
insert into PatrociniosPorClubes values ('13','03/09/2018','03/09/2019','16','8');
insert into PatrociniosPorClubes values ('14','03/09/2019',null,'9','8');
/*milan*/
insert into PatrociniosPorClubes values ('15','03/09/2015','03/09/2017','17','6');
insert into PatrociniosPorClubes values ('16','03/09/2017',null,'8','6');
/*chelsea*/
insert into PatrociniosPorClubes values ('17','03/09/2018','03/09/2019','10','11');
insert into PatrociniosPorClubes values ('18','03/09/2019',null,'8','11');


insert into TiposAcción(descripción) values('Falta');
insert into TiposAcción(descripción) values('Pase');
insert into TiposAcción(descripción) values('Asistencia');
insert into TiposAcción(descripción) values('Remate');
insert into TiposAcción(descripción) values('Sustitucion');
insert into TiposAcción(descripción) values('Adicion');
insert into TiposAcción(descripción) values('Atajada');
insert into TiposAcción(descripción) values('Gol');


/*GOLES*/
/*Partido 1*/
insert into Acciones values('101','15','1','8'); /*psg*/
insert into Acciones values('102','70','1','8'); /*barca*/
insert into Acciones values('103','91','1','8'); /*psg*/
/*Partido 2*/
insert into Acciones values('104','17','2','8'); /*psg*/
insert into Acciones values('105','70','2','8'); /*lvp*/
insert into Acciones values('106','115','2','8'); /*lvp*/

/*---Asistencias---*/
/*p1*/
insert into Acciones values('155','15','1','3');
insert into Acciones values('156','70','1','3');
insert into Acciones values('157','91','1','3');
/*p2*/
insert into Acciones values('158','17','2','3');
insert into Acciones values('159','70','2','3');
insert into Acciones values('160','115','2','3');

/*---Atajadas ---*/
/*p1*/
/*t1*/
insert into Acciones values('161','3','1','7');
insert into Acciones values('162','6','1','7');
insert into Acciones values('163','8','1','7');
insert into Acciones values('164','10','1','7');
insert into Acciones values('165','11','1','7');
insert into Acciones values('166','28','1','7');
insert into Acciones values('167','30','1','7');
insert into Acciones values('168','32','1','7');
insert into Acciones values('169','33','1','7');
insert into Acciones values('170','39','1','7');
insert into Acciones values('171','44','1','7');
/*t2*/
insert into Acciones values('172','48','1','7');
insert into Acciones values('173','55','1','7');
insert into Acciones values('174','60','1','7');
insert into Acciones values('175','62','1','7');
insert into Acciones values('176','69','1','7');
insert into Acciones values('177','70','1','7');
insert into Acciones values('178','72','1','7');
insert into Acciones values('179','80','1','7');
insert into Acciones values('180','83','1','7');
insert into Acciones values('181','89','1','7');
/*Consulta , cuntas atajadas han sido en 1mer tiempo, segundo, 1prorroga, 2prorroga*/
/*p2*/
/*t1*/
insert into Acciones values('182','2','2','7');
insert into Acciones values('183','4','2','7');
insert into Acciones values('184','6','2','7');
insert into Acciones values('185','8','2','7');
insert into Acciones values('186','12','2','7');
insert into Acciones values('187','14','2','7');
insert into Acciones values('188','18','2','7');
insert into Acciones values('189','28','2','7');
insert into Acciones values('190','30','2','7');
insert into Acciones values('191','43','2','7');
/*t2*/
insert into Acciones values('192','47','2','7');
insert into Acciones values('193','48','2','7');
insert into Acciones values('194','54','2','7'); 
insert into Acciones values('195','58','2','7');
insert into Acciones values('196','64','2','7');
insert into Acciones values('197','69','2','7');
insert into Acciones values('198','78','2','7');
insert into Acciones values('199','85','2','7');
insert into Acciones values('200','91','2','7');
--
insert into Acciones values('201','95','2','7');
insert into Acciones values('202','99','2','7');
insert into Acciones values('203','105','2','7');
--
insert into Acciones values('204','108','2','7');
insert into Acciones values('205','112','2','7');
insert into Acciones values('206','118','2','7');

/*---Sustituciones---*/
/*p1*/
insert into Acciones values('207','78','1','5');
insert into Acciones values('208','84','1','5');
insert into Acciones values('209','88','1','5');
insert into Acciones values('210','90','1','5');
insert into Acciones values('211','80','1','5');

/*p2*/
insert into Acciones values('213','81','2','5');
insert into Acciones values('214','85','2','5');
insert into Acciones values('215','88','2','5');
insert into Acciones values('216','55','2','5');
insert into Acciones values('217','95','2','5');
insert into Acciones values('218','110','2','5');
insert into Acciones values('219','115','2','5');


/*---Adiciones---*/

/*p1*/
insert into Acciones values('220','5','1','6');
insert into Acciones values('221','7','1','6');

/*p2*/
insert into Acciones values('222','4','2','6');
insert into Acciones values('223','5','2','6');
insert into Acciones values('224','3','2','6');
insert into Acciones values('225','2','2','6');

/*---Pases---*/

/*---Primer Partido T1---*/
insert into Acciones values('1','1','1','2');
insert into Acciones values('2','2','1','2');
insert into Acciones values('3','3','1','2');
insert into Acciones values('4','5','1','2');
insert into Acciones values('5','5','1','2');
insert into Acciones values('6','6','1','2');
insert into Acciones values('7','34','1','2');
insert into Acciones values('8','34','1','2');
insert into Acciones values('9','40','1','2');
insert into Acciones values('10','8','1','2');
insert into Acciones values('11','9','1','2');
insert into Acciones values('12','10','1','2');
insert into Acciones values('13','11','1','2');
insert into Acciones values('14','12','1','2');
insert into Acciones values('15','13','1','2');
insert into Acciones values('16','14','1','2');
insert into Acciones values('17','15','1','2');
insert into Acciones values('18','16','1','2');
insert into Acciones values('19','17','1','2');
insert into Acciones values('20','18','1','2');
insert into Acciones values('21','20','1','2');
insert into Acciones values('22','36','1','2');
insert into Acciones values('23','38','1','2');
insert into Acciones values('24','39','1','2');
insert into Acciones values('25','22','1','2');

/*Primer Partido T2*/
insert into Acciones values('26','45','1','2');
insert into Acciones values('27','46','1','2');
insert into Acciones values('28','47','1','2');
insert into Acciones values('29','49','1','2');
insert into Acciones values('30','50','1','2');
insert into Acciones values('31','52','1','2');
insert into Acciones values('32','54','1','2');
insert into Acciones values('33','57','1','2');
insert into Acciones values('34','59','1','2');
insert into Acciones values('35','61','1','2');
insert into Acciones values('36','63','1','2');
insert into Acciones values('37','65','1','2');
insert into Acciones values('38','69','1','2');
insert into Acciones values('39','72','1','2');
insert into Acciones values('40','80','1','2');
insert into Acciones values('41','81','1','2');
insert into Acciones values('42','82','1','2');
insert into Acciones values('43','83','1','2');
insert into Acciones values('44','53','1','2');
insert into Acciones values('45','85','1','2');
insert into Acciones values('46','88','1','2');
insert into Acciones values('47','53','1','2');
insert into Acciones values('48','90','1','2');
insert into Acciones values('49','90','1','2');
insert into Acciones values('50','69','1','2');

/*Segundo Partido T1*/
insert into Acciones values('51','1','2','2');
insert into Acciones values('52','2','2','2');
insert into Acciones values('53','3','2','2');
insert into Acciones values('54','5','2','2');
insert into Acciones values('55','6','2','2');
insert into Acciones values('56','8','2','2');
insert into Acciones values('57','12','2','2');
insert into Acciones values('58','15','2','2');
insert into Acciones values('59','16','2','2');
insert into Acciones values('60','20','2','2');
insert into Acciones values('61','24','2','2');
insert into Acciones values('62','25','2','2');
insert into Acciones values('63','30','2','2');
insert into Acciones values('64','34','2','2');
insert into Acciones values('65','36','2','2');
insert into Acciones values('66','38','2','2');
insert into Acciones values('67','40','2','2');
insert into Acciones values('68','41','2','2');
insert into Acciones values('69','43','2','2');
insert into Acciones values('70','45','2','2');

/*Segundo Partido T2*/
insert into Acciones values('71','45','2','2');
insert into Acciones values('72','47','2','2');
insert into Acciones values('73','49','2','2');
insert into Acciones values('74','52','2','2');
insert into Acciones values('75','55','2','2');
insert into Acciones values('76','57','2','2');
insert into Acciones values('77','62','2','2');
insert into Acciones values('78','65','2','2');
insert into Acciones values('79','68','2','2');
insert into Acciones values('80','70','2','2');
insert into Acciones values('81','72','2','2');
insert into Acciones values('82','75','2','2');
insert into Acciones values('83','78','2','2');
insert into Acciones values('84','81','2','2');
insert into Acciones values('85','84','2','2');
insert into Acciones values('86','86','2','2');
insert into Acciones values('87','88','2','2');
insert into Acciones values('88','89','2','2');
insert into Acciones values('89','90','2','2');
insert into Acciones values('90','90','2','2');

/*Segundo Partido TE1*/
insert into Acciones values('91','92','2','2');
insert into Acciones values('92','95','2','2');
insert into Acciones values('93','98','2','2');
insert into Acciones values('94','103','2','2');
insert into Acciones values('95','105','2','2');

/*Segundo Partido TE2*/
insert into Acciones values('96','106','2','2');
insert into Acciones values('97','108','2','2');
insert into Acciones values('98','112','2','2');
insert into Acciones values('99','115','2','2');
insert into Acciones values('100','120','2','2');


/*---Faltas---*/
 


/*---Remates---*/
/*---Primer Partido T1---*/
insert into Acciones values('107','5','1','4');
insert into Acciones values('108','11','1','4');
insert into Acciones values('109','15','1','4');
insert into Acciones values('110','23','1','4');
insert into Acciones values('111','25','1','4');
insert into Acciones values('112','30','1','4');
insert into Acciones values('113','37','1','4');
insert into Acciones values('114','40','1','4');
insert into Acciones values('115','41','1','4');
insert into Acciones values('116','45','1','4');
/*---Primer Partido T2---*/
insert into Acciones values('117','47','1','4');
insert into Acciones values('118','50','1','4');
insert into Acciones values('119','53','1','4');
insert into Acciones values('120','55','1','4');
insert into Acciones values('121','60','1','4');
insert into Acciones values('122','70','1','4');
insert into Acciones values('123','74','1','4');
insert into Acciones values('124','79','1','4');
insert into Acciones values('125','83','1','4');
insert into Acciones values('126','88','1','4');

/*---Segundo Partido T1---*/
insert into Acciones values('127','7','2','4');
insert into Acciones values('128','9','2','4');
insert into Acciones values('129','13','2','4');
insert into Acciones values('130','21','2','4');
insert into Acciones values('131','27','2','4');
insert into Acciones values('132','29','2','4');
insert into Acciones values('133','31','2','4');
insert into Acciones values('134','37','2','4');
insert into Acciones values('135','42','2','4');
insert into Acciones values('136','44','2','4');
/*---segundo Partido T2---*/
insert into Acciones values('137','46','2','4');
insert into Acciones values('138','48','2','4');
insert into Acciones values('139','51','2','4');
insert into Acciones values('140','54','2','4');
insert into Acciones values('141','59','2','4');
insert into Acciones values('142','62','2','4');
insert into Acciones values('143','66','2','4');
insert into Acciones values('144','74','2','4');
insert into Acciones values('145','78','2','4');
insert into Acciones values('146','83','2','4');
/*---segundo Partido TE1---*/
insert into Acciones values('147','92','2','4');
insert into Acciones values('148','95','2','4');
insert into Acciones values('149','103','2','4');
insert into Acciones values('150','104','2','4');
/*---segundo Partido TE2---*/
insert into Acciones values('151','106','2','4');
insert into Acciones values('152','109','2','4');
insert into Acciones values('153','113','2','4');
insert into Acciones values('154','114','2','4');


insert into TiposFalta(descripción) values('Golpe');
insert into TiposFalta(descripción) values('Insulto');
insert into TiposFalta(descripción) values('Mano');
insert into TiposFalta(descripción) values('Perdida de Tiempo');
insert into TiposFalta(descripción) values('Abandono del terreno de juego');
insert into TiposFalta(descripción) values('simulacion de falta');
insert into TiposFalta(descripción) values('Quitar camisa');


insert into TiposAmonestacion(descripción) values('Amarilla');
insert into TiposAmonestacion(descripción) values('Roja');

insert into Pases values('1','2','2');
insert into Pases values('2','2','3');
insert into Pases values('3','2','4');
insert into Pases values('4','2','5');
insert into Pases values('5','2','6');
insert into Pases values('6','2','7');
insert into Pases values('7','2','8');
insert into Pases values('8','2','9');
insert into Pases values('9','2','10');
insert into Pases values('10','2','2');
insert into Pases values('11','3','3');
insert into Pases values('12','3',null);
insert into Pases values('13','3',null);
insert into Pases values('14','3',null);
insert into Pases values('15','3','7');
insert into Pases values('16','3',null);
insert into Pases values('17','7',null);
insert into Pases values('18','7','3');
insert into Pases values('19','7','4');
insert into Pases values('20','7','5');
insert into Pases values('21','7','6');
insert into Pases values('22','7','7');
insert into Pases values('23','7','8');
insert into Pases values('24','7','9');
insert into Pases values('25','7',null);

/*Primer Partido T2*/
insert into Pases values('26','1','49');
insert into Pases values('27','1','49');
insert into Pases values('28','1','51');
insert into Pases values('29','1','49');
insert into Pases values('30','1','49');
insert into Pases values('31','1','49');
insert into Pases values('32','1','49');
insert into Pases values('33','1','49');
insert into Pases values('34','52','51');
insert into Pases values('35','52','51');
insert into Pases values('36','52','51');
insert into Pases values('37','52','51');
insert into Pases values('38','52','51');
insert into Pases values('39','52','55');
insert into Pases values('40','52','55');
insert into Pases values('41','52','55');
insert into Pases values('42','49','55');
insert into Pases values('43','49','55');
insert into Pases values('44','49','55');
insert into Pases values('45','49','55');
insert into Pases values('46','49','55');
insert into Pases values('47','49','55');
insert into Pases values('48','49','54');
insert into Pases values('49','49','54');
insert into Pases values('50','49','54');

/*Segundo Partido T1*/
insert into Pases values('51','2','2');
insert into Pases values('52','2',null);
insert into Pases values('53','2','2');
insert into Pases values('54','2',null);
insert into Pases values('55','2','2');
insert into Pases values('56','2','2');
insert into Pases values('57','2','2');
insert into Pases values('58','7',null);
insert into Pases values('59','7','2');
insert into Pases values('60','7','2');
insert into Pases values('61','7',null);
insert into Pases values('62','2','2');
insert into Pases values('63','2','2');
insert into Pases values('64','2','2');
insert into Pases values('65','2','2');
insert into Pases values('66','2','2');
insert into Pases values('67','2','2');
insert into Pases values('68','49','2');
insert into Pases values('69','49','2');
insert into Pases values('70','49','2');

/*Segundo Partido T2*/
insert into Pases values('71','49','2');
insert into Pases values('72','49','2');
insert into Pases values('73','49','2');
insert into Pases values('74','49','2');
insert into Pases values('75','49','2');
insert into Pases values('76','49','2');
insert into Pases values('77','49','2');
insert into Pases values('78','49','2');
insert into Pases values('79','49','2');
insert into Pases values('80','60','2');
insert into Pases values('81','60','2');
insert into Pases values('82','60','2');
insert into Pases values('83','60','2');
insert into Pases values('84','60','2');
insert into Pases values('85','53','2');
insert into Pases values('86','53','2');
insert into Pases values('87','53','2');
insert into Pases values('88','53','2');
insert into Pases values('89','53','2');
insert into Pases values('90','53','2');

/*Segundo Partido TE1*/
insert into Pases values('91','53',null);
insert into Pases values('92','53','2');
insert into Pases values('93','53',null);
insert into Pases values('94','53','2');
insert into Pases values('95','53','2');

/*Segundo Partido TE2*/
insert into Pases values('96','8','2');
insert into Pases values('97','8','2');
insert into Pases values('98','8','2');
insert into Pases values('99','8','2');
insert into Pases values('100','8','2');


insert into Atajadas values('161','4');
insert into Atajadas values('162','4');
insert into Atajadas values('163','4');
insert into Atajadas values('164','4');
insert into Atajadas values('165','4');
insert into Atajadas values('166','4');
insert into Atajadas values('167','4');
insert into Atajadas values('168','54');
insert into Atajadas values('169','54');
insert into Atajadas values('170','54');
insert into Atajadas values('171','54');
/*t2*/
insert into Atajadas values('172','54');
insert into Atajadas values('173','54');
insert into Atajadas values('174','54');
insert into Atajadas values('175','54');
insert into Atajadas values('176','54');
insert into Atajadas values('177','54');
insert into Atajadas values('178','54');
insert into Atajadas values('179','4');
insert into Atajadas values('180','4');
insert into Atajadas values('181','4');

/*p2*/
/*t1*/
insert into Atajadas values('182','4');
insert into Atajadas values('183','4');
insert into Atajadas values('184','4');
insert into Atajadas values('185','4');
insert into Atajadas values('186','4');
insert into Atajadas values('187','4');
insert into Atajadas values('188','4');
insert into Atajadas values('189','4');
insert into Atajadas values('190','33');
insert into Atajadas values('191','33');
/*t2*/
insert into Atajadas values('192','4');
insert into Atajadas values('193','33');
insert into Atajadas values('194','33'); 
insert into Atajadas values('195','4');
insert into Atajadas values('196','33');
insert into Atajadas values('197','4');
insert into Atajadas values('198','33');
insert into Atajadas values('199','4');
insert into Atajadas values('200','4');
--
insert into Atajadas values('201','4');
insert into Atajadas values('202','33');
insert into Atajadas values('203','4');
--
insert into Atajadas values('204','33');
insert into Atajadas values('205','33');
insert into Atajadas values('206','33');

insert into TiposAdicion(tiempoDelPartido) values('Primer tiempo');
insert into TiposAdicion(tiempoDelPartido) values('Segundo tiempo');
insert into TiposAdicion(tiempoDelPartido) values('Primer tiempo prorroga');
insert into TiposAdicion(tiempoDelPartido) values('Segundo tiempo prorroga');



/*p1*/
insert into Adiciones values('220','1');
insert into Adiciones values('221','2');

/*p2*/
insert into Adiciones values('222','1');
insert into Adiciones values('223','2');
insert into Adiciones values('224','3');
insert into Adiciones values('225','4');

/*---Sustituciones---*/
/*p1*/
insert into Sustituciones values('207','3','13');
insert into Sustituciones values('208','4','14');
insert into Sustituciones values('209','5','15');
insert into Sustituciones values('210','1','59');
insert into Sustituciones values('211','49','60');

/*p2*/
insert into Sustituciones values('213','2','10');
insert into Sustituciones values('214','3','11');
insert into Sustituciones values('215','4','12');
insert into Sustituciones values('216','44','2');
insert into Sustituciones values('217','45','2');
insert into Sustituciones values('218','46','2');
insert into Sustituciones values('219','47','2');

insert into TiposDeEjecucion(descripcionEjecucion) values('Tiro libre');
insert into TiposDeEjecucion(descripcionEjecucion) values('Tiro esquina');
insert into TiposDeEjecucion(descripcionEjecucion) values('Pase directo');
insert into TiposDeEjecucion(descripcionEjecucion) values('Penalti');
insert into TiposDeEjecucion(descripcionEjecucion) values('Tiro directo');



/*Asistencia*/
insert into Asistencias values('155','2','3');/*psg*/
insert into Asistencias values('156','1','3');/*barca*/
insert into Asistencias values('157','2','3');/*psg*/

insert into Asistencias values('158','2','3');/*psg*/
insert into Asistencias values('159','41','3');/*lvp*/
insert into Asistencias values('160','41','3');/*lvp*/


insert into ExtremidadesAnotadoras(extremidad) values('Pie derecho');
insert into ExtremidadesAnotadoras(extremidad) values('Pie izquierdo');
insert into ExtremidadesAnotadoras(extremidad) values('Cabeza');
insert into ExtremidadesAnotadoras(extremidad) values('Otro');

insert into Remates values('107','7','3','5');
insert into Remates values('108','7','1','5');
insert into Remates values('109','7','1','5');

insert into Remates values('110','2','2','5');
insert into Remates values('111','2','2','5');
insert into Remates values('112','3','2','5');
insert into Remates values('113','50','1','5');
insert into Remates values('114','1','1','5');
insert into Remates values('115','1','1','1');
insert into Remates values('116','49','1','1');
/*---Primer Partido T2---*/
insert into Remates values('117','4','1','4');
insert into Remates values('118','10','2','4');
insert into Remates values('119','10','3','5');
insert into Remates values('120','10','1','4');
insert into Remates values('121','2','2','4');
insert into Remates values('122','2','2','4');
insert into Remates values('123','49','1','4');
insert into Remates values('124','49','1','1');
insert into Remates values('125','53','2','1');
insert into Remates values('126','53','2','4');

/*---Segundo Partido T1---*/
insert into Remates values('127','2','2','5');
insert into Remates values('128','2','2','5');
insert into Remates values('129','2','1','5');
insert into Remates values('130','2','1','5');
insert into Remates values('131','7','3','5');
insert into Remates values('132','7','1','5');
insert into Remates values('133','7','1','5');
insert into Remates values('134','42','2','5');
insert into Remates values('135','42','2','5');
insert into Remates values('136','42','2','5');
/*---segundo Partido T2---*/
insert into Remates values('137','42','2','5');
insert into Remates values('138','42','2','5');
insert into Remates values('139','42','2','5');
insert into Remates values('140','39','2','5');
insert into Remates values('141','39','2','5');
insert into Remates values('142','39','2','5');
insert into Remates values('143','2','2','5');
insert into Remates values('144','2','1','5');
insert into Remates values('145','2','2','5');
insert into Remates values('146','2','4','5');
/*---segundo Partido TE1---*/
insert into Remates values('147','36','3','5');
insert into Remates values('148','36','3','5');
insert into Remates values('149','36','3','5');
insert into Remates values('150','36','3','5');
/*---segundo Partido TE2---*/
insert into Remates values('151','42','2','5');
insert into Remates values('152','41','2','5');
insert into Remates values('153','41','2','5');
insert into Remates values('154','41','2','5');


insert into Remates values('107','2','2','1');
insert into Remates values('108','2','2','4');
insert into Remates values('109','2','3','5');

insert into Remates values('110','2','2','5');
insert into Remates values('111','2','2','5');
insert into Remates values('112','3','2','5');
insert into Remates values('113','50','1','5');
insert into Remates values('114','1','1','5');
insert into Remates values('115','1','1','1');
insert into Remates values('116','49','1','1');
/*---Primer Partido T2---*/
insert into Remates values('117','4','1','4');
insert into Remates values('118','10','2','4');
insert into Remates values('119','10','3','5');
insert into Remates values('120','10','1','4');
insert into Remates values('121','2','2','4');
insert into Remates values('122','2','2','4');
insert into Remates values('123','49','1','4');
insert into Remates values('124','49','1','1');
insert into Remates values('125','53','2','1');
insert into Remates values('126','53','2','4');

/*---Segundo Partido T1---*/
insert into Remates values('127','2','2','5');
insert into Remates values('128','2','2','5');
insert into Remates values('129','2','1','5');
insert into Remates values('130','2','1','5');
insert into Remates values('131','7','3','5');
insert into Remates values('132','7','1','5');
insert into Remates values('133','7','1','5');
insert into Remates values('134','42','2','5');
insert into Remates values('135','42','2','5');
insert into Remates values('136','42','2','5');
/*---segundo Partido T2---*/
insert into Remates values('137','42','2','5');
insert into Remates values('138','42','2','5');
insert into Remates values('139','42','2','5');
insert into Remates values('140','39','2','5');
insert into Remates values('141','39','2','5');
insert into Remates values('142','39','2','5');
insert into Remates values('143','2','2','5');
insert into Remates values('144','2','1','5');
insert into Remates values('145','2','2','5');
insert into Remates values('146','2','4','5');
/*---segundo Partido TE1---*/
insert into Remates values('147','36','3','5');
insert into Remates values('148','36','3','5');
insert into Remates values('149','36','3','5');
insert into Remates values('150','36','3','5');
/*---segundo Partido TE2---*/
insert into Remates values('151','42','2','5');
insert into Remates values('152','41','2','5');
insert into Remates values('153','41','2','5');
insert into Remates values('154','41','2','5');

/* Goles */ 
/*Partido 1*/
insert into Goles values('101','107','155'); /*psg*/
insert into Goles values('102','123','156'); /*barca*/
insert into Goles values('103','108','157'); /*psg*/

/*Partido 2*/
insert into Goles values('104','131','158'); /*psg*/
insert into Goles values('105','134','159'); /*lvp*/
insert into Goles values('106','135','160'); /*lvp*/







