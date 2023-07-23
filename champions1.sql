/* ________________ENTIDADES PERSONAS___________ */

create table Entrenadores(
	idEntrenador int primary key,
	númeroLicenciaDeportiva varchar(20) unique not null,
	FOREIGN key (idEntrenador) REFERENCES Personas(idPersona) 
);

drop table Entrenadores

create table Jugadores(
	idJugador int primary key,
	numeroLicenciaJugador varchar(20) unique not null,
	FOREIGN key (idJugador) REFERENCES Personas(idPersona) 
);

drop table Jugadores

create table PosiciónDeJugadores(
	idPosiciónDeJugador serial primary key,
	descripción varchar (45) not null
);


select *
from PosiciónDeJugadores

create table Árbitros(
	idÁrbitro serial primary key ,
	nombre varchar (40) not null,
	númeroLicenciaÁrbitro varchar (40) not null,
	idPaisProcedencia int not null,
	FOREIGN key (idPaisProcedencia) REFERENCES Países (idPaís) 
);



select * from Árbitros

create table TiposÁrbitro(
	idTipoÁrbitro serial primary key,
	descripción varchar(45) not null 
);

insert into TiposÁrbitro(descripción) values ('Central');
insert into TiposÁrbitro(descripción) values ('Banderin Derecho');
insert into TiposÁrbitro(descripción) values ('Banderin Izquierdo');
insert into TiposÁrbitro(descripción) values ('Var');

select *
from TiposÁrbitro

create table TipoÁrbitroEnPartido(
	idTipoÁrbitroEnPartido serial primary key,
	idÁrbitro int not null,
	idTipoÁrbitro int not null,
	idPartido int not null,
	FOREIGN key (idÁrbitro) REFERENCES Árbitros(idÁrbitro) ,
	FOREIGN key (idTipoÁrbitro) REFERENCES TiposÁrbitro(idTipoÁrbitro),
	FOREIGN key (idPartido) REFERENCES Partidos(idPartido) 
);


delete from TipoÁrbitroEnPartido

/* _____________________________________________ */
/* ________________SUPERENTIDADE PERSONA________ */

Create table Personas(
	idPersona serial primary key,
	nombre varchar(45) not null,
	fechaNacimiento date not null,
	fechaDedebut date,
	idPaísProcedencia int not null,
	idCiudadNacimiento int not null,
	idTipoPersona int not null,
	FOREIGN key (idPaísProcedencia) REFERENCES Países(idPaís),
	FOREIGN key (idCiudadNacimiento) REFERENCES Ciudades(idCiudad),
	FOREIGN key (idTipoPersona) REFERENCES TiposPersonas(idTipoPersona)
);

Select count(*)
From Personas 
Where idPaisProcedencia = 4


Select nombre, idTipoPersona
From Personas 
Group by nombre,idTipoPersona
having idTipoPersona in(1,2)

Select nombre
From personas 
Where fechaRetiro is not null


alter table Personas
add column fechaRetiro date;

select *
from Personas


Create table TiposPersonas(
	idTipoPersona serial primary key,
	descripción varchar(30) not null
);

insert into TiposPersonas(descripción) values ('Jugador');
insert into TiposPersonas(descripción) values ('Entrenador');

select * from TiposPersonas

Create table TiposDeEstadosPersonas(
	idTipoEstadoPersona serial primary key,
	descripción varchar(30) not null
);

insert into TiposDeEstadosPersonas(descripción) values ('Lesionado');
insert into TiposDeEstadosPersonas(descripción) values ('Suspendido');

select * from TiposDeEstadosPersonas

create table EstadosDePersonas (
	idEstadoPersona serial primary key,
	fechaInicioEstado date not null,
	fechaFinalEstado date,	
	idPersona int not null,
	idTipoEstadoPersona int not null,
	FOREIGN key (idPersona) REFERENCES Personas(idPersona),
	FOREIGN key (idTipoEstadoPersona) REFERENCES TiposDeEstadosPersonas(idTipoEstadoPersona)
);




select *
from EstadosDePersonas

/* _____________________________________________ */
/* ________________ENTIDADES TEMPORADA__________ */

create table Temporadas(
	idTemporada serial PRIMARY KEY,
	nombreTemporada varchar(10) not null,
	fechaInicio date not null,
	fechaFinal date
	CONSTRAINT fechas_validas CHECK(fechaInicio<fechaFinal)/* -> CONSTRAINT*/
);



select *
from Temporadas


create table Grupos(
	idGrupo serial primary key,
	nombreGrupo varchar(5) not null,
	idTemporada int not null,
	FOREIGN key (idTemporada) REFERENCES Temporadas(idTemporada) 
);

select * from Grupos

/* _____________________________________________ */
/* ________________ENTIDADES LUGAR______________ */

Create Table Países(
	idPaís serial primary key,
	nombre varchar (45) not null
);



delete from Países
where idPaís = 14;

select * 
from Países



Create Table Ciudades(
	idCiudad serial primary key,
	nombre varchar(200) not null,
	idPaís int not null,
	FOREIGN key (idPaís) REFERENCES Países(idPaís) 
);



select * from Ciudades

/* _____________________________________________ */
/* ________________ENTIDADES CLUB_______________ */

create table Clubes(
	idClub serial primary key,
	nombreClub varchar(100) not null,
	idCiudad int not null,
	FOREIGN key (idCiudad) REFERENCES Ciudades(idCiudad) 
);


select * from Clubes

delete from Clubes

create table ClubesEnGrupoPorTemporada(
	idClubEnGrupoPorTemporada serial primary key,
	idClub int not null,
	idGrupo int not null,
	FOREIGN key (idClub) REFERENCES Clubes(idClub),
	FOREIGN key (idGrupo) REFERENCES Grupos(idGrupo) 
);


SELECT *
FROM ClubesEnGrupoPorTemporada

delete from ClubesEnGrupoPorTemporada

create table EntrenadoresEnClubes(
	idEntrenadorEnClub serial primary key,
	fechaVinculacion date not null,
	fechaDesvinculación date,
	idClub int not null,
	idEntrenador int not null,
	FOREIGN key (idClub) REFERENCES Clubes(idClub),
	FOREIGN key (idEntrenador) REFERENCES Personas(idPersona)
);



drop table EntrenadoresEnClubes

create table Contratos (
	idContrato serial primary key,
	fechaInicio date not null,
	fechaFinal date,
	idPersona int not null,
	idClub int not null,
	FOREIGN key (idClub) REFERENCES Clubes(idClub) ,
	FOREIGN key (idPersona) REFERENCES Personas(idPersona) 	
); 
	


create table PosiciónDeJugadoresEnPartido (
	idPosiciónDeJugadorEnPartido serial primary key,
	idJugador int not null,
	idPosición int not null,
	idPartido int not null,
	idClub int not null,
	FOREIGN key (idJugador) REFERENCES Personas(idPersona),
	FOREIGN key (idPosición) REFERENCES PosiciónDeJugadores(idPosiciónDeJugador),
	FOREIGN key (idPartido) REFERENCES Partidos(idPartido),
	FOREIGN key (idClub) REFERENCES Clubes(idClub)
);


select *
from PosiciónDeJugadoresEnPartido

/* _____________________________________________ */
/* ________________ENTIDADES ESTADIO____________ */

create table Estadios(
	idEstadio serial primary key,
	CapacidadAforo int not null,
	idCiudad int not null,
	FOREIGN key (idCiudad) REFERENCES Ciudades(idCiudad)
);
alter table Estadios
add column nombre varchar (45) not null;




select * from Estadios

create table EstadiosDeclubes(
	idEstadioDeClube serial primary key,
	fechaInicio date not null,
	fechaFinal date,
	idClub int not null,
	idEstadio int not null,
	FOREIGN key (idClub) REFERENCES Clubes(idClub) ,
	FOREIGN key (idEstadio) REFERENCES Estadios(idEstadio) 
);


select *
from EstadiosDeclubes


create table EstadiosDeshabilitados(
	idEstadioDeshabilitado serial primary key,
	fechaInicio date not null,
	fechaFinal date,
	motivo varchar(40),
	idEstadio int not null,
	FOREIGN key (idEstadio) REFERENCES Estadios(idEstadio)
);


'01/07/2020' - '30/06/2021'

delete from EstadiosDeshabilitados
select * from EstadiosDeshabilitados


/* _____________________________________________ */
/* ________________ENTIDADES PARTIDO____________ */

create table TiposPartido(
	idTipoPartido serial primary key,
	nombre varchar (30) not null
);

insert into TiposPartido(nombre) values ('Fase de grupos');
insert into TiposPartido(nombre) values ('Octavos');
insert into TiposPartido(nombre) values ('Cuartos');
insert into TiposPartido(nombre) values ('Semifinal');
insert into TiposPartido(nombre) values ('Final');

select * from TiposPartido

create table Partidos(
	idPartido serial primary key,
	horaInicio date,
	time not null,
	horaFinal time,
	idLocal int not null,
	marcadorLocal int,
	idVisitante int not null,
	marcadorVisitante int,
	idEstadio int not null,
	idTipoPartido int not null,
	FOREIGN KEY (idVisitante) REFERENCES Clubes(idClub),
	FOREIGN KEY (idLocal) REFERENCES Clubes(idClub),
	FOREIGN key (idEstadio) REFERENCES Estadios(idEstadio) 
);

alter table Partidos
add FOREIGN key (idTipoPartido) REFERENCES TiposPartido(idTipoPartido);

alter table Partidos
Add column idTipoEstadoDePartido int not null;

alter table Partidos
add FOREIGN key (idTipoEstadoDePartido) REFERENCES TipoEstadosDePartidos(idTipoEstadoDePartido);


select *
from partidos



delete from Partidos 

select * from tipoestadosdepartidos




create table TipoEstadosDePartidos(
	idTipoEstadoDePartido serial PRIMARY key,
	nombre varchar (30) not null
);

select *
from TipoEstadosDePartidos




/* _____________________________________________ */
/* ________________ENTIDADES PATROCINIO_________ */

create table MarcasPatroncinadoras(
	idMarcaPatroncinadora serial PRIMARY key,
	nombreMarca varchar (30) not null
);


select *
from MarcasPatroncinadoras

create table PatrociniosPorPersona(
	idPatrocinioPorJugador serial primary key,
	fechaInicio date not null,
	fechaFinal date,
	idMarcaPatroncinadora int not null,
	idPersona int not null,
	FOREIGN key (idMarcaPatroncinadora) REFERENCES MarcasPatroncinadoras(idMarcaPatroncinadora),
	FOREIGN key (idPersona) REFERENCES Personas(idPersona) 
);



select *
from PatrociniosPorPersona


create table PatrociniosPorClubes(
	idPatrocinioPorClubes serial primary key,
	fechaInicio date not null,
	fechaFinal date,
	idMarcaPatroncinadora int not null,
	idClub int not null,
	FOREIGN key (idMarcaPatroncinadora) REFERENCES MarcasPatroncinadoras(idMarcaPatroncinadora),
	FOREIGN key (idClub) REFERENCES Clubes(idClub)
);


select * from PatrociniosPorClubes

delete from PatrociniosPorClubes


/* _____________________________________________ */
/* ________________ENTIDADES ACCIONES_________ */

create table TiposAcción(
	idTipoAcción serial primary key,
	descripción varchar (100) not null
);




select *
from TiposAcción

create table Acciones(
    idAcción serial primary key,
	minuto int not null, 
	idpartido int not null,
	idTipoAcción int not null,
	FOREIGN key (minuto) REFERENCES partidos(idpartido),
	FOREIGN key (idTipoAcción) REFERENCES TiposAcción(idTipoAcción)
);



select *
from Acciones


create table TiposFalta(
	idTipoFalta serial primary key,
	descripción varchar (100) not null
);


select *
from TiposFalta

create table TiposAmonestacion(
	idTipoAmonestacion serial primary key,
	descripción varchar (100) not null
);


select *
from TiposAmonestacion

create table Faltas(
	idFalta int primary key,
	idTipoFalta int not null,
	idTipoAmonestacion int not null,
	idInfractor int not null,
	idVictima int not null,
);


alter table faltas
alter column idInfractor drop not null;

select *
from Faltas

create table Pases (
	idPase int primary key,
	idJugadorEjecuta int not null,
	idJugadorRecepciona int,
	
	FOREIGN key (idPase) REFERENCES Acciones(idAcción) ,
	FOREIGN key (idJugadorEjecuta) REFERENCES Personas(idPersona) ,
	FOREIGN key (idJugadorRecepciona) REFERENCES Personas(idPersona)
);



select *
from Pases

create table Atajadas(
	idAtajada int primary key,
	idPortero int not null,
	FOREIGN key (idPortero) REFERENCES Personas(idPersona) ,
	FOREIGN key (idAtajada) REFERENCES Acciones(idAcción) 
);


select * 
from atajadas

create table TiposAdicion(
	idTipoAdicion serial primary key,
	tiempoDelPartido varchar(30) not null
);



SELECT *
FROM TiposAdicion


create table Adiciones (
	idAdicion int primary key,
	idTipoAdicion int not null,
	FOREIGN key (idAdicion) REFERENCES Acciones(idAcción) ,
	FOREIGN key (idTipoAdicion) REFERENCES TiposAdicion(idTipoAdicion) 
);




create table Sustituciones (
	idSustitucion int primary key,
	idJugadorSustituido int not null,
	idJugadorSustituto int not null,
	FOREIGN key (idSustitucion) REFERENCES Acciones(idAcción) ,
	FOREIGN key (idJugadorSustituido) REFERENCES Personas(idPersona),
	FOREIGN key (idJugadorSustituto) REFERENCES Personas(idPersona)
);


select * from  Sustituciones

create table TiposDeEjecucion (
	idTipoDeEjecucion serial primary key,
	descripcionEjecucion varchar(45) not null
);


select *
from TiposDeEjecucion


create table Asistencias (
	idAsistencia int primary key,
	idJugador int not null,
	idTipoDeEjecucion int not null,
	FOREIGN key (idAsistencia) REFERENCES Acciones(idAcción) ,
	FOREIGN key (idJugador) REFERENCES Personas(idPersona) ,
	FOREIGN key (idTipoDeEjecucion) REFERENCES TiposDeEjecucion(idTipoDeEjecucion) 
);
drop table Asistencias

/*Asistencia*/


create table ExtremidadesAnotadoras (
	idExtremidad serial primary key,
	extremidad varchar (30) not null
	/* Hacer restriccion para solo 4 opciones, pie(1 derecho o 2 izquiero), 3 cabeza, 4 otro */
);



select * 
from ExtremidadesAnotadoras


create table Remates(
	idRemate int primary key,
	idJugador int not null,
	idExtremidad int not null,
	idTipoEjecucion int not null,
	FOREIGN key (idRemate) REFERENCES Acciones(idAcción) ,
	FOREIGN key (idJugador) REFERENCES Personas(idPersona) ,
	FOREIGN key (idExtremidad) REFERENCES ExtremidadesAnotadoras(idExtremidad) ,
	FOREIGN key (idTipoEjecucion) REFERENCES TiposDeEjecucion(idTipoDeEjecucion) 
);




delete from Remates

create table Goles (
	idGol int primary key,
	idRemate int not null,
	idAsistencia int ,
	FOREIGN key (idGol) REFERENCES Acciones(idAcción) ,
	FOREIGN key (idRemate) REFERENCES Remates(idRemate) ,
	FOREIGN key (idAsistencia) REFERENCES Asistencias(idAsistencia)
);













