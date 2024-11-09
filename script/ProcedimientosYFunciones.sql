CREATE PROCEDURE InsertarUsuario
    @Nombre VARCHAR(255),
    @Apellido VARCHAR(255),
    @Email VARCHAR(255),
    @Contrasena VARCHAR(255)
AS
BEGIN
    INSERT INTO usuarios (nombre, apellido, email, contraseña)
    VALUES (@Nombre, @Apellido, @Email, @Contrasena);
END;


CREATE PROCEDURE ModificarUsuario
    @UsuarioID INT,
    @Nombre VARCHAR(255) = NULL,
    @Apellido VARCHAR(255) = NULL,
    @Email VARCHAR(255) = NULL,
    @Contrasena VARCHAR(255) = NULL
AS
BEGIN
    UPDATE usuarios
    SET nombre = COALESCE(@Nombre, nombre),
        apellido = COALESCE(@Apellido, apellido),
        email = COALESCE(@Email, email),
        contraseña = COALESCE(@Contrasena, contraseña)
    WHERE id = @UsuarioID;
END;


CREATE PROCEDURE BorrarUsuario
    @UsuarioID INT
AS
BEGIN
    DELETE FROM usuarios
    WHERE id = @UsuarioID;
END;


CREATE FUNCTION dbo.CalcularEdad(@FechaNacimiento DATE) 
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @FechaNacimiento, GETDATE()) -
           CASE WHEN MONTH(@FechaNacimiento) > MONTH(GETDATE()) OR 
                     (MONTH(@FechaNacimiento) = MONTH(GETDATE()) AND DAY(@FechaNacimiento) > DAY(GETDATE())) 
                THEN 1 ELSE 0 END;
END;


CREATE FUNCTION dbo.CantidadSolicitudesUsuario(@UsuarioID INT) 
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM solicitudes WHERE solicitante_id = @UsuarioID);
END;



CREATE FUNCTION dbo.PrecioPromedioViajes() 
RETURNS DECIMAL(10, 2)
AS
BEGIN
    RETURN (SELECT AVG(precio) FROM viajes);
END;


-- Insertar un usuario
EXEC InsertarUsuario 'Juan', 'Perez', 'juan.perez@correo.com', 'contraseñaSegura123';

-- Modificar el nombre del usuario con id 1
EXEC ModificarUsuario @UsuarioID = 1, @Nombre = 'Juan Carlos';

-- Borrar el usuario con id 1
EXEC BorrarUsuario @UsuarioID = 1;

ALTER PROCEDURE ModificarUsuario
    @UsuarioID INT,
    @Nombre VARCHAR(255) = NULL,
    @Apellido VARCHAR(255) = NULL,
    @Email VARCHAR(255) = NULL,
    @Contrasena VARCHAR(255) = NULL
AS
BEGIN
    -- Verificar si el usuario existe antes de actualizar
    IF EXISTS (SELECT 1 FROM usuarios WHERE id = @UsuarioID)
    BEGIN
        UPDATE usuarios
        SET nombre = COALESCE(@Nombre, nombre),
            apellido = COALESCE(@Apellido, apellido),
            email = COALESCE(@Email, email),
            contraseña = COALESCE(@Contrasena, contraseña)
        WHERE id = @UsuarioID;
    END
    ELSE
    BEGIN
        PRINT 'Usuario no encontrado.';
    END
END;
