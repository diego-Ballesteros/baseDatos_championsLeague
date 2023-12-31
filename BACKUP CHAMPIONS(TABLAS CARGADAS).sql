PGDMP     :    1            
    z         
   Champions1    14.5    14.5 `   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    49211 
   Champions1    DATABASE     k   CREATE DATABASE "Champions1" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE "Champions1";
                postgres    false            C           1255    66327 >   insertaradiciones(integer, integer, integer, integer, integer) 	   PROCEDURE     1  CREATE PROCEDURE public.insertaradiciones(IN idadicion integer, IN minuto integer, IN idpartido integer, IN "idtipoacción" integer, IN idtipoadicion integer)
    LANGUAGE plpgsql
    AS $$
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
$$;
 �   DROP PROCEDURE public.insertaradiciones(IN idadicion integer, IN minuto integer, IN idpartido integer, IN "idtipoacción" integer, IN idtipoadicion integer);
       public          postgres    false            A           1255    66324 =   insertaratajadas(integer, integer, integer, integer, integer) 	   PROCEDURE     )  CREATE PROCEDURE public.insertaratajadas(IN idatajada integer, IN minuto integer, IN idpartido integer, IN "idtipoacción" integer, IN idportero integer)
    LANGUAGE plpgsql
    AS $$
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
$$;
 �   DROP PROCEDURE public.insertaratajadas(IN idatajada integer, IN minuto integer, IN idpartido integer, IN "idtipoacción" integer, IN idportero integer);
       public          postgres    false            4           1255    66304 i   insertarclubesengrupos(integer, character varying, integer, integer, character varying, integer, integer) 	   PROCEDURE       CREATE PROCEDURE public.insertarclubesengrupos(IN idclub integer, IN nombreclub character varying, IN idciudad integer, IN idgrupo integer, IN nombregrupo character varying, IN idtemporada integer, IN idclubengrupoportemporada integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
grupo Grupos%rowtype;
club Clubes%rowtype;
cgpt ClubesEnGrupoPorTemporada%rowtype;
contClubGrupo ClubesEnGrupoPorTemporada%rowtype;
BEGIN

	select * into grupo
	from grupos 
	where grupos.idgrupo = idGrupo;
	
	if grupo is null then 
		RAISE NOTICE 'Insertando Grupos %',idGrupo;
		INSERT INTO Grupos VALUES (idGrupo,nombreGrupo,idTemporada);	
		RAISE NOTICE 'Grupo % insertado',idGrupo;
		commit;
	end if; 
	
	select * into club
	from clubes 
	where clubes.idclub = idclub;
	
	if club is null then 
		RAISE NOTICE 'Insertando Clubes %',idClub;
		INSERT INTO Clubes VALUES (idClub,nombreclub,idCiudad);	
		RAISE NOTICE 'Club % insertado',idclub;
	end if;	
	
	select * into cgpt
	from ClubesEnGrupoPorTemporada as c
		left join grupos as g on grupos.idgrupo = c.grupo
	where c.idclub = idclub and c.idgrupo = idgrupo and c.idtemporada = idtemporada;
	
	if cgpt is null then 
		select count(*) into contClubGrupo
		from ClubesEnGrupoPorTemporada as c
			left join grupos as g on g.idgrupo = c.idgrupos
		where g.idTemporada = idTemporada AND c.idGrupo = idGrupo
		order by c.idGrupo;
		
		if contClubGrupo < 5 then 
			RAISE NOTICE 'Insertando Clubes en grupos %',idClubEnGrupoPorTemporada;
			INSERT INTO ClubsEnGrupoPorTemporada VALUES (idClubEnGrupoPorTemporada,idclub,idGrupo );
			RAISE NOTICE 'Club % insertado',idClubEnGrupoPorTemporada;
		ELSE
			RAISE NOTICE 'Este grupo ya esta completo, no es posible añadir el club';
			
		--Guardar cambios
		end IF;
	ELSE
		RAISE NOTICE 'Este club ya esta regiatrado en este grupo';
	end if;
END
$$;
 �   DROP PROCEDURE public.insertarclubesengrupos(IN idclub integer, IN nombreclub character varying, IN idciudad integer, IN idgrupo integer, IN nombregrupo character varying, IN idtemporada integer, IN idclubengrupoportemporada integer);
       public          postgres    false            5           1255    66305 j   insertarclubesengruposc(integer, character varying, integer, integer, character varying, integer, integer) 	   PROCEDURE     :  CREATE PROCEDURE public.insertarclubesengruposc(IN idclubc integer, IN nombreclubc character varying, IN idciudadc integer, IN idgrupoc integer, IN nombregrupoc character varying, IN idtemporadac integer, IN idclubengrupoportemporadac integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
grupo Grupos%rowtype;
club Clubes%rowtype;
cgpt ClubesEnGrupoPorTemporada%rowtype;
contClubGrupo ClubesEnGrupoPorTemporada%rowtype;
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
		left join grupos as g on grupos.idgrupo = c.grupo
	where c.idclub = idclubC and c.idgrupo = idgrupoC and c.idtemporada = idtemporadaC;
	
	if cgpt is null then 
		select count(*) into contClubGrupo
		from ClubesEnGrupoPorTemporada as c
			left join grupos as g on g.idgrupo = c.idgrupos
		where g.idTemporada = idTemporadaC AND c.idGrupo = idGrupoC
		order by c.idGrupo;
		
		if contClubGrupo < 5 then 
			RAISE NOTICE 'Insertando Clubes en grupos %',idClubEnGrupoPorTemporadaC;
			INSERT INTO ClubsEnGrupoPorTemporada VALUES (idClubEnGrupoPorTemporadaC,idclubC,idGrupoC );
			RAISE NOTICE 'Club % insertado',idClubEnGrupoPorTemporadaC;
		ELSE
			RAISE NOTICE 'Este grupo ya esta completo, no es posible añadir el club';
			
		--Guardar cambios
		end IF;
	ELSE
		RAISE NOTICE 'Este club ya esta regiatrado en este grupo';
	end if;
END
$$;
 �   DROP PROCEDURE public.insertarclubesengruposc(IN idclubc integer, IN nombreclubc character varying, IN idciudadc integer, IN idgrupoc integer, IN nombregrupoc character varying, IN idtemporadac integer, IN idclubengrupoportemporadac integer);
       public          postgres    false            6           1255    66306 j   insertarclubesengruposd(integer, character varying, integer, integer, character varying, integer, integer) 	   PROCEDURE     t  CREATE PROCEDURE public.insertarclubesengruposd(IN idclubc integer, IN nombreclubc character varying, IN idciudadc integer, IN idgrupoc integer, IN nombregrupoc character varying, IN idtemporadac integer, IN idclubengrupoportemporadac integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
grupo Grupos%rowtype;
club Clubes%rowtype;
cgpt ClubesEnGrupoPorTemporada%rowtype;
contClubGrupo ClubesEnGrupoPorTemporada%rowtype;
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
		order by c.idGrupo;
		
		if contClubGrupo < 5 then 
			RAISE NOTICE 'Insertando Clubes en grupos %',idClubEnGrupoPorTemporadaC;
			INSERT INTO ClubsEnGrupoPorTemporada VALUES (idClubEnGrupoPorTemporadaC,idclubC,idGrupoC );
			RAISE NOTICE 'Club % insertado',idClubEnGrupoPorTemporadaC;
		ELSE
			RAISE NOTICE 'Este grupo ya esta completo, no es posible añadir el club';
			
		--Guardar cambios
		end IF;
	ELSE
		RAISE NOTICE 'Este club ya esta regiatrado en este grupo';
	end if;
END
$$;
 �   DROP PROCEDURE public.insertarclubesengruposd(IN idclubc integer, IN nombreclubc character varying, IN idciudadc integer, IN idgrupoc integer, IN nombregrupoc character varying, IN idtemporadac integer, IN idclubengrupoportemporadac integer);
       public          postgres    false            7           1255    66307 j   insertarclubesengrupose(integer, character varying, integer, integer, character varying, integer, integer) 	   PROCEDURE     t  CREATE PROCEDURE public.insertarclubesengrupose(IN idclubc integer, IN nombreclubc character varying, IN idciudadc integer, IN idgrupoc integer, IN nombregrupoc character varying, IN idtemporadac integer, IN idclubengrupoportemporadac integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
grupo Grupos%rowtype;
club Clubes%rowtype;
cgpt ClubesEnGrupoPorTemporada%rowtype;
contClubGrupo ClubesEnGrupoPorTemporada%rowtype;
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
			INSERT INTO ClubsEnGrupoPorTemporada VALUES (idClubEnGrupoPorTemporadaC,idclubC,idGrupoC );
			RAISE NOTICE 'Club % insertado',idClubEnGrupoPorTemporadaC;
		ELSE
			RAISE NOTICE 'Este grupo ya esta completo, no es posible añadir el club';
			
		--Guardar cambios
		end IF;
	ELSE
		RAISE NOTICE 'Este club ya esta regiatrado en este grupo';
	end if;
END
$$;
 �   DROP PROCEDURE public.insertarclubesengrupose(IN idclubc integer, IN nombreclubc character varying, IN idciudadc integer, IN idgrupoc integer, IN nombregrupoc character varying, IN idtemporadac integer, IN idclubengrupoportemporadac integer);
       public          postgres    false            8           1255    66309 j   insertarclubesengruposg(integer, character varying, integer, integer, character varying, integer, integer) 	   PROCEDURE     t  CREATE PROCEDURE public.insertarclubesengruposg(IN idclubc integer, IN nombreclubc character varying, IN idciudadc integer, IN idgrupoc integer, IN nombregrupoc character varying, IN idtemporadac integer, IN idclubengrupoportemporadac integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
grupo Grupos%rowtype;
club Clubes%rowtype;
cgpt ClubesEnGrupoPorTemporada%rowtype;
contClubGrupo ClubesEnGrupoPorTemporada%rowtype;
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
			INSERT INTO ClubsEnGrupoPorTemporada VALUES (idClubEnGrupoPorTemporadaC,idclubC,idGrupoC );
			RAISE NOTICE 'Club % insertado',idClubEnGrupoPorTemporadaC;
		ELSE
			RAISE NOTICE 'Este grupo ya esta completo, no es posible añadir el club';
			
		--Guardar cambios
		end IF;
	ELSE
		RAISE NOTICE 'Este club ya esta regiatrado en este grupo';
	end if;
END
$$;
 �   DROP PROCEDURE public.insertarclubesengruposg(IN idclubc integer, IN nombreclubc character varying, IN idciudadc integer, IN idgrupoc integer, IN nombregrupoc character varying, IN idtemporadac integer, IN idclubengrupoportemporadac integer);
       public          postgres    false            9           1255    66310 j   insertarclubesengruposh(integer, character varying, integer, integer, character varying, integer, integer) 	   PROCEDURE     {  CREATE PROCEDURE public.insertarclubesengruposh(IN idclubc integer, IN nombreclubc character varying, IN idciudadc integer, IN idgrupoc integer, IN nombregrupoc character varying, IN idtemporadac integer, IN idclubengrupoportemporadac integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
grupo Grupos%rowtype;
club Clubes%rowtype;
cgpt ClubesEnGrupoPorTemporada%rowtype;
contClubGrupo ClubesEnGrupoPorTemporada%rowtype;
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
		select count(*) as r into contClubGrupo
		from ClubesEnGrupoPorTemporada as c
		group by c.idGrupo;
		
		if contClubGrupo.r < 5 then 
			RAISE NOTICE 'Insertando Clubes en grupos %',idClubEnGrupoPorTemporadaC;
			INSERT INTO ClubsEnGrupoPorTemporada VALUES (idClubEnGrupoPorTemporadaC,idclubC,idGrupoC );
			RAISE NOTICE 'Club % insertado',idClubEnGrupoPorTemporadaC;
		ELSE
			RAISE NOTICE 'Este grupo ya esta completo, no es posible añadir el club';
			
		--Guardar cambios
		end IF;
	ELSE
		RAISE NOTICE 'Este club ya esta regiatrado en este grupo';
	end if;
END
$$;
 �   DROP PROCEDURE public.insertarclubesengruposh(IN idclubc integer, IN nombreclubc character varying, IN idciudadc integer, IN idgrupoc integer, IN nombregrupoc character varying, IN idtemporadac integer, IN idclubengrupoportemporadac integer);
       public          postgres    false            ;           1255    66313 j   insertarclubesengruposj(integer, character varying, integer, integer, character varying, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.insertarclubesengruposj(IN idclubc integer, IN nombreclubc character varying, IN idciudadc integer, IN idgrupoc integer, IN nombregrupoc character varying, IN idtemporadac integer, IN idclubengrupoportemporadac integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
grupo Grupos%rowtype;
club Clubes%rowtype;
cgpt ClubesEnGrupoPorTemporada%rowtype;
contClubGrupo ClubesEnGrupoPorTemporada%rowtype;
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
		select idGrupo, count(*) as counted into contClubGrupo
		from ClubesEnGrupoPorTemporada as c
		group by c.idGrupo;
		
		if contClubGrupo.counted < 5 then 
			RAISE NOTICE 'Insertando Clubes en grupos %',idClubEnGrupoPorTemporadaC;
			INSERT INTO ClubsEnGrupoPorTemporada VALUES (idClubEnGrupoPorTemporadaC,idclubC,idGrupoC );
			RAISE NOTICE 'Club % insertado',idClubEnGrupoPorTemporadaC;
		ELSE
			RAISE NOTICE 'Este grupo ya esta completo, no es posible añadir el club';
			
		--Guardar cambios
		end IF;
	ELSE
		RAISE NOTICE 'Este club ya esta regiatrado en este grupo';
	end if;
END
$$;
 �   DROP PROCEDURE public.insertarclubesengruposj(IN idclubc integer, IN nombreclubc character varying, IN idciudadc integer, IN idgrupoc integer, IN nombregrupoc character varying, IN idtemporadac integer, IN idclubengrupoportemporadac integer);
       public          postgres    false            <           1255    66314 j   insertarclubesengruposk(integer, character varying, integer, integer, character varying, integer, integer) 	   PROCEDURE     W  CREATE PROCEDURE public.insertarclubesengruposk(IN idclubc integer, IN nombreclubc character varying, IN idciudadc integer, IN idgrupoc integer, IN nombregrupoc character varying, IN idtemporadac integer, IN idclubengrupoportemporadac integer)
    LANGUAGE plpgsql
    AS $$
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
$$;
 �   DROP PROCEDURE public.insertarclubesengruposk(IN idclubc integer, IN nombreclubc character varying, IN idciudadc integer, IN idgrupoc integer, IN nombregrupoc character varying, IN idtemporadac integer, IN idclubengrupoportemporadac integer);
       public          postgres    false            '           1255    66268 q   insertarcontrato(integer, date, date, integer, integer, character varying, date, date, integer, integer, integer) 	   PROCEDURE        CREATE PROCEDURE public.insertarcontrato(IN idcontrato integer, IN fechainicio date, IN fechafinal date, IN idpersona integer, IN idclub integer, IN nombre character varying, IN fechanacimiento date, IN fechadedebut date, IN "idpaísprocedencia" integer, IN idciudadnacimiento integer, IN idtipopersona integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RAISE NOTICE 'Insertando Personas %',idPersona;
	INSERT INTO Personas VALUES (idPersona,nombre,fechaNacimiento,fechaDedebut ,idPaísProcedencia ,idCiudadNacimiento,idTipoPersona);
	RAISE NOTICE 'Persona % insertado',idPersona;
	--Guardar cambios
	COMMIT;
	
	RAISE NOTICE 'Insertando Contrato %',idContrato;
	INSERT INTO Contratos VALUES (idContrato,fechaInicio,fechaFinal,idPersona,idClub);
	
	RAISE NOTICE 'Contrato % insertado',idContrato;
END
$$;
 7  DROP PROCEDURE public.insertarcontrato(IN idcontrato integer, IN fechainicio date, IN fechafinal date, IN idpersona integer, IN idclub integer, IN nombre character varying, IN fechanacimiento date, IN fechadedebut date, IN "idpaísprocedencia" integer, IN idciudadnacimiento integer, IN idtipopersona integer);
       public          postgres    false            :           1255    66317 x   insertarestadiosdeclubesc(integer, integer, integer, character varying, integer, character varying, integer, date, date) 	   PROCEDURE     �  CREATE PROCEDURE public.insertarestadiosdeclubesc(IN idestadioc integer, IN capacidadaforo integer, IN idciudad integer, IN nombre character varying, IN idclubc integer, IN nombreclub character varying, IN idestadiodeclube integer, IN fechainicio date, IN fechafinal date)
    LANGUAGE plpgsql
    AS $$
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
$$;
   DROP PROCEDURE public.insertarestadiosdeclubesc(IN idestadioc integer, IN capacidadaforo integer, IN idciudad integer, IN nombre character varying, IN idclubc integer, IN nombreclub character varying, IN idestadiodeclube integer, IN fechainicio date, IN fechafinal date);
       public          postgres    false            @           1255    66323 _   insertarfaltas(integer, integer, integer, integer, integer, integer, integer, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.insertarfaltas(IN idfalta integer, IN idtipofalta integer, IN idtipoamonestacion integer, IN idinfractor integer, IN idvictima integer, IN "idacción" integer, IN minuto integer, IN idpartido integer, IN "idtipoacción" integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RAISE NOTICE 'Insertando Accion %',idAcción;
	INSERT INTO Acciones VALUES (idAcción,minuto,idpartido,idTipoAcción);
	RAISE NOTICE 'Acciones % insertado',idAcción;
	--Guardar cambios	
	
	RAISE NOTICE 'Insertando Falta %',idFalta;
	INSERT INTO faltas VALUES (idfalta,idtipofalta,idtipoamonestacion,idinfractor,idvictima);
	
	RAISE NOTICE 'Falta % insertado',idFalta;
		
END
$$;
 �   DROP PROCEDURE public.insertarfaltas(IN idfalta integer, IN idtipofalta integer, IN idtipoamonestacion integer, IN idinfractor integer, IN idvictima integer, IN "idacción" integer, IN minuto integer, IN idpartido integer, IN "idtipoacción" integer);
       public          postgres    false            3           1255    66272 j   insertargolesenpartidosregistrados(integer, integer, integer, integer, integer, integer, integer, integer) 	   PROCEDURE     #  CREATE PROCEDURE public.insertargolesenpartidosregistrados(IN idgol integer, IN minuto integer, IN "idtipoacción" integer, IN idpartido integer, IN idextremidadanotadora integer, IN idjugador integer, IN idtipoejecucion integer, IN idasistencia integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RAISE NOTICE 'Insertando Acciónes %',idGol;
	INSERT INTO Acciones VALUES (idgol,minuto, idtipoAcción,idPartido );	
	RAISE NOTICE 'Acción % insertado',idGol;
	
	
	RAISE NOTICE 'Insertando Remates %',idGol;
	INSERT INTO remates VALUES (idGol,idExtremidadAnotadora,idJugador, idtipoEjecucion);	
	RAISE NOTICE 'Remate % insertado',idGol;
	
	
	RAISE NOTICE 'Insertando Goles %',idGol;
	INSERT INTO Goles VALUES (idGol,idRemate,idAsistencia);
	RAISE NOTICE 'Gol % insertado',idGol;
	--Guardar cambios
	
	
END
$$;
 �   DROP PROCEDURE public.insertargolesenpartidosregistrados(IN idgol integer, IN minuto integer, IN "idtipoacción" integer, IN idpartido integer, IN idextremidadanotadora integer, IN idjugador integer, IN idtipoejecucion integer, IN idasistencia integer);
       public          postgres    false            0           1255    66271 y   insertargolesenpartidosregistrados(integer, time without time zone, integer, integer, integer, integer, integer, integer) 	   PROCEDURE     2  CREATE PROCEDURE public.insertargolesenpartidosregistrados(IN idgol integer, IN minuto time without time zone, IN "idtipoacción" integer, IN idpartido integer, IN idextremidadanotadora integer, IN idjugador integer, IN idtipoejecucion integer, IN idasistencia integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RAISE NOTICE 'Insertando Acciónes %',idGol;
	INSERT INTO Acciones VALUES (idAcción,minuto, idtipoAcción,idPartido );	
	RAISE NOTICE 'Acción % insertado',idGol;
	COMMIT;
	
	RAISE NOTICE 'Insertando Remates %',idGol;
	INSERT INTO Ciudades VALUES (idGol,idExtremidadAnotadora,idJugador, idtipoEjecucion);	
	RAISE NOTICE 'Remate % insertado',idGol;
	
	
	RAISE NOTICE 'Insertando Goles %',idGol;
	INSERT INTO Personas VALUES (idAsistencia);
	RAISE NOTICE 'Gol % insertado',idGol;
	--Guardar cambios
	
	
END
$$;
   DROP PROCEDURE public.insertargolesenpartidosregistrados(IN idgol integer, IN minuto time without time zone, IN "idtipoacción" integer, IN idpartido integer, IN idextremidadanotadora integer, IN idjugador integer, IN idtipoejecucion integer, IN idasistencia integer);
       public          postgres    false            1           1255    66273 s   insertargolesenpartidosregistrados(integer, integer, integer, integer, integer, integer, integer, integer, integer) 	   PROCEDURE     ;  CREATE PROCEDURE public.insertargolesenpartidosregistrados(IN idgol integer, IN minuto integer, IN "idtipoacción" integer, IN idpartido integer, IN idextremidadanotadora integer, IN idjugador integer, IN idtipoejecucion integer, IN idasistencia integer, IN idremate integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RAISE NOTICE 'Insertando Acciónes %',idGol;
	INSERT INTO Acciones VALUES (idgol,minuto, idtipoAcción,idPartido );	
	RAISE NOTICE 'Acción % insertado',idGol;
	
	
	RAISE NOTICE 'Insertando Remates %',idGol;
	INSERT INTO remates VALUES (idRemate,idExtremidadAnotadora,idJugador, idtipoEjecucion);	
	RAISE NOTICE 'Remate % insertado',idGol;
	
	
	RAISE NOTICE 'Insertando Goles %',idGol;
	INSERT INTO Goles VALUES (idGol,idRemate,idAsistencia);
	RAISE NOTICE 'Gol % insertado',idGol;
	--Guardar cambios
	
	
END
$$;
   DROP PROCEDURE public.insertargolesenpartidosregistrados(IN idgol integer, IN minuto integer, IN "idtipoacción" integer, IN idpartido integer, IN idextremidadanotadora integer, IN idjugador integer, IN idtipoejecucion integer, IN idasistencia integer, IN idremate integer);
       public          postgres    false            >           1255    66321 t   insertargolesenpartidosregistradosc(integer, integer, integer, integer, integer, integer, integer, integer, boolean) 	   PROCEDURE     C  CREATE PROCEDURE public.insertargolesenpartidosregistradosc(IN idgolc integer, IN minuto integer, IN "idtipoacción" integer, IN idpartidoc integer, IN idextremidadanotadora integer, IN idjugador integer, IN idtipoejecucion integer, IN idasistencia integer, IN islocalclub boolean)
    LANGUAGE plpgsql
    AS $$
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
$$;
   DROP PROCEDURE public.insertargolesenpartidosregistradosc(IN idgolc integer, IN minuto integer, IN "idtipoacción" integer, IN idpartidoc integer, IN idextremidadanotadora integer, IN idjugador integer, IN idtipoejecucion integer, IN idasistencia integer, IN islocalclub boolean);
       public          postgres    false            ?           1255    66322 D   insertarpasesb(integer, integer, integer, integer, integer, integer) 	   PROCEDURE     M  CREATE PROCEDURE public.insertarpasesb(IN idpase integer, IN minuto integer, IN "idtipoacción" integer, IN idpartido integer, IN idjugadorejecuta integer, IN idjugadorrecepciona integer)
    LANGUAGE plpgsql
    AS $$
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
$$;
 �   DROP PROCEDURE public.insertarpasesb(IN idpase integer, IN minuto integer, IN "idtipoacción" integer, IN idpartido integer, IN idjugadorejecuta integer, IN idjugadorrecepciona integer);
       public          postgres    false            2           1255    66270 �   insertarpersona(integer, character varying, integer, character varying, integer, character varying, date, date, integer, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.insertarpersona(IN "idpaís" integer, IN "nombrepaís" character varying, IN idciudad integer, IN nombreciudad character varying, IN idpersona integer, IN nombrepersona character varying, IN fechanacimiento date, IN fechadedebut date, IN "idpaísprocedencia" integer, IN idciudadnacimiento integer, IN idtipopersona integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RAISE NOTICE 'Insertando país %',idPaís;
	INSERT INTO Países VALUES (idPaís,nombrePaís);	
	RAISE NOTICE 'país % insertado',idPaís;
	COMMIT;
	
	RAISE NOTICE 'Insertando Ciudades %',idCiudad;
	INSERT INTO Ciudades VALUES (idCiudad,nombreCiudad,idPaís);	
	RAISE NOTICE 'Ciudad % insertado',idCiudad;
	
	
	RAISE NOTICE 'Insertando Personas %',idPersona;
	INSERT INTO Personas VALUES (idPersona,nombrePersona,fechaNacimiento,fechaDedebut ,idPaísProcedencia ,idCiudadNacimiento,idTipoPersona);
	RAISE NOTICE 'Persona % insertado',idPersona;
	--Guardar cambios
	
	
END
$$;
 \  DROP PROCEDURE public.insertarpersona(IN "idpaís" integer, IN "nombrepaís" character varying, IN idciudad integer, IN nombreciudad character varying, IN idpersona integer, IN nombrepersona character varying, IN fechanacimiento date, IN fechadedebut date, IN "idpaísprocedencia" integer, IN idciudadnacimiento integer, IN idtipopersona integer);
       public          postgres    false            =           1255    66325 N   insertarremates(integer, integer, integer, integer, integer, integer, integer) 	   PROCEDURE     o  CREATE PROCEDURE public.insertarremates(IN idremate integer, IN minuto integer, IN idpartido integer, IN "idtipoacción" integer, IN idjugador integer, IN idextremidadanotadora integer, IN idtipoejecucion integer)
    LANGUAGE plpgsql
    AS $$
DECLARE 
BEGIN

	RAISE NOTICE 'Insertando Acciónes %',idRemate;
	INSERT INTO Acciones VALUES (idRemate,minuto,idPartido, idtipoAcción );	
	RAISE NOTICE 'Acción % insertado',idRemate;

	RAISE NOTICE 'Insertando Remates %',idRemate;
	INSERT INTO Remates VALUES (idRemate,idJugador,idExtremidadAnotadora, idtipoEjecucion);	
	RAISE NOTICE 'Remate % insertado',idRemate;

END
$$;
 �   DROP PROCEDURE public.insertarremates(IN idremate integer, IN minuto integer, IN idpartido integer, IN "idtipoacción" integer, IN idjugador integer, IN idextremidadanotadora integer, IN idtipoejecucion integer);
       public          postgres    false            B           1255    66326 T   insertarsustituciones(integer, integer, integer, integer, integer, integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.insertarsustituciones(IN idsustitucion integer, IN idjugadorsustituido integer, IN idjugadorsustituto integer, IN "idacción" integer, IN minuto integer, IN idpartido integer, IN "idtipoacción" integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
	RAISE NOTICE 'Insertando Accion %',idAcción;
	INSERT INTO Acciones VALUES (idAcción,minuto,idpartido,idTipoAcción);
	RAISE NOTICE 'Acciones % insertado',idAcción;
	--Guardar cambios	
	
	RAISE NOTICE 'Insertando Sustitucion %',idsustitucion;
	INSERT INTO Sustituciones VALUES (idsustitucion,idjugadorsustituido,idjugadorsustituto);
	
	RAISE NOTICE 'Falta % insertado',idsustitucion;
		
END
$$;
 �   DROP PROCEDURE public.insertarsustituciones(IN idsustitucion integer, IN idjugadorsustituido integer, IN idjugadorsustituto integer, IN "idacción" integer, IN minuto integer, IN idpartido integer, IN "idtipoacción" integer);
       public          postgres    false                        1259    49629    acciones    TABLE     �   CREATE TABLE public.acciones (
    "idacción" integer NOT NULL,
    minuto integer NOT NULL,
    idpartido integer NOT NULL,
    "idtipoacción" integer NOT NULL
);
    DROP TABLE public.acciones;
       public         heap    postgres    false            �            1259    49628    acciones_idacción_seq    SEQUENCE     �   CREATE SEQUENCE public."acciones_idacción_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."acciones_idacción_seq";
       public          postgres    false    256            �           0    0    acciones_idacción_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."acciones_idacción_seq" OWNED BY public.acciones."idacción";
          public          postgres    false    255                       1259    49731 	   adiciones    TABLE     f   CREATE TABLE public.adiciones (
    idadicion integer NOT NULL,
    idtipoadicion integer NOT NULL
);
    DROP TABLE public.adiciones;
       public         heap    postgres    false                       1259    49987    asistencias    TABLE     �   CREATE TABLE public.asistencias (
    idasistencia integer NOT NULL,
    idjugador integer NOT NULL,
    idtipodeejecucion integer NOT NULL
);
    DROP TABLE public.asistencias;
       public         heap    postgres    false                       1259    49952    atajadas    TABLE     a   CREATE TABLE public.atajadas (
    idatajada integer NOT NULL,
    idportero integer NOT NULL
);
    DROP TABLE public.atajadas;
       public         heap    postgres    false            �            1259    49366    personas    TABLE     4  CREATE TABLE public.personas (
    idpersona integer NOT NULL,
    nombre character varying(45) NOT NULL,
    fechanacimiento date NOT NULL,
    fechadedebut date,
    "idpaísprocedencia" integer NOT NULL,
    idciudadnacimiento integer NOT NULL,
    idtipopersona integer NOT NULL,
    fecharetiro date
);
    DROP TABLE public.personas;
       public         heap    postgres    false            !           1259    66278 #   atajadasensegundostiemposporarquero    VIEW     \  CREATE VIEW public.atajadasensegundostiemposporarquero AS
 SELECT p.nombre,
    count(*) AS c
   FROM ((public.atajadas a
     JOIN public.personas p ON ((p.idpersona = a.idportero)))
     JOIN public.acciones ac ON ((ac."idacción" = a.idatajada)))
  WHERE ((ac.minuto >= 45) AND (ac.minuto <= 90))
  GROUP BY p.nombre
  ORDER BY (count(*)) DESC;
 6   DROP VIEW public.atajadasensegundostiemposporarquero;
       public          postgres    false    276    276    236    256    236    256                        1259    66274     cantidadpasesacertadosporjugador    VIEW     �   CREATE VIEW public.cantidadpasesacertadosporjugador AS
SELECT
    NULL::character varying(45) AS nombre,
    NULL::bigint AS c;
 3   DROP VIEW public.cantidadpasesacertadosporjugador;
       public          postgres    false            �            1259    49325    ciudades    TABLE     �   CREATE TABLE public.ciudades (
    idciudad integer NOT NULL,
    nombre character varying(200) NOT NULL,
    "idpaís" integer NOT NULL
);
    DROP TABLE public.ciudades;
       public         heap    postgres    false            �            1259    49324    ciudades_idciudad_seq    SEQUENCE     �   CREATE SEQUENCE public.ciudades_idciudad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.ciudades_idciudad_seq;
       public          postgres    false    230            �           0    0    ciudades_idciudad_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.ciudades_idciudad_seq OWNED BY public.ciudades.idciudad;
          public          postgres    false    229            �            1259    49337    clubes    TABLE     �   CREATE TABLE public.clubes (
    idclub integer NOT NULL,
    nombreclub character varying(100) NOT NULL,
    idciudad integer NOT NULL
);
    DROP TABLE public.clubes;
       public         heap    postgres    false            �            1259    49336    clubes_idclub_seq    SEQUENCE     �   CREATE SEQUENCE public.clubes_idclub_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.clubes_idclub_seq;
       public          postgres    false    232            �           0    0    clubes_idclub_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.clubes_idclub_seq OWNED BY public.clubes.idclub;
          public          postgres    false    231            �            1259    49349    clubesengrupoportemporada    TABLE     �   CREATE TABLE public.clubesengrupoportemporada (
    idclubengrupoportemporada integer NOT NULL,
    idclub integer NOT NULL,
    idgrupo integer NOT NULL
);
 -   DROP TABLE public.clubesengrupoportemporada;
       public         heap    postgres    false            �            1259    49348 7   clubesengrupoportemporada_idclubengrupoportemporada_seq    SEQUENCE     �   CREATE SEQUENCE public.clubesengrupoportemporada_idclubengrupoportemporada_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 N   DROP SEQUENCE public.clubesengrupoportemporada_idclubengrupoportemporada_seq;
       public          postgres    false    234            �           0    0 7   clubesengrupoportemporada_idclubengrupoportemporada_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.clubesengrupoportemporada_idclubengrupoportemporada_seq OWNED BY public.clubesengrupoportemporada.idclubengrupoportemporada;
          public          postgres    false    233            �            1259    49464 	   contratos    TABLE     �   CREATE TABLE public.contratos (
    idcontrato integer NOT NULL,
    fechainicio date NOT NULL,
    fechafinal date,
    idpersona integer NOT NULL,
    idclub integer NOT NULL
);
    DROP TABLE public.contratos;
       public         heap    postgres    false            �            1259    49463    contratos_idcontrato_seq    SEQUENCE     �   CREATE SEQUENCE public.contratos_idcontrato_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.contratos_idcontrato_seq;
       public          postgres    false    240            �           0    0    contratos_idcontrato_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.contratos_idcontrato_seq OWNED BY public.contratos.idcontrato;
          public          postgres    false    239            �            1259    49248    países    TABLE     m   CREATE TABLE public."países" (
    "idpaís" integer NOT NULL,
    nombre character varying(45) NOT NULL
);
    DROP TABLE public."países";
       public         heap    postgres    false                       1259    66255    cuantosjugadoresporpais    VIEW     F  CREATE VIEW public.cuantosjugadoresporpais AS
 SELECT "países".nombre,
    count(*) AS c
   FROM (public.personas
     JOIN public."países" ON ((personas."idpaísprocedencia" = "países"."idpaís")))
  WHERE (personas.idtipopersona = 1)
  GROUP BY personas."idpaísprocedencia", "países".nombre
  ORDER BY (count(*)) DESC;
 *   DROP VIEW public.cuantosjugadoresporpais;
       public          postgres    false    236    236    218    218                       1259    49859    entrenadoresenclubes    TABLE     �   CREATE TABLE public.entrenadoresenclubes (
    identrenadorenclub integer NOT NULL,
    fechavinculacion date NOT NULL,
    "fechadesvinculación" date,
    idclub integer NOT NULL,
    identrenador integer NOT NULL
);
 (   DROP TABLE public.entrenadoresenclubes;
       public         heap    postgres    false                       1259    49858 +   entrenadoresenclubes_identrenadorenclub_seq    SEQUENCE     �   CREATE SEQUENCE public.entrenadoresenclubes_identrenadorenclub_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.entrenadoresenclubes_identrenadorenclub_seq;
       public          postgres    false    271            �           0    0 +   entrenadoresenclubes_identrenadorenclub_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.entrenadoresenclubes_identrenadorenclub_seq OWNED BY public.entrenadoresenclubes.identrenadorenclub;
          public          postgres    false    270            �            1259    49498    estadios    TABLE     �   CREATE TABLE public.estadios (
    idestadio integer NOT NULL,
    capacidadaforo integer NOT NULL,
    idciudad integer NOT NULL,
    nombre character varying(45) NOT NULL
);
    DROP TABLE public.estadios;
       public         heap    postgres    false            �            1259    49497    estadios_idestadio_seq    SEQUENCE     �   CREATE SEQUENCE public.estadios_idestadio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.estadios_idestadio_seq;
       public          postgres    false    242            �           0    0    estadios_idestadio_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.estadios_idestadio_seq OWNED BY public.estadios.idestadio;
          public          postgres    false    241            �            1259    49510    estadiosdeclubes    TABLE     �   CREATE TABLE public.estadiosdeclubes (
    idestadiodeclube integer NOT NULL,
    fechainicio date NOT NULL,
    fechafinal date,
    idclub integer NOT NULL,
    idestadio integer NOT NULL
);
 $   DROP TABLE public.estadiosdeclubes;
       public         heap    postgres    false            �            1259    49509 %   estadiosdeclubes_idestadiodeclube_seq    SEQUENCE     �   CREATE SEQUENCE public.estadiosdeclubes_idestadiodeclube_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.estadiosdeclubes_idestadiodeclube_seq;
       public          postgres    false    244            �           0    0 %   estadiosdeclubes_idestadiodeclube_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.estadiosdeclubes_idestadiodeclube_seq OWNED BY public.estadiosdeclubes.idestadiodeclube;
          public          postgres    false    243            �            1259    49527    estadiosdeshabilitados    TABLE     �   CREATE TABLE public.estadiosdeshabilitados (
    idestadiodeshabilitado integer NOT NULL,
    fechainicio date NOT NULL,
    fechafinal date,
    motivo character varying(40),
    idestadio integer NOT NULL
);
 *   DROP TABLE public.estadiosdeshabilitados;
       public         heap    postgres    false            �            1259    49526 1   estadiosdeshabilitados_idestadiodeshabilitado_seq    SEQUENCE     �   CREATE SEQUENCE public.estadiosdeshabilitados_idestadiodeshabilitado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.estadiosdeshabilitados_idestadiodeshabilitado_seq;
       public          postgres    false    246            �           0    0 1   estadiosdeshabilitados_idestadiodeshabilitado_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.estadiosdeshabilitados_idestadiodeshabilitado_seq OWNED BY public.estadiosdeshabilitados.idestadiodeshabilitado;
          public          postgres    false    245            �            1259    49588    estadosdepersonas    TABLE     �   CREATE TABLE public.estadosdepersonas (
    idestadopersona integer NOT NULL,
    fechainicioestado date NOT NULL,
    fechafinalestado date,
    idpersona integer NOT NULL,
    idtipoestadopersona integer NOT NULL
);
 %   DROP TABLE public.estadosdepersonas;
       public         heap    postgres    false            �            1259    49587 %   estadosdepersonas_idestadopersona_seq    SEQUENCE     �   CREATE SEQUENCE public.estadosdepersonas_idestadopersona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.estadosdepersonas_idestadopersona_seq;
       public          postgres    false    252            �           0    0 %   estadosdepersonas_idestadopersona_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.estadosdepersonas_idestadopersona_seq OWNED BY public.estadosdepersonas.idestadopersona;
          public          postgres    false    251                       1259    49794    extremidadesanotadoras    TABLE     �   CREATE TABLE public.extremidadesanotadoras (
    idextremidad integer NOT NULL,
    extremidad character varying(30) NOT NULL
);
 *   DROP TABLE public.extremidadesanotadoras;
       public         heap    postgres    false            
           1259    49793 '   extremidadesanotadoras_idextremidad_seq    SEQUENCE     �   CREATE SEQUENCE public.extremidadesanotadoras_idextremidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.extremidadesanotadoras_idextremidad_seq;
       public          postgres    false    267            �           0    0 '   extremidadesanotadoras_idextremidad_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.extremidadesanotadoras_idextremidad_seq OWNED BY public.extremidadesanotadoras.idextremidad;
          public          postgres    false    266                       1259    49892    faltas    TABLE     �   CREATE TABLE public.faltas (
    idfalta integer NOT NULL,
    idtipofalta integer NOT NULL,
    idtipoamonestacion integer NOT NULL,
    idinfractor integer NOT NULL,
    idvictima integer NOT NULL
);
    DROP TABLE public.faltas;
       public         heap    postgres    false                       1259    50032    goles    TABLE     s   CREATE TABLE public.goles (
    idgol integer NOT NULL,
    idremate integer NOT NULL,
    idasistencia integer
);
    DROP TABLE public.goles;
       public         heap    postgres    false            #           1259    66288    golesporextremidaddeneymar    VIEW     �   CREATE VIEW public.golesporextremidaddeneymar AS
SELECT
    NULL::character varying(30) AS extremidad,
    NULL::bigint AS n_veces;
 -   DROP VIEW public.golesporextremidaddeneymar;
       public          postgres    false            �            1259    49313    grupos    TABLE     �   CREATE TABLE public.grupos (
    idgrupo integer NOT NULL,
    nombregrupo character varying(5) NOT NULL,
    idtemporada integer NOT NULL
);
    DROP TABLE public.grupos;
       public         heap    postgres    false            �            1259    49312    grupos_idgrupo_seq    SEQUENCE     �   CREATE SEQUENCE public.grupos_idgrupo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.grupos_idgrupo_seq;
       public          postgres    false    228            �           0    0    grupos_idgrupo_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.grupos_idgrupo_seq OWNED BY public.grupos.idgrupo;
          public          postgres    false    227                       1259    50007    remates    TABLE     �   CREATE TABLE public.remates (
    idremate integer NOT NULL,
    idjugador integer NOT NULL,
    idextremidad integer NOT NULL,
    idtipoejecucion integer NOT NULL
);
    DROP TABLE public.remates;
       public         heap    postgres    false                       1259    66263    historialdegolesporjugador    VIEW       CREATE VIEW public.historialdegolesporjugador AS
 SELECT p.nombre,
    count(*) AS count
   FROM ((public.remates rm
     JOIN public.personas p ON ((p.idpersona = rm.idjugador)))
     JOIN public.goles gol ON ((gol.idremate = rm.idremate)))
  GROUP BY p.nombre;
 -   DROP VIEW public.historialdegolesporjugador;
       public          postgres    false    279    280    279    236    236            �            1259    49234    tiposdeestadospersonas    TABLE     �   CREATE TABLE public.tiposdeestadospersonas (
    idtipoestadopersona integer NOT NULL,
    "descripción" character varying(30) NOT NULL
);
 *   DROP TABLE public.tiposdeestadospersonas;
       public         heap    postgres    false                       1259    66250 $   jugadoresdelpsgquehansidosancionados    VIEW     `  CREATE VIEW public.jugadoresdelpsgquehansidosancionados AS
 SELECT p.nombre
   FROM ((public.contratos c
     JOIN public.personas p ON ((p.idpersona = c.idpersona)))
     JOIN public.estadosdepersonas ep ON ((ep.idpersona = p.idpersona)))
  WHERE ((c.idclub = ( SELECT clubes.idclub
           FROM public.clubes
          WHERE ((clubes.nombreclub)::text = 'París Saint Germain'::text))) AND (ep.idtipoestadopersona = ( SELECT tiposdeestadospersonas.idtipoestadopersona
           FROM public.tiposdeestadospersonas
          WHERE ((tiposdeestadospersonas."descripción")::text = 'Suspendido'::text))));
 7   DROP VIEW public.jugadoresdelpsgquehansidosancionados;
       public          postgres    false    216    216    240    252    240    252    236    236    232    232                       1259    66246    jugadoresqueahorasontecnicos    VIEW     �   CREATE VIEW public.jugadoresqueahorasontecnicos AS
 SELECT DISTINCT p1.nombre
   FROM (public.personas p1
     JOIN public.personas p2 ON (((p1.nombre)::text = (p2.nombre)::text)))
  WHERE (p1.idtipopersona <> p2.idtipopersona);
 /   DROP VIEW public.jugadoresqueahorasontecnicos;
       public          postgres    false    236    236            �            1259    49262    marcaspatroncinadoras    TABLE     �   CREATE TABLE public.marcaspatroncinadoras (
    idmarcapatroncinadora integer NOT NULL,
    nombremarca character varying(30) NOT NULL
);
 )   DROP TABLE public.marcaspatroncinadoras;
       public         heap    postgres    false            �            1259    49261 /   marcaspatroncinadoras_idmarcapatroncinadora_seq    SEQUENCE     �   CREATE SEQUENCE public.marcaspatroncinadoras_idmarcapatroncinadora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.marcaspatroncinadoras_idmarcapatroncinadora_seq;
       public          postgres    false    222            �           0    0 /   marcaspatroncinadoras_idmarcapatroncinadora_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.marcaspatroncinadoras_idmarcapatroncinadora_seq OWNED BY public.marcaspatroncinadoras.idmarcapatroncinadora;
          public          postgres    false    221            �            1259    49539    partidos    TABLE     �  CREATE TABLE public.partidos (
    idpartido integer NOT NULL,
    horafinal time without time zone,
    idlocal integer NOT NULL,
    marcadorlocal integer,
    idvisitante integer NOT NULL,
    marcadorvisitante integer,
    idestadio integer NOT NULL,
    idtipopartido integer NOT NULL,
    fechayhorainicio timestamp without time zone NOT NULL,
    idtipoestadodepartido integer NOT NULL
);
    DROP TABLE public.partidos;
       public         heap    postgres    false            �            1259    49538    partidos_idpartido_seq    SEQUENCE     �   CREATE SEQUENCE public.partidos_idpartido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.partidos_idpartido_seq;
       public          postgres    false    248            �           0    0    partidos_idpartido_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.partidos_idpartido_seq OWNED BY public.partidos.idpartido;
          public          postgres    false    247                       1259    49932    pases    TABLE     �   CREATE TABLE public.pases (
    idpase integer NOT NULL,
    idjugadorejecuta integer NOT NULL,
    idjugadorrecepciona integer
);
    DROP TABLE public.pases;
       public         heap    postgres    false            �            1259    49446    patrociniosporclubes    TABLE     �   CREATE TABLE public.patrociniosporclubes (
    idpatrocinioporclubes integer NOT NULL,
    fechainicio date NOT NULL,
    fechafinal date,
    idmarcapatroncinadora integer NOT NULL,
    idclub integer NOT NULL
);
 (   DROP TABLE public.patrociniosporclubes;
       public         heap    postgres    false            �            1259    49445 .   patrociniosporclubes_idpatrocinioporclubes_seq    SEQUENCE     �   CREATE SEQUENCE public.patrociniosporclubes_idpatrocinioporclubes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.patrociniosporclubes_idpatrocinioporclubes_seq;
       public          postgres    false    238            �           0    0 .   patrociniosporclubes_idpatrocinioporclubes_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.patrociniosporclubes_idpatrocinioporclubes_seq OWNED BY public.patrociniosporclubes.idpatrocinioporclubes;
          public          postgres    false    237                       1259    49876    patrociniosporpersona    TABLE     �   CREATE TABLE public.patrociniosporpersona (
    idpatrocinioporjugador integer NOT NULL,
    fechainicio date NOT NULL,
    fechafinal date,
    idmarcapatroncinadora integer NOT NULL,
    idpersona integer NOT NULL
);
 )   DROP TABLE public.patrociniosporpersona;
       public         heap    postgres    false                       1259    49875 0   patrociniosporpersona_idpatrocinioporjugador_seq    SEQUENCE     �   CREATE SEQUENCE public.patrociniosporpersona_idpatrocinioporjugador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.patrociniosporpersona_idpatrocinioporjugador_seq;
       public          postgres    false    273            �           0    0 0   patrociniosporpersona_idpatrocinioporjugador_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.patrociniosporpersona_idpatrocinioporjugador_seq OWNED BY public.patrociniosporpersona.idpatrocinioporjugador;
          public          postgres    false    272            �            1259    49247    países_idpaís_seq    SEQUENCE     �   CREATE SEQUENCE public."países_idpaís_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."países_idpaís_seq";
       public          postgres    false    218            �           0    0    países_idpaís_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."países_idpaís_seq" OWNED BY public."países"."idpaís";
          public          postgres    false    217            �            1259    49365    personas_idpersona_seq    SEQUENCE     �   CREATE SEQUENCE public.personas_idpersona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.personas_idpersona_seq;
       public          postgres    false    236            �           0    0    personas_idpersona_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.personas_idpersona_seq OWNED BY public.personas.idpersona;
          public          postgres    false    235            �            1259    49213    posicióndejugadores    TABLE     �   CREATE TABLE public."posicióndejugadores" (
    "idposicióndejugador" integer NOT NULL,
    "descripción" character varying(45) NOT NULL
);
 *   DROP TABLE public."posicióndejugadores";
       public         heap    postgres    false            �            1259    49212 -   posicióndejugadores_idposicióndejugador_seq    SEQUENCE     �   CREATE SEQUENCE public."posicióndejugadores_idposicióndejugador_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public."posicióndejugadores_idposicióndejugador_seq";
       public          postgres    false    210            �           0    0 -   posicióndejugadores_idposicióndejugador_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."posicióndejugadores_idposicióndejugador_seq" OWNED BY public."posicióndejugadores"."idposicióndejugador";
          public          postgres    false    209                       1259    50060    posicióndejugadoresenpartido    TABLE     �   CREATE TABLE public."posicióndejugadoresenpartido" (
    "idposicióndejugadorenpartido" integer NOT NULL,
    idjugador integer NOT NULL,
    "idposición" integer NOT NULL,
    idpartido integer NOT NULL,
    idclub integer NOT NULL
);
 3   DROP TABLE public."posicióndejugadoresenpartido";
       public         heap    postgres    false                       1259    50059 ?   posicióndejugadoresenpartido_idposicióndejugadorenpartido_seq    SEQUENCE     �   CREATE SEQUENCE public."posicióndejugadoresenpartido_idposicióndejugadorenpartido_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 X   DROP SEQUENCE public."posicióndejugadoresenpartido_idposicióndejugadorenpartido_seq";
       public          postgres    false    282            �           0    0 ?   posicióndejugadoresenpartido_idposicióndejugadorenpartido_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."posicióndejugadoresenpartido_idposicióndejugadorenpartido_seq" OWNED BY public."posicióndejugadoresenpartido"."idposicióndejugadorenpartido";
          public          postgres    false    281            "           1259    66283    promedioedadporclub    VIEW     c  CREATE VIEW public.promedioedadporclub AS
 SELECT DISTINCT cl.nombreclub,
    avg(EXTRACT(year FROM age((p.fechanacimiento)::timestamp with time zone))) OVER (PARTITION BY con.idclub) AS promedio_edad
   FROM ((public.contratos con
     JOIN public.clubes cl ON ((con.idclub = cl.idclub)))
     JOIN public.personas p ON ((p.idpersona = con.idpersona)));
 &   DROP VIEW public.promedioedadporclub;
       public          postgres    false    236    236    240    240    232    232                       1259    66259    rankingmarcasmaspatrocinadoras    VIEW       CREATE VIEW public.rankingmarcasmaspatrocinadoras AS
 SELECT m.nombremarca,
    count(*) AS c
   FROM (public.patrociniosporpersona p
     JOIN public.marcaspatroncinadoras m ON ((m.idmarcapatroncinadora = p.idmarcapatroncinadora)))
  GROUP BY m.nombremarca
  ORDER BY (count(*)) DESC;
 1   DROP VIEW public.rankingmarcasmaspatrocinadoras;
       public          postgres    false    222    273    222                       1259    49967    sustituciones    TABLE     �   CREATE TABLE public.sustituciones (
    idsustitucion integer NOT NULL,
    idjugadorsustituido integer NOT NULL,
    idjugadorsustituto integer NOT NULL
);
 !   DROP TABLE public.sustituciones;
       public         heap    postgres    false            �            1259    49288 
   temporadas    TABLE     �   CREATE TABLE public.temporadas (
    idtemporada integer NOT NULL,
    nombretemporada character varying(10) NOT NULL,
    fechainicio date NOT NULL,
    fechafinal date,
    CONSTRAINT fechas_validas CHECK ((fechainicio < fechafinal))
);
    DROP TABLE public.temporadas;
       public         heap    postgres    false            �            1259    49287    temporadas_idtemporada_seq    SEQUENCE     �   CREATE SEQUENCE public.temporadas_idtemporada_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.temporadas_idtemporada_seq;
       public          postgres    false    226            �           0    0    temporadas_idtemporada_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.temporadas_idtemporada_seq OWNED BY public.temporadas.idtemporada;
          public          postgres    false    225            �            1259    49255    tipoestadosdepartidos    TABLE     �   CREATE TABLE public.tipoestadosdepartidos (
    idtipoestadodepartido integer NOT NULL,
    nombre character varying(30) NOT NULL
);
 )   DROP TABLE public.tipoestadosdepartidos;
       public         heap    postgres    false            �            1259    49254 /   tipoestadosdepartidos_idtipoestadodepartido_seq    SEQUENCE     �   CREATE SEQUENCE public.tipoestadosdepartidos_idtipoestadodepartido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.tipoestadosdepartidos_idtipoestadodepartido_seq;
       public          postgres    false    220            �           0    0 /   tipoestadosdepartidos_idtipoestadodepartido_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.tipoestadosdepartidos_idtipoestadodepartido_seq OWNED BY public.tipoestadosdepartidos.idtipoestadodepartido;
          public          postgres    false    219            �            1259    49622    tiposacción    TABLE     �   CREATE TABLE public."tiposacción" (
    "idtipoacción" integer NOT NULL,
    "descripción" character varying(100) NOT NULL
);
 "   DROP TABLE public."tiposacción";
       public         heap    postgres    false            �            1259    49621    tiposacción_idtipoacción_seq    SEQUENCE     �   CREATE SEQUENCE public."tiposacción_idtipoacción_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."tiposacción_idtipoacción_seq";
       public          postgres    false    254                        0    0    tiposacción_idtipoacción_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."tiposacción_idtipoacción_seq" OWNED BY public."tiposacción"."idtipoacción";
          public          postgres    false    253                       1259    49725    tiposadicion    TABLE     ~   CREATE TABLE public.tiposadicion (
    idtipoadicion integer NOT NULL,
    tiempodelpartido character varying(30) NOT NULL
);
     DROP TABLE public.tiposadicion;
       public         heap    postgres    false                       1259    49724    tiposadicion_idtipoadicion_seq    SEQUENCE     �   CREATE SEQUENCE public.tiposadicion_idtipoadicion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.tiposadicion_idtipoadicion_seq;
       public          postgres    false    262                       0    0    tiposadicion_idtipoadicion_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.tiposadicion_idtipoadicion_seq OWNED BY public.tiposadicion.idtipoadicion;
          public          postgres    false    261                       1259    49653    tiposamonestacion    TABLE     �   CREATE TABLE public.tiposamonestacion (
    idtipoamonestacion integer NOT NULL,
    "descripción" character varying(100) NOT NULL
);
 %   DROP TABLE public.tiposamonestacion;
       public         heap    postgres    false                       1259    49652 (   tiposamonestacion_idtipoamonestacion_seq    SEQUENCE     �   CREATE SEQUENCE public.tiposamonestacion_idtipoamonestacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.tiposamonestacion_idtipoamonestacion_seq;
       public          postgres    false    260                       0    0 (   tiposamonestacion_idtipoamonestacion_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.tiposamonestacion_idtipoamonestacion_seq OWNED BY public.tiposamonestacion.idtipoamonestacion;
          public          postgres    false    259            	           1259    49767    tiposdeejecucion    TABLE     �   CREATE TABLE public.tiposdeejecucion (
    idtipodeejecucion integer NOT NULL,
    descripcionejecucion character varying(45) NOT NULL
);
 $   DROP TABLE public.tiposdeejecucion;
       public         heap    postgres    false                       1259    49766 &   tiposdeejecucion_idtipodeejecucion_seq    SEQUENCE     �   CREATE SEQUENCE public.tiposdeejecucion_idtipodeejecucion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.tiposdeejecucion_idtipodeejecucion_seq;
       public          postgres    false    265                       0    0 &   tiposdeejecucion_idtipodeejecucion_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.tiposdeejecucion_idtipodeejecucion_seq OWNED BY public.tiposdeejecucion.idtipodeejecucion;
          public          postgres    false    264            �            1259    49233 .   tiposdeestadospersonas_idtipoestadopersona_seq    SEQUENCE     �   CREATE SEQUENCE public.tiposdeestadospersonas_idtipoestadopersona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.tiposdeestadospersonas_idtipoestadopersona_seq;
       public          postgres    false    216                       0    0 .   tiposdeestadospersonas_idtipoestadopersona_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.tiposdeestadospersonas_idtipoestadopersona_seq OWNED BY public.tiposdeestadospersonas.idtipoestadopersona;
          public          postgres    false    215                       1259    49646 
   tiposfalta    TABLE     y   CREATE TABLE public.tiposfalta (
    idtipofalta integer NOT NULL,
    "descripción" character varying(100) NOT NULL
);
    DROP TABLE public.tiposfalta;
       public         heap    postgres    false                       1259    49645    tiposfalta_idtipofalta_seq    SEQUENCE     �   CREATE SEQUENCE public.tiposfalta_idtipofalta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.tiposfalta_idtipofalta_seq;
       public          postgres    false    258                       0    0    tiposfalta_idtipofalta_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.tiposfalta_idtipofalta_seq OWNED BY public.tiposfalta.idtipofalta;
          public          postgres    false    257                       1259    49847    tipospartido    TABLE     t   CREATE TABLE public.tipospartido (
    idtipopartido integer NOT NULL,
    nombre character varying(30) NOT NULL
);
     DROP TABLE public.tipospartido;
       public         heap    postgres    false                       1259    49846    tipospartido_idtipopartido_seq    SEQUENCE     �   CREATE SEQUENCE public.tipospartido_idtipopartido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.tipospartido_idtipopartido_seq;
       public          postgres    false    269                       0    0    tipospartido_idtipopartido_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.tipospartido_idtipopartido_seq OWNED BY public.tipospartido.idtipopartido;
          public          postgres    false    268            �            1259    49227    tipospersonas    TABLE     }   CREATE TABLE public.tipospersonas (
    idtipopersona integer NOT NULL,
    "descripción" character varying(30) NOT NULL
);
 !   DROP TABLE public.tipospersonas;
       public         heap    postgres    false            �            1259    49226    tipospersonas_idtipopersona_seq    SEQUENCE     �   CREATE SEQUENCE public.tipospersonas_idtipopersona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tipospersonas_idtipopersona_seq;
       public          postgres    false    214                       0    0    tipospersonas_idtipopersona_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tipospersonas_idtipopersona_seq OWNED BY public.tipospersonas.idtipopersona;
          public          postgres    false    213            �            1259    49220    tiposÁrbitro    TABLE     �   CREATE TABLE public."tiposÁrbitro" (
    "idtipoÁrbitro" integer NOT NULL,
    "descripción" character varying(45) NOT NULL
);
 #   DROP TABLE public."tiposÁrbitro";
       public         heap    postgres    false            �            1259    49219     tiposÁrbitro_idtipoÁrbitro_seq    SEQUENCE     �   CREATE SEQUENCE public."tiposÁrbitro_idtipoÁrbitro_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."tiposÁrbitro_idtipoÁrbitro_seq";
       public          postgres    false    212                       0    0     tiposÁrbitro_idtipoÁrbitro_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."tiposÁrbitro_idtipoÁrbitro_seq" OWNED BY public."tiposÁrbitro"."idtipoÁrbitro";
          public          postgres    false    211            �            1259    49566    tipoÁrbitroenpartido    TABLE     �   CREATE TABLE public."tipoÁrbitroenpartido" (
    "idtipoÁrbitroenpartido" integer NOT NULL,
    "idÁrbitro" integer NOT NULL,
    "idtipoÁrbitro" integer NOT NULL,
    idpartido integer NOT NULL
);
 +   DROP TABLE public."tipoÁrbitroenpartido";
       public         heap    postgres    false            �            1259    49565 1   tipoÁrbitroenpartido_idtipoÁrbitroenpartido_seq    SEQUENCE     �   CREATE SEQUENCE public."tipoÁrbitroenpartido_idtipoÁrbitroenpartido_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public."tipoÁrbitroenpartido_idtipoÁrbitroenpartido_seq";
       public          postgres    false    250            	           0    0 1   tipoÁrbitroenpartido_idtipoÁrbitroenpartido_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."tipoÁrbitroenpartido_idtipoÁrbitroenpartido_seq" OWNED BY public."tipoÁrbitroenpartido"."idtipoÁrbitroenpartido";
          public          postgres    false    249            �            1259    49269 	   Árbitros    TABLE     �   CREATE TABLE public."Árbitros" (
    "idÁrbitro" integer NOT NULL,
    nombre character varying(40) NOT NULL,
    "númerolicenciaÁrbitro" character varying(40) NOT NULL,
    idpaisprocedencia integer NOT NULL
);
    DROP TABLE public."Árbitros";
       public         heap    postgres    false            �            1259    49268    Árbitros_idÁrbitro_seq    SEQUENCE     �   CREATE SEQUENCE public."Árbitros_idÁrbitro_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Árbitros_idÁrbitro_seq";
       public          postgres    false    224            
           0    0    Árbitros_idÁrbitro_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Árbitros_idÁrbitro_seq" OWNED BY public."Árbitros"."idÁrbitro";
          public          postgres    false    223            m           2604    49632    acciones idacción    DEFAULT     |   ALTER TABLE ONLY public.acciones ALTER COLUMN "idacción" SET DEFAULT nextval('public."acciones_idacción_seq"'::regclass);
 C   ALTER TABLE public.acciones ALTER COLUMN "idacción" DROP DEFAULT;
       public          postgres    false    256    255    256            `           2604    49328    ciudades idciudad    DEFAULT     v   ALTER TABLE ONLY public.ciudades ALTER COLUMN idciudad SET DEFAULT nextval('public.ciudades_idciudad_seq'::regclass);
 @   ALTER TABLE public.ciudades ALTER COLUMN idciudad DROP DEFAULT;
       public          postgres    false    230    229    230            a           2604    49340    clubes idclub    DEFAULT     n   ALTER TABLE ONLY public.clubes ALTER COLUMN idclub SET DEFAULT nextval('public.clubes_idclub_seq'::regclass);
 <   ALTER TABLE public.clubes ALTER COLUMN idclub DROP DEFAULT;
       public          postgres    false    231    232    232            b           2604    49352 3   clubesengrupoportemporada idclubengrupoportemporada    DEFAULT     �   ALTER TABLE ONLY public.clubesengrupoportemporada ALTER COLUMN idclubengrupoportemporada SET DEFAULT nextval('public.clubesengrupoportemporada_idclubengrupoportemporada_seq'::regclass);
 b   ALTER TABLE public.clubesengrupoportemporada ALTER COLUMN idclubengrupoportemporada DROP DEFAULT;
       public          postgres    false    233    234    234            e           2604    49467    contratos idcontrato    DEFAULT     |   ALTER TABLE ONLY public.contratos ALTER COLUMN idcontrato SET DEFAULT nextval('public.contratos_idcontrato_seq'::regclass);
 C   ALTER TABLE public.contratos ALTER COLUMN idcontrato DROP DEFAULT;
       public          postgres    false    240    239    240            t           2604    49862 '   entrenadoresenclubes identrenadorenclub    DEFAULT     �   ALTER TABLE ONLY public.entrenadoresenclubes ALTER COLUMN identrenadorenclub SET DEFAULT nextval('public.entrenadoresenclubes_identrenadorenclub_seq'::regclass);
 V   ALTER TABLE public.entrenadoresenclubes ALTER COLUMN identrenadorenclub DROP DEFAULT;
       public          postgres    false    271    270    271            f           2604    49501    estadios idestadio    DEFAULT     x   ALTER TABLE ONLY public.estadios ALTER COLUMN idestadio SET DEFAULT nextval('public.estadios_idestadio_seq'::regclass);
 A   ALTER TABLE public.estadios ALTER COLUMN idestadio DROP DEFAULT;
       public          postgres    false    242    241    242            g           2604    49513 !   estadiosdeclubes idestadiodeclube    DEFAULT     �   ALTER TABLE ONLY public.estadiosdeclubes ALTER COLUMN idestadiodeclube SET DEFAULT nextval('public.estadiosdeclubes_idestadiodeclube_seq'::regclass);
 P   ALTER TABLE public.estadiosdeclubes ALTER COLUMN idestadiodeclube DROP DEFAULT;
       public          postgres    false    243    244    244            h           2604    49530 -   estadiosdeshabilitados idestadiodeshabilitado    DEFAULT     �   ALTER TABLE ONLY public.estadiosdeshabilitados ALTER COLUMN idestadiodeshabilitado SET DEFAULT nextval('public.estadiosdeshabilitados_idestadiodeshabilitado_seq'::regclass);
 \   ALTER TABLE public.estadiosdeshabilitados ALTER COLUMN idestadiodeshabilitado DROP DEFAULT;
       public          postgres    false    245    246    246            k           2604    49591 !   estadosdepersonas idestadopersona    DEFAULT     �   ALTER TABLE ONLY public.estadosdepersonas ALTER COLUMN idestadopersona SET DEFAULT nextval('public.estadosdepersonas_idestadopersona_seq'::regclass);
 P   ALTER TABLE public.estadosdepersonas ALTER COLUMN idestadopersona DROP DEFAULT;
       public          postgres    false    251    252    252            r           2604    49797 #   extremidadesanotadoras idextremidad    DEFAULT     �   ALTER TABLE ONLY public.extremidadesanotadoras ALTER COLUMN idextremidad SET DEFAULT nextval('public.extremidadesanotadoras_idextremidad_seq'::regclass);
 R   ALTER TABLE public.extremidadesanotadoras ALTER COLUMN idextremidad DROP DEFAULT;
       public          postgres    false    267    266    267            _           2604    49316    grupos idgrupo    DEFAULT     p   ALTER TABLE ONLY public.grupos ALTER COLUMN idgrupo SET DEFAULT nextval('public.grupos_idgrupo_seq'::regclass);
 =   ALTER TABLE public.grupos ALTER COLUMN idgrupo DROP DEFAULT;
       public          postgres    false    228    227    228            [           2604    49265 +   marcaspatroncinadoras idmarcapatroncinadora    DEFAULT     �   ALTER TABLE ONLY public.marcaspatroncinadoras ALTER COLUMN idmarcapatroncinadora SET DEFAULT nextval('public.marcaspatroncinadoras_idmarcapatroncinadora_seq'::regclass);
 Z   ALTER TABLE public.marcaspatroncinadoras ALTER COLUMN idmarcapatroncinadora DROP DEFAULT;
       public          postgres    false    221    222    222            i           2604    49542    partidos idpartido    DEFAULT     x   ALTER TABLE ONLY public.partidos ALTER COLUMN idpartido SET DEFAULT nextval('public.partidos_idpartido_seq'::regclass);
 A   ALTER TABLE public.partidos ALTER COLUMN idpartido DROP DEFAULT;
       public          postgres    false    247    248    248            d           2604    49449 *   patrociniosporclubes idpatrocinioporclubes    DEFAULT     �   ALTER TABLE ONLY public.patrociniosporclubes ALTER COLUMN idpatrocinioporclubes SET DEFAULT nextval('public.patrociniosporclubes_idpatrocinioporclubes_seq'::regclass);
 Y   ALTER TABLE public.patrociniosporclubes ALTER COLUMN idpatrocinioporclubes DROP DEFAULT;
       public          postgres    false    238    237    238            u           2604    49879 ,   patrociniosporpersona idpatrocinioporjugador    DEFAULT     �   ALTER TABLE ONLY public.patrociniosporpersona ALTER COLUMN idpatrocinioporjugador SET DEFAULT nextval('public.patrociniosporpersona_idpatrocinioporjugador_seq'::regclass);
 [   ALTER TABLE public.patrociniosporpersona ALTER COLUMN idpatrocinioporjugador DROP DEFAULT;
       public          postgres    false    272    273    273            Y           2604    49251    países idpaís    DEFAULT     x   ALTER TABLE ONLY public."países" ALTER COLUMN "idpaís" SET DEFAULT nextval('public."países_idpaís_seq"'::regclass);
 B   ALTER TABLE public."países" ALTER COLUMN "idpaís" DROP DEFAULT;
       public          postgres    false    218    217    218            c           2604    49369    personas idpersona    DEFAULT     x   ALTER TABLE ONLY public.personas ALTER COLUMN idpersona SET DEFAULT nextval('public.personas_idpersona_seq'::regclass);
 A   ALTER TABLE public.personas ALTER COLUMN idpersona DROP DEFAULT;
       public          postgres    false    236    235    236            U           2604    49216 )   posicióndejugadores idposicióndejugador    DEFAULT     �   ALTER TABLE ONLY public."posicióndejugadores" ALTER COLUMN "idposicióndejugador" SET DEFAULT nextval('public."posicióndejugadores_idposicióndejugador_seq"'::regclass);
 \   ALTER TABLE public."posicióndejugadores" ALTER COLUMN "idposicióndejugador" DROP DEFAULT;
       public          postgres    false    209    210    210            v           2604    50063 ;   posicióndejugadoresenpartido idposicióndejugadorenpartido    DEFAULT     �   ALTER TABLE ONLY public."posicióndejugadoresenpartido" ALTER COLUMN "idposicióndejugadorenpartido" SET DEFAULT nextval('public."posicióndejugadoresenpartido_idposicióndejugadorenpartido_seq"'::regclass);
 n   ALTER TABLE public."posicióndejugadoresenpartido" ALTER COLUMN "idposicióndejugadorenpartido" DROP DEFAULT;
       public          postgres    false    282    281    282            ]           2604    49291    temporadas idtemporada    DEFAULT     �   ALTER TABLE ONLY public.temporadas ALTER COLUMN idtemporada SET DEFAULT nextval('public.temporadas_idtemporada_seq'::regclass);
 E   ALTER TABLE public.temporadas ALTER COLUMN idtemporada DROP DEFAULT;
       public          postgres    false    225    226    226            Z           2604    49258 +   tipoestadosdepartidos idtipoestadodepartido    DEFAULT     �   ALTER TABLE ONLY public.tipoestadosdepartidos ALTER COLUMN idtipoestadodepartido SET DEFAULT nextval('public.tipoestadosdepartidos_idtipoestadodepartido_seq'::regclass);
 Z   ALTER TABLE public.tipoestadosdepartidos ALTER COLUMN idtipoestadodepartido DROP DEFAULT;
       public          postgres    false    219    220    220            l           2604    49625    tiposacción idtipoacción    DEFAULT     �   ALTER TABLE ONLY public."tiposacción" ALTER COLUMN "idtipoacción" SET DEFAULT nextval('public."tiposacción_idtipoacción_seq"'::regclass);
 M   ALTER TABLE public."tiposacción" ALTER COLUMN "idtipoacción" DROP DEFAULT;
       public          postgres    false    253    254    254            p           2604    49728    tiposadicion idtipoadicion    DEFAULT     �   ALTER TABLE ONLY public.tiposadicion ALTER COLUMN idtipoadicion SET DEFAULT nextval('public.tiposadicion_idtipoadicion_seq'::regclass);
 I   ALTER TABLE public.tiposadicion ALTER COLUMN idtipoadicion DROP DEFAULT;
       public          postgres    false    261    262    262            o           2604    49656 $   tiposamonestacion idtipoamonestacion    DEFAULT     �   ALTER TABLE ONLY public.tiposamonestacion ALTER COLUMN idtipoamonestacion SET DEFAULT nextval('public.tiposamonestacion_idtipoamonestacion_seq'::regclass);
 S   ALTER TABLE public.tiposamonestacion ALTER COLUMN idtipoamonestacion DROP DEFAULT;
       public          postgres    false    260    259    260            q           2604    49770 "   tiposdeejecucion idtipodeejecucion    DEFAULT     �   ALTER TABLE ONLY public.tiposdeejecucion ALTER COLUMN idtipodeejecucion SET DEFAULT nextval('public.tiposdeejecucion_idtipodeejecucion_seq'::regclass);
 Q   ALTER TABLE public.tiposdeejecucion ALTER COLUMN idtipodeejecucion DROP DEFAULT;
       public          postgres    false    264    265    265            X           2604    49237 *   tiposdeestadospersonas idtipoestadopersona    DEFAULT     �   ALTER TABLE ONLY public.tiposdeestadospersonas ALTER COLUMN idtipoestadopersona SET DEFAULT nextval('public.tiposdeestadospersonas_idtipoestadopersona_seq'::regclass);
 Y   ALTER TABLE public.tiposdeestadospersonas ALTER COLUMN idtipoestadopersona DROP DEFAULT;
       public          postgres    false    216    215    216            n           2604    49649    tiposfalta idtipofalta    DEFAULT     �   ALTER TABLE ONLY public.tiposfalta ALTER COLUMN idtipofalta SET DEFAULT nextval('public.tiposfalta_idtipofalta_seq'::regclass);
 E   ALTER TABLE public.tiposfalta ALTER COLUMN idtipofalta DROP DEFAULT;
       public          postgres    false    257    258    258            s           2604    49850    tipospartido idtipopartido    DEFAULT     �   ALTER TABLE ONLY public.tipospartido ALTER COLUMN idtipopartido SET DEFAULT nextval('public.tipospartido_idtipopartido_seq'::regclass);
 I   ALTER TABLE public.tipospartido ALTER COLUMN idtipopartido DROP DEFAULT;
       public          postgres    false    268    269    269            W           2604    49230    tipospersonas idtipopersona    DEFAULT     �   ALTER TABLE ONLY public.tipospersonas ALTER COLUMN idtipopersona SET DEFAULT nextval('public.tipospersonas_idtipopersona_seq'::regclass);
 J   ALTER TABLE public.tipospersonas ALTER COLUMN idtipopersona DROP DEFAULT;
       public          postgres    false    214    213    214            V           2604    49223    tiposÁrbitro idtipoÁrbitro    DEFAULT     �   ALTER TABLE ONLY public."tiposÁrbitro" ALTER COLUMN "idtipoÁrbitro" SET DEFAULT nextval('public."tiposÁrbitro_idtipoÁrbitro_seq"'::regclass);
 O   ALTER TABLE public."tiposÁrbitro" ALTER COLUMN "idtipoÁrbitro" DROP DEFAULT;
       public          postgres    false    211    212    212            j           2604    49569 -   tipoÁrbitroenpartido idtipoÁrbitroenpartido    DEFAULT     �   ALTER TABLE ONLY public."tipoÁrbitroenpartido" ALTER COLUMN "idtipoÁrbitroenpartido" SET DEFAULT nextval('public."tipoÁrbitroenpartido_idtipoÁrbitroenpartido_seq"'::regclass);
 `   ALTER TABLE public."tipoÁrbitroenpartido" ALTER COLUMN "idtipoÁrbitroenpartido" DROP DEFAULT;
       public          postgres    false    250    249    250            \           2604    49272    Árbitros idÁrbitro    DEFAULT     �   ALTER TABLE ONLY public."Árbitros" ALTER COLUMN "idÁrbitro" SET DEFAULT nextval('public."Árbitros_idÁrbitro_seq"'::regclass);
 G   ALTER TABLE public."Árbitros" ALTER COLUMN "idÁrbitro" DROP DEFAULT;
       public          postgres    false    224    223    224            �          0    49629    acciones 
   TABLE DATA           S   COPY public.acciones ("idacción", minuto, idpartido, "idtipoacción") FROM stdin;
    public          postgres    false    256   �G      �          0    49731 	   adiciones 
   TABLE DATA           =   COPY public.adiciones (idadicion, idtipoadicion) FROM stdin;
    public          postgres    false    263   K      �          0    49987    asistencias 
   TABLE DATA           Q   COPY public.asistencias (idasistencia, idjugador, idtipodeejecucion) FROM stdin;
    public          postgres    false    278   JK      �          0    49952    atajadas 
   TABLE DATA           8   COPY public.atajadas (idatajada, idportero) FROM stdin;
    public          postgres    false    276   �K      �          0    49325    ciudades 
   TABLE DATA           ?   COPY public.ciudades (idciudad, nombre, "idpaís") FROM stdin;
    public          postgres    false    230   L      �          0    49337    clubes 
   TABLE DATA           >   COPY public.clubes (idclub, nombreclub, idciudad) FROM stdin;
    public          postgres    false    232   9O      �          0    49349    clubesengrupoportemporada 
   TABLE DATA           _   COPY public.clubesengrupoportemporada (idclubengrupoportemporada, idclub, idgrupo) FROM stdin;
    public          postgres    false    234   �P      �          0    49464 	   contratos 
   TABLE DATA           [   COPY public.contratos (idcontrato, fechainicio, fechafinal, idpersona, idclub) FROM stdin;
    public          postgres    false    240   �Q      �          0    49859    entrenadoresenclubes 
   TABLE DATA           �   COPY public.entrenadoresenclubes (identrenadorenclub, fechavinculacion, "fechadesvinculación", idclub, identrenador) FROM stdin;
    public          postgres    false    271   vR      �          0    49498    estadios 
   TABLE DATA           O   COPY public.estadios (idestadio, capacidadaforo, idciudad, nombre) FROM stdin;
    public          postgres    false    242   �S      �          0    49510    estadiosdeclubes 
   TABLE DATA           h   COPY public.estadiosdeclubes (idestadiodeclube, fechainicio, fechafinal, idclub, idestadio) FROM stdin;
    public          postgres    false    244   qT      �          0    49527    estadiosdeshabilitados 
   TABLE DATA           t   COPY public.estadiosdeshabilitados (idestadiodeshabilitado, fechainicio, fechafinal, motivo, idestadio) FROM stdin;
    public          postgres    false    246   �T      �          0    49588    estadosdepersonas 
   TABLE DATA           �   COPY public.estadosdepersonas (idestadopersona, fechainicioestado, fechafinalestado, idpersona, idtipoestadopersona) FROM stdin;
    public          postgres    false    252   :U      �          0    49794    extremidadesanotadoras 
   TABLE DATA           J   COPY public.extremidadesanotadoras (idextremidad, extremidad) FROM stdin;
    public          postgres    false    267   �U      �          0    49892    faltas 
   TABLE DATA           b   COPY public.faltas (idfalta, idtipofalta, idtipoamonestacion, idinfractor, idvictima) FROM stdin;
    public          postgres    false    274   �U      �          0    50032    goles 
   TABLE DATA           >   COPY public.goles (idgol, idremate, idasistencia) FROM stdin;
    public          postgres    false    280   �U      �          0    49313    grupos 
   TABLE DATA           C   COPY public.grupos (idgrupo, nombregrupo, idtemporada) FROM stdin;
    public          postgres    false    228   OV      �          0    49262    marcaspatroncinadoras 
   TABLE DATA           S   COPY public.marcaspatroncinadoras (idmarcapatroncinadora, nombremarca) FROM stdin;
    public          postgres    false    222   �V      �          0    49539    partidos 
   TABLE DATA           �   COPY public.partidos (idpartido, horafinal, idlocal, marcadorlocal, idvisitante, marcadorvisitante, idestadio, idtipopartido, fechayhorainicio, idtipoestadodepartido) FROM stdin;
    public          postgres    false    248   lW      �          0    49932    pases 
   TABLE DATA           N   COPY public.pases (idpase, idjugadorejecuta, idjugadorrecepciona) FROM stdin;
    public          postgres    false    275   -X      �          0    49446    patrociniosporclubes 
   TABLE DATA           }   COPY public.patrociniosporclubes (idpatrocinioporclubes, fechainicio, fechafinal, idmarcapatroncinadora, idclub) FROM stdin;
    public          postgres    false    238   PY      �          0    49876    patrociniosporpersona 
   TABLE DATA           �   COPY public.patrociniosporpersona (idpatrocinioporjugador, fechainicio, fechafinal, idmarcapatroncinadora, idpersona) FROM stdin;
    public          postgres    false    273   mY      �          0    49248    países 
   TABLE DATA           6   COPY public."países" ("idpaís", nombre) FROM stdin;
    public          postgres    false    218   �Y      �          0    49366    personas 
   TABLE DATA           �   COPY public.personas (idpersona, nombre, fechanacimiento, fechadedebut, "idpaísprocedencia", idciudadnacimiento, idtipopersona, fecharetiro) FROM stdin;
    public          postgres    false    236   �Z      �          0    49213    posicióndejugadores 
   TABLE DATA           X   COPY public."posicióndejugadores" ("idposicióndejugador", "descripción") FROM stdin;
    public          postgres    false    210   �a      �          0    50060    posicióndejugadoresenpartido 
   TABLE DATA           �   COPY public."posicióndejugadoresenpartido" ("idposicióndejugadorenpartido", idjugador, "idposición", idpartido, idclub) FROM stdin;
    public          postgres    false    282   %b      �          0    50007    remates 
   TABLE DATA           U   COPY public.remates (idremate, idjugador, idextremidad, idtipoejecucion) FROM stdin;
    public          postgres    false    279   c      �          0    49967    sustituciones 
   TABLE DATA           _   COPY public.sustituciones (idsustitucion, idjugadorsustituido, idjugadorsustituto) FROM stdin;
    public          postgres    false    277   �c      �          0    49288 
   temporadas 
   TABLE DATA           [   COPY public.temporadas (idtemporada, nombretemporada, fechainicio, fechafinal) FROM stdin;
    public          postgres    false    226   .d      �          0    49255    tipoestadosdepartidos 
   TABLE DATA           N   COPY public.tipoestadosdepartidos (idtipoestadodepartido, nombre) FROM stdin;
    public          postgres    false    220   kd      �          0    49622    tiposacción 
   TABLE DATA           I   COPY public."tiposacción" ("idtipoacción", "descripción") FROM stdin;
    public          postgres    false    254   �d      �          0    49725    tiposadicion 
   TABLE DATA           G   COPY public.tiposadicion (idtipoadicion, tiempodelpartido) FROM stdin;
    public          postgres    false    262   e      �          0    49653    tiposamonestacion 
   TABLE DATA           O   COPY public.tiposamonestacion (idtipoamonestacion, "descripción") FROM stdin;
    public          postgres    false    260   Ue      �          0    49767    tiposdeejecucion 
   TABLE DATA           S   COPY public.tiposdeejecucion (idtipodeejecucion, descripcionejecucion) FROM stdin;
    public          postgres    false    265   �e      �          0    49234    tiposdeestadospersonas 
   TABLE DATA           U   COPY public.tiposdeestadospersonas (idtipoestadopersona, "descripción") FROM stdin;
    public          postgres    false    216   �e      �          0    49646 
   tiposfalta 
   TABLE DATA           A   COPY public.tiposfalta (idtipofalta, "descripción") FROM stdin;
    public          postgres    false    258   
f      �          0    49847    tipospartido 
   TABLE DATA           =   COPY public.tipospartido (idtipopartido, nombre) FROM stdin;
    public          postgres    false    269   �f      �          0    49227    tipospersonas 
   TABLE DATA           F   COPY public.tipospersonas (idtipopersona, "descripción") FROM stdin;
    public          postgres    false    214   �f      �          0    49220    tiposÁrbitro 
   TABLE DATA           K   COPY public."tiposÁrbitro" ("idtipoÁrbitro", "descripción") FROM stdin;
    public          postgres    false    212   	g      �          0    49566    tipoÁrbitroenpartido 
   TABLE DATA           w   COPY public."tipoÁrbitroenpartido" ("idtipoÁrbitroenpartido", "idÁrbitro", "idtipoÁrbitro", idpartido) FROM stdin;
    public          postgres    false    250   Vg      �          0    49269 	   Árbitros 
   TABLE DATA           i   COPY public."Árbitros" ("idÁrbitro", nombre, "númerolicenciaÁrbitro", idpaisprocedencia) FROM stdin;
    public          postgres    false    224   �g                 0    0    acciones_idacción_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."acciones_idacción_seq"', 1, false);
          public          postgres    false    255                       0    0    ciudades_idciudad_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.ciudades_idciudad_seq', 34, true);
          public          postgres    false    229                       0    0    clubes_idclub_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.clubes_idclub_seq', 1, false);
          public          postgres    false    231                       0    0 7   clubesengrupoportemporada_idclubengrupoportemporada_seq    SEQUENCE SET     f   SELECT pg_catalog.setval('public.clubesengrupoportemporada_idclubengrupoportemporada_seq', 1, false);
          public          postgres    false    233                       0    0    contratos_idcontrato_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.contratos_idcontrato_seq', 1, false);
          public          postgres    false    239                       0    0 +   entrenadoresenclubes_identrenadorenclub_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.entrenadoresenclubes_identrenadorenclub_seq', 1, false);
          public          postgres    false    270                       0    0    estadios_idestadio_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.estadios_idestadio_seq', 8, true);
          public          postgres    false    241                       0    0 %   estadiosdeclubes_idestadiodeclube_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.estadiosdeclubes_idestadiodeclube_seq', 1, false);
          public          postgres    false    243                       0    0 1   estadiosdeshabilitados_idestadiodeshabilitado_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.estadiosdeshabilitados_idestadiodeshabilitado_seq', 1, false);
          public          postgres    false    245                       0    0 %   estadosdepersonas_idestadopersona_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.estadosdepersonas_idestadopersona_seq', 1, false);
          public          postgres    false    251                       0    0 '   extremidadesanotadoras_idextremidad_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.extremidadesanotadoras_idextremidad_seq', 4, true);
          public          postgres    false    266                       0    0    grupos_idgrupo_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.grupos_idgrupo_seq', 1, false);
          public          postgres    false    227                       0    0 /   marcaspatroncinadoras_idmarcapatroncinadora_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.marcaspatroncinadoras_idmarcapatroncinadora_seq', 19, true);
          public          postgres    false    221                       0    0    partidos_idpartido_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.partidos_idpartido_seq', 1, false);
          public          postgres    false    247                       0    0 .   patrociniosporclubes_idpatrocinioporclubes_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.patrociniosporclubes_idpatrocinioporclubes_seq', 1, false);
          public          postgres    false    237                       0    0 0   patrociniosporpersona_idpatrocinioporjugador_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.patrociniosporpersona_idpatrocinioporjugador_seq', 1, false);
          public          postgres    false    272                       0    0    países_idpaís_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."países_idpaís_seq"', 16, true);
          public          postgres    false    217                       0    0    personas_idpersona_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.personas_idpersona_seq', 1, false);
          public          postgres    false    235                       0    0 -   posicióndejugadores_idposicióndejugador_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public."posicióndejugadores_idposicióndejugador_seq"', 1, false);
          public          postgres    false    209                       0    0 ?   posicióndejugadoresenpartido_idposicióndejugadorenpartido_seq    SEQUENCE SET     p   SELECT pg_catalog.setval('public."posicióndejugadoresenpartido_idposicióndejugadorenpartido_seq"', 1, false);
          public          postgres    false    281                       0    0    temporadas_idtemporada_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.temporadas_idtemporada_seq', 1, false);
          public          postgres    false    225                        0    0 /   tipoestadosdepartidos_idtipoestadodepartido_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.tipoestadosdepartidos_idtipoestadodepartido_seq', 3, true);
          public          postgres    false    219            !           0    0    tiposacción_idtipoacción_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public."tiposacción_idtipoacción_seq"', 8, true);
          public          postgres    false    253            "           0    0    tiposadicion_idtipoadicion_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.tiposadicion_idtipoadicion_seq', 4, true);
          public          postgres    false    261            #           0    0 (   tiposamonestacion_idtipoamonestacion_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.tiposamonestacion_idtipoamonestacion_seq', 2, true);
          public          postgres    false    259            $           0    0 &   tiposdeejecucion_idtipodeejecucion_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.tiposdeejecucion_idtipodeejecucion_seq', 5, true);
          public          postgres    false    264            %           0    0 .   tiposdeestadospersonas_idtipoestadopersona_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.tiposdeestadospersonas_idtipoestadopersona_seq', 2, true);
          public          postgres    false    215            &           0    0    tiposfalta_idtipofalta_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.tiposfalta_idtipofalta_seq', 7, true);
          public          postgres    false    257            '           0    0    tipospartido_idtipopartido_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.tipospartido_idtipopartido_seq', 5, true);
          public          postgres    false    268            (           0    0    tipospersonas_idtipopersona_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tipospersonas_idtipopersona_seq', 2, true);
          public          postgres    false    213            )           0    0     tiposÁrbitro_idtipoÁrbitro_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."tiposÁrbitro_idtipoÁrbitro_seq"', 4, true);
          public          postgres    false    211            *           0    0 1   tipoÁrbitroenpartido_idtipoÁrbitroenpartido_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public."tipoÁrbitroenpartido_idtipoÁrbitroenpartido_seq"', 1, false);
          public          postgres    false    249            +           0    0    Árbitros_idÁrbitro_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Árbitros_idÁrbitro_seq"', 1, false);
          public          postgres    false    223            �           2606    49634    acciones acciones_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.acciones
    ADD CONSTRAINT acciones_pkey PRIMARY KEY ("idacción");
 @   ALTER TABLE ONLY public.acciones DROP CONSTRAINT acciones_pkey;
       public            postgres    false    256            �           2606    49735    adiciones adiciones_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.adiciones
    ADD CONSTRAINT adiciones_pkey PRIMARY KEY (idadicion);
 B   ALTER TABLE ONLY public.adiciones DROP CONSTRAINT adiciones_pkey;
       public            postgres    false    263            �           2606    49991    asistencias asistencias_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.asistencias
    ADD CONSTRAINT asistencias_pkey PRIMARY KEY (idasistencia);
 F   ALTER TABLE ONLY public.asistencias DROP CONSTRAINT asistencias_pkey;
       public            postgres    false    278            �           2606    49956    atajadas atajadas_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.atajadas
    ADD CONSTRAINT atajadas_pkey PRIMARY KEY (idatajada);
 @   ALTER TABLE ONLY public.atajadas DROP CONSTRAINT atajadas_pkey;
       public            postgres    false    276            �           2606    49330    ciudades ciudades_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (idciudad);
 @   ALTER TABLE ONLY public.ciudades DROP CONSTRAINT ciudades_pkey;
       public            postgres    false    230            �           2606    49342    clubes clubes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clubes
    ADD CONSTRAINT clubes_pkey PRIMARY KEY (idclub);
 <   ALTER TABLE ONLY public.clubes DROP CONSTRAINT clubes_pkey;
       public            postgres    false    232            �           2606    49354 8   clubesengrupoportemporada clubesengrupoportemporada_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.clubesengrupoportemporada
    ADD CONSTRAINT clubesengrupoportemporada_pkey PRIMARY KEY (idclubengrupoportemporada);
 b   ALTER TABLE ONLY public.clubesengrupoportemporada DROP CONSTRAINT clubesengrupoportemporada_pkey;
       public            postgres    false    234            �           2606    49469    contratos contratos_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.contratos
    ADD CONSTRAINT contratos_pkey PRIMARY KEY (idcontrato);
 B   ALTER TABLE ONLY public.contratos DROP CONSTRAINT contratos_pkey;
       public            postgres    false    240            �           2606    49864 .   entrenadoresenclubes entrenadoresenclubes_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.entrenadoresenclubes
    ADD CONSTRAINT entrenadoresenclubes_pkey PRIMARY KEY (identrenadorenclub);
 X   ALTER TABLE ONLY public.entrenadoresenclubes DROP CONSTRAINT entrenadoresenclubes_pkey;
       public            postgres    false    271            �           2606    49503    estadios estadios_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.estadios
    ADD CONSTRAINT estadios_pkey PRIMARY KEY (idestadio);
 @   ALTER TABLE ONLY public.estadios DROP CONSTRAINT estadios_pkey;
       public            postgres    false    242            �           2606    49515 &   estadiosdeclubes estadiosdeclubes_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.estadiosdeclubes
    ADD CONSTRAINT estadiosdeclubes_pkey PRIMARY KEY (idestadiodeclube);
 P   ALTER TABLE ONLY public.estadiosdeclubes DROP CONSTRAINT estadiosdeclubes_pkey;
       public            postgres    false    244            �           2606    49532 2   estadiosdeshabilitados estadiosdeshabilitados_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.estadiosdeshabilitados
    ADD CONSTRAINT estadiosdeshabilitados_pkey PRIMARY KEY (idestadiodeshabilitado);
 \   ALTER TABLE ONLY public.estadiosdeshabilitados DROP CONSTRAINT estadiosdeshabilitados_pkey;
       public            postgres    false    246            �           2606    49593 (   estadosdepersonas estadosdepersonas_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.estadosdepersonas
    ADD CONSTRAINT estadosdepersonas_pkey PRIMARY KEY (idestadopersona);
 R   ALTER TABLE ONLY public.estadosdepersonas DROP CONSTRAINT estadosdepersonas_pkey;
       public            postgres    false    252            �           2606    49799 2   extremidadesanotadoras extremidadesanotadoras_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.extremidadesanotadoras
    ADD CONSTRAINT extremidadesanotadoras_pkey PRIMARY KEY (idextremidad);
 \   ALTER TABLE ONLY public.extremidadesanotadoras DROP CONSTRAINT extremidadesanotadoras_pkey;
       public            postgres    false    267            �           2606    49896    faltas faltas_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.faltas
    ADD CONSTRAINT faltas_pkey PRIMARY KEY (idfalta);
 <   ALTER TABLE ONLY public.faltas DROP CONSTRAINT faltas_pkey;
       public            postgres    false    274            �           2606    50036    goles goles_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.goles
    ADD CONSTRAINT goles_pkey PRIMARY KEY (idgol);
 :   ALTER TABLE ONLY public.goles DROP CONSTRAINT goles_pkey;
       public            postgres    false    280            �           2606    49318    grupos grupos_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (idgrupo);
 <   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_pkey;
       public            postgres    false    228            �           2606    49267 0   marcaspatroncinadoras marcaspatroncinadoras_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.marcaspatroncinadoras
    ADD CONSTRAINT marcaspatroncinadoras_pkey PRIMARY KEY (idmarcapatroncinadora);
 Z   ALTER TABLE ONLY public.marcaspatroncinadoras DROP CONSTRAINT marcaspatroncinadoras_pkey;
       public            postgres    false    222            �           2606    49544    partidos partidos_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.partidos
    ADD CONSTRAINT partidos_pkey PRIMARY KEY (idpartido);
 @   ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_pkey;
       public            postgres    false    248            �           2606    49936    pases pases_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.pases
    ADD CONSTRAINT pases_pkey PRIMARY KEY (idpase);
 :   ALTER TABLE ONLY public.pases DROP CONSTRAINT pases_pkey;
       public            postgres    false    275            �           2606    49451 .   patrociniosporclubes patrociniosporclubes_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.patrociniosporclubes
    ADD CONSTRAINT patrociniosporclubes_pkey PRIMARY KEY (idpatrocinioporclubes);
 X   ALTER TABLE ONLY public.patrociniosporclubes DROP CONSTRAINT patrociniosporclubes_pkey;
       public            postgres    false    238            �           2606    49881 0   patrociniosporpersona patrociniosporpersona_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.patrociniosporpersona
    ADD CONSTRAINT patrociniosporpersona_pkey PRIMARY KEY (idpatrocinioporjugador);
 Z   ALTER TABLE ONLY public.patrociniosporpersona DROP CONSTRAINT patrociniosporpersona_pkey;
       public            postgres    false    273            �           2606    49253    países países_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."países"
    ADD CONSTRAINT "países_pkey" PRIMARY KEY ("idpaís");
 B   ALTER TABLE ONLY public."países" DROP CONSTRAINT "países_pkey";
       public            postgres    false    218            �           2606    49371    personas personas_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (idpersona);
 @   ALTER TABLE ONLY public.personas DROP CONSTRAINT personas_pkey;
       public            postgres    false    236            x           2606    49218 .   posicióndejugadores posicióndejugadores_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."posicióndejugadores"
    ADD CONSTRAINT "posicióndejugadores_pkey" PRIMARY KEY ("idposicióndejugador");
 \   ALTER TABLE ONLY public."posicióndejugadores" DROP CONSTRAINT "posicióndejugadores_pkey";
       public            postgres    false    210            �           2606    50065 @   posicióndejugadoresenpartido posicióndejugadoresenpartido_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."posicióndejugadoresenpartido"
    ADD CONSTRAINT "posicióndejugadoresenpartido_pkey" PRIMARY KEY ("idposicióndejugadorenpartido");
 n   ALTER TABLE ONLY public."posicióndejugadoresenpartido" DROP CONSTRAINT "posicióndejugadoresenpartido_pkey";
       public            postgres    false    282            �           2606    50011    remates remates_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.remates
    ADD CONSTRAINT remates_pkey PRIMARY KEY (idremate);
 >   ALTER TABLE ONLY public.remates DROP CONSTRAINT remates_pkey;
       public            postgres    false    279            �           2606    49971     sustituciones sustituciones_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.sustituciones
    ADD CONSTRAINT sustituciones_pkey PRIMARY KEY (idsustitucion);
 J   ALTER TABLE ONLY public.sustituciones DROP CONSTRAINT sustituciones_pkey;
       public            postgres    false    277            �           2606    49294    temporadas temporadas_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.temporadas
    ADD CONSTRAINT temporadas_pkey PRIMARY KEY (idtemporada);
 D   ALTER TABLE ONLY public.temporadas DROP CONSTRAINT temporadas_pkey;
       public            postgres    false    226            �           2606    49260 0   tipoestadosdepartidos tipoestadosdepartidos_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.tipoestadosdepartidos
    ADD CONSTRAINT tipoestadosdepartidos_pkey PRIMARY KEY (idtipoestadodepartido);
 Z   ALTER TABLE ONLY public.tipoestadosdepartidos DROP CONSTRAINT tipoestadosdepartidos_pkey;
       public            postgres    false    220            �           2606    49627    tiposacción tiposacción_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public."tiposacción"
    ADD CONSTRAINT "tiposacción_pkey" PRIMARY KEY ("idtipoacción");
 L   ALTER TABLE ONLY public."tiposacción" DROP CONSTRAINT "tiposacción_pkey";
       public            postgres    false    254            �           2606    49730    tiposadicion tiposadicion_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.tiposadicion
    ADD CONSTRAINT tiposadicion_pkey PRIMARY KEY (idtipoadicion);
 H   ALTER TABLE ONLY public.tiposadicion DROP CONSTRAINT tiposadicion_pkey;
       public            postgres    false    262            �           2606    49658 (   tiposamonestacion tiposamonestacion_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.tiposamonestacion
    ADD CONSTRAINT tiposamonestacion_pkey PRIMARY KEY (idtipoamonestacion);
 R   ALTER TABLE ONLY public.tiposamonestacion DROP CONSTRAINT tiposamonestacion_pkey;
       public            postgres    false    260            �           2606    49772 &   tiposdeejecucion tiposdeejecucion_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.tiposdeejecucion
    ADD CONSTRAINT tiposdeejecucion_pkey PRIMARY KEY (idtipodeejecucion);
 P   ALTER TABLE ONLY public.tiposdeejecucion DROP CONSTRAINT tiposdeejecucion_pkey;
       public            postgres    false    265            ~           2606    49239 2   tiposdeestadospersonas tiposdeestadospersonas_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.tiposdeestadospersonas
    ADD CONSTRAINT tiposdeestadospersonas_pkey PRIMARY KEY (idtipoestadopersona);
 \   ALTER TABLE ONLY public.tiposdeestadospersonas DROP CONSTRAINT tiposdeestadospersonas_pkey;
       public            postgres    false    216            �           2606    49651    tiposfalta tiposfalta_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.tiposfalta
    ADD CONSTRAINT tiposfalta_pkey PRIMARY KEY (idtipofalta);
 D   ALTER TABLE ONLY public.tiposfalta DROP CONSTRAINT tiposfalta_pkey;
       public            postgres    false    258            �           2606    49852    tipospartido tipospartido_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.tipospartido
    ADD CONSTRAINT tipospartido_pkey PRIMARY KEY (idtipopartido);
 H   ALTER TABLE ONLY public.tipospartido DROP CONSTRAINT tipospartido_pkey;
       public            postgres    false    269            |           2606    49232     tipospersonas tipospersonas_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.tipospersonas
    ADD CONSTRAINT tipospersonas_pkey PRIMARY KEY (idtipopersona);
 J   ALTER TABLE ONLY public.tipospersonas DROP CONSTRAINT tipospersonas_pkey;
       public            postgres    false    214            z           2606    49225     tiposÁrbitro tiposÁrbitro_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."tiposÁrbitro"
    ADD CONSTRAINT "tiposÁrbitro_pkey" PRIMARY KEY ("idtipoÁrbitro");
 N   ALTER TABLE ONLY public."tiposÁrbitro" DROP CONSTRAINT "tiposÁrbitro_pkey";
       public            postgres    false    212            �           2606    49571 0   tipoÁrbitroenpartido tipoÁrbitroenpartido_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."tipoÁrbitroenpartido"
    ADD CONSTRAINT "tipoÁrbitroenpartido_pkey" PRIMARY KEY ("idtipoÁrbitroenpartido");
 ^   ALTER TABLE ONLY public."tipoÁrbitroenpartido" DROP CONSTRAINT "tipoÁrbitroenpartido_pkey";
       public            postgres    false    250            �           2606    49274    Árbitros Árbitros_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Árbitros"
    ADD CONSTRAINT "Árbitros_pkey" PRIMARY KEY ("idÁrbitro");
 F   ALTER TABLE ONLY public."Árbitros" DROP CONSTRAINT "Árbitros_pkey";
       public            postgres    false    224            �           2618    66277 (   cantidadpasesacertadosporjugador _RETURN    RULE     1  CREATE OR REPLACE VIEW public.cantidadpasesacertadosporjugador AS
 SELECT DISTINCT p.nombre,
    count(*) AS c
   FROM (public.pases pas
     JOIN public.personas p ON ((p.idpersona = pas.idjugadorejecuta)))
  WHERE (pas.idjugadorrecepciona IS NOT NULL)
  GROUP BY p.idpersona
  ORDER BY (count(*)) DESC;
 �   CREATE OR REPLACE VIEW public.cantidadpasesacertadosporjugador AS
SELECT
    NULL::character varying(45) AS nombre,
    NULL::bigint AS c;
       public          postgres    false    3474    236    236    275    275    288            �           2618    66291 "   golesporextremidaddeneymar _RETURN    RULE     
  CREATE OR REPLACE VIEW public.golesporextremidaddeneymar AS
 SELECT ex.extremidad,
    count(*) AS n_veces
   FROM (((public.remates rm
     JOIN public.goles gol ON ((rm.idremate = gol.idremate)))
     JOIN public.personas p ON ((rm.idjugador = p.idpersona)))
     JOIN public.extremidadesanotadoras ex ON ((rm.idextremidad = ex.idextremidad)))
  WHERE (rm.idjugador = ( SELECT personas.idpersona
           FROM public.personas
          WHERE ((personas.nombre)::text = 'Neymar Jr'::text)))
  GROUP BY ex.idextremidad;
 �   CREATE OR REPLACE VIEW public.golesporextremidaddeneymar AS
SELECT
    NULL::character varying(30) AS extremidad,
    NULL::bigint AS n_veces;
       public          postgres    false    236    236    267    267    3506    279    279    279    280    291            �           2606    49635     acciones acciones_idpartido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.acciones
    ADD CONSTRAINT acciones_idpartido_fkey FOREIGN KEY (idpartido) REFERENCES public.partidos(idpartido);
 J   ALTER TABLE ONLY public.acciones DROP CONSTRAINT acciones_idpartido_fkey;
       public          postgres    false    256    248    3486            �           2606    49640 $   acciones acciones_idtipoacción_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.acciones
    ADD CONSTRAINT "acciones_idtipoacción_fkey" FOREIGN KEY ("idtipoacción") REFERENCES public."tiposacción"("idtipoacción");
 P   ALTER TABLE ONLY public.acciones DROP CONSTRAINT "acciones_idtipoacción_fkey";
       public          postgres    false    254    256    3492            �           2606    49736 "   adiciones adiciones_idadicion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.adiciones
    ADD CONSTRAINT adiciones_idadicion_fkey FOREIGN KEY (idadicion) REFERENCES public.acciones("idacción");
 L   ALTER TABLE ONLY public.adiciones DROP CONSTRAINT adiciones_idadicion_fkey;
       public          postgres    false    3494    256    263            �           2606    49741 &   adiciones adiciones_idtipoadicion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.adiciones
    ADD CONSTRAINT adiciones_idtipoadicion_fkey FOREIGN KEY (idtipoadicion) REFERENCES public.tiposadicion(idtipoadicion);
 P   ALTER TABLE ONLY public.adiciones DROP CONSTRAINT adiciones_idtipoadicion_fkey;
       public          postgres    false    262    263    3500            �           2606    49992 )   asistencias asistencias_idasistencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asistencias
    ADD CONSTRAINT asistencias_idasistencia_fkey FOREIGN KEY (idasistencia) REFERENCES public.acciones("idacción");
 S   ALTER TABLE ONLY public.asistencias DROP CONSTRAINT asistencias_idasistencia_fkey;
       public          postgres    false    278    256    3494            �           2606    49997 &   asistencias asistencias_idjugador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asistencias
    ADD CONSTRAINT asistencias_idjugador_fkey FOREIGN KEY (idjugador) REFERENCES public.personas(idpersona);
 P   ALTER TABLE ONLY public.asistencias DROP CONSTRAINT asistencias_idjugador_fkey;
       public          postgres    false    236    3474    278            �           2606    50002 .   asistencias asistencias_idtipodeejecucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asistencias
    ADD CONSTRAINT asistencias_idtipodeejecucion_fkey FOREIGN KEY (idtipodeejecucion) REFERENCES public.tiposdeejecucion(idtipodeejecucion);
 X   ALTER TABLE ONLY public.asistencias DROP CONSTRAINT asistencias_idtipodeejecucion_fkey;
       public          postgres    false    3504    265    278            �           2606    49962     atajadas atajadas_idatajada_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.atajadas
    ADD CONSTRAINT atajadas_idatajada_fkey FOREIGN KEY (idatajada) REFERENCES public.acciones("idacción");
 J   ALTER TABLE ONLY public.atajadas DROP CONSTRAINT atajadas_idatajada_fkey;
       public          postgres    false    276    256    3494            �           2606    49957     atajadas atajadas_idportero_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.atajadas
    ADD CONSTRAINT atajadas_idportero_fkey FOREIGN KEY (idportero) REFERENCES public.personas(idpersona);
 J   ALTER TABLE ONLY public.atajadas DROP CONSTRAINT atajadas_idportero_fkey;
       public          postgres    false    236    276    3474            �           2606    49331    ciudades ciudades_idpaís_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT "ciudades_idpaís_fkey" FOREIGN KEY ("idpaís") REFERENCES public."países"("idpaís");
 J   ALTER TABLE ONLY public.ciudades DROP CONSTRAINT "ciudades_idpaís_fkey";
       public          postgres    false    218    3456    230            �           2606    49343    clubes clubes_idciudad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clubes
    ADD CONSTRAINT clubes_idciudad_fkey FOREIGN KEY (idciudad) REFERENCES public.ciudades(idciudad);
 E   ALTER TABLE ONLY public.clubes DROP CONSTRAINT clubes_idciudad_fkey;
       public          postgres    false    230    3468    232            �           2606    49355 ?   clubesengrupoportemporada clubesengrupoportemporada_idclub_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clubesengrupoportemporada
    ADD CONSTRAINT clubesengrupoportemporada_idclub_fkey FOREIGN KEY (idclub) REFERENCES public.clubes(idclub);
 i   ALTER TABLE ONLY public.clubesengrupoportemporada DROP CONSTRAINT clubesengrupoportemporada_idclub_fkey;
       public          postgres    false    234    232    3470            �           2606    49360 @   clubesengrupoportemporada clubesengrupoportemporada_idgrupo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clubesengrupoportemporada
    ADD CONSTRAINT clubesengrupoportemporada_idgrupo_fkey FOREIGN KEY (idgrupo) REFERENCES public.grupos(idgrupo);
 j   ALTER TABLE ONLY public.clubesengrupoportemporada DROP CONSTRAINT clubesengrupoportemporada_idgrupo_fkey;
       public          postgres    false    234    3466    228            �           2606    49470    contratos contratos_idclub_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contratos
    ADD CONSTRAINT contratos_idclub_fkey FOREIGN KEY (idclub) REFERENCES public.clubes(idclub);
 I   ALTER TABLE ONLY public.contratos DROP CONSTRAINT contratos_idclub_fkey;
       public          postgres    false    232    240    3470            �           2606    49475 "   contratos contratos_idpersona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.contratos
    ADD CONSTRAINT contratos_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES public.personas(idpersona);
 L   ALTER TABLE ONLY public.contratos DROP CONSTRAINT contratos_idpersona_fkey;
       public          postgres    false    3474    236    240            �           2606    49865 5   entrenadoresenclubes entrenadoresenclubes_idclub_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entrenadoresenclubes
    ADD CONSTRAINT entrenadoresenclubes_idclub_fkey FOREIGN KEY (idclub) REFERENCES public.clubes(idclub);
 _   ALTER TABLE ONLY public.entrenadoresenclubes DROP CONSTRAINT entrenadoresenclubes_idclub_fkey;
       public          postgres    false    271    3470    232            �           2606    49870 ;   entrenadoresenclubes entrenadoresenclubes_identrenador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.entrenadoresenclubes
    ADD CONSTRAINT entrenadoresenclubes_identrenador_fkey FOREIGN KEY (identrenador) REFERENCES public.personas(idpersona);
 e   ALTER TABLE ONLY public.entrenadoresenclubes DROP CONSTRAINT entrenadoresenclubes_identrenador_fkey;
       public          postgres    false    236    3474    271            �           2606    49504    estadios estadios_idciudad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estadios
    ADD CONSTRAINT estadios_idciudad_fkey FOREIGN KEY (idciudad) REFERENCES public.ciudades(idciudad);
 I   ALTER TABLE ONLY public.estadios DROP CONSTRAINT estadios_idciudad_fkey;
       public          postgres    false    242    3468    230            �           2606    49516 -   estadiosdeclubes estadiosdeclubes_idclub_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estadiosdeclubes
    ADD CONSTRAINT estadiosdeclubes_idclub_fkey FOREIGN KEY (idclub) REFERENCES public.clubes(idclub);
 W   ALTER TABLE ONLY public.estadiosdeclubes DROP CONSTRAINT estadiosdeclubes_idclub_fkey;
       public          postgres    false    3470    232    244            �           2606    49521 0   estadiosdeclubes estadiosdeclubes_idestadio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estadiosdeclubes
    ADD CONSTRAINT estadiosdeclubes_idestadio_fkey FOREIGN KEY (idestadio) REFERENCES public.estadios(idestadio);
 Z   ALTER TABLE ONLY public.estadiosdeclubes DROP CONSTRAINT estadiosdeclubes_idestadio_fkey;
       public          postgres    false    242    3480    244            �           2606    49533 <   estadiosdeshabilitados estadiosdeshabilitados_idestadio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estadiosdeshabilitados
    ADD CONSTRAINT estadiosdeshabilitados_idestadio_fkey FOREIGN KEY (idestadio) REFERENCES public.estadios(idestadio);
 f   ALTER TABLE ONLY public.estadiosdeshabilitados DROP CONSTRAINT estadiosdeshabilitados_idestadio_fkey;
       public          postgres    false    3480    246    242            �           2606    49594 2   estadosdepersonas estadosdepersonas_idpersona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estadosdepersonas
    ADD CONSTRAINT estadosdepersonas_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES public.personas(idpersona);
 \   ALTER TABLE ONLY public.estadosdepersonas DROP CONSTRAINT estadosdepersonas_idpersona_fkey;
       public          postgres    false    3474    252    236            �           2606    49599 <   estadosdepersonas estadosdepersonas_idtipoestadopersona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.estadosdepersonas
    ADD CONSTRAINT estadosdepersonas_idtipoestadopersona_fkey FOREIGN KEY (idtipoestadopersona) REFERENCES public.tiposdeestadospersonas(idtipoestadopersona);
 f   ALTER TABLE ONLY public.estadosdepersonas DROP CONSTRAINT estadosdepersonas_idtipoestadopersona_fkey;
       public          postgres    false    216    252    3454            �           2606    49897    faltas faltas_idfalta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.faltas
    ADD CONSTRAINT faltas_idfalta_fkey FOREIGN KEY (idfalta) REFERENCES public.acciones("idacción");
 D   ALTER TABLE ONLY public.faltas DROP CONSTRAINT faltas_idfalta_fkey;
       public          postgres    false    256    274    3494            �           2606    49912    faltas faltas_idinfractor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.faltas
    ADD CONSTRAINT faltas_idinfractor_fkey FOREIGN KEY (idinfractor) REFERENCES public.personas(idpersona);
 H   ALTER TABLE ONLY public.faltas DROP CONSTRAINT faltas_idinfractor_fkey;
       public          postgres    false    274    3474    236            �           2606    49907 %   faltas faltas_idtipoamonestacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.faltas
    ADD CONSTRAINT faltas_idtipoamonestacion_fkey FOREIGN KEY (idtipoamonestacion) REFERENCES public.tiposamonestacion(idtipoamonestacion);
 O   ALTER TABLE ONLY public.faltas DROP CONSTRAINT faltas_idtipoamonestacion_fkey;
       public          postgres    false    260    274    3498            �           2606    49902    faltas faltas_idtipofalta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.faltas
    ADD CONSTRAINT faltas_idtipofalta_fkey FOREIGN KEY (idtipofalta) REFERENCES public.tiposfalta(idtipofalta);
 H   ALTER TABLE ONLY public.faltas DROP CONSTRAINT faltas_idtipofalta_fkey;
       public          postgres    false    3496    274    258            �           2606    49917    faltas faltas_idvictima_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.faltas
    ADD CONSTRAINT faltas_idvictima_fkey FOREIGN KEY (idvictima) REFERENCES public.personas(idpersona);
 F   ALTER TABLE ONLY public.faltas DROP CONSTRAINT faltas_idvictima_fkey;
       public          postgres    false    274    236    3474            �           2606    50047    goles goles_idasistencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.goles
    ADD CONSTRAINT goles_idasistencia_fkey FOREIGN KEY (idasistencia) REFERENCES public.asistencias(idasistencia);
 G   ALTER TABLE ONLY public.goles DROP CONSTRAINT goles_idasistencia_fkey;
       public          postgres    false    280    3522    278                        2606    50037    goles goles_idgol_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.goles
    ADD CONSTRAINT goles_idgol_fkey FOREIGN KEY (idgol) REFERENCES public.acciones("idacción");
 @   ALTER TABLE ONLY public.goles DROP CONSTRAINT goles_idgol_fkey;
       public          postgres    false    3494    280    256                       2606    50042    goles goles_idremate_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.goles
    ADD CONSTRAINT goles_idremate_fkey FOREIGN KEY (idremate) REFERENCES public.remates(idremate);
 C   ALTER TABLE ONLY public.goles DROP CONSTRAINT goles_idremate_fkey;
       public          postgres    false    280    279    3524            �           2606    49319    grupos grupos_idtemporada_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_idtemporada_fkey FOREIGN KEY (idtemporada) REFERENCES public.temporadas(idtemporada);
 H   ALTER TABLE ONLY public.grupos DROP CONSTRAINT grupos_idtemporada_fkey;
       public          postgres    false    228    226    3464            �           2606    49555     partidos partidos_idestadio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partidos
    ADD CONSTRAINT partidos_idestadio_fkey FOREIGN KEY (idestadio) REFERENCES public.estadios(idestadio);
 J   ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_idestadio_fkey;
       public          postgres    false    242    248    3480            �           2606    49550    partidos partidos_idlocal_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partidos
    ADD CONSTRAINT partidos_idlocal_fkey FOREIGN KEY (idlocal) REFERENCES public.clubes(idclub);
 H   ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_idlocal_fkey;
       public          postgres    false    232    3470    248            �           2606    49853 $   partidos partidos_idtipopartido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partidos
    ADD CONSTRAINT partidos_idtipopartido_fkey FOREIGN KEY (idtipopartido) REFERENCES public.tipospartido(idtipopartido);
 N   ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_idtipopartido_fkey;
       public          postgres    false    248    269    3508            �           2606    49545 "   partidos partidos_idvisitante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.partidos
    ADD CONSTRAINT partidos_idvisitante_fkey FOREIGN KEY (idvisitante) REFERENCES public.clubes(idclub);
 L   ALTER TABLE ONLY public.partidos DROP CONSTRAINT partidos_idvisitante_fkey;
       public          postgres    false    248    3470    232            �           2606    49942 !   pases pases_idjugadorejecuta_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pases
    ADD CONSTRAINT pases_idjugadorejecuta_fkey FOREIGN KEY (idjugadorejecuta) REFERENCES public.personas(idpersona);
 K   ALTER TABLE ONLY public.pases DROP CONSTRAINT pases_idjugadorejecuta_fkey;
       public          postgres    false    236    3474    275            �           2606    49947 $   pases pases_idjugadorrecepciona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pases
    ADD CONSTRAINT pases_idjugadorrecepciona_fkey FOREIGN KEY (idjugadorrecepciona) REFERENCES public.personas(idpersona);
 N   ALTER TABLE ONLY public.pases DROP CONSTRAINT pases_idjugadorrecepciona_fkey;
       public          postgres    false    236    275    3474            �           2606    49937    pases pases_idpase_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pases
    ADD CONSTRAINT pases_idpase_fkey FOREIGN KEY (idpase) REFERENCES public.acciones("idacción");
 A   ALTER TABLE ONLY public.pases DROP CONSTRAINT pases_idpase_fkey;
       public          postgres    false    256    3494    275            �           2606    49457 5   patrociniosporclubes patrociniosporclubes_idclub_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.patrociniosporclubes
    ADD CONSTRAINT patrociniosporclubes_idclub_fkey FOREIGN KEY (idclub) REFERENCES public.clubes(idclub);
 _   ALTER TABLE ONLY public.patrociniosporclubes DROP CONSTRAINT patrociniosporclubes_idclub_fkey;
       public          postgres    false    238    3470    232            �           2606    49452 D   patrociniosporclubes patrociniosporclubes_idmarcapatroncinadora_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.patrociniosporclubes
    ADD CONSTRAINT patrociniosporclubes_idmarcapatroncinadora_fkey FOREIGN KEY (idmarcapatroncinadora) REFERENCES public.marcaspatroncinadoras(idmarcapatroncinadora);
 n   ALTER TABLE ONLY public.patrociniosporclubes DROP CONSTRAINT patrociniosporclubes_idmarcapatroncinadora_fkey;
       public          postgres    false    222    238    3460            �           2606    49882 F   patrociniosporpersona patrociniosporpersona_idmarcapatroncinadora_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.patrociniosporpersona
    ADD CONSTRAINT patrociniosporpersona_idmarcapatroncinadora_fkey FOREIGN KEY (idmarcapatroncinadora) REFERENCES public.marcaspatroncinadoras(idmarcapatroncinadora);
 p   ALTER TABLE ONLY public.patrociniosporpersona DROP CONSTRAINT patrociniosporpersona_idmarcapatroncinadora_fkey;
       public          postgres    false    3460    222    273            �           2606    49887 :   patrociniosporpersona patrociniosporpersona_idpersona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.patrociniosporpersona
    ADD CONSTRAINT patrociniosporpersona_idpersona_fkey FOREIGN KEY (idpersona) REFERENCES public.personas(idpersona);
 d   ALTER TABLE ONLY public.patrociniosporpersona DROP CONSTRAINT patrociniosporpersona_idpersona_fkey;
       public          postgres    false    3474    236    273            �           2606    49377 )   personas personas_idciudadnacimiento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_idciudadnacimiento_fkey FOREIGN KEY (idciudadnacimiento) REFERENCES public.ciudades(idciudad);
 S   ALTER TABLE ONLY public.personas DROP CONSTRAINT personas_idciudadnacimiento_fkey;
       public          postgres    false    236    3468    230            �           2606    49372 )   personas personas_idpaísprocedencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT "personas_idpaísprocedencia_fkey" FOREIGN KEY ("idpaísprocedencia") REFERENCES public."países"("idpaís");
 U   ALTER TABLE ONLY public.personas DROP CONSTRAINT "personas_idpaísprocedencia_fkey";
       public          postgres    false    236    3456    218            �           2606    49382 $   personas personas_idtipopersona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_idtipopersona_fkey FOREIGN KEY (idtipopersona) REFERENCES public.tipospersonas(idtipopersona);
 N   ALTER TABLE ONLY public.personas DROP CONSTRAINT personas_idtipopersona_fkey;
       public          postgres    false    214    236    3452                       2606    50081 G   posicióndejugadoresenpartido posicióndejugadoresenpartido_idclub_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."posicióndejugadoresenpartido"
    ADD CONSTRAINT "posicióndejugadoresenpartido_idclub_fkey" FOREIGN KEY (idclub) REFERENCES public.clubes(idclub);
 u   ALTER TABLE ONLY public."posicióndejugadoresenpartido" DROP CONSTRAINT "posicióndejugadoresenpartido_idclub_fkey";
       public          postgres    false    232    3470    282                       2606    50066 J   posicióndejugadoresenpartido posicióndejugadoresenpartido_idjugador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."posicióndejugadoresenpartido"
    ADD CONSTRAINT "posicióndejugadoresenpartido_idjugador_fkey" FOREIGN KEY (idjugador) REFERENCES public.personas(idpersona);
 x   ALTER TABLE ONLY public."posicióndejugadoresenpartido" DROP CONSTRAINT "posicióndejugadoresenpartido_idjugador_fkey";
       public          postgres    false    236    3474    282                       2606    50076 J   posicióndejugadoresenpartido posicióndejugadoresenpartido_idpartido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."posicióndejugadoresenpartido"
    ADD CONSTRAINT "posicióndejugadoresenpartido_idpartido_fkey" FOREIGN KEY (idpartido) REFERENCES public.partidos(idpartido);
 x   ALTER TABLE ONLY public."posicióndejugadoresenpartido" DROP CONSTRAINT "posicióndejugadoresenpartido_idpartido_fkey";
       public          postgres    false    248    3486    282                       2606    50071 L   posicióndejugadoresenpartido posicióndejugadoresenpartido_idposición_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."posicióndejugadoresenpartido"
    ADD CONSTRAINT "posicióndejugadoresenpartido_idposición_fkey" FOREIGN KEY ("idposición") REFERENCES public."posicióndejugadores"("idposicióndejugador");
 z   ALTER TABLE ONLY public."posicióndejugadoresenpartido" DROP CONSTRAINT "posicióndejugadoresenpartido_idposición_fkey";
       public          postgres    false    3448    282    210            �           2606    50022 !   remates remates_idextremidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.remates
    ADD CONSTRAINT remates_idextremidad_fkey FOREIGN KEY (idextremidad) REFERENCES public.extremidadesanotadoras(idextremidad);
 K   ALTER TABLE ONLY public.remates DROP CONSTRAINT remates_idextremidad_fkey;
       public          postgres    false    267    3506    279            �           2606    50017    remates remates_idjugador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.remates
    ADD CONSTRAINT remates_idjugador_fkey FOREIGN KEY (idjugador) REFERENCES public.personas(idpersona);
 H   ALTER TABLE ONLY public.remates DROP CONSTRAINT remates_idjugador_fkey;
       public          postgres    false    3474    279    236            �           2606    50012    remates remates_idremate_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.remates
    ADD CONSTRAINT remates_idremate_fkey FOREIGN KEY (idremate) REFERENCES public.acciones("idacción");
 G   ALTER TABLE ONLY public.remates DROP CONSTRAINT remates_idremate_fkey;
       public          postgres    false    279    3494    256            �           2606    50027 $   remates remates_idtipoejecucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.remates
    ADD CONSTRAINT remates_idtipoejecucion_fkey FOREIGN KEY (idtipoejecucion) REFERENCES public.tiposdeejecucion(idtipodeejecucion);
 N   ALTER TABLE ONLY public.remates DROP CONSTRAINT remates_idtipoejecucion_fkey;
       public          postgres    false    265    279    3504            �           2606    49977 4   sustituciones sustituciones_idjugadorsustituido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sustituciones
    ADD CONSTRAINT sustituciones_idjugadorsustituido_fkey FOREIGN KEY (idjugadorsustituido) REFERENCES public.personas(idpersona);
 ^   ALTER TABLE ONLY public.sustituciones DROP CONSTRAINT sustituciones_idjugadorsustituido_fkey;
       public          postgres    false    277    236    3474            �           2606    49982 3   sustituciones sustituciones_idjugadorsustituto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sustituciones
    ADD CONSTRAINT sustituciones_idjugadorsustituto_fkey FOREIGN KEY (idjugadorsustituto) REFERENCES public.personas(idpersona);
 ]   ALTER TABLE ONLY public.sustituciones DROP CONSTRAINT sustituciones_idjugadorsustituto_fkey;
       public          postgres    false    3474    277    236            �           2606    49972 .   sustituciones sustituciones_idsustitucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sustituciones
    ADD CONSTRAINT sustituciones_idsustitucion_fkey FOREIGN KEY (idsustitucion) REFERENCES public.acciones("idacción");
 X   ALTER TABLE ONLY public.sustituciones DROP CONSTRAINT sustituciones_idsustitucion_fkey;
       public          postgres    false    256    277    3494            �           2606    49582 :   tipoÁrbitroenpartido tipoÁrbitroenpartido_idpartido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."tipoÁrbitroenpartido"
    ADD CONSTRAINT "tipoÁrbitroenpartido_idpartido_fkey" FOREIGN KEY (idpartido) REFERENCES public.partidos(idpartido);
 h   ALTER TABLE ONLY public."tipoÁrbitroenpartido" DROP CONSTRAINT "tipoÁrbitroenpartido_idpartido_fkey";
       public          postgres    false    250    3486    248            �           2606    49577 ?   tipoÁrbitroenpartido tipoÁrbitroenpartido_idtipoÁrbitro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."tipoÁrbitroenpartido"
    ADD CONSTRAINT "tipoÁrbitroenpartido_idtipoÁrbitro_fkey" FOREIGN KEY ("idtipoÁrbitro") REFERENCES public."tiposÁrbitro"("idtipoÁrbitro");
 m   ALTER TABLE ONLY public."tipoÁrbitroenpartido" DROP CONSTRAINT "tipoÁrbitroenpartido_idtipoÁrbitro_fkey";
       public          postgres    false    212    3450    250            �           2606    49572 ;   tipoÁrbitroenpartido tipoÁrbitroenpartido_idÁrbitro_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."tipoÁrbitroenpartido"
    ADD CONSTRAINT "tipoÁrbitroenpartido_idÁrbitro_fkey" FOREIGN KEY ("idÁrbitro") REFERENCES public."Árbitros"("idÁrbitro");
 i   ALTER TABLE ONLY public."tipoÁrbitroenpartido" DROP CONSTRAINT "tipoÁrbitroenpartido_idÁrbitro_fkey";
       public          postgres    false    250    224    3462            �           2606    49275 *   Árbitros Árbitros_idpaisprocedencia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Árbitros"
    ADD CONSTRAINT "Árbitros_idpaisprocedencia_fkey" FOREIGN KEY (idpaisprocedencia) REFERENCES public."países"("idpaís");
 X   ALTER TABLE ONLY public."Árbitros" DROP CONSTRAINT "Árbitros_idpaisprocedencia_fkey";
       public          postgres    false    3456    224    218            �   p  x�U�]�%;��9��
��^f��6v�4j��.B ��2rE��e�q�q�K�<��;늃?�����Q�������'�,���� [\A������6J��V�\�%|��Mm��-�1�
δE�/y�=��:b��Ctd����)����Ӟ��V�K�G���X�o�XZ��W����le4Nl톐��^�Á]�1���N��#�E��W��U���z����Ix�U(rU.���A ��C��n��5!���/��)�/����N�IѢNE�:�N�P�z*8T딿��S��AŊf(��A��nS�"(ᯗ��؊ 2E �� Ñd8��ԩJ(���RF�P��WQ�R���Gh���ͪ�%֔:��_Q�M�<H�lM,�{nfv ��.�N���qM5񩿀��>�I儝�	��1N59qQ)�[�x�Iī">U(Q-ۢw���g=�3�3.�хO<AqI�|��4)d��O����m���3�LR�̺�McM!����=�`�mq0�[�Ӷ3��8=��Rm7�U�D�ϕ��6�`g7��jޜ��W~�K��������uA|� ժ
#g]��J �����O\*:"B��ʋ��_{Ş5��I��'/*$�T!�[�5��GI��/�i����}��jN�0dL�$iՄ$m�H��,//)�c⅘ 5��	G�8#q����h�_������WeD|�#�s�1UFD�g0��B^�+d�����p�7�r 
�Z�M1u�ġ�I����4.�[�x(���������P�^�F]f�Y��#h�HPM�9ܠ�w|�7�M5��A��%���ϛ���4�����t�}��ߟ�~���YKXV      �   '   x�322�4�222�4�F`�1�m�i$M9M�b���� ~�      �   )   x�345�4�4�245�4��P����4K�@1z\\\ ݊�      �   z   x�%��0���0���.���ԇ�`X�k�	�p����n=tMr)�����#]I-�uedB1��PL(&�	U��g#�/��~��$��Q���B7�t}K�R��}l�����s� ,301      �     x�UT�r$5<��b��I�<چ�aÄ�,��nyF�Z2j��� �;����� �V%���*3[�5���Ň������2,e�-�8�����>E�Z�. '���1�aKW�\\y"�:\����*�ӝ?���R@������f�����&���Uq�gj�����ft���ωZ�+�F�͇��{����,.�ys�3�uJ7�7x���ŝ���Jw�<g�FZ+����#~��rb�h�����2����1�>��X��5�֤�GE�a�|?�1���[]�@�mp�6;^�LdZ��	�z'K�|�y�T�i��Ap�����,d���1�Pf�5 �˄�@��t�e�0���m>�wO yX�^�,O.O�yP��<��������֨GYj�چ>-ٯ�-}���%����C�ٿL�q�Ӌw'ҍ궴�Ʈex�i�>���t�?3t�J*���T���%�n�s�@�]g�� l��8����,��r9���}<�Rm����^U[���?ͿsX�V�~ߙ�U���.�E�L�}�RU��AUӇ4����a�.�}�"��T2ؕ��dO�o��-'�;s�*�mmTo�0�T��R^y�5}\����k#,�>�x��E���J� K��)���X`���w8�d�uCW���h��g�,˫���^�ŋ��L'8������xp~����� doUcѣ��^5 ��wʨTsq�λ�P���'4j�N,۪����� C�QO7G�9�Y��ǲ�r�ԫ�4�&�3z�֢����64�6������o�R� ߄_	      �   �  x�MQˎ1<W�� �v��9n6�Xm+�މ��Ʊ���#~�k~��������j��~�JuY]�zBK7�Ͽ�Z��U�r� ,Y\�p�Y}�Ԋ7�o0�)����O)t4����k��4���h���u'p�qAZ,��rT�������N�ܻ�"cFz�|��W������΅��4,\���ai�7���:�Q`�E�C)��R�:q����W��Rͅ_��rA#�-n���t������Y4��e?
�	�>�!����td4>�8gᣝ�1����h5�Oi�j�N�"1���gX��HGk�̱���~��Bmp�¶����g'yȁ��qϳ�NR���V�OIY��8�/�^5E9�n��-��nÒ���������3,����<�Z���Q�2���갧�      �   �   x���m@A�PL�`����:2�b|Yd�����3sň��yb1o\�#�y\��-G��5��xKV�-��/����
��	ԒCcJ��8�;<� Ѯ|�n�}�p%	�r��嘜7V���_��c��d�?˲h��R3\��ޯY6�9�j�h�'j����Y��lA�֤�P3��@Ͳ	��Tͱ�Z��eh��a�g]���ڹ�����7�F4�4kN��d�OI�      �   �   x�u��	�0��h���M�%n��?G�R8��zI2[F��kL����:n�O��ʸ����L��2��2��23e,3e0@��4]��N�
@�T ��j����Q{���fk<���C_����w��w~ \�EI�      �   '  x�u�[�� ��{�9>�2�_G�1�9N��7%2I��I�I�o�Z>��W��N*��)w�8�
J@y�%F���h���6�J}��O�T1,��B��JN+u0,�CK��rR�D���ː�Z4�Z5���x[ Vp9�Nl�2�K�<�5/�vV_��w�7[u�l�ؔ��n�h��������ֹm{(�l��C���-���[���!�5�ٚZ<T���F�5���|\v-�A�mj�Pr[ˁ�5���xj�P��|�k�g��a��d�� _�*��      �   �   x��1N�0E�?���'NB����f�vV#9v��4��5���I�A7c��,�v��c��\4]t;Y4�/�n��j1ڊz|J��\3?��du��F|D�_E�%OCW�5�릗L=���m0Ũ�~y*!	p��'Li�=�h���~�����r%�йZ����9�P�~ND���9w      �   U   x�eα�0C�Zڅ`�����ϑ�!��5�W�)87Fo��ͬ0���0���,�X������)��9ޮ�s�| �A"+      �   T   x�3�4202�50�52�2-@̠Լ������<Nc.#��H������%����()3��ӈ����ʴ1!&�2����� ���      �   D   x�u�� !c�3�8�^迎3���vօFWJ{�ԻP<�x�����&nF�%�E�� ��#�      �   7   x�3��LUHI-JM���2�2�
K3S�R�9��R��L8�K��b���� ���      �      x�3�0�4C#�=... ?;      �   E   x����0C�s<��&-K0����`�Y�����*9GxLܘ΃7^�ɯ.̮7fwjuƟ��{I� o �      �   N   x����0���ax�sA	��,���Fj$�.���,:a��&��n�a��s�`A�&T�PcC]����r��      �   �   x�5�A��@E��O�	�Ru�A"��ljH#E���]AfNoo\��{�NA-������l�f��à�-�Se.����Q��9E�t�Rİ�n�A
�������s0�Q�)�𚾻����WaCW1Bo鞦���Q�pC�����*�2���srO�}=X�E�c�k{�[��	?K o�Y=�      �   �   x�]��	!D�c׀G2�U��뿎�nDWDQ|o��V��	$�le��p�?��%��V;�C"#����I�����z��ڳˢ���nF����N����sD�a�0fEe�Ӫ��ܕ;�Q���S:��:l_�u�͓�40���MF-[��dD����hpΆ�j�}C�SQ9      �     x�5�ˑ� �3
f	} ��`�cۨ9�^C�d[��ƒ���!����%��e�9�:E��S�����+��Ӏ%�\֨��:��&1)���Їk��#�h9t8�E7;�^�*5�����a��B��_87��|A_�9���B��/����a������=�9c�ҹ�^fS��3��Mr6ڻi�Oكқ��='{N޻���I�]�iФE9�8oρ{�J�.��d}&-��iϤ��G=ƍ�6��xr�jvs.:�u�}����M�����s�      �      x������ � �      �   [   x�u���0�x�T@ZB����:�)d�eW�o�N��4�q�����^��ݕ1�go[�.Dq�$FMaf���Y	yN	��?�'N      �   �   x�U�AN1E�ߧ�U��v9S��Bt��LC)M��Hp$���#3���=?ٌ�J�����.���)H<�p�.H��B-�YB%�8��Vnѫ�>��:��B[���"_�K�RH�׊2��~�!t�^$Nm�Ǥ�8	�-��~��^�4�L��1f�y�CM�C���ɠ���e��&�X���O�E��x���Y+�YB�\5We$�_D���R�      �   �  x��W˒[5]k�B?`�J��t�0�BR,��Ǫ�2�W�}&?@�*l��̇qZ�k�`U5�O��O�Ӓ�x>�^�Mg?UW�,Q3�	�$)��(Q|V��͉ϝom#�m�;��f*��BT��T�/]��V������
�1��˟�+���N� ���)=Sy�+�S�O����+��9/_��g<�N.?�i���B\��ѵ� �3B�ZTJ�U)J���R��ǵ��eGX=K�_(���d[���ƙV^/����#TT9՚�2TB5�_�7n@����eM� �ҟ
'�(H��*�������b�0�XQ���W�5G(q�/_�x
" G�JB��(+��%��z§�D�Ii8L���x��~Xm>Z�^l>6h���1h�{��L\�����ʗ�#��I!��UF��8������`W�������f�b��?;��	��:��ae�S����f:��2DQWU�3g＜7ø�۱h�s~ЂǮ*�z�f������BZ�fT�͠�)�c��NM�޼3�(�I�aݢ��OK��k׸a�����"&g�"e�h��{�D#fa��ɨ5����wcnW!q�K��+�D����ɫ�Gp���- ������F^�e������Q�-�4cE����h����w&�
	�V�3V�y>ޚ^�����1l2�z�4&�ʦMV�)�S�0M{	� ��:`o����/m+��(o�����Ȧ	���tn-����]���h�ռ�X�� �>�m�;�a�8��9��q��[7��r�G�|Ǌ����pJI�$i�a'��[���G򚒃�I�a��l
�p޸���{{oy�N5Wl�L�eb�����%z[Ovخ8��à~���r���L�}R�c��F�6�g���n�3B*
�,��3+�6�ʷf��9Z��*�8�G]����nmh�*v2O?�<���� ��L���]�%�I���PC<r��_X,yẵk}�'R���(e�`�3籙.�`�4�͌PtK�x3��3g&:]*�JD��6g��޵�f����y? Y�bJ��g�:������.�<��v������~���a��Gy�4���9��l���nX��֐Q���~.'F0�ͧ���j��-��QE`;�����$
N�j�צ����m�Vq�b�"�1C�إ�3볊7r@a'L�%^8�V������F3f|��0�@p���Ӹ���{�/a��sJ�s�yV�|m�|5X��N��h2�*�ř}0����<�T�<���i�� 9�w;4Cyly)^Xy��5�O�W�)�t|��'�N�k1o�Q^��m���b�[�O�l����-Y�p÷t�������$t��N����o<�����(_��m>�E|=*�&���PF*�����P^^�0�Gӯ�!\�8��1�K�-��xaD�d���+�o�����*q��v�C�\�~���o�LT	�]���6<�k*qN�e6��:>ǎ��N��v����S��D̢�G��K8��8��^�B��޵G�.țX��-�s��=d�k�������3������n89ry�s@3���B菰��TCg�;�o� Vn��Cw����13�M���{��F޼X�fa�V��o9Ƴ���,�oyc�x�"/ /¶�����A���?wL�Avqa�5�� ���*I�<r��������������� �(��      �   {   x�3��/*I-��2�tN�+)J�QpI-JM���2��xV�f���s�p�$�#�2�� T�q���d�'����U��ES���`�ĀҼ�D.KN׊���\�6C�B��!�KjNb��1z\\\ ��C/      �   �   x�-��m 1�t1����^�Q�,�^���5�?u�64ջqj�h)�
휅������I��mz�w�i�m�703���^�d��� ����Dx+\/�(�|�~�p�k��>pW��ip������W�n�j��C0n�a%%�25��������]8|$�����j�ɉ��᭔�G��W�U�����	y���Wk �tw������%t������ �B�      �   �   x�E���0 �7.fe.���:l�#��3`�0�A�e£������,�G���J��4@vp��i�)���ӛ���m��JNɢ��>�s\z�|��JmsqO�[��˜�6��Z�Y\ŝ[m�HE~㉼�D���u�l�q'�U�I�A��Z:�(�2z�����u(����Z��GK      �   P   x�̱�0�Z�����.�����܅o,pY��j$�ty��[49Y4
ʋ>�Łv#�\�=f�_;�      �   -   x�3�4202 ��� ����������IA%c���� T�
}      �   -   x�3�(�O/J�ML��2��*MO���9�2�s2�@�1z\\\ ZM      �   S   x�ƫ�0P��1$��3`	XL�U��M��?	G��V���hg�LͥDet��.�|��ߨ�`����L����Xh�W��#�      �   :   x�3�(��M-R(�L�-��2�NM/�Kɇ	�*P((�/*�OO�2AS������� \      �      x�3�t�M,���I�2���J����� N��      �   B   x�3��,�W��L*J�2�pR�K3���9�SR2�R�K�L8R�sJ2�L!�`1z\\\ Y��      �   $   x�3��I-���KL��2�.-.H�K�rb���� �[�      �   o   x�ȹ
BA�:�+��{m%���M|%2�<f���p�t�<+Vt�6r��,��Ek�$��o�el��O����]kտ�=��Q�2�L�ۧ�.��uX�ʓk���  &<      �   @   x�3�tK,NUHIUH/*-�/�2��O.I,��9�K�J�,����̴̼�.SN70���� `7q      �       x�3��*MOL�/�2�t�+)J�sb���� |k      �   =   x�3�tN�+)J��2�tJ�KI-��SpI-JM���2FyV�f���s�p�%q��qqq [I�      �   7   x����0B�3��H�㥘�_G�Ip �A)�P�Wa�݋���st�ދ�~P-      �   �   x�5̻
1���W�$��I��b� ��L���د�Su�T��n���YG/0�,���e���^H�^8ØZ�U�z��0x�@���Ӭny��qC@�c�^��׎�.�TH�˥�����u���<��'�     