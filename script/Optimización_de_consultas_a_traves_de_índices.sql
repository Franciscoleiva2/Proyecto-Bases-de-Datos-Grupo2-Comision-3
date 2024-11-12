/*
PUNTO 1:
Realizar una carga masiva de por lo menos un millón de registros en la tabla 'viajes' de la base de datos 'viajate_nf'.
*/

-- Declaramos una variable para controlar el bucle
DECLARE @contador INT = 1;

-- Comienza el bucle WHILE
WHILE @contador <= 1000000
BEGIN
    -- Inserta un lote de 1000 registros en cada iteración
    INSERT INTO viajes (usuario_id, vehiculo_id, origen, destino, fecha, hora, precio, asientos_disponibles)
    SELECT
        ((@contador + n - 1) % 4) + 1 AS usuario_id,              -- IDs de usuarios que van del 1 al 4
        ((@contador + n - 1) % 2) + 1 AS vehiculo_id,             -- IDs de vehículos que van del 1 al 2
        CASE ((@contador + n - 1) % 10)                           -- Ciudades de origen en secuencia
            WHEN 0 THEN 'Corrientes'
            WHEN 1 THEN 'Resistencia'
            WHEN 2 THEN 'Formosa'
            WHEN 3 THEN 'Posadas'
            WHEN 4 THEN 'Buenos Aires'
            WHEN 5 THEN 'Rosario'
            WHEN 6 THEN 'Córdoba'
            WHEN 7 THEN 'Mendoza'
            WHEN 8 THEN 'Salta'
            ELSE 'Bariloche'
        END AS origen,
        CASE ((@contador + n) % 10)                               -- Ciudades de destino en secuencia
            WHEN 9 THEN 'Corrientes'
            WHEN 8 THEN 'Resistencia'
            WHEN 7 THEN 'Formosa'
            WHEN 6 THEN 'Posadas'
            WHEN 5 THEN 'Buenos Aires'
            WHEN 4 THEN 'Rosario'
            WHEN 3 THEN 'Córdoba'
            WHEN 2 THEN 'Mendoza'
            WHEN 1 THEN 'Salta'
            ELSE 'Bariloche'
        END AS destino,
        DATEADD(DAY, ((@contador + n - 1) % 365), '2024-01-01') AS fecha,  -- Fechas en 2024
        CONVERT(TIME, DATEADD(MINUTE, ((@contador + n - 1) % 1440), '00:00')) AS hora,  -- Horas del día
        CAST(8000 + ((@contador + n - 1) % 92000) * 1.0 AS DECIMAL(10,2)) AS precio,   -- Precio entre 8000 y 100000
        ((@contador + n - 1) % 5) + 1 AS asientos_disponibles -- Número de asientos disponibles entre 1 y 5
    FROM 
        (SELECT TOP 1000 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n FROM sys.all_objects) AS Numbers;

    -- Incrementa el contador en 1000 para el siguiente lote
    SET @contador = @contador + 1000;
END;

/*
PUNTO 2:
Realizar una búsqueda por periodo y registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.
*/

-- Estructura de la tabla viajes, las restricciones y las relaciones con otras tablas
go
sp_help viajes
go

-- Filtrar Registros por Fecha en la tabla 'viajes'
SELECT fecha, origen, destino, fecha, hora, precio, asientos_disponibles
FROM viajes 
WHERE fecha BETWEEN '2024-01-01' AND '2024-03-31';

-- Plan de Ejecución: Clustered Index Scan
-- Tiempo de Ejecución: 0.166s

/*
PUNTO 3:
Definir un índice agrupado sobre la columna fecha y repetir la consulta anterior.
Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.
*/

-- Crea una copia de la tabla 'viajes' sin restricciones ni índices
SELECT fecha, origen, destino, fecha, hora, precio, asientos_disponibles
INTO viajes_sin_restricciones
FROM viajes;

-- Comparar estructuras de tablas
go
sp_help viajes_sin_restricciones
go
sp_help viajes
go

-- Crear un índice agrupado en la columna 'fecha' en la tabla 'viajes'
CREATE CLUSTERED INDEX IX_fecha_viajes 
ON viajes_sin_restricciones(fecha);

-- Filtrar Registros por Fecha en 'viajes_sin_restricciones'
SELECT fecha, origen, destino, fecha, hora, precio, asientos_disponibles
FROM viajes_sin_restricciones 
WHERE fecha BETWEEN '2024-01-01' AND '2024-03-31';

-- Plan de Ejecución: Clustered Index Seek
-- Tiempo de Ejecución: 0.078s

-- Comparar tiempos de acceso
SELECT fecha, origen, destino, fecha, hora, precio, asientos_disponibles
FROM viajes_sin_restricciones 
WHERE fecha BETWEEN '2024-01-01' AND '2024-03-31';

SELECT fecha, origen, destino, fecha, hora, precio, asientos_disponibles
FROM viajes 
WHERE fecha BETWEEN '2024-01-01' AND '2024-03-31';

/*
PUNTO 4:
Borrar el índice creado.
*/

-- Eliminar el índice agrupado en la columna 'fecha'
DROP INDEX IX_fecha_viajes ON viajes_sin_restricciones;

go
sp_help viajes_sin_restricciones
go

/*
PUNTO 5:
Definir otro índice agrupado sobre la columna 'fecha' en la tabla 'viajes' que además incluya las columnas seleccionadas 
y repetir la consulta anterior. Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.
*/

CREATE CLUSTERED INDEX IX_fecha_viajes
ON viajes_sin_restricciones (fecha, origen, destino, hora, precio, asientos_disponibles);

go
sp_help viajes_sin_restricciones
go

-- Repetir la consulta para observar los cambios en el plan de ejecución y tiempo de respuesta
SELECT fecha, origen, destino, fecha, hora, precio, asientos_disponibles
FROM viajes_sin_restricciones 
WHERE fecha BETWEEN '2024-01-01' AND '2024-03-31';

-- Plan de Ejecución: Clustered Index Seek
-- Tiempo de Ejecución: 0.075s
