-- Insertar comunidades
INSERT INTO comunidad (nombre, descripcion)
VALUES 
    ('UNNE', 'Comunidad de la Universidad Nacional del Nordeste'),
    ('Cuenca del Plata', 'Comunidad de la Universidad Cuenca del Plata');

-- Insertar usuarios
INSERT INTO usuarios (nombre, apellido, email, contraseña)
VALUES 
    ('Cesar', 'Huici', 'cesar.huici@viajate.com', 'password1'),
    ('Emilio', 'Barrios', 'emilio.barrios@viajate.com', 'password2'),
    ('Francisco', 'Leiva', 'francisco.leiva@viajate.com', 'password3'),
    ('Diego', 'Gauto', 'diego.gauto@viajate.com', 'password4');

-- Insertar detalles del usuario
INSERT INTO usuarios_detalle (usuarios_id, telefono, genero, terminos, fecha_nacimiento)
VALUES 
    (1, '3794000001', 'Masculino', 1, '1990-04-05'),
    (2, '3794000002', 'Masculino', 1, '1992-06-12'),
    (3, '3794000003', 'Masculino', 1, '1991-08-25'),
    (4, '3794000004', 'Masculino', 1, '1989-11-10');

-- Asignar usuarios a comunidades
INSERT INTO usuarios_comunidad (usuarios_id, comunidad_id)
VALUES 
    (1, 1), -- Cesar en UNNE
    (2, 1), -- Emilio en UNNE
    (3, 2), -- Francisco en Cuenca del Plata
    (4, 2); -- Diego en Cuenca del Plata

-- Insertar viajes
INSERT INTO viajes (usuarios_id, origen, destino, fecha, hora, precio)
VALUES 
    (1, 'Corrientes', 'Resistencia', '2024-10-05', '08:00:00', 500.00),
    (2, 'Resistencia', 'Formosa', '2024-10-06', '09:00:00', 800.00),
    (3, 'Corrientes', 'Posadas', '2024-10-07', '10:30:00', 1200.00),
    (4, 'Posadas', 'Buenos Aires', '2024-10-08', '07:00:00', 1500.00);

-- Insertar detalles del viaje
INSERT INTO viajes_detalle (viajes_id, asientos, descripcion, mascotas, is_available, cancelado, equipaje)
VALUES 
    (1, 3, 'Viaje rápido con aire acondicionado', 1, 1, 0, '2 maletas grandes'),
    (2, 2, 'Viaje sin mascotas', 0, 1, 0, '1 maleta mediana'),
    (3, 4, 'Acepta mascotas y tiene espacio para equipaje', 1, 1, 0, '4 maletas pequeñas'),
    (4, 2, 'Viaje largo con aire acondicionado', 0, 1, 0, '2 maletas grandes');

-- Insertar viajes de rutina
INSERT INTO viajes_rutina (viajes_id, comunidad_id, frecuencia)
VALUES 
    (1, 1, 'Diario'), -- Viaje de Cesar en UNNE
    (2, 1, 'Semanal'), -- Viaje de Emilio en UNNE
    (3, 2, 'Mensual'); -- Viaje de Francisco en Cuenca del Plata

-- Insertar solicitudes
INSERT INTO solicitudes (viajes_id, conductor_id, solicitante_id, notificado, aceptado)
VALUES 
    (1, 1, 2, 1, 1), -- Emilio solicita viaje a Cesar
    (2, 2, 3, 1, 1), -- Francisco solicita viaje a Emilio
    (3, 3, 4, 1, 0); -- Diego solicita viaje a Francisco

-- Insertar tipos de combustible
INSERT INTO combustibles (nombre, precio, descripcion)
VALUES 
    ('Nafta', 150.00, 'Combustible común para autos de media gama'),
    ('Gasoil', 130.00, 'Combustible diesel para vehículos pesados'),
    ('Eléctrico', 90.00, 'Energía para vehículos eléctricos recargables');
