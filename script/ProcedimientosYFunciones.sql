-- Procedimiento para Insertar un Usuario
CREATE PROCEDURE InsertarUsuario
    @Nombre VARCHAR(255),
    @Apellido VARCHAR(255),
    @Email VARCHAR(255),
    @Contrasena VARCHAR(255),
    @Calificacion DECIMAL(2,1) = 5.0
AS
BEGIN
    IF EXISTS (SELECT 1 FROM usuarios WHERE email = @Email)
    BEGIN
        PRINT 'Error: El correo electrónico ya está registrado.';
        RETURN;
    END

    INSERT INTO usuarios (nombre, apellido, email, contraseña, fecha_registro, calificacion)
    VALUES (@Nombre, @Apellido, @Email, @Contrasena, GETDATE(), @Calificacion);

    PRINT 'Usuario insertado exitosamente.';
END;
GO

-- Procedimiento para Modificar un Usuario
CREATE OR ALTER PROCEDURE ModificarUsuario
    @UsuarioID INT,
    @Nombre VARCHAR(255) = NULL,
    @Apellido VARCHAR(255) = NULL,
    @Email VARCHAR(255) = NULL,
    @Contrasena VARCHAR(255) = NULL,
    @Calificacion DECIMAL(2,1) = NULL
AS
BEGIN
    -- Verificar si el usuario existe antes de actualizar
    IF EXISTS (SELECT 1 FROM usuarios WHERE id = @UsuarioID)
    BEGIN
        UPDATE usuarios
        SET nombre = COALESCE(@Nombre, nombre),
            apellido = COALESCE(@Apellido, apellido),
            email = COALESCE(@Email, email),
            contraseña = COALESCE(@Contrasena, contraseña),
            calificacion = COALESCE(@Calificacion, calificacion)
        WHERE id = @UsuarioID;
        PRINT 'Usuario actualizado exitosamente.';
    END
    ELSE
    BEGIN
        PRINT 'Error: Usuario no encontrado.';
    END
END;
GO

-- Procedimiento para Borrar un Usuario
CREATE PROCEDURE BorrarUsuario
    @UsuarioID INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM usuarios WHERE id = @UsuarioID)
    BEGIN
        PRINT 'Error: Usuario no encontrado.';
        RETURN;
    END

    -- 1. Eliminar valoraciones y reservas relacionadas con los viajes del usuario
    DELETE FROM valoraciones WHERE viajes_id IN (SELECT id FROM viajes WHERE usuarios_id = @UsuarioID);
    DELETE FROM reservas WHERE viajes_id IN (SELECT id FROM viajes WHERE usuarios_id = @UsuarioID);

    -- 2. Eliminar los viajes que dependen del vehículo del usuario
    DELETE FROM viajes WHERE vehiculo_id IN (SELECT id FROM vehiculos WHERE usuario_id = @UsuarioID);

    -- 3. Eliminar otras dependencias de usuario en tablas relacionadas
    DELETE FROM usuarios_comunidades WHERE usuarios_id = @UsuarioID;
    DELETE FROM usuarios_detalles WHERE usuarios_id = @UsuarioID;

    -- 4. Eliminar los vehículos del usuario
    DELETE FROM vehiculos WHERE usuario_id = @UsuarioID;

    -- 5. Finalmente, eliminar el usuario de la tabla usuarios
    DELETE FROM usuarios WHERE id = @UsuarioID;

    PRINT 'Usuario eliminado exitosamente.';
END;
GO

-- Función para Calcular la Edad de un Usuario
CREATE FUNCTION dbo.CalcularEdad(@FechaNacimiento DATE) 
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @FechaNacimiento, GETDATE()) -
           CASE WHEN MONTH(@FechaNacimiento) > MONTH(GETDATE()) OR 
                     (MONTH(@FechaNacimiento) = MONTH(GETDATE()) AND DAY(@FechaNacimiento) > DAY(GETDATE())) 
                THEN 1 ELSE 0 END;
END;
GO

-- Función para Contar las Reservas de un Usuario
CREATE FUNCTION dbo.CantidadReservasUsuario(@UsuarioID INT) 
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM reservas WHERE usuarios_id = @UsuarioID);
END;
GO

-- Función para Calcular el Precio Promedio de Todos los Viajes de un Usuario
CREATE FUNCTION dbo.PrecioPromedioViajesUsuario(@UsuarioID INT) 
RETURNS DECIMAL(10, 2)
AS
BEGIN
    RETURN (
        SELECT AVG(precio) 
        FROM viajes 
        WHERE usuarios_id = @UsuarioID
    );
END;
GO

-- Pruebas de los Procedimientos y Funciones

-- Prueba del procedimiento InsertarUsuario
PRINT '--- Prueba de InsertarUsuario ---';
EXEC InsertarUsuario 'Laura', 'Sanchez', 'laura.sanchez@correo.com', 'securePass123';
EXEC InsertarUsuario 'Laura', 'Sanchez', 'laura.sanchez@correo.com', 'securePass123'; -- Prueba de error para email duplicado

-- Prueba del procedimiento ModificarUsuario (modificamos el usuario con id = 1)
PRINT '--- Prueba de ModificarUsuario ---';
EXEC ModificarUsuario @UsuarioID = 1, @Nombre = 'Laura Maria', @Apellido = 'Sanchez Lopez', @Calificacion = 4.8;
EXEC ModificarUsuario @UsuarioID = 999, @Nombre = 'No Existente'; -- Prueba de error para usuario no encontrado

-- Prueba del procedimiento BorrarUsuario (eliminamos el usuario con id = 3)
PRINT '--- Prueba de BorrarUsuario ---';
EXEC BorrarUsuario @UsuarioID = 3;
EXEC BorrarUsuario @UsuarioID = 999; -- Prueba de error para usuario no encontrado

-- Prueba de la función CalcularEdad
PRINT '--- Prueba de CalcularEdad ---';
DECLARE @FechaNacimiento DATE = (SELECT fecha_nacimiento FROM usuarios_detalles WHERE usuarios_id = 1);
SELECT dbo.CalcularEdad(@FechaNacimiento) AS Edad_Usuario1;

-- Prueba de la función CantidadReservasUsuario
PRINT '--- Prueba de CantidadReservasUsuario ---';
SELECT dbo.CantidadReservasUsuario(1) AS Cantidad_Reservas_Usuario1;

-- Prueba de la función PrecioPromedioViajesUsuario
PRINT '--- Prueba de PrecioPromedioViajesUsuario ---';
SELECT dbo.PrecioPromedioViajesUsuario(1) AS Precio_Promedio_Viajes_Usuario1;

-- Consultas de Verificación
PRINT '--- Consultas de Verificación ---';

-- Verificación de todos los datos de la tabla usuarios después de las operaciones CRUD
SELECT * FROM usuarios;

-- Verificación de todas las reservas en la tabla reservas
SELECT * FROM reservas;

-- Verificación de los detalles de los viajes en la tabla viajes
SELECT * FROM viajes;

-- Comprobación de los registros en la tabla comunidades
SELECT * FROM comunidades;

-- Verificación de detalles en la tabla usuarios_detalles
SELECT * FROM usuarios_detalles;

-- Verificación de los vehículos de los usuarios
SELECT * FROM vehiculos;

-- Verificación de las valoraciones realizadas
SELECT * FROM valoraciones;
