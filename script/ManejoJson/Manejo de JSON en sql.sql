-- Tarea 1: Crear una nueva tabla con una columna JSON
use viajate_t

CREATE TABLE datos_adicionales (
    id INT PRIMARY KEY IDENTITY(1,1),
    usuarios_id INT NOT NULL,
    datos NVARCHAR(MAX) CHECK (ISJSON(datos) > 0), -- Columna JSON con validación
    CONSTRAINT FK_datos_adicionales_usuarios FOREIGN KEY (usuarios_id) REFERENCES usuarios(id)
);


--N  el valor como una cadena de caracteres Unicode.

-- Tarea 2: Agregar un conjunto de datos no estructurados en formato JSON
INSERT INTO datos_adicionales (usuarios_id, datos)
VALUES 
(1, N'{
    "hobbies": ["fútbol", "leer"],
    "preferencias": {
        "música": "rock",
        "comida": "italiana"
    }
}'),
(2, N'{
    "hobbies": ["correr", "cocinar"],
    "preferencias": {
        "música": "pop",
        "comida": "mexicana"
    }
}'),
(3, N'{
    "hobbies": ["fotografía", "natación"],
    "preferencias": {
        "música": "jazz",
        "comida": "francesa"
    }
}'),
(4, N'{
    "hobbies": ["pintura", "senderismo"],
    "preferencias": {
        "música": "clásica",
        "comida": "china"
    }
}'),
(5, N'{
    "hobbies": ["escalar", "videojuegos"],
    "preferencias": {
        "música": "electrónica",
        "comida": "americana"
    }
}');

-- Tarea 3: Realizar operaciones de actualización en datos JSON
-- Actualizar un valor dentro del JSON
UPDATE datos_adicionales
SET datos = JSON_MODIFY(datos, '$.preferencias.comida', 'japonesa')
WHERE usuarios_id = 1;

SELECT * FROM datos_adicionales where usuarios_id = 1
-- Agregar un nuevo campo al JSON existente
UPDATE datos_adicionales
SET datos = JSON_MODIFY(datos, '$.preferencias.deporte', 'tenis')
WHERE usuarios_id = 1;

-- Agregar otro campo en diferentes usuarios
UPDATE datos_adicionales
SET datos = JSON_MODIFY(datos, '$.preferencias.libros', 'novelas')
WHERE usuarios_id = 2;

UPDATE datos_adicionales
SET datos = JSON_MODIFY(datos, '$.preferencias.bebida', 'vino tinto')
WHERE usuarios_id = 3;

-- Eliminar una propiedad del JSON
UPDATE datos_adicionales
SET datos = JSON_MODIFY(datos, 'delete $.preferencias.música')
WHERE usuarios_id = 1;

-- Tarea 4: Realizar operaciones de consultas en datos JSON
-- Consultar un valor específico dentro del JSON
SELECT JSON_VALUE(datos, '$.preferencias.comida') AS ComidaPreferida
FROM datos_adicionales
WHERE usuarios_id = 1;

-- Consultar varios valores JSON al mismo tiempo
SELECT 
    JSON_VALUE(datos, '$.hobbies[0]') AS PrimerHobby,
    JSON_VALUE(datos, '$.preferencias.comida') AS ComidaPreferida
FROM datos_adicionales;

-- Filtrar registros en función de un valor JSON
SELECT usuarios_id
FROM datos_adicionales
WHERE JSON_VALUE(datos, '$.preferencias.comida') = 'mexicana';

-- Tarea 5: Aproximaciones a la optimización de consultas para estas estructuras
-- Crear una columna calculada e indexarla para optimizar consultas
ALTER TABLE datos_adicionales
ADD comida_preferida AS JSON_VALUE(datos, '$.preferencias.comida');

CREATE INDEX idx_comida_preferida ON datos_adicionales (comida_preferida);

-- Tarea 6: Eliminar un registro específico de datos adicionales
DELETE FROM datos_adicionales
WHERE usuarios_id = 4;

-- Tarea 7: Seleccionar todos los registros para revisar la estructura final de datos adicionales
SELECT * FROM datos_adicionales;

