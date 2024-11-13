-- CREATE DATABASE viajate;
--CREATE DATABASE viajate_t;

USE viajate;
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

-- Tabla: usuarios_detalles
CREATE TABLE usuarios_detalles (
    id INT PRIMARY KEY IDENTITY(1,1),
    usuarios_id INT NOT NULL,
    telefono VARCHAR(20),
    genero VARCHAR(40),
    fecha_nacimiento DATE,
    biografia TEXT,
    foto_url VARCHAR(255),
    CONSTRAINT FK_usuarios_detalles_usuarios FOREIGN KEY (usuarios_id) REFERENCES usuarios(id),
);

-- Tabla: comunidad
CREATE TABLE comunidades (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
);

-- Tabla intermedia: usuarios_comunidad
CREATE TABLE usuarios_comunidades (
    usuarios_id INT NOT NULL,
    comunidades_id INT NOT NULL,
    fecha_union DATE NOT NULL DEFAULT GETDATE(),
    CONSTRAINT PK_usuarios_comunidades PRIMARY KEY (usuarios_id, comunidades_id),
    CONSTRAINT FK_usuarios_comunidades_usuarios FOREIGN KEY (usuarios_id) REFERENCES usuarios(id),
    CONSTRAINT FK_usuarios_comunidades_comunidades FOREIGN KEY (comunidades_id) REFERENCES comunidades(id)
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
    CONSTRAINT FK_vehiculos_usuarios FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    CONSTRAINT FK_tipo_vehiculo FOREIGN KEY (tipo_vehiculo_id) REFERENCES tipos_vehiculos(id),
    CONSTRAINT FK_tipo_combustible FOREIGN KEY (tipo_combustible_id) REFERENCES tipos_combustible(id)
);

-- Tabla: viajes
CREATE TABLE viajes (
    id INT PRIMARY KEY IDENTITY(1,1),
    usuarios_id INT NOT NULL,
    vehiculo_id INT NOT NULL,
    origen VARCHAR(255) NOT NULL,
    destino VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    asientos_disponibles INT NOT NULL,
    duracion_estimada TIME,
    CONSTRAINT FK_viajes_usuarios FOREIGN KEY (usuarios_id) REFERENCES usuarios(id),
    CONSTRAINT FK_viajes_vehiculo FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(id)
);


-- Tabla: estados_reserva
CREATE TABLE estados_reserva (
    id INT PRIMARY KEY IDENTITY(1,1),
    estado VARCHAR(50) NOT NULL UNIQUE -- Ejemplo: "Pendiente", "Confirmado", "Cancelado"
);

-- Tabla: reservas
CREATE TABLE reservas (
    id INT PRIMARY KEY IDENTITY(1,1),
    viajes_id INT NOT NULL,
    usuarios_id INT NOT NULL,
    fecha_reserva DATE NOT NULL DEFAULT GETDATE(),
    asientos_reservados INT NOT NULL,
    estado_reserva_id INT NOT NULL,
    CONSTRAINT FK_reservas_viajes FOREIGN KEY (viajes_id) REFERENCES viajes(id),
    CONSTRAINT FK_reservas_usuarios FOREIGN KEY (usuarios_id) REFERENCES usuarios(id),
    CONSTRAINT FK_estado_reserva FOREIGN KEY (estado_reserva_id) REFERENCES estados_reserva(id)
);

-- Tabla: valoraciones
CREATE TABLE valoraciones (
    id INT PRIMARY KEY IDENTITY(1,1),
    viajes_id INT NOT NULL,
    usuarios_id INT NOT NULL,
    calificacion INT NOT NULL,
    comentario TEXT,
    fecha_valoracion DATE NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_valoraciones_viajes FOREIGN KEY (viajes_id) REFERENCES viajes(id),
    CONSTRAINT FK_valoraciones_usuarios FOREIGN KEY (usuarios_id) REFERENCES usuarios(id),
);

CREATE TABLE roles (
    id INT PRIMARY KEY,
    rol VARCHAR(50) NOT NULL
);

ALTER TABLE usuarios_comunidades
ADD roles_id INT;

ALTER TABLE usuarios_comunidades
ADD CONSTRAINT FK_usuarios_comunidades_roles
FOREIGN KEY (roles_id) REFERENCES roles(id);
