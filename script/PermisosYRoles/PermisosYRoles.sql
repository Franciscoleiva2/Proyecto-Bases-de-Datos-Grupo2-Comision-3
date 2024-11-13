use viajate;
-- ROLES Y USUARIOS

--- ********************* Permisos a nivel de usuarios ********************* 
-- Crear dos usuarios de base de datos.
-- Usuario 1: UsuarioAdmin
IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = 'UsuarioAdmin')
BEGIN
    CREATE LOGIN UsuarioAdmin WITH PASSWORD = 'admin';
    CREATE USER UsuarioAdmin FOR LOGIN UsuarioAdmin;
END

-- Usuario 2: Emilio
IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = 'Emilio')
BEGIN
    CREATE LOGIN Emilio WITH PASSWORD = 'barrios';
    CREATE USER Emilio FOR LOGIN Emilio;
END

-- A un usuario darle el permiso de administrador y al otro usuario solo permiso de lectura.
-- Se asigna rol de db_owner para permisos completos a UsuarioAdmin
ALTER ROLE db_owner ADD MEMBER UsuarioAdmin;
GO

-- Se asigna rol de solo lectura en toda la base de datos a Emilio
ALTER ROLE db_datareader ADD MEMBER Emilio;


-- Al usuario con permiso de solo lectura, darle permiso de ejecución sobre este procedimiento. 
-- Permitir que Emilio ejecute el procedimiento almacenado 'InsertarUsuario'
GRANT EXECUTE ON dbo.InsertarUsuario TO Emilio;

/* 
	 Realizar INSERT con sentencia SQL sobre la tabla del procedimiento con ambos usuarios.
	 Login con usuario ADMIN  --> Deberia funcionar correctamente.
	 Login con usuario EMILIO --> Esto debería fallar por falta de permisos de escritura.
*/
INSERT INTO usuarios (nombre, apellido, email, contraseña)
VALUES ('Victor', 'Zaracho', 'victor.zaracho@hotmail.com', 'password1234');

/* 
	Realizar un INSERT a través del procedimiento almacenado con el usuario con permiso de solo lectura
	Login con usuario EMILIO --> Esto debería fallar por falta de permisos de escritura.
*/

EXEC InsertarUsuario 
    @Nombre = 'Victor', 
    @Apellido = 'Zaracho', 
    @Email = 'victor.zaracho@viajate.com', 
    @Contrasena = 'password1234!';

--- ********************* Permisos a nivel de roles del DBMS ********************* 

-- Crear dos usuarios de base de datos
-- Usuario 1: UsuarioLector
IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = 'UsuarioLector')
BEGIN
    CREATE LOGIN UsuarioLector WITH PASSWORD = 'lector';
    CREATE USER UsuarioLector FOR LOGIN UsuarioLector;
END

-- Usuario 2: UsuarioSinPermiso
IF NOT EXISTS (SELECT * FROM sys.sql_logins WHERE name = 'UsuarioSinPermiso')
BEGIN
    CREATE LOGIN UsuarioSinPermiso WITH PASSWORD = 'sinpermiso';
    CREATE USER UsuarioSinPermiso FOR LOGIN UsuarioSinPermiso;
END

-- Crear un rol que solo permita la lectura de alguna de las tablas creadas.

-- Rol SoloLecturaViajes si no existe
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'SoloLecturaViajes')
BEGIN
    CREATE ROLE SoloLecturaViajes;
END

-- Permiso de lectura en la tabla "viajes" al rol SoloLecturaViajes
GRANT SELECT ON dbo.viajes TO SoloLecturaViajes;

-- Se asigna el rol de solo lectura a UsuarioLector
ALTER ROLE SoloLecturaViajes ADD MEMBER UsuarioLector;

-- Verificar el comportamiento de ambos usuarios 
-- (el que tiene permiso sobre el rol y el que no tiene), cuando intentan leer el contenido de la tabla

-- Ejecutar como UsuarioLector: Debería poder hacer SELECT en la tabla "viajes"
SELECT * FROM viajes;

-- Ejecutar como UsuarioSinPermiso: Debería fallar al intentar hacer SELECT en "viajes"
 SELECT * FROM viajes;