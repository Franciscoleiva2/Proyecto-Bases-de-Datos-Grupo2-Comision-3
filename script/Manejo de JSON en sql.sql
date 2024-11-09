USE viajate;

/* Eliminar la tabla si existe (para propósitos de prueba). No usar en producción. */
DROP TABLE IF EXISTS viajes_metadata;

-- Crear la tabla viajes_metadata con columna JSON
CREATE TABLE viajes_metadata (
    id INT IDENTITY(1,1) PRIMARY KEY,
    viaje_id INT NOT NULL,
    metadata NVARCHAR(MAX) NOT NULL, -- Almacenará datos JSON
    CONSTRAINT FK_viaje FOREIGN KEY (viaje_id) REFERENCES viajes(id)
);

-- Verificar la estructura de la tabla
SELECT * FROM viajes_metadata;

-- Insertar varios datos JSON en la tabla
INSERT INTO viajes_metadata (viaje_id, metadata)
VALUES 
(1, '{
    "ModeloDeVehiculo": "Toyota Corolla",
    "clima": "soleado",
    "duracion": "3 horas",
    "paradas": ["Parada 1", "Parada 2"],
    "comentarios": ["Excelente conductor", "Muy cómodo"]
}'),
(2, '{
    "ModeloDeVehiculo": "Honda Civic",
    "clima": "lluvioso",
    "duracion": "4 horas",
    "paradas": ["Parada 3"],
    "comentarios": ["Conductor puntual", "Auto limpio"]
}'),
(3, '{
    "ModeloDeVehiculo": "Ford Fiesta",
    "clima": "nublado",
    "duracion": "2 horas",
    "paradas": ["Parada A", "Parada B", "Parada C"],
    "comentarios": ["Conducción suave", "Amable con los pasajeros"]
}'),
(4, '{
    "ModeloDeVehiculo": "Chevrolet Spark",
    "clima": "ventoso",
    "duracion": "1.5 horas",
    "paradas": ["Parada X"],
    "comentarios": ["Coche pequeño pero cómodo", "Buen manejo"]
}');

-- Cambiar el clima de varios viajes
UPDATE viajes_metadata
SET metadata = JSON_MODIFY(metadata, '$.clima', 'nublado')
WHERE viaje_id IN (1, 2);

-- Agregar un comentario adicional en algunos viajes
UPDATE viajes_metadata
SET metadata = JSON_MODIFY(metadata, '$.comentarios[2]', 'Buena relación calidad-precio')
WHERE viaje_id IN (3, 4);

-- Verificar las actualizaciones
SELECT * FROM viajes_metadata;

-- Eliminar el campo "duracion" del JSON en un viaje específico
UPDATE viajes_metadata
SET metadata = JSON_MODIFY(metadata, '$.duracion', NULL)
WHERE viaje_id = 1;

-- Eliminar un registro completo (con viaje_id = 4)
DELETE FROM viajes_metadata
WHERE viaje_id = 4;

-- Extraer el valor de "clima" en metadata para un viaje específico
SELECT JSON_VALUE(metadata, '$.clima') AS clima
FROM viajes_metadata
WHERE viaje_id = 2;

-- Convertir todos los resultados de viaje en JSON
SELECT viaje_id, metadata
FROM viajes_metadata
FOR JSON AUTO;

-- Consultar con JOIN a la tabla viajes
SELECT v.id AS viaje_id, v.origen, v.destino, vm.metadata
FROM viajes v
JOIN viajes_metadata vm ON v.id = vm.viaje_id
FOR JSON AUTO;

-- Extraer el array "comentarios" para cada viaje
SELECT vm.viaje_id, comentario.value AS comentario
FROM viajes_metadata vm
CROSS APPLY OPENJSON(metadata, '$.comentarios') AS comentario;

-- Crear una columna calculada persistente para "clima"
ALTER TABLE viajes_metadata
ADD clima AS CAST(JSON_VALUE(metadata, '$.clima') AS NVARCHAR(100)) PERSISTED;

-- Crear un índice para mejorar consultas de "clima"
CREATE INDEX idx_clima_viaje
ON viajes_metadata (clima);

-- Verificar la estructura final de la tabla
SELECT * FROM viajes_metadata;

