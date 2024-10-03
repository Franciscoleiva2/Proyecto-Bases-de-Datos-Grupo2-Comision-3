use viajate

-- Insert communities
INSERT INTO comunidad (id, nombre, descripcion)
VALUES 
    (1, 'UNNE', 'Comunidad de la Universidad Nacional del Nordeste'),
    (2, 'Cuenca del Plata', 'Comunidad de la Universidad Cuenca del Plata');

-- Insert users
INSERT INTO usuarios (id, nombre, apellido, email, contraseña)
VALUES 
    (1, 'Cesar', 'Huici', 'cesar.huici@viajate.com', 'password1'),
    (2, 'Emilio', 'Barrios', 'emilio.barrios@viajate.com', 'password2'),
    (3, 'Francisco', 'Leiva', 'francisco.leiva@viajate.com', 'password3'),
    (4, 'Diego', 'Gauto', 'diego.gauto@viajate.com', 'password4');

-- Insert user details
INSERT INTO usuarios_detalle (id, usuarios_id, telefono, genero, terminos, fecha_nacimiento)
VALUES 
    (1, 1, '3794000001', 'Masculino', 1, '1990-04-05'),
    (2, 2, '3794000002', 'Masculino', 1, '1992-06-12'),
    (3, 3, '3794000003', 'Masculino', 1, '1991-08-25'),
    (4, 4, '3794000004', 'Masculino', 1, '1989-11-10');

-- Assign users to communities
INSERT INTO usuarios_comunidad (usuarios_id, comunidad_id)
VALUES 
    (1, 1), -- Cesar in UNNE
    (2, 1), -- Emilio in UNNE
    (3, 2), -- Francisco in Cuenca del Plata
    (4, 2); -- Diego in Cuenca del Plata

-- Insert travels (viajes)
INSERT INTO viajes (id, usuarios_id, origen, destino, fecha, hora, precio)
VALUES 
    (1, 1, 'Corrientes', 'Resistencia', '2024-10-05', '08:00:00', 500.00),
    (2, 2, 'Resistencia', 'Formosa', '2024-10-06', '09:00:00', 800.00),
    (3, 3, 'Corrientes', 'Posadas', '2024-10-07', '10:30:00', 1200.00),
    (4, 4, 'Posadas', 'Buenos Aires', '2024-10-08', '07:00:00', 1500.00);

-- Insert travel details
INSERT INTO viajes_detalle (id, viajes_id, asientos, descripcion, mascotas, is_available, cancelado, equipaje)
VALUES 
    (1, 1, 3, 'Viaje rápido con aire acondicionado', 1, 1, 0, '2 maletas grandes'),
    (2, 2, 2, 'Viaje sin mascotas', 0, 1, 0, '1 maleta mediana'),
    (3, 3, 4, 'Acepta mascotas y tiene espacio para equipaje', 1, 1, 0, '4 maletas pequeñas'),
    (4, 4, 2, 'Viaje largo con aire acondicionado', 0, 1, 0, '2 maletas grandes');

-- Insert routine travels
INSERT INTO viajes_rutina (id, viajes_id, comunidad_id, frecuencia)
VALUES 
    (1, 1, 1, 'Diario'), -- Viaje de Cesar en UNNE
    (2, 2, 1, 'Semanal'), -- Viaje de Emilio en UNNE
    (3, 3, 2, 'Mensual'); -- Viaje de Francisco en Cuenca del Plata

-- Insert travel requests (solicitudes)
INSERT INTO solicitudes (id, viajes_id, conductor_id, solicitante_id, notificado, aceptado)
VALUES 
    (1, 1, 1, 2, 1, 1), -- Emilio solicita viaje a Cesar
    (2, 2, 2, 3, 1, 1), -- Francisco solicita viaje a Emilio
    (3, 3, 3, 4, 1, 0); -- Diego solicita viaje a Francisco

-- Insert fuel types (combustibles)
INSERT INTO combustibles (id, nombre, precio, descripcion)
VALUES 
    (1, 'Nafta', 150.00, 'Combustible común para autos de media gama'),
    (2, 'Gasoil', 130.00, 'Combustible diesel para vehículos pesados'),
    (3, 'Eléctrico', 90.00, 'Energía para vehículos eléctricos recargables');


	-- Select all data from the comunidad table
SELECT * FROM comunidad;

-- Select all data from the usuarios table
SELECT * FROM usuarios;

-- Select all data from the usuarios_detalle table
SELECT * FROM usuarios_detalle;

-- Select all data from the usuarios_comunidad table
SELECT * FROM usuarios_comunidad;

-- Select all data from the viajes table
SELECT * FROM viajes;

-- Select all data from the viajes_detalle table
SELECT * FROM viajes_detalle;

-- Select all data from the viajes_rutina table
SELECT * FROM viajes_rutina;

-- Select all data from the solicitudes table
SELECT * FROM solicitudes;

-- Select all data from the combustibles table
SELECT * FROM combustibles;
