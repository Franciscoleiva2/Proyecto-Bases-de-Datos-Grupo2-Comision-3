--CREATE DATABASE viajate_nf;
USE viajate_nf;
GO

-- Tabla: usuarios
CREATE TABLE usuarios (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    contraseña VARCHAR(255) NOT NULL,
    fecha_registro DATE NOT NULL DEFAULT GETDATE(),
    calificacion DECIMAL(2, 1) DEFAULT 5.0 -- Calificación promedio del usuario
);

-- Tabla: tipos_genero
CREATE TABLE tipos_genero (
    id INT PRIMARY KEY IDENTITY(1,1),
    genero VARCHAR(10) NOT NULL UNIQUE -- Ejemplo: "Masculino", "Femenino", "Otro"
);

-- Tabla: perfiles_usuarios
CREATE TABLE perfiles_usuarios (
    id INT PRIMARY KEY IDENTITY(1,1),
    usuario_id INT NOT NULL,
    telefono VARCHAR(20),
    genero_id INT,
    fecha_nacimiento DATE,
    biografia TEXT,
    foto_url VARCHAR(255),
    CONSTRAINT FK_perfil_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    CONSTRAINT FK_genero_usuario FOREIGN KEY (genero_id) REFERENCES tipos_genero(id)
);

-- Tabla: comunidad
CREATE TABLE comunidad (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
);

-- Tabla intermedia: usuarios_comunidad
CREATE TABLE usuarios_comunidad (
    usuario_id INT NOT NULL,
    comunidad_id INT NOT NULL,
    fecha_union DATE NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_usuarios_comunidad PRIMARY KEY (usuario_id, comunidad_id),
    CONSTRAINT FK_usuarios_comunidad_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    CONSTRAINT FK_usuarios_comunidad_comunidad FOREIGN KEY (comunidad_id) REFERENCES comunidad(id)
);

-- Tabla: tipos_vehiculos
CREATE TABLE tipos_vehiculos (
    id INT PRIMARY KEY IDENTITY(1,1),
    tipo VARCHAR(50) NOT NULL UNIQUE -- Ejemplo: "Auto", "SUV", "Moto", etc.
);

-- Tabla: tipos_combustible
CREATE TABLE tipos_combustible (
    id INT PRIMARY KEY IDENTITY(1,1),
    tipo VARCHAR(50) NOT NULL UNIQUE -- Ejemplo: "Gasolina", "Diesel", "Eléctrico", etc.
);

-- Tabla: vehiculos
CREATE TABLE vehiculos (
    id INT PRIMARY KEY IDENTITY(1,1),
    usuario_id INT NOT NULL,
    tipo_vehiculo_id INT NOT NULL,
    tipo_combustible_id INT NOT NULL,
    marca VARCHAR(255) NOT NULL,
    modelo VARCHAR(255) NOT NULL,
    año INT NOT NULL,
    color VARCHAR(50),
    capacidad INT NOT NULL,
    CONSTRAINT FK_vehiculos_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    CONSTRAINT FK_tipo_vehiculo FOREIGN KEY (tipo_vehiculo_id) REFERENCES tipos_vehiculos(id),
    CONSTRAINT FK_tipo_combustible FOREIGN KEY (tipo_combustible_id) REFERENCES tipos_combustible(id)
);

-- Tabla: viajes
CREATE TABLE viajes (
    id INT PRIMARY KEY IDENTITY(1,1),
    usuario_id INT NOT NULL,
    vehiculo_id INT NOT NULL,
    origen VARCHAR(255) NOT NULL,
    destino VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    asientos_disponibles INT NOT NULL,
    duracion_estimada TIME,
    CONSTRAINT FK_viajes_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    CONSTRAINT FK_viajes_vehiculo FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(id)
);

-- Tabla: caracteristicas
CREATE TABLE caracteristicas (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL UNIQUE -- Ejemplo: "Mascotas permitidas", "Espacio para equipaje"
);

-- Tabla: viajes_caracteristicas
CREATE TABLE viajes_caracteristicas (
    viaje_id INT NOT NULL,
    caracteristica_id INT NOT NULL,
    CONSTRAINT PK_viajes_caracteristicas PRIMARY KEY (viaje_id, caracteristica_id),
    CONSTRAINT FK_viajes_caracteristicas_viaje FOREIGN KEY (viaje_id) REFERENCES viajes(id),
    CONSTRAINT FK_viajes_caracteristicas_caracteristica FOREIGN KEY (caracteristica_id) REFERENCES caracteristicas(id)
);

-- Tabla: estados_reserva
CREATE TABLE estados_reserva (
    id INT PRIMARY KEY IDENTITY(1,1),
    estado VARCHAR(50) NOT NULL UNIQUE -- Ejemplo: "Pendiente", "Confirmado", "Cancelado"
);

-- Tabla: reservas
CREATE TABLE reservas (
    id INT PRIMARY KEY IDENTITY(1,1),
    viaje_id INT NOT NULL,
    usuario_id INT NOT NULL,
    fecha_reserva DATE NOT NULL DEFAULT GETDATE(),
    asientos_reservados INT NOT NULL,
    estado_reserva_id INT NOT NULL,
    CONSTRAINT FK_reservas_viaje FOREIGN KEY (viaje_id) REFERENCES viajes(id),
    CONSTRAINT FK_reservas_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    CONSTRAINT FK_estado_reserva FOREIGN KEY (estado_reserva_id) REFERENCES estados_reserva(id)
);

-- Tabla: valores_calificacion
CREATE TABLE valores_calificacion (
    id INT PRIMARY KEY IDENTITY(1,1),
    valor INT NOT NULL CHECK (valor BETWEEN 1 AND 5) -- Rango de calificaciones
);

-- Tabla: valoraciones
CREATE TABLE valoraciones (
    id INT PRIMARY KEY IDENTITY(1,1),
    viaje_id INT NOT NULL,
    usuario_id INT NOT NULL,
    calificacion_id INT NOT NULL,
    comentario TEXT,
    fecha_valoracion DATE NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_valoraciones_viaje FOREIGN KEY (viaje_id) REFERENCES viajes(id),
    CONSTRAINT FK_valoraciones_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    CONSTRAINT FK_valoraciones_calificacion FOREIGN KEY (calificacion_id) REFERENCES valores_calificacion(id)
);
