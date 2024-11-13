# Proyecto de Estudio

### Desarrollo de una aplicación de viajes compartidos: `Viajate`

**Asignatura**: Bases de Datos I (Facultad de Ciencias Exactas y Naturales - Universidad Nacional del Nordeste)

**Integrantes**:
- **Huici, Cesar Raúl**
- **Barrios, Emilio Farid**
- **Leiva, Francisco Emanuel**
- **Gauto, Diego Ignacio**

**Año**: 2024

---

## ÍNDICE

1. [Introducción](#introducción)
2. [Marco Conceptual o Referencial](#marco-conceptual-o-referencial)
3. [Metodología Seguida](#metodología-seguida)
4. [Desarrollo del Tema / Presentación de Resultados](#desarrollo-del-tema--presentación-de-resultados)
5. [Conclusiones](#conclusiones)
6. [Bibliografía](#bibliografía)

---

## CAPÍTULO I: INTRODUCCIÓN

### Tema
Este proyecto se enfoca en el desarrollo de **Viajate**, una aplicación para la organización de viajes compartidos. Su objetivo es conectar a personas que desean compartir trayectos en sus vehículos particulares, optimizando recursos y reduciendo costos y emisiones de carbono.

### Definición o Planteamiento del Problema
El problema identificado es la falta de una plataforma centralizada que permita a los usuarios coordinar viajes compartidos de manera eficiente y segura. Esto genera inconvenientes como altos costos de transporte, mayor congestión vehicular y un impacto ambiental significativo debido al uso individual de vehículos. **Viajate** busca resolver estos problemas proporcionando una solución que reduzca los costos de transporte y las emisiones de gases de efecto invernadero.

### Objetivos
- **Objetivo General**: Crear una plataforma de viajes compartidos que facilite la conexión entre usuarios que buscan compartir trayectos similares.
- **Objetivos Específicos**:
  - Desarrollar un backend robusto que permita la gestión de usuarios, viajes y solicitudes.
  - Optimizar la base de datos para un almacenamiento eficiente y seguro de la información.
  - Implementar funcionalidades que faciliten la creación y gestión de viajes compartidos.
  - Mejorar una base de datos ya creada en la aplicacion.

---

## CAPÍTULO II: MARCO CONCEPTUAL O REFERENCIAL

El desarrollo de Viajate como un sistema de gestión de viajes compartidos requiere la implementación de funcionalidades esenciales que garantizan la eficiencia, seguridad y adaptabilidad del sistema a las diversas necesidades de sus usuarios. Al ser una plataforma destinada a coordinar trayectos compartidos, Viajate debe ofrecer un diseño robusto que permita el manejo seguro de información personal, la optimización de consultas para un acceso ágil a los datos, y la flexibilidad necesaria para adaptarse a diferentes patrones de uso. A continuación, se presentan los aspectos clave que guían su diseño.

1. **Manejo de Json en sql**: Importancia de reducir el uso individual de vehículos y promover opciones compartidas.
2. **Permisos y Roles**: Conceptos clave para el diseño de bases de datos eficientes y seguras.
3. **Optimizacion de consultas atraves de indices**: Metodologías y buenas prácticas para el diseño de APIs RESTful con Golang.
4. **TEMA 2: PROCEDIMIENTOS Y FUNCIONES ALMACENADAS**:
La implementación de procedimientos y funciones almacenadas en Viajate es fundamental para mantener una plataforma eficiente, segura y capaz de manejar operaciones complejas de manera estructurada. Estas herramientas permiten encapsular la lógica de negocio directamente en la base de datos, lo cual facilita la gestión de transacciones, reduce el margen de error en las operaciones y asegura la consistencia de los datos.

Procedimientos Almacenados en Viajate
Los procedimientos almacenados en SQL Server son conjuntos de instrucciones SQL que se guardan y ejecutan en el servidor. En Viajate, los procedimientos almacenados se utilizan para gestionar operaciones clave que requieren un control riguroso, como la creación y eliminación de usuarios, la gestión de reservas y la administración de viajes. Estos procedimientos permiten que todas las operaciones se realicen de forma segura y eficiente, al reducir la interacción directa con las tablas y centralizar la lógica de negocio.

Ventajas de los Procedimientos Almacenados
Optimización del Tráfico de Red: Al ejecutar la lógica de negocio en el servidor, los procedimientos almacenados minimizan el tráfico de datos entre el cliente y la base de datos, mejorando el rendimiento de la plataforma.
Seguridad y Control: Los procedimientos almacenados limitan el acceso directo a las tablas de la base de datos, permitiendo que los usuarios ejecuten acciones específicas sin exponer la estructura interna de los datos.
Reutilización de Código: Los procedimientos pueden ser reutilizados en distintas áreas de la aplicación, lo que asegura la consistencia y facilita el mantenimiento de la lógica.
Mantenimiento Simplificado: Las actualizaciones en la lógica se realizan directamente en el procedimiento, sin requerir modificaciones en el código del cliente.
Rendimiento Mejorado: Los procedimientos almacenados se compilan una vez y pueden reutilizar su plan de ejecución, optimizando el rendimiento en consultas repetitivas.
Ejemplo en Viajate
InsertarUsuario: Este procedimiento permite registrar un nuevo usuario en la base de datos, validando previamente que el correo electrónico sea único para evitar duplicados.

![alt text](image.png)

BorrarUsuario: Este procedimiento elimina un usuario y todos los datos relacionados, como reservas y solicitudes, asegurando que no queden registros huérfanos.

![alt text](image-1.png)

Funciones Almacenadas en Viajate
Las funciones almacenadas permiten realizar cálculos específicos y retornar un valor que puede ser utilizado directamente en consultas SQL. En Viajate, las funciones son útiles para realizar operaciones como el cálculo de la edad de un usuario, la cantidad de reservas realizadas o el costo promedio de los viajes de un conductor. Estas funciones ayudan a reducir la carga en el cliente, permitiendo que cálculos complejos se realicen directamente en la base de datos.

Ventajas de las Funciones en Viajate
Cálculos y Consultas Personalizadas: Las funciones permiten realizar cálculos específicos dentro de las consultas SQL, lo cual es útil para generar estadísticas y personalizar la información.
Reutilización de Lógica: Al encapsular cálculos en funciones, se pueden reutilizar de manera uniforme en toda la base de datos, manteniendo la coherencia en los resultados.
Facilidad de Uso en Consultas: Las funciones pueden ser usadas en cláusulas SELECT, WHERE, entre otras, permitiendo integrarlas en diversas consultas de manera sencilla.

Ejemplo en Viajate
CalcularEdad: Calcula la edad de un usuario a partir de su fecha de nacimiento, lo cual es útil para obtener datos demográficos en la aplicación.

![alt text](image-2.png)

CantidadReservasUsuario: Cuenta el número de reservas realizadas por un usuario, proporcionando un dato estadístico relevante para su perfil.

![alt text](image-3.png)

Esta función devuelve la edad del usuario, lo que puede ser útil en diversas consultas y cálculos sin necesidad de realizar operaciones adicionales en el frontend.

Comparación entre Procedimientos y Funciones

![alt text](image-4.png)
---

## CAPÍTULO III: METODOLOGÍA SEGUIDA

### Descripción de cómo se realizó el Trabajo Práctico
El desarrollo de la plataforma **Viajate** se centró en el diseño y creación del backend utilizando Golang como lenguaje de programación y MySQL como sistema de gestión de bases de datos. Se trabajó en diferentes fases:

1. **Definición de Requisitos**: Identificación de las necesidades de los usuarios y las funcionalidades clave que debía cubrir la plataforma.
2. **Diseño de la Arquitectura**: Estructuración del sistema mediante el uso de una base de datos relacional con MySQL y la creación de APIs RESTful con Golang.
3. **Desarrollo del Backend**: Implementación de funcionalidades clave como el registro de usuarios, creación de viajes y mensajería interna.

### Herramientas Utilizadas
- **Golang**: Lenguaje de programación eficiente para la creación de APIs.
- **MySQL**: Sistema de gestión de bases de datos relacional.
- **Postman**: Herramienta para probar y documentar las APIs desarrolladas.
- **Cursos en línea y ChatGPT**: Fuentes de conocimiento que permitieron adquirir las habilidades necesarias para el desarrollo del backend, complementando con ejemplos y asistencia técnica.
- **Google Forms**: Herramienta utilizada para realizar encuestas y recopilar datos de usuarios potenciales sobre sus necesidades de movilidad.

---

## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS

### Optimización de Consultas en la Base de Datos

#### Carga Masiva de Datos
Realizar una carga masiva de por lo menos un millón de registros en la tabla 'viajes'.

```sql

-- Declaramos una variable para controlar el bucle
DECLARE @contador INT = 1;


-- Comienza el bucle WHILE
WHILE @contador <= 1000000
BEGIN
    -- Inserta un lote de 1000 registros en cada iteración
    INSERT INTO viajes (usuarios_id, vehiculo_id, origen, destino, fecha, hora, precio, asientos_disponibles)
    SELECT
        ((@contador + n - 1) % 4) + 1 AS usuarios_id,              -- IDs de usuarios que van del 1 al 4
        ((@contador + n - 1) % 2) + 1 AS vehiculo_id,              -- IDs de vehículos que van del 1 al 2
        CASE ((@contador + n - 1) % 10)                            -- Ciudades de origen en secuencia
            WHEN 0 THEN 'Corrientes'
            WHEN 1 THEN 'Resistencia'
            WHEN 2 THEN 'Formosa'
            WHEN 3 THEN 'Posadas'
            WHEN 4 THEN 'Buenos Aires'
            WHEN 5 THEN 'Rosario'
            WHEN 6 THEN 'Córdoba'
            WHEN 7 THEN 'Mendoza'
            WHEN 8 THEN 'Salta'
            ELSE 'Bariloche'
        END AS origen,
        CASE ((@contador + n) % 10)                                -- Ciudades de destino en secuencia
            WHEN 9 THEN 'Corrientes'
            WHEN 8 THEN 'Resistencia'
            WHEN 7 THEN 'Formosa'
            WHEN 6 THEN 'Posadas'
            WHEN 5 THEN 'Buenos Aires'
            WHEN 4 THEN 'Rosario'
            WHEN 3 THEN 'Córdoba'
            WHEN 2 THEN 'Mendoza'
            WHEN 1 THEN 'Salta'
            ELSE 'Bariloche'
        END AS destino,
        DATEADD(DAY, ((@contador + n - 1) % 365), '2024-01-01') AS fecha,  -- Fechas en 2024
        CONVERT(TIME, DATEADD(MINUTE, ((@contador + n - 1) % 1440), '00:00')) AS hora,  -- Horas del día
        CAST(8000 + ((@contador + n - 1) % 92000) * 1.0 AS DECIMAL(10,2)) AS precio,   -- Precio entre 8000 y 100000
        ((@contador + n - 1) % 5) + 1 AS asientos_disponibles -- Número de asientos disponibles entre 1 y 5
    FROM 
        (SELECT TOP 1000 ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n FROM sys.all_objects) AS Numbers;


    -- Incrementa el contador en 1000 para el siguiente lote
    SET @contador = @contador + 1000;
END;
```

#### Evaluación Inicial de la Consulta 
Realizar una búsqueda por periodo y registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.

```sql
-- Filtrar Registros por Fecha en la tabla 'viajes'
SELECT fecha, origen, destino, hora, precio, asientos_disponibles
FROM viajes 
WHERE fecha BETWEEN '2024-01-01' AND '2024-03-31';


-- Plan de Ejecución: Clustered Index Scan
-- Tiempo de Ejecución: 0.772s 
```

##### Salida:

![Captura de pantalla (154)](https://github.com/user-attachments/assets/41cbc9d5-ba3f-4638-bd17-a02b4bc5bc6c)

#### Implementación de Índices

- **Índice Agrupado en la Columna `fecha`**: Definir un índice agrupado sobre la columna fecha y repetir la consulta anterior.
Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.


```sql
-- Crear una copia de la tabla 'viajes' sin restricciones ni índices
SELECT fecha, origen, destino, hora, precio, asientos_disponibles
INTO viajes_sin_restricciones
FROM viajes;


-- Crear un índice agrupado en la columna 'fecha' en la tabla 'viajes_sin_restricciones'
CREATE CLUSTERED INDEX IX_fecha_viajes 
ON viajes_sin_restricciones(fecha);


-- Filtrar registros por fecha en 'viajes_sin_restricciones'
SELECT fecha, origen, destino, hora, precio, asientos_disponibles
FROM viajes_sin_restricciones 
WHERE fecha BETWEEN '2024-01-01' AND '2024-03-31';


-- Plan de Ejecución: Clustered Index Seek
-- Tiempo de Ejecución: 0.434s
```

##### Salida:

![Captura de pantalla (155)](https://github.com/user-attachments/assets/92cc1d78-a153-4933-a273-91a6b20fab4c)
  
- **Índice Agrupado con Múltiples Columnas**: Definir otro índice agrupado sobre la columna 'fecha' en la tabla 'viajes' que además incluya las columnas seleccionadas 
y repetir la consulta anterior. Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.


```sql
CREATE CLUSTERED INDEX IX_fecha_viajes
ON viajes_sin_restricciones (fecha, origen, destino, hora, precio, asientos_disponibles);


-- Repetir la consulta para observar los cambios en el plan de ejecución y tiempo de respuesta
SELECT fecha, origen, destino, hora, precio, asientos_disponibles
FROM viajes_sin_restricciones 
WHERE fecha BETWEEN '2024-01-01' AND '2024-03-31';


-- Plan de Ejecución: Clustered Index Seek
-- Tiempo de Ejecución: 0.434s (registrar este valor)
```

##### Salida

![Captura de pantalla (156)](https://github.com/user-attachments/assets/ac6658c2-7013-4768-95ac-9033eeab8fd6)


**TEMA 2: "Procedimientos y Funciones Almacenadas en Viajate"**
La implementación de procedimientos y funciones almacenadas en Viajate ha sido una estrategia fundamental para gestionar las operaciones clave de la aplicación directamente en el servidor de base de datos. Al encapsular la lógica de negocio en estos elementos, Viajate logra mejorar la eficiencia, seguridad y coherencia de sus transacciones. Los procedimientos almacenados en Viajate permiten realizar operaciones complejas como la creación, modificación y eliminación de usuarios, así como el manejo de reservas y solicitudes de viaje, asegurando que la lógica de negocio se ejecute de forma segura y eficiente, reduciendo los errores y centralizando el control en un único punto.

Las funciones almacenadas, por su parte, facilitan cálculos específicos y el procesamiento de datos en consultas, como el cálculo de la edad de un usuario o el promedio de reservas de un conductor. Esto permite obtener datos precisos de manera optimizada y sin sobrecargar el procesamiento del cliente, mejorando la experiencia del usuario y el rendimiento de la aplicación.

Sin embargo, la centralización de la lógica en procedimientos y funciones también conlleva ciertos desafíos en el contexto de Viajate. Al depender de SQL Server, la portabilidad de la solución a otros sistemas de bases de datos se ve limitada, lo cual puede ser un obstáculo si se requiere migrar o integrar la aplicación en otros entornos. Además, el mantenimiento y la depuración de lógica almacenada pueden resultar más complejos en proyectos colaborativos y distribuidos, donde múltiples desarrolladores deben gestionar el código en la base de datos y asegurar la coherencia en los cambios.

En conclusión, el uso de procedimientos y funciones almacenadas en Viajate ha proporcionado una base sólida para la eficiencia y seguridad de las operaciones en el servidor, lo que es clave para el éxito de la aplicación. No obstante, es esencial evaluar continuamente su impacto en la flexibilidad y escalabilidad del sistema, considerando el equilibrio adecuado entre la eficiencia centralizada y la capacidad de adaptación del sistema para futuras expansiones.
#### Impacto en `Viajate`
Estas optimizaciones en la base de datos resultan fundamentales para **Viajate**, ya que permiten una experiencia de usuario más fluida, con consultas y búsquedas rápidas en una plataforma que maneja grandes volúmenes de información de viajes compartidos.

---

### Procedimientos y Funciones Almacenadas en `Viajate`

#### Procedimientos Almacenados
Los procedimientos almacenados en **Viajate** agrupan instrucciones SQL que ejecutan operaciones CRUD (Crear, Leer, Actualizar y Borrar) de manera controlada y eficiente, encapsulando la lógica de negocio en el servidor. A continuación, algunos ejemplos clave:

- **InsertarUsuario**: Valida la unicidad del correo antes de registrar un nuevo usuario, asegurando la integridad de los datos.
- **ModificarUsuario**: Permite actualizar la información de un usuario tras verificar su existencia, evitando modificaciones no válidas.
- **BorrarUsuario**: Elimina un usuario y sus datos dependientes, garantizando la consistencia de la base de datos al borrar en cascada.

**Ventajas de los Procedimientos Almacenados**:
- Mejoran el rendimiento al ejecutar la lógica en el servidor, reduciendo la carga en el cliente.
- Aumentan la seguridad al limitar el acceso directo a las tablas.
- Facilitan el mantenimiento al centralizar la lógica de negocio en un solo lugar.

#### Funciones Almacenadas
Las funciones almacenadas devuelven valores específicos y son útiles para cálculos en consultas SQL, permitiendo realizar operaciones complejas sin duplicar código en varias consultas. Ejemplos de funciones utilizadas en **Viajate** incluyen:

- **CalcularEdad**: Calcula la edad de un usuario, útil en reportes demográficos.
- **CantidadReservasUsuario**: Cuenta las reservas realizadas por un usuario, ideal para estadísticas de uso.
- **PrecioPromedioViajesUsuario**: Calcula el precio promedio de los viajes realizados por un usuario.

**Ventajas de las Funciones Almacenadas**:
- Permiten cálculos reutilizables en consultas SQL, mejorando la eficiencia del código.
- Ejecución directa en SQL, lo cual optimiza el rendimiento.
- Simplifican los filtrados y cálculos personalizados en consultas complejas.

#### Impacto en `Viajate`
La combinación de procedimientos y funciones almacenadas en **Viajate** mejora la eficiencia, seguridad y mantenibilidad del sistema. Estos elementos permiten una gestión de datos robusta, optimizada para consultas y reportes, lo cual es esencial en una plataforma que requiere de operaciones rápidas y seguras para satisfacer las necesidades de los usuarios de viajes compartidos.


###TEMA: Manejo de tipos de datos JSON en el Proyecto de Gestión de Viajes

¿Qué es JSON?
JSON (JavaScript Object Notation) es un formato de datos ligero y fácil de leer utilizado para almacenar y transferir datos estructurados. Es muy común en aplicaciones web, ya que permite un intercambio eficiente de información entre el servidor y la interfaz de usuario. JSON organiza los datos en una estructura de clave-valor, lo que facilita su interpretación tanto por humanos como por sistemas de procesamiento automático.

¿Por qué utilizamos JSON en este proyecto?
En este proyecto de gestión de viajes, JSON permite almacenar información adicional y no estructurada dentro de las tablas de una base de datos SQL Server. Aunque SQL es ideal para datos estructurados, el uso de JSON nos permite manejar datos semiestructurados que pueden variar entre registros, como las características detalladas de un viaje, preferencias de los usuarios, paradas de ruta, y más. Esto nos brinda flexibilidad sin la necesidad de modificar el esquema de la base de datos cada vez que se añade una nueva característica.

JSON en SQL Server
Aunque JSON no es una estructura de base de datos, SQL Server permite trabajar con datos en formato JSON. Podemos almacenar JSON en columnas de tipo NVARCHAR, ejecutar consultas sobre datos JSON específicos dentro de esas columnas y actualizar partes del JSON almacenado sin afectar el resto de la estructura. En este proyecto:

Los datos JSON se almacenan en una columna dedicada en la tabla viajes_datos.

La información de cada viaje, como paradas intermedias y preferencias de bebida, se guarda en JSON, manteniendo flexibilidad y adaptabilidad.

Mediante el uso de columnas calculadas e índices en SQL Server, optimizamos las consultas sobre propiedades específicas en el JSON, como la preferencia de bebida.

Ventajas de Usar JSON en el Proyecto

Flexibilidad: Permite almacenar información variable de los viajes sin modificar la estructura de la base de datos.
Compatibilidad con APIs y Frontend: JSON es un formato ideal para comunicarse con aplicaciones web y móviles, que consumen datos desde el backend en este formato.
Escalabilidad: Podemos añadir nuevas propiedades dentro del JSON sin requerir cambios en las tablas o en la estructura general de la base de datos.
Optimización en Consultas: Gracias al uso de columnas calculadas y la capacidad de indexar datos JSON específicos en SQL Server, logramos un rendimiento óptimo al consultar información de uso frecuente en el frontend.

Conclusion
JSON es un formato de intercambio de datos muy popular en el desarrollo web, especialmente útil en proyectos donde los datos pueden variar en estructura.
Su naturaleza independiente del lenguaje permite el intercambio de datos entre diferentes sistemas, facilitando la comunicación entre el backend y frontend.
En este proyecto de gestión de viajes, JSON proporciona una solución flexible y escalable para manejar detalles de los viajes, mientras SQL Server se encarga de almacenar y consultar datos de manera estructurada.
Las capacidades de SQL Server para manejar datos JSON enriquecen la funcionalidad de nuestras aplicaciones, al combinar lo mejor de los datos estructurados y semiestructurados en un solo sistema.


---

## CAPÍTULO V: CONCLUSIONES

**Viajate** es una plataforma digital diseñada para facilitar la organización de viajes compartidos entre usuarios, promoviendo la movilidad sostenible y la reducción de costos de transporte. Desarrollada por los cuatro integrantes de este proyecto —César Huici, Emilio Barrios, Francisco Leiva y Diego Gauto—, la aplicación surgió como una respuesta a la falta de soluciones eficientes para coordinar trayectos compartidos entre personas que realizan viajes similares. Al ser un proyecto en el que hemos estado trabajando activamente, elegimos **Viajate** como el tema de estudio para la asignatura Bases de Datos I, con el objetivo de mejorar su funcionalidad y optimizar la base de datos que sustenta su operación.

En esta primera entrega del trabajo final, hemos logrado aplicar los conocimientos adquiridos en la asignatura Bases de Datos I al proyecto **Viajate**, una plataforma diseñada para facilitar la organización de viajes compartidos entre usuarios. A través de este proceso, hemos podido optimizar y mejorar la estructura de nuestra base de datos, lo cual es clave para el funcionamiento eficiente de la aplicación.

**Viajate** está estructurada para gestionar varios aspectos esenciales del sistema de viajes compartidos, basados en el modelo entidad-relación presentado. 
Gracias a estas mejoras en la estructura de la base de datos, **Viajate** está mejor preparada para manejar la complejidad de los viajes compartidos y ofrecer a sus usuarios una plataforma más organizada y eficiente. La normalización de las tablas y la correcta relación entre las entidades aseguran que el sistema pueda crecer de manera escalable, manteniendo un alto nivel de rendimiento.

---

## BIBLIOGRAFÍA

1. **Título** - Autor(es), Fecha de Publicación, Editorial/Enlace.
2. **Título** - Autor(es), Fecha de Publicación, Editorial/Enlace.
3. **Título** - Autor(es), Fecha de Publicación, Editorial/Enlace.
4. **Título** - Autor(es), Fecha de Publicación, Editorial/Enlace.
5. **Título** - Autor(es), Fecha de Publicación, Editorial/Enlace.
