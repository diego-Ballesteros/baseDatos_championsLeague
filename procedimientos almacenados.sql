1)
CREATE or REPLACE PROCEDURE insertarClubesEnGruposK(idclubC INT,
								 nombreclubC varchar (200),
								 idCiudadC int ,
								 idGrupoC int, 
								 nombreGrupoC varchar (50),
								 idTemporadaC int,
								 idClubEnGrupoPorTemporadaC int)
AS
$CODE$
DECLARE
grupo Grupos%rowtype;
club Clubes%rowtype;
cgpt ClubesEnGrupoPorTemporada%rowtype;
contClubGrupo INT;
BEGIN

	select * into grupo
	from grupos 
	where grupos.idgrupo = idGrupoC;
	
	if grupo is null then 
		RAISE NOTICE 'Insertando Grupos %',idGrupoC;
		INSERT INTO Grupos VALUES (idGrupoC,nombreGrupoC,idTemporadaC);	
		RAISE NOTICE 'Grupo % insertado',idGrupoC;
		commit;
	end if; 
	
	select * into club
	from clubes 
	where clubes.idclub = idclubC;
	
	if club is null then 
		RAISE NOTICE 'Insertando Clubes %',idClubC;
		INSERT INTO Clubes VALUES (idClubC,nombreclubC,idCiudadC);	
		RAISE NOTICE 'Club % insertado',idclubC;
	end if;	
	
	select * into cgpt
	from ClubesEnGrupoPorTemporada as c
	where c.idclub = idclubC and c.idgrupo = idgrupoC;
	
	if cgpt is null then 
		select count(*) into contClubGrupo
		from ClubesEnGrupoPorTemporada as c
		group by c.idGrupo;
		
		if contClubGrupo < 5 then 
			RAISE NOTICE 'Insertando Clubes en grupos %',idClubEnGrupoPorTemporadaC;
			INSERT INTO ClubesEnGrupoPorTemporada VALUES (idClubEnGrupoPorTemporadaC,idclubC,idGrupoC );
			RAISE NOTICE 'Club % insertado',idClubEnGrupoPorTemporadaC;
		ELSE
			RAISE NOTICE 'Este grupo ya esta completo, no es posible añadir el club';
			
		--Guardar cambios
		end IF;
	ELSE
		RAISE NOTICE 'Este club ya esta regiatrado en este grupo';
	end if;
END
$CODE$
LANGUAGE'plpgsql';



call insertarClubesEnGruposK(35,'Duque fc',1,17,'i',1,65)


2)

CREATE Or REPLACE PROCEDURE insertarEstadiosDeclubesC(
								idEstadioC INT,
								CapacidadAforo int,
								idCiudad int,
								nombre varchar(200),
								idClubC  int,
								nombreClub varchar(100),
								idEstadioDeClube  int,
								fechaInicio date,
								fechaFinal date
							)
AS
$CODE$
DECLARE
estadio Estadios%rowType;
club Clubes%rowtype;
BEGIN

	select * into estadio
	from Estadios
	Where Estadios.idEstadio = idEstadioC;
	
	IF estadio is null then
		RAISE NOTICE 'Insertando estadio %',idEstadioC;
		INSERT INTO Estadios VALUES (idEstadioC ,CapacidadAforo,idCiudad,nombre );	
		RAISE NOTICE 'Estadio % insertado',idEstadioC;
	END IF;
	
	select * into club
	from Clubes 
	where Clubes.idClub = idClubC;
	
	IF club is null then
		RAISE NOTICE 'Insertando club %',idClubC;
		INSERT INTO Clubes VALUES (idClubC ,nombreClub,idCiudad);	
		RAISE NOTICE 'Club % insertado',idClubC;
	end if;


	
	RAISE NOTICE 'Insertando EntrenadoresEnClubes %',idEstadioDeClube ;
	INSERT INTO EstadiosDeClubes VALUES (idEstadioDeClube,fechaInicio,fechaFinal,idClubC, idEstadioC);
	RAISE NOTICE 'EntrenadoresEnClubes % insertado',idEstadioDeClube ;
	--Guardar cambios
	
	
END
$CODE$
LANGUAGE'plpgsql';

call insertarEstadiosDeclubesC(25,4500,2,'La bombonera','33','brujas','3064','24/06/1996','24/06/1996')


3)
CREATE or REPLACE PROCEDURE insertarGolesEnPartidosRegistradosC(idGolC INT,
								 minuto int,
								 idtipoAcción int ,
								 idPartidoC int, 
								 idExtremidadAnotadora int,
								 idJugador int,
								 idtipoEjecucion int,
								 idAsistencia int, 
									isLocalClub bool
							)
AS
$CODE$
DECLARE 
accion Acciones%rowtype;
remate Remates%rowtype;
gol Goles%rowtype;
numGol INT;
BEGIN


	select * into accion
	from acciones 
	where acciones.idacción = idGolC;
	
	if accion is null then
		RAISE NOTICE 'Insertando Acciónes %',idGolC;
		INSERT INTO Acciones VALUES (idGolC,minuto,idPartidoC, idtipoAcción );	
		RAISE NOTICE 'Acción % insertado',idGolC;
	end if; 
	
	select * into remate
	from remates
	where remates.idRemate = idgolC;
	
	if remate is null then
		RAISE NOTICE 'Insertando Remates %',idGolC;
		INSERT INTO Remates VALUES (idGolC,idJugador,idExtremidadAnotadora, idtipoEjecucion);	
		RAISE NOTICE 'Remate % insertado',idGolC;
	end if;
	
	select * into gol
	from Goles
	where goles.idGol = idGolC;
	
	if gol is null then
		RAISE NOTICE 'Insertando Goles %',idGolC;
		INSERT INTO Goles VALUES (idGolC,idGolC,idAsistencia);
		RAISE NOTICE 'Gol % insertado',idGolC;
	end if;
	
	If isLocalClub then
		select marcadorlocal into numGol from Partidos where idPartido = idPartidoC;
		RAISE NOTICE 'Actualizando partido';
		UPDATE Partidos set marcadorlocal = (numGol+1);
	else
		select marcadorvisitante into numGol from Partidos  where idPartido = idPartidoC;
		RAISE NOTICE 'Actualizando partido';
		UPDATE Partidos set marcadorvisitante = (numGol+1);
	end IF;
	
END
$CODE$
LANGUAGE'plpgsql';

call insertarGolesEnPartidosRegistradosC (460,44,8,11,1,1,5,null,true);

4)


CREATE or REPLACE PROCEDURE insertarPasesB(idPase INT,
								 minuto int,
								 idtipoAcción int ,
								 idPartido int, 
								 idjugadorejecuta int,
								 idjugadorrecepciona int
								 )
AS
$CODE$
DECLARE 
BEGIN

	RAISE NOTICE 'Insertando Acciónes %',idPase;
	INSERT INTO Acciones VALUES (idPase,minuto,idPartido, idtipoAcción );	
	RAISE NOTICE 'Acción % insertado',idPase;

	RAISE NOTICE 'Insertando Pases %',idPase;
	INSERT INTO Pases VALUES (idPase,idjugadorejecuta,idjugadorrecepciona);
	RAISE NOTICE 'Pase % insertado',idPase;

	--Guardar cambios
	
	
END
$CODE$
LANGUAGE'plpgsql';


call insertarPasesB (31231,44,2,11,14,1);

5)

CREATE Or REPLACE PROCEDURE insertarFaltas(idfalta int, idtipofalta int,idtipoamonestacion int ,idinfractor int ,idvictima int, idAcción int,minuto int,idPartido int,idTipoAcción int)
AS
 $CODE$
BEGIN
	RAISE NOTICE 'Insertando Accion %',idAcción;
	INSERT INTO Acciones VALUES (idAcción,minuto,idpartido,idTipoAcción);
	RAISE NOTICE 'Acciones % insertado',idAcción;
	--Guardar cambios	
	
	RAISE NOTICE 'Insertando Falta %',idFalta;
	INSERT INTO faltas VALUES (idfalta,idtipofalta,idtipoamonestacion,idinfractor,idvictima);
	
	RAISE NOTICE 'Falta % insertado',idFalta;
		
END
$CODE$
LANGUAGE'plpgsql';



call insertarFaltas(780,1,1,1,2,780,32,1,1)

6)

CREATE or REPLACE PROCEDURE insertarAtajadas(idAtajada INT,
								 minuto int,
								 idPartido int,
								 idtipoAcción int , 
								 idPortero int
								 )
AS
$CODE$
DECLARE 
BEGIN

	RAISE NOTICE 'Insertando Acciónes %',idAtajada;
	INSERT INTO Acciones VALUES (idAtajada,minuto,idPartido, idtipoAcción);	
	RAISE NOTICE 'Acción % insertado',idAtajada;

	RAISE NOTICE 'Insertando Atajada %',idAtajada;
	INSERT INTO Atajadas VALUES (idAtajada,idPortero);
	RAISE NOTICE 'Atajada % insertado',idAtajada;

	--Guardar cambios
	
	
END
$CODE$
LANGUAGE'plpgsql';

call insertarAtajadas (31233,30,11,7,4);

7)

CREATE or REPLACE PROCEDURE insertarRemates(idRemate INT,
								 minuto int,
								 idPartido int,
								 idtipoAcción int ,
								 idJugador int,
								 idExtremidadAnotadora int,
								 idtipoejecucion int)
AS
$CODE$
DECLARE 
BEGIN

	RAISE NOTICE 'Insertando Acciónes %',idRemate;
	INSERT INTO Acciones VALUES (idRemate,minuto,idPartido, idtipoAcción );	
	RAISE NOTICE 'Acción % insertado',idRemate;

	RAISE NOTICE 'Insertando Remates %',idRemate;
	INSERT INTO Remates VALUES (idRemate,idJugador,idExtremidadAnotadora, idtipoEjecucion);	
	RAISE NOTICE 'Remate % insertado',idRemate;

END
$CODE$
LANGUAGE'plpgsql';

call insertarRemates (31235,12,11,4,1,2,5);

8)
CREATE Or REPLACE PROCEDURE insertarSustituciones(idsustitucion int, idjugadorsustituido int,idjugadorsustituto int, idAcción int,minuto int,idPartido int,idTipoAcción int)
AS
 $CODE$
BEGIN
	RAISE NOTICE 'Insertando Accion %',idAcción;
	INSERT INTO Acciones VALUES (idAcción,minuto,idpartido,idTipoAcción);
	RAISE NOTICE 'Acciones % insertado',idAcción;
	--Guardar cambios	
	
	RAISE NOTICE 'Insertando Sustitucion %',idsustitucion;
	INSERT INTO Sustituciones VALUES (idsustitucion,idjugadorsustituido,idjugadorsustituto);
	
	RAISE NOTICE 'Falta % insertado',idsustitucion;
		
END
$CODE$
LANGUAGE'plpgsql';

call insertarSustituciones(568,2,14,568,41,1,4)
9)
CREATE or REPLACE PROCEDURE insertarAdiciones(idAdicion INT,
								 minuto int,
								 idPartido int,
								 idtipoAcción int, 
								 idtipoadicion int
								 )
AS
$CODE$
DECLARE 
BEGIN

	RAISE NOTICE 'Insertando Acciónes %',idAdicion;
	INSERT INTO Acciones VALUES (idAdicion,minuto,idPartido, idtipoAcción);	
	RAISE NOTICE 'Acción % insertado',idAdicion;

	RAISE NOTICE 'Insertando Adicion %',idAdicion;
	INSERT INTO Adicion VALUES (idAdicion,idtipoadicion);
	RAISE NOTICE 'Atajada % insertado',idAdicion;

	--Guardar cambios
	
	
END
$CODE$
LANGUAGE'plpgsql';

call insertarAtajadas (31237,30,11,6,1);
