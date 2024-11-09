CREATE DATABASE viajate1;
GO

USE viajate1;
GO

-- Tabla: usuarios
CREATE TABLE usuarios (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    contraseña VARCHAR(255) NOT NULL
);

-- Tabla: usuarios_detalle
CREATE TABLE usuarios_detalle (
    id INT PRIMARY KEY IDENTITY(1,1),
    usuarios_id INT,
    telefono VARCHAR(20),
    genero VARCHAR(10),
    terminos BIT NOT NULL,
    fecha_nacimiento DATE,
    CONSTRAINT FK_usuarios_detalle_usuarios FOREIGN KEY (usuarios_id) REFERENCES usuarios(id)
);

-- Tabla: comunidad
CREATE TABLE comunidad (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
);

-- Tabla: usuarios_comunidad (relación entre usuarios y comunidad)
CREATE TABLE usuarios_comunidad (
    usuarios_id INT,
    comunidad_id INT,
    CONSTRAINT PK_usuarios_comunidad PRIMARY KEY (usuarios_id, comunidad_id),
    CONSTRAINT FK_usuarios_comunidad_usuarios FOREIGN KEY (usuarios_id) REFERENCES usuarios(id),
    CONSTRAINT FK_usuarios_comunidad_comunidad FOREIGN KEY (comunidad_id) REFERENCES comunidad(id)
);

-- Tabla: viajes
CREATE TABLE viajes (
    id INT PRIMARY KEY IDENTITY(1,1),
    usuarios_id INT,
    origen VARCHAR(255) NOT NULL,
    destino VARCHAR(255) NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_viajes_usuarios FOREIGN KEY (usuarios_id) REFERENCES usuarios(id)
);

-- Tabla: viajes_rutina (relación para viajes rutinarios compartidos)
CREATE TABLE viajes_rutina (
    id INT PRIMARY KEY IDENTITY(1,1),
    viajes_id INT,
    comunidad_id INT,
    frecuencia VARCHAR(50) NOT NULL, -- Ejemplo: "Diario", "Semanal"
    CONSTRAINT FK_viajes_rutina_viajes FOREIGN KEY (viajes_id) REFERENCES viajes(id),
    CONSTRAINT FK_viajes_rutina_comunidad FOREIGN KEY (comunidad_id) REFERENCES comunidad(id)
);

-- Tabla: viajes_detalle
CREATE TABLE viajes_detalle (
    id INT PRIMARY KEY IDENTITY(1,1),
    viajes_id INT,
    asientos INT NOT NULL,
    descripcion TEXT,
    mascotas BIT NOT NULL,
    is_available BIT NOT NULL,
    cancelado BIT NOT NULL,
    equipaje VARCHAR(255),
    CONSTRAINT FK_viajes_detalle_viajes FOREIGN KEY (viajes_id) REFERENCES viajes(id)
);

-- Tabla: solicitudes
CREATE TABLE solicitudes (
    id INT PRIMARY KEY IDENTITY(1,1),
    viajes_id INT,
    conductor_id INT,
    solicitante_id INT,
    notificado BIT NOT NULL,
    aceptado BIT NOT NULL,
    CONSTRAINT FK_solicitudes_viajes FOREIGN KEY (viajes_id) REFERENCES viajes(id),
    CONSTRAINT FK_solicitudes_conductor FOREIGN KEY (conductor_id) REFERENCES usuarios(id),
    CONSTRAINT FK_solicitudes_solicitante FOREIGN KEY (solicitante_id) REFERENCES usuarios(id)
);

-- Tabla: combustibles
CREATE TABLE combustibles (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    descripcion TEXT
);
