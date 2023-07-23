/*1.	Que personas fueron jugadores y luego son técnicos*/

create view jugadoresQueAhoraSonTecnicos
as
select distinct p1.nombre
from personas as p1
	inner join personas as p2
	on p1.nombre = p2.nombre
where p1.idTipoPersona <> p2.idTipoPersona


/*2.Que jugadores del psg que estuvieron sancionados a lo largo de la champions */

create view JugadoresDelPsgQueHanSidoSancionados
as
select p.nombre
From Contratos as c
	Inner join personas as p
	ON p.idPersona = c.idPersona
	inner join estadosdepersonas AS ep
	ON ep.idpersona = p.idpersona
Where c.idClub = (select idClub
				  from clubes
				  where nombreClub = 'París Saint Germain') AND
ep.idtipoestadopersona = (select idTipoEstadoPersona
						 from TiposDeEstadosPersonas 
						 where descripción = 'Suspendido')
						 
/*3.	Cuantos jugadores que están o hayan participado en la champion hay por país*/ 

Select Países.nombre, count(*) as c
From Personas 
     inner join Países 
	 on personas."idpaísprocedencia" = Países.idPaís
where Personas.idTipoPersona = 1
GROUP by  idPaísProcedencia, Países.nombre
ORDer by c DESC



/*4.	Ranking de marcas que mas han patrocinado personas en la champions */

create view rankingMarcasMasPatrocinadoras
as
Select m.nombremarca,count(*) as c
From PatrociniosPorPersona as p 
     inner join MarcasPatroncinadoras as m
	 on m.idmarcapatroncinadora = p.idmarcapatroncinadora 
GROUP by m.nombremarca
ORDER BY c DESC

/*5.	  Goles por jugador durante toda la competencia*/

create VIEW historialDeGolesPorJugador
as
select p.nombre, count(*)
from Remates as rm
     inner join Personas as p
	 ON p.idpersona = rm.idjugador
	 inner join Goles as gol
	 ON gol.idremate = rm.idremate
group by p.nombre

/*6.	Cantidad de pases acertados por jugador en orden*/

create view cantidadPasesAcertadosPorJugador
 as
select distinct p.nombre,  
       count(*) as c
from Pases as pas
 	inner join Personas as p
    on p.idPersona = pas.idjugadorejecuta
where pas.idjugadorrecepciona is not null
 group by p.idPersona
order by c desc

/*7.	Atajadas en segundos tiempos por portero*/

create view AtajadasEnSegundosTiemposPorArquero
 as
 select p.nombre, count(*) as c
 from atajadas as a
 	inner join personas as p
 	on p.idpersona = a.idportero
    inner join acciones as ac
    on ac."idacción" = a.idatajada
 where ac.minuto >= 45 and ac.minuto <= 90
 group by p.nombre 
 order by c DESC

/*8.	Promedio de edades por club*/

create view promedioEdadPorClub
 as
select distinct cl.nombreClub,
       AVG(EXTRACT(YEAR FROM AGE(p.fechanacimiento))) over (partition by con.idClub)   as Promedio_edad  
from Contratos as con
 	inner join Clubes as cl 
 	on con.idClub = cl.idClub
 	inner join Personas as p
    on p.idPersona = con.idpersona

/*9.	Goles por extremidad anotados por Neymar*/

create view golesPorExtremidadDeNeymar
 as
 select ex.extremidad, count (*) as N_veces
from Remates as rm
	inner join Goles as gol
	on rm.idRemate = gol.idRemate
	inner join personas as p
	on rm.idJugador = p.idPersona
	inner join ExtremidadesAnotadoras as ex
	on rm.idExtremidad = ex.idExtremidad
where rm.idJugador =(select idPersona
					 from Personas
					 where nombre = 'Neymar Jr')
group by ex.idExtremidad
