### Base de datos de Pagina oficial de la Uefa Champions League 

Realizada con PgAdmin 

- 17 requisitos de la base de datos
- 20 consultas en SQL
- Insercion de Datos para simular dos temporadas 
- 9 vistas
- 9 Procedimientos almacenados 
- Diseño conceptual 
- Diseño Logico en MySql

## Diseño logico

## Diseño concepctual

## Consultas Realizadas en este proyecto


> 1. Que personas fueron jugadores y luego son técnicos

> 2. Que jugadores del psg que estuvieron sancionados a lo largo de la champions                      

> 3. Cuantos jugadores que están o hayan participado en la champion hay por país

> 4. Ranking de marcas que mas han patrocinado personas en la champions

> 5. Goles por jugador durante toda la competencia

> 6. Cantidad de pases acertados por jugador en orden

> 7. Atajadas en segundos tiempos por portero

> 8. Promedio de edades por club

> 9. Goles por extremidad anotados por Neymar


## Requisitos que soluciona esta base de datos

1.	Deben almacenarse jugadores en cada equipo participante de la UEFA CHAMPIONS LEAGUE, cada jugador deberá contener nombre, apellido, fecha de nacimiento, número en dorsal actual, país de nacimiento y club al que pertenece actualmente 

2.	Debe almacenarse tipo de posición de juego para cada jugador por ejemplo (defensa, delantero, volante, arquero...) Un jugador podrá tener una o más posiciones durante la liga

3.	De cada jugador deberá verse estadísticas clave como, partidos disputados, goles anotados, disparos totales, asistencias, además deberá especificar si cada gol fue marcado con pie derecho o izquierdo, si fue con cabeza o en su defecto con otra parte del cuerpo, deberá registrarse cuantos disparos ha realizado cada jugador, también cuantos penaltis (si ha tenido) ha marcado o fallado, cuantos saques de esquina ha ejecutado

4.	Debe poder almacenarse los equipos participantes en la UEFA CHAMPIONS LEAGUE, para cada uno, nombre del equipo, país de procedencia, fecha de inicio

5.	Para cada equipo debe poder verse estadísticas clave como goles, partidos disputados, ganados, empatados y perdidos, tarjetas amarillas y rojas, títulos obtenidos

6.	Cada equipo tiene un contrato para cada jugador inscrito en cada temporada, deberá poder mostrar la plantilla con la que contaba X equipo en cualquier año de su historia 

7.	Cada equipo a la hora de juagar un partido debe presentar su lista de jugadores convocados para dicho partido

8.	Debe almacenarse los enfrentamientos para cada jornada, dentro de cada enfrentamiento se almacena, grupo al que pertenece el enfrentamiento, fecha y hora exacta de inicio del compromiso, nombre del estadio donde se realizará el partido, nombre del equipo local y visitante

9.	Para cada partido debe almacenarse acciones que ocurren durante su ejecución, acciones como, faltas (quien la cometió, a quien la cometió si es el caso, que amonestación tuvo por dicha falta), goles anotados, sustituciones...para cada evento el minuto en que sucedió 

10.	Deberá manejarse información de cada grupo, para cada uno se registra nombre del grupo, ejemplo grupo A, B, C.... y En cada uno, 4 equipos que conforman el grupo 

11.	Deberá poder registrarse los estadios participantes en los enfrentamientos de la UEFA CHAMPIONS LEAGUE, para cada uno se registrará nombre del estadio, país y ciudad donde se encuentra, además de su capacidad máxima de aforo

12.	Para cada estadio debe poder manejar información de sus diferentes estados, dado que cada estadio durante la competencia pude estar inhabilitado por cualquier motivo, con esto podremos saber durante que lapso de tiempo X estadio pudo haber estado no disponible en medio de la competencia 

13.	Debe almacenarse las jornadas planificadas de los enfrentamientos, para cada jornada se registra: tipo de jornada (fase de grupos, octavos de final, cuartos de final, semifinal, final), número de jornada, fecha de la jornada, enfrentamientos para dicha jornada

14.	Debe registrarse los nombres de las marcas que son patrocinadores globales oficiales que intervienen en la UEFA CHAMPIONS LEAGUE ya sea en jugadores, equipos o estadios

15.	Deberá almacenarse información de los jueces participantes, para cada uno se registra: nombre, apellido, fecha de nacimiento, país de procedencia, además Cada juez tiene tipo, por ejemplo (juez: principal, asistente, cuarto árbitro).

16.	Deberá registrarse información sobre los técnicos principales de cada equipo, se registrará: Nombre, edad, fecha de nacimiento, país de procedencia.

17.	La base de datos deberá responder a la trazabilidad del tiempo en todo lo que compete a la información de equipos, jugadores, entrenadores y estadísticas que han sucedido a lo largo de los años para cada objeto, teniendo en cuenta por ejemplo que un entrenador actual pudo haber participado como jugador años atrás.

