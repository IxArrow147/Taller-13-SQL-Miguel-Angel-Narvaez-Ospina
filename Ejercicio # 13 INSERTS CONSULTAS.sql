USE Destinos_Soñados_SA; # Utilizar Base de Datos Creada


#Inserts de las Tablas (Tipo, Clasificaciones, Metodos, etc)

INSERT INTO Tipo_Destino (nombre) 
VALUES ('Playa'), ('Montaña'), ('Ciudad Histórica'), ('Selva'), ('Desierto'), ('Isla'), ('Parque Natural'), ('Zona Rural'), ('Ciudad Moderna'), ('Destino Cultural');

INSERT INTO Tipo_Alojamiento (nombre) 
VALUES ('Hotel'), ('Hostal'), ('Resort'), ('Apartamento Turístico'), ('Cabaña'), ('Glamping'), ('Ecohotel'), ('Casa Rural'), ('Bed & Breakfast'), ('Lodge');

INSERT INTO Categoria_Alojamiento (Estrellas) 
VALUES (1),(2),(3),(4),(5),(3),(4),(5),(2),(4);

INSERT INTO Tipo_Transporte (nombre) 
VALUES ('Avión'), ('Autobús'), ('Tren'), ('Barco'), ('Helicóptero'), ('Transporte Privado'), ('Crucero'), ('Lancha'), ('Metro Turístico'), ('Teleférico');

INSERT INTO Regimen_Alimenticio (nombre) 
VALUES('Solo Alojamiento'),('Desayuno Incluido'),('Media Pensión'),('Pensión Completa'),('Todo Incluido'),('Brunch Incluido'),('Cena Incluida'),('Buffet Internacional'),('Plan Familiar'),('Plan Ejecutivo');

INSERT INTO Tipo_Actividad (nombre)
VALUES('Aventura'),('Cultural'),('Deportiva'),('Gastronómica'),('Ecológica'),('Histórica'),('Acuática'),('Fotográfica'),('Nocturna'),('Familiar');

INSERT INTO Tipo_Descuento (nombre) 
VALUES('Porcentaje'),('Valor Fijo'),('Temporada Baja'),('Promoción Anticipada'),('Descuento Familiar'),('Cliente Frecuente'),('Estudiantes'),('Tercera Edad'),('Promoción Bancaria'),('Oferta Relámpago');

INSERT INTO Metodo_Pago (nombre) 
VALUES('Tarjeta de Crédito'),('Tarjeta Débito'),('Transferencia Bancaria'),('Pago en Efectivo'),('PayPal'),('Stripe'),('Criptomonedas'),('Pago Contraentrega'),('PSE'),('Apple Pay');

INSERT INTO Tipo_Cliente (nombre) 
VALUES('Individual'),('Pareja'),('Familiar'),('Empresarial'),('Grupo Turístico'),('Estudiante'),('Adulto Mayor'),('Influencer'),('Agencia de Viajes'),('Cliente VIP');

INSERT INTO Pais (nombre) 
VALUES('Colombia'),('México'),('Perú'),('Chile'),('Argentina'),('España'),('Francia'),('Italia'),('Estados Unidos'),('Canadá');

INSERT INTO Region (nombre, id_pais) 
VALUES('Antioquia', 1),('Cundinamarca', 1),('Jalisco', 2),('Ciudad de México', 2),('Lima Metropolitana', 3),('Cusco', 3),('Cataluña', 6),('Andalucía', 6),('California', 9),('Florida', 9);

INSERT INTO Idioma (nombre) 
VALUES('Español'),('Inglés'),('Francés'),('Italiano'),('Portugués'),('Alemán'),('Mandarín'),('Japonés'),('Coreano'),('Árabe');

INSERT INTO Especialidad (nombre) 
VALUES('Historia'),('Ecoturismo'),('Deportes Extremos'),('Gastronomía Local'),('Fotografía'),('Arqueología'),('Turismo Urbano'),('Fauna y Flora'),('Turismo de Lujo'),('Turismo Cultural');

INSERT INTO Certificacion (nombre) 
VALUES('Guía Profesional Nacional'),('Primeros Auxilios'),('Rescate en Montaña'),('Buceo Profesional'),('Turismo Sostenible'),('Atención al Cliente'),('Idiomas Avanzados'),('Gestión de Riesgos'),('Patrimonio Cultural'),('Avistamiento de Aves');

INSERT INTO Temporada (nombre) 
VALUES('Temporada Alta'),('Temporada Media'),('Temporada Baja'),('Verano'),('Invierno'),('Primavera'),('Otoño'),('Semana Santa'),('Navidad'),('Festividades Locales');

INSERT INTO Servicio_Alojamiento (nombre) 
VALUES('WiFi'),('Piscina'),('Spa'),('Gimnasio'),('Desayuno Buffet'),('Transporte Aeropuerto'),('Room Service'),('Lavandería'),('Bar'),('Parqueadero');

#Inserts de las Tablas ENTIDADES Principales

INSERT INTO Destino_Turistico (codigo, nombre, latitud, longitud, descripcion, nivel_popularidad, restricciones, id_tipo_destino, id_pais, id_region)
VALUES
('DST001','Cartagena de Indias',10.391049,-75.479426,'Ciudad amurallada con playas caribeñas y patrimonio histórico',9,'Alta humedad en temporada de lluvias',1,1,2),
('DST002','Guatapé',6.231609,-75.158571,'Destino colorido famoso por la Piedra del Peñol',8,'Ascenso requiere buena condición física',2,1,1),
('DST003','Cusco Histórico',-13.531950,-71.967463,'Capital histórica del Imperio Inca',10,'Altura puede afectar a visitantes',10,3,6),
('DST004','Cancún Zona Hotelera',21.121908,-86.750265,'Playas turquesa y vida nocturna',10,'Alta demanda en temporada alta',1,2,3),
('DST005','Machu Picchu',-13.163141,-72.544963,'Maravilla mundial de arquitectura inca',10,'Ingreso limitado por día',10,3,6),
('DST006','Medellín Urbana',6.244203,-75.581212,'Ciudad moderna rodeada de montañas',9,'Tráfico en horas pico',9,1,1),
('DST007','Barcelona Cultural',41.385064,2.173404,'Arquitectura modernista y vida cultural',9,'Alta afluencia turística',3,6,7),
('DST008','Miami Beach',25.790654,-80.130045,'Playas, compras y entretenimiento',8,'Precios elevados en temporada alta',1,9,10),
('DST009','Desierto de La Tatacoa',3.234736,-75.168198,'Paisaje árido ideal para astronomía',7,'Altas temperaturas diurnas',5,1,2),
('DST010','Lago de Como',46.016048,9.257167,'Destino alpino de lujo y paisajes naturales',8,'Reservas anticipadas recomendadas',2,8,7);

INSERT INTO Actividad_Turistica (codigo,nombre,duracion_horas,dificultad,equipamiento_necesario,restricciones,precio_por_persona,capacidad_maxima,id_destino,id_tipo_actividad)
VALUES
('ACT001','Tour Ciudad Amurallada',3.50,2,'Ropa cómoda','Ninguna',25.00,30,1,2),
('ACT002','Escalada Piedra del Peñol',2.00,4,'Calzado deportivo','No apto cardiacos',18.00,20,2,1),
('ACT003','City Tour Cusco',4.00,2,'Protector solar','Altitud elevada',22.00,25,3,2),
('ACT004','Snorkel Caribe',2.50,3,'Equipo acuático','Saber nadar',40.00,15,4,7),
('ACT005','Ruta Camino Inca',6.00,5,'Botas trekking','Alta exigencia física',120.00,10,5,1),
('ACT006','Tour Comuna 13',3.00,2,'Ninguno','Ninguna',15.00,20,6,10),
('ACT007','Tour Sagrada Familia',2.00,1,'Ninguno','Reservas previas',30.00,25,7,6),
('ACT008','Paseo en Yate',4.00,2,'Ropa ligera','Clima favorable',85.00,12,8,7),
('ACT009','Observación Astronómica',3.00,1,'Abrigo nocturno','Cielo despejado',28.00,18,9,5),
('ACT010','Tour Villas Lago Como',5.00,2,'Ninguno','Reservación previa',95.00,14,10,9);

INSERT INTO Alojamiento (codigo,nombre_comercial,direccion,latitud,longitud,contacto,politica_cancelacion,comision_acordada,id_tipo_alojamiento,id_categoria_alojamiento)
VALUES
('ALJ001','Hotel Caribe Plaza','Centro Histórico Cartagena',10.4236,-75.5478,'+57 605 1234567','Cancelación 48h antes',12.50,1,4),
('ALJ002','Hostal El Peñol','Guatapé Centro',6.2340,-75.1590,'+57 604 6543210','No reembolsable',8.00,2,2),
('ALJ003','Resort Riviera Maya','Zona Costera Cancún',21.1619,-86.8515,'+52 998 7654321','Cancelación flexible',15.00,3,5),
('ALJ004','Ecohotel Andes','Cusco Valle Sagrado',-13.5167,-71.9780,'+51 84 234567','Cancelación 72h antes',10.00,7,4),
('ALJ005','Apartamento Moderno Medellín','El Poblado',6.2088,-75.5674,'+57 604 7890123','Cancelación flexible',9.50,4,3),
('ALJ006','Hotel Boutique Gaudí','Barcelona Centro',41.3870,2.1701,'+34 93 1234567','No reembolsable',13.00,1,5),
('ALJ007','Beach Resort Miami','Ocean Drive',25.7907,-80.1300,'+1 305 5557788','Cancelación 24h antes',14.00,3,5),
('ALJ008','Cabañas Tatacoa','Zona Desierto',3.2370,-75.1700,'+57 608 4567890','Cancelación 48h antes',7.00,5,2),
('ALJ009','Lodge Lago Como','Orilla del Lago',46.0160,9.2572,'+39 031 123456','Cancelación flexible',16.00,10,5),
('ALJ010','Casa Rural Antioquia','Santa Fe de Antioquia',6.5569,-75.8270,'+57 604 2223344','Cancelación 72h antes',6.50,8,3);

INSERT INTO Transporte (codigo,proveedor,ruta,capacidad,duracion_minutos,restricciones_equipaje,tarifa,id_tipo_transporte)
VALUES
('TRN001','Avianca','Bogotá - Cartagena',180,95,'23kg por pasajero',120.00,1),
('TRN002','LATAM','Lima - Cusco',150,80,'Equipaje en bodega pago',95.00,1),
('TRN003','Expreso Brasilia','Medellín - Guatapé',40,120,'Maletas medianas',18.00,2),
('TRN004','Renfe','Madrid - Barcelona',300,180,'2 maletas permitidas',60.00,3),
('TRN005','Royal Caribbean','Miami - Caribe',2500,4320,'Política naviera estándar',850.00,7),
('TRN006','Lancha Caribe','Cartagena - Islas Rosario',35,60,'Equipaje ligero',25.00,8),
('TRN007','Metro Medellín','Ruta Turística',500,45,'Sin restricciones',2.50,9),
('TRN008','Teleférico Barcelona','Montjuïc',60,15,'Sin equipaje grande',12.00,10),
('TRN009','Traslado VIP','Aeropuerto - Hotel',6,30,'Equipaje estándar',40.00,6),
('TRN010','HeliTours','City Tour Aéreo',5,20,'Peso máximo 120kg',150.00,5);

INSERT INTO Guia_Turistico (nombres,apellidos,documento_identidad,fecha_nacimiento,nacionalidad,evaluacion_desempeno,disponibilidad)
VALUES
('Laura','Gómez','CC1023456789','1990-05-14','Colombiana',4.8,TRUE),
('Andrés','Martínez','CC1098765432','1988-11-02','Colombiano',4.6,TRUE),
('Camila','Rojas','CE55667788','1995-07-21','Peruana',4.9,TRUE),
('Diego','Fernández','DNI44556677','1985-03-10','Argentino',4.5,TRUE),
('Sofía','López','PAS998877','1992-09-18','Española',4.7,TRUE),
('Miguel','Torres','CC1122334455','1987-01-30','Colombiano',4.4,FALSE),
('Valentina','Castro','CC2233445566','1998-12-12','Colombiana',4.9,TRUE),
('Javier','Morales','DNI77889966','1991-06-06','Mexicano',4.3,TRUE),
('Isabella','Ramírez','CE33445566','1996-04-25','Chilena',4.8,TRUE),
('Tomás','Herrera','PAS112244','1984-08-09','Estadounidense',4.2,TRUE);

INSERT INTO Cliente (codigo,nombres_razon_social,documento,nacionalidad,direccion,telefono,correo,programa_fidelizacion,id_tipo_cliente)
VALUES
('CLI001','Juan Esteban Pérez','CC1012345678','Colombiana','Medellín','3001234567','juan.perez@email.com','Viajero Frecuente',1),
('CLI002','María Fernanda López','CC1099988877','Colombiana','Bogotá','3017654321','maria.lopez@email.com','Premium Travel',2),
('CLI003','Carlos Rodríguez','DNI55667788','Peruana','Lima','987654321','carlos.rodriguez@email.com','Club Aventurero',1),
('CLI004','Familia González','NIT900123456','Colombiana','Cali','6023456789','familia.gonzalez@email.com','Plan Familiar',3),
('CLI005','TechNova S.A.S','NIT901556677','Colombiana','Bogotá','6012345678','contacto@technova.com','Corporativo Plus',4),
('CLI006','Lucía Martínez','PAS887766','Española','Madrid','612345678','lucia.m@email.com','Europa Travel',1),
('CLI007','Agencia Viajes Andinos','NIT805667788','Colombiana','Medellín','6044445566','ventas@andinos.com','Aliado Comercial',9),
('CLI008','Pedro Sánchez','CC1033344455','Colombiana','Barranquilla','3007778899','pedro.s@email.com','Viajero Frecuente',1),
('CLI009','Grupo Exploradores','NIT811223344','Colombiana','Bucaramanga','6071234567','grupo@exploradores.com','Grupos VIP',5),
('CLI010','Ana Belén Ruiz','DNI66778899','Argentina','Buenos Aires','1156781234','ana.ruiz@email.com','Travel Rewards',1);

INSERT INTO Paquete_Turistico (codigo,nombre_comercial,duracion_dias,duracion_noches,precio_base,minimo_participantes,nivel_dificultad,id_tipo_transporte,id_categoria_alojamiento,id_regimen)
VALUES
('PKT001','Cartagena Premium',4,3,850.00,2,2,1,4,5),
('PKT002','Aventura Guatapé',2,1,320.00,1,4,2,3,2),
('PKT003','Experiencia Cusco Inca',5,4,1200.00,2,5,1,5,4),
('PKT004','Cancún Todo Incluido',6,5,2100.00,2,2,1,5,5),
('PKT005','Ruta Andina Cultural',7,6,1800.00,3,3,1,4,3),
('PKT006','Escapada Medellín Urbana',3,2,540.00,1,1,6,3,2),
('PKT007','Barcelona Artística',4,3,990.00,2,2,3,5,2),
('PKT008','Miami Beach Experience',5,4,1600.00,2,2,1,5,5),
('PKT009','Desierto y Estrellas',2,1,410.00,1,2,2,2,1),
('PKT010','Lago Como Luxury',4,3,2500.00,2,1,1,5,5);

INSERT INTO Promocion (codigo,nombre,descripcion,fecha_inicio,fecha_fin,valor_descuento,condiciones_especiales,resultados_obtenidos,id_tipo_descuento)
VALUES
('PRM001','Promo Verano Caribe','Descuento temporada alta','2026-06-01','2026-08-31',15.00,'Aplica mínimo 2 personas','Alta demanda',1),
('PRM002','Oferta Familiar','Niños viajan con descuento','2026-01-10','2026-12-31',20.00,'Familias >3 personas','Incremento reservas familiares',5),
('PRM003','Compra Anticipada','Reserva con 3 meses de antelación','2026-01-01','2026-12-31',10.00,'Pago total anticipado','Mayor flujo de caja',4),
('PRM004','Promo Estudiantes','Tarifa preferencial','2026-02-01','2026-11-30',12.00,'Carnet vigente','Alta participación joven',7),
('PRM005','Descuento Senior','Adultos mayores','2026-01-01','2026-12-31',18.00,'Mayores de 60 años','Fidelización lograda',8),
('PRM006','Black Travel','Oferta relámpago anual','2026-11-20','2026-11-30',25.00,'Cupos limitados','Ventas récord',10),
('PRM007','Promo Corporativa','Empresas aliadas','2026-01-01','2026-12-31',22.00,'Convenio empresarial','Nuevos contratos',2),
('PRM008','Clientes Frecuentes','Premio lealtad','2026-01-01','2026-12-31',15.00,'Más de 3 compras','Retención alta',6),
('PRM009','Temporada Baja','Incentivo baja demanda','2026-04-01','2026-05-31',30.00,'Fechas específicas','Ocupación equilibrada',3),
('PRM010','Promo Bancaria','Pago con banco aliado','2026-03-01','2026-09-30',18.00,'Tarjetas seleccionadas','Más transacciones',9);

INSERT INTO Reserva (numero_reserva,fecha_creacion,fecha_inicio,fecha_fin,cantidad_adultos,cantidad_ninos,solicitudes_especiales,precio_total,abonos_realizados,saldo_pendiente,estado,id_cliente,id_metodo_pago)
VALUES
('RSV001','2026-03-01 10:15:00','2026-06-10','2026-06-14',2,0,'Habitación vista al mar',1700.00,500.00,1200.00,'Confirmada',1,1),
('RSV002','2026-03-02 14:20:00','2026-07-05','2026-07-07',1,0,'Cama individual',320.00,320.00,0.00,'Pagada',2,2),
('RSV003','2026-03-03 09:10:00','2026-08-12','2026-08-17',2,1,'Menú vegetariano',2100.00,1000.00,1100.00,'Confirmada',4,3),
('RSV004','2026-03-04 16:45:00','2026-09-01','2026-09-03',2,0,'Transporte aeropuerto',540.00,200.00,340.00,'Pendiente',8,9),
('RSV005','2026-03-05 11:30:00','2026-10-10','2026-10-15',3,0,'Habitaciones juntas',1800.00,600.00,1200.00,'Confirmada',9,1),
('RSV006','2026-03-06 13:50:00','2026-11-02','2026-11-06',2,2,'Cuna adicional',2500.00,2500.00,0.00,'Pagada',4,4),
('RSV007','2026-03-07 08:40:00','2026-12-20','2026-12-24',1,0,'Ninguna',990.00,400.00,590.00,'Confirmada',6,5),
('RSV008','2026-03-08 18:10:00','2026-05-15','2026-05-20',2,0,'Tour privado',1600.00,800.00,800.00,'Confirmada',3,1),
('RSV009','2026-03-09 12:25:00','2026-04-10','2026-04-12',2,0,'Guía bilingüe',410.00,200.00,210.00,'Pendiente',10,2),
('RSV010','2026-03-10 17:05:00','2026-06-01','2026-06-05',2,0,'Cena romántica',850.00,850.00,0.00,'Pagada',2,10);

#Tabla Pivote solo la primera

INSERT INTO Destino_Fotografia (id_destino, url) 
VALUES
(1,'https://img.toursystem.com/destinos/cartagena1.jpg'),
(2,'https://img.toursystem.com/destinos/guatape1.jpg'),
(3,'https://img.toursystem.com/destinos/cusco1.jpg'),
(4,'https://img.toursystem.com/destinos/cancun1.jpg'),
(5,'https://img.toursystem.com/destinos/machu_picchu1.jpg'),
(6,'https://img.toursystem.com/destinos/medellin1.jpg'),
(7,'https://img.toursystem.com/destinos/barcelona1.jpg'),
(8,'https://img.toursystem.com/destinos/miami1.jpg'),
(9,'https://img.toursystem.com/destinos/tatacoa1.jpg'),
(10,'https://img.toursystem.com/destinos/lago_como1.jpg');


#Las 10 Consultas

#1. ¿Cuáles son todas las actividades de un destino específico? voy a utilizar el 3 como ejemplo
SELECT * FROM Actividad_Turistica 
WHERE id_destino = 3;

#2. ¿Qué paquetes turísticos tienen duración mayor a 7 días?
SELECT * FROM Paquete_Turistico
WHERE duracion_dias > 7;

#3. ¿Cuáles son las reservas para cierto paquete con fecha de inicio el 15 de julio de 2024?
SELECT * FROM Reserva
WHERE fecha_inicio = '2024-07-15';

#4. ¿Qué destinos son de tipo Playa o Montaña? 
SELECT * FROM Tipo_Destino
WHERE nombre = 'Playa' OR nombre = 'Montaña';
SELECT * FROM Destino_Turistico
WHERE id_tipo_destino IN (1,2);

#5. ¿Cuáles son las reservas con fecha de inicio entre el 1 de junio y el 31 de agosto de 2024?
SELECT * FROM Reserva
WHERE fecha_inicio BETWEEN '2024-06-01' AND '2024-08-31';

#6.¿Qué actividades son de tipo Cultural, Aventura o Gastronómica?
SELECT * FROM Tipo_Actividad
WHERE nombre = 'Aventura' OR nombre = 'Cultural' OR nombre = 'Gastronómica';
SELECT * FROM Actividad_Turistica
WHERE id_tipo_actividad IN (1,2,4);

#7. ¿Cuáles son los destinos con descripciones que contienen las palabras "patrimonio" o "histórico"?
SELECT * FROM Destino_Turistico
WHERE descripcion LIKE '%patrimonio%' OR descripcion LIKE '%histórico%';

#8. ¿Qué paquetes turísticos no tienen guía asignado? 
#Esta consulta no se puede hacer por que no existe la relacion entre paquetes turisticos y Guias
#Podriamos decir que La base de datos no registra asignación de guías a paquetes, dentro del ejercicio no se encuentra

#9. ¿Cuáles son los alojamientos ordenados por categoría descendente y precio ascendente?
SELECT * FROM Alojamiento
ORDER BY id_categoria_alojamiento DESC, comision_acordada ASC;

#10. ¿Cuáles son los ingresos por destino y temporada?
#Yo creo que esta consulta requiere JOIN o no estoy seguro por eso dejo estas consultas como los ingresos totales
SELECT estado, SUM(precio_total) AS Ingresos FROM Reserva
GROUP BY estado;
SELECT SUM(precio_total) AS Ingresos_Totales
FROM Reserva;
