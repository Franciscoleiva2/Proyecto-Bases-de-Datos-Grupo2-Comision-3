USE viajate;

-- Insertar datos en la tabla usuarios
INSERT INTO usuarios (nombre, apellido, email, contraseña)
VALUES 
('Juan', 'Pérez', 'juan.perez@example.com', 'password123'),
('María', 'García', 'maria.garcia@example.com', 'password123'),
('Carlos', 'Sánchez', 'carlos.sanchez@example.com', 'password123'),
('Ana', 'López', 'ana.lopez@example.com', 'password123');

-- Insertar datos en la tabla usuarios_detalles
INSERT INTO usuarios_detalles (usuarios_id, telefono, genero, fecha_nacimiento, biografia, foto_url)
VALUES 
(1, '123456789', 'Masculino', '1990-01-01', 'Me encanta viajar y conocer gente.', 'https://example.com/foto1.jpg'),
(2, '987654321', 'Femenino', '1992-05-15', 'Apasionada por los road trips.', 'https://example.com/foto2.jpg'),
(3, '456789123', 'Masculino', '1988-08-20', 'Amante de las aventuras al aire libre.', 'https://example.com/foto3.jpg'),
(4, '789123456', 'Femenino', '1995-12-30', 'Viajar es mi pasión.', 'https://example.com/foto4.jpg');

-- Insertar datos en la tabla comunidades
INSERT INTO comunidades (nombre, descripcion)
VALUES 
('Viajantes Argentina', 'Comunidad de viajeros en Argentina.'),
('Road Trippers', 'Amantes de los viajes en auto.'),
('Aventureros Unidos', 'Exploradores de naturaleza y aventura.');

-- Insertar datos en la tabla usuarios_comunidades
INSERT INTO usuarios_comunidades (usuarios_id, comunidades_id, fecha_union)
VALUES 
(1, 1, '2023-01-01'),
(2, 2, '2023-02-15'),
(3, 3, '2023-03-20'),
(4, 1, '2023-04-10');

-- Insertar datos en la tabla tipos_vehiculos
INSERT INTO tipos_vehiculos (tipo)
VALUES 
('Auto'),
('SUV'),
('Moto');

-- Insertar datos en la tabla tipos_combustible
INSERT INTO tipos_combustible (tipo)
VALUES 
('Gasolina'),
('Diesel'),
('Eléctrico');

-- Insertar datos en la tabla vehiculos
INSERT INTO vehiculos (usuario_id, tipo_vehiculo_id, tipo_combustible_id, marca, modelo, año, color, capacidad)
VALUES 
(1, 1, 1, 'Toyota', 'Corolla', 2015, 'Rojo', 4),
(2, 2, 2, 'Ford', 'Explorer', 2018, 'Negro', 7),
(3, 3, 1, 'Honda', 'CBR600RR', 2020, 'Azul', 2),
(4, 1, 3, 'Nissan', 'Leaf', 2019, 'Blanco', 5);

-- Insertar datos en la tabla viajes
INSERT INTO viajes (usuarios_id, vehiculo_id, origen, destino, fecha, hora, precio, asientos_disponibles, duracion_estimada)
VALUES 
(1, 1, 'Buenos Aires', 'Córdoba', '2024-01-10', '08:00', 5000.00, 3, '08:00'),
(2, 2, 'Rosario', 'Mendoza', '2024-01-15', '09:00', 7500.00, 5, '10:00'),
(3, 3, 'Posadas', 'Resistencia', '2024-02-10', '06:30', 2000.00, 1, '05:30'),
(4, 4, 'Córdoba', 'Salta', '2024-02-20', '07:45', 6000.00, 4, '07:45');
