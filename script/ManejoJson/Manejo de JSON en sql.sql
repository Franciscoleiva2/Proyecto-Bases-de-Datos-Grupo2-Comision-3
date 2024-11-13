
-- Crear la base de datos
CREATE DATABASE viajate_t;
GO

USE viajate_t;
GO



-- Crear la tabla de datos adicionales con una columna JSON
CREATE TABLE datos_adicionales (
    id INT PRIMARY KEY IDENTITY(1,1),
    usuarios_id INT NOT NULL,
    datos NVARCHAR(MAX) CHECK (ISJSON(datos) > 0), -- Columna JSON con validaci�n
    CONSTRAINT FK_datos_adicionales_usuarios FOREIGN KEY (usuarios_id) REFERENCES usuarios(id)
);

-- Insertar datos en formato JSON
INSERT INTO datos_adicionales (usuarios_id, datos)
VALUES 
(1, N'{"hobbies": ["f�tbol", "leer"], "preferencias": {"m�sica": "rock", "comida": "italiana"}}'),
(2, N'{"hobbies": ["correr", "cocinar"], "preferencias": {"m�sica": "pop", "comida": "mexicana"}}'),
(3, N'{"hobbies": ["fotograf�a", "nataci�n"], "preferencias": {"m�sica": "jazz", "comida": "francesa"}}'),
(4, N'{"hobbies": ["pintura", "senderismo"], "preferencias": {"m�sica": "cl�sica", "comida": "china"}}'),
(5, N'{"hobbies": ["escalar", "videojuegos"], "preferencias": {"m�sica": "electr�nica", "comida": "americana"}}');

-- Actualizar un valor dentro del JSON
UPDATE datos_adicionales
SET datos = JSON_MODIFY(datos, '$.preferencias.comida', 'japonesa')
WHERE usuarios_id = 1;

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
SET datos = JSON_MODIFY(datos, 'delete $.preferencias.m�sica')
WHERE usuarios_id = 1;

-- Consultar un valor espec�fico dentro del JSON
SELECT JSON_VALUE(datos, '$.preferencias.comida') AS ComidaPreferida
FROM datos_adicionales
WHERE usuarios_id = 1;

-- Consultar varios valores JSON al mismo tiempo
SELECT 
    JSON_VALUE(datos, '$.hobbies[0]') AS PrimerHobby,
    JSON_VALUE(datos, '$.preferencias.comida') AS ComidaPreferida
FROM datos_adicionales;

-- Filtrar registros en funci�n de un valor JSON
SELECT usuarios_id
FROM datos_adicionales
WHERE JSON_VALUE(datos, '$.preferencias.comida') = 'mexicana';

-- Crear una columna calculada e indexarla para optimizar consultas
ALTER TABLE datos_adicionales
ADD comida_preferida AS JSON_VALUE(datos, '$.preferencias.comida');

CREATE INDEX idx_comida_preferida ON datos_adicionales (comida_preferida);

-- Eliminar un registro espec�fico de datos adicionales
DELETE FROM datos_adicionales
WHERE usuarios_id = 4;

-- Seleccionar todos los registros para revisar la estructura final de datos adicionales
SELECT * FROM datos_adicionales;


/*



Conclusi�n 

El uso de JSON en SQL Server permite almacenar datos no estructurados y flexibles sin necesidad de un esquema fijo, 
lo cual es ideal para aplicaciones que manejan datos variables. SQL Server proporciona funciones espec�ficas como `JSON_VALUE` y `JSON_MODIFY`,
que facilitan el acceso y modificaci�n de estos datos
Sin embargo, a diferencia de bases de datos NoSQL, el rendimiento y la optimizaci�n de consultas JSON en SQL Server son limitados,
MongoDB, ofrecen mejor rendimiento y flexibilidad para este tipo de operaciones.
 Para mejorar el rendimiento, es recomendable usar columnas calculadas e indexarlas si se requiere consultar propiedades JSON con frecuencia.

 JSON en SQL Server es �til como complemento en estructuras relacionales, pero no reemplaza un esquema relacional en consultas complejas y repetitivas. 
 Para estos casos, una soluci�n NoSQL puede ser m�s adecuada.
*/