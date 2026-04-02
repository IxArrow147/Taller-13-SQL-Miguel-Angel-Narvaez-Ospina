USE Destinos_Soñados_SA; # Utilizar Base de Datos Creada

#Obviamente como no hay muchos Registros (solo 10 por tabla), la mayoria de las consultas no de volveran nada 

#1. Utiliza INNER JOIN con WHERE para encontrar todos los paquetes turísticos que incluyen cierto destino y tienen una duración menor a 10 días.

SELECT pt.nombre_comercial, pt.duracion_dias, dt.nombre AS destino
FROM Paquete_Turistico pt
INNER JOIN Paquete_Destino pd 
    ON pt.id_paquete = pd.id_paquete
INNER JOIN Destino_Turistico dt 
    ON pd.id_destino = dt.id_destino
WHERE dt.nombre = 'Cartagena' #Por Ejemplo Cartagena
  AND pt.duracion_dias < 10;
  
#2. Aplica LEFT JOIN con ORDER BY para listar todos los destinos turísticos y sus actividades asociadas (si las tienen) ordenadas por popularidad. de mayor a menor
SELECT dt.nombre, dt.nivel_popularidad, at.nombre AS Actividad
FROM Destino_Turistico dt
LEFT JOIN Actividad_Turistica at
    ON dt.id_destino = at.id_destino
ORDER BY dt.nivel_popularidad DESC;

#3. Usa RIGHT JOIN con GROUP BY y HAVING para encontrar guías que han dirigido más de 15 tours en el último trimestre y calcular la calificación promedio.

/* profe puse este where por que al no tener Tantos registros en las tablas puse intervalo de fechas para que se vea la consulta, 
pero para hacer lo del ultimo trimestre hay funciones segun investigue es como poner algo como 
fecha de inicio >= currentdate interval 3 MONTH pero esto no mostraria nada ya que los inserts no estan en las fechas requeridas */

SELECT g.id_guia, g.nombres, g.apellidos, COUNT(r.id_reserva) AS Total_Tours, AVG(g.evaluacion_desempeno) AS Promedio_Calificacion
FROM Guia_Turistico g
RIGHT JOIN Reserva r
    ON r.id_guia = g.id_guia
WHERE r.fecha_inicio BETWEEN '2025-01-01' AND '2026-12-31'  
GROUP BY g.id_guia, g.nombres, g.apellidos
HAVING COUNT(r.id_reserva) >= 1;

#4. Implementa INNER JOIN múltiple con BETWEEN para listar reservas realizadas en un período específico junto con los datos del cliente, paquete y guía asignado.

/* Profe aqui hay un tema Se agregaron las columnas id_paquete e id_guia a la tabla Reserva mediante ALTER TABLE en el ejercicio original no existe esta relacion asi que modifique un poco el script Principal en el GITHUB.
Debido a que estos campos inicialmente contienen valores NULL, las consultas con INNER JOIN no retornan resultados hasta que se establezcan relaciones válidas.
entonces para que funcionen con inner hize unos inserts con update para el funcionamiento correcto puede funcionar con left pero cambia la logica del punto.*/
# Para llenar los 10 registros toca 1 por uno
UPDATE Reserva
SET id_paquete = 1,
    id_guia = 1
WHERE id_reserva = 1;
UPDATE Reserva
SET id_paquete = 2,
    id_guia = 2
WHERE id_reserva = 2;

SELECT id_reserva, id_paquete, id_guia
FROM Reserva;

# Ahora si la consulta  
SELECT r.numero_reserva, r.fecha_inicio, r.fecha_fin, c.nombres_razon_social, pt.nombre_comercial, CONCAT(g.nombres, ' ', g.apellidos) AS guia
FROM Reserva r
INNER JOIN Cliente c 
    ON r.id_cliente = c.id_cliente
INNER JOIN Paquete_Turistico pt
    ON r.id_paquete = pt.id_paquete
INNER JOIN Guia_Turistico g
    ON r.id_guia = g.id_guia
WHERE r.fecha_inicio > '2026-01-01';

# 5. Combina LEFT JOIN con IS NULL para identificar destinos que no tienen actividades programadas para la próxima temporada alta.
#En los registros no hay Destinos turisticos sin actividades y encima en una temporada en especifico 'Temporada Alta'
SELECT dt.nombre
FROM Destino_Turistico dt
LEFT JOIN Actividad_Turistica at
    ON dt.id_destino = at.id_destino
LEFT JOIN Destino_Temporada dtemp
    ON dt.id_destino = dtemp.id_destino
LEFT JOIN Temporada t
    ON dtemp.id_temporada = t.id_temporada
WHERE t.nombre = 'Temporada Alta'
  AND at.id_actividad IS NULL;
  
 #6. Utiliza INNER JOIN con IN para encontrar transportes utilizados en ciertos paquetes turísticos específicos.
SELECT t.codigo, t.proveedor, tt.nombre AS Tipo_transporte
FROM Transporte t
INNER JOIN Tipo_Transporte tt
    ON t.id_tipo_transporte = tt.id_tipo_transporte
WHERE t.id_tipo_transporte IN (
    SELECT id_tipo_transporte
    FROM Paquete_Turistico
    WHERE id_paquete IN (1, 2, 3) #In para filtrar varios paquetes escoji esos 3
);

#7. Aplica JOIN con función de agregación SUM y GROUP BY para calcular los ingresos totales por destino y temporada.
#Contenia una Tabla pivote sin datos por ellos puedes utilizar el siguiente insert para rellenar algunos y generar la consulta 
INSERT INTO Paquete_Destino (id_paquete, id_destino)
VALUES (1,1),(1,2),(2,1),(2,3),(3,2),(3,3);

SELECT dt.nombre AS destino, SUM(pt.precio_base) AS ingresos_totales
FROM Paquete_Turistico pt
INNER JOIN Paquete_Destino pd 
    ON pt.id_paquete = pd.id_paquete
INNER JOIN Destino_Turistico dt 
    ON pd.id_destino = dt.id_destino
GROUP BY dt.nombre;

#8. Usa INNER JOIN con LIKE para encontrar clientes con ciertas preferencias en su perfil, junto con sus reservas históricas.
SELECT c.nombres_razon_social, r.numero_reserva
FROM Cliente c
INNER JOIN Reserva r
    ON c.id_cliente = r.id_cliente
WHERE c.programa_fidelizacion LIKE '%Viajero%'; #Utilize la palabra Viajero como ejemplo

#9. Implementa JOIN múltiple con subconsulta para identificar los paquetes con nivel de satisfacción superior al promedio para su categoría de precio.
#Version sin Join para entender la logica
SELECT pt.nombre_comercial, pt.precio_base
FROM Paquete_Turistico pt
WHERE pt.precio_base > (
    SELECT AVG(pt2.precio_base)
    FROM Paquete_Turistico pt2
    WHERE pt2.id_categoria_alojamiento = pt.id_categoria_alojamiento
);
#Version con Join
SELECT pt.nombre_comercial, pt.precio_base, ca.estrellas AS categoria
FROM Paquete_Turistico pt
INNER JOIN Categoria_Alojamiento ca
    ON pt.id_categoria_alojamiento = ca.id_categoria_alojamiento
WHERE pt.precio_base > (
    SELECT AVG(pt2.precio_base)
    FROM Paquete_Turistico pt2
    WHERE pt2.id_categoria_alojamiento = pt.id_categoria_alojamiento
);
#10. Combina LEFT JOIN con función de fecha para listar promociones vigentes en los próximos 3 meses junto con los paquetes aplicables, incluso si no hay promociones activas.
#esta require de nuevo una nueva tabla que se llame promociones cosa que no existe en el ejercicio planteado pero creo que require de nuevo esta funcion interval 3 MONTH









