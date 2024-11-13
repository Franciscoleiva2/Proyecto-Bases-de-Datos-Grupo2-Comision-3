-- Tarea: Crear la tabla viajes_datos con una columna JSON
USE viajate;

CREATE TABLE viajes_datos (
    id INT PRIMARY KEY IDENTITY(1,1),
    viajes_id INT NOT NULL,
    datos NVARCHAR(MAX) CHECK (ISJSON(datos) > 0), -- Columna JSON con validación
    CONSTRAINT FK_viajes_datos_viaje FOREIGN KEY (viajes_id) REFERENCES viajes(id)
);

-- Tarea: Insertar datos JSON en la tabla viajes_datos
INSERT INTO viajes_datos (viajes_id, datos)
VALUES 
(1, N'{
    "caracteristicas": {
        "equipaje": "permitido",
        "mascotas": "permitidas",
        "fumar": "no permitido",
        "paradas": [
            "YPF 4 bocas",
            "Estación Shell Avenida",
            "Parador Ruta 3"
        ]
    },
    "preferencias": {
        "bebida": "mate"
    }
}'),
(2, N'{
    "caracteristicas": {
        "equipaje": "no permitido",
        "mascotas": "no permitidas",
        "fumar": "permitido",
        "paradas": [
            "Estación de Servicio Axion",
            "Parada Centro Plaza"
        ]
    },
    "preferencias": {
        "bebida": "tereré"
    }
}');

-- Tarea: Consultar datos específicos en el JSON

-- Consultar una característica específica (Ejemplo: estado de "fumar" para un viaje específico)
SELECT JSON_VALUE(datos, '$.caracteristicas.fumar') AS Fumar
FROM viajes_datos
WHERE viajes_id = 1;

-- Consultar varias características JSON al mismo tiempo (Ejemplo: estado de "equipaje" y primera parada)
SELECT 
    JSON_VALUE(datos, '$.caracteristicas.equipaje') AS Equipaje,
    JSON_QUERY(datos, '$.caracteristicas.paradas[0]') AS PrimeraParada
FROM viajes_datos;

-- Filtrar registros según una preferencia JSON (Ejemplo: viajes con preferencia de "mate" como bebida)
SELECT viajes_id
FROM viajes_datos
WHERE JSON_VALUE(datos, '$.preferencias.bebida') = 'mate';

-- Tarea: Crear una columna calculada e indexarla para optimizar consultas sobre el JSON
ALTER TABLE viajes_datos
ADD bebida_preferida AS JSON_VALUE(datos, '$.preferencias.bebida');

CREATE INDEX idx_bebida_preferida ON viajes_datos (bebida_preferida);

-- Tarea: Seleccionar todos los registros para revisar la estructura final de los datos
SELECT * FROM viajes_datos;
