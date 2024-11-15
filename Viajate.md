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

1. **MANEJO DE PERMISOS A NIVEL DE USUARIOS DE BASE**:
   Permisos
   Un permiso es una autorización que se otorga a un usuario o grupo para que puedan realizar acciones específicas en un objeto dentro de la base de datos, como una tabla, vista o procedimiento almacenado. Los permisos permiten llevar a cabo operaciones como SELECT, INSERT, UPDATE y DELETE, así como otros más específicos, como EXECUTE para ejecutar procedimientos almacenados o ALTER para modificar la estructura de la base de datos.
   Al asignar estos permisos, los administradores pueden gestionar el acceso que tiene cada usuario a diferentes áreas de la base de datos, definiendo qué acciones pueden realizar en ellas, y así asegurar la protección y privacidad de la información.

Roles
Un rol es una colección de permisos que se agrupa y se asigna a varios usuarios de forma conjunta. En lugar de dar permisos específicos a cada usuario individualmente, los roles permiten reunir permisos comunes bajo un solo nombre, lo que facilita la administración de accesos. Por ejemplo, un rol de "Administrador" puede incluir permisos para lectura y escritura en todas las tablas, mientras que un rol de "Usuario" podría tener solo permisos de lectura. Los roles pueden ser predefinidos por el sistema (como el rol db_owner en SQL Server) o creados por los administradores para ajustar los accesos a las necesidades específicas de la organización.

2. **Manejo de tipos de datos JSON en el Proyecto de Gestión de Viajes**

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

3. **Optimizacion de consultas atraves de indices**: Metodologías y buenas prácticas para el diseño de APIs RESTful con Golang.
4. **Procedimientos y funciones almacenadas**:
   En el contexto de una aplicación de viajes compartidos como Viajate, la implementación de procedimientos y funciones almacenadas en la base de datos aporta una capa fundamental de eficiencia, control y seguridad en la gestión de datos. Estos elementos se convierten en pilares de la lógica de negocio, permitiendo la centralización de operaciones en el servidor de la base de datos y proporcionando ventajas específicas que optimizan tanto el rendimiento como la integridad del sistema.

   Procedimientos Almacenados en Bases de Datos
   Los procedimientos almacenados son conjuntos de instrucciones SQL almacenados en el servidor que ejecutan operaciones complejas, como el registro y actualización de usuarios o la creación de reservas de viaje. En Viajate, su utilización se enfoca en tareas críticas que requieren asegurar la consistencia y la seguridad de los datos en cada transacción.

   La centralización de la lógica de negocio en procedimientos almacenados en el servidor permite que la aplicación Viajate mantenga un flujo constante y seguro de datos, reduciendo el margen de error y evitando accesos directos a las tablas. Los procedimientos almacenados también ayudan a minimizar el tráfico de red, ya que las operaciones se ejecutan directamente en el servidor, lo que resulta en un rendimiento optimizado al manejar grandes volúmenes de datos.

   Funciones Almacenadas en Bases de Datos
   Las funciones almacenadas permiten realizar cálculos y transformaciones sobre los datos, devolviendo un valor específico que puede ser reutilizado en distintas consultas. En Viajate, las funciones almacenadas facilitan cálculos como la cantidad de reservas realizadas por un usuario o el cálculo de la edad de un usuario según su fecha de nacimiento. Estas funciones, al ejecutarse en el servidor, optimizan la eficiencia del sistema al reducir la carga de procesamiento en el cliente, integrándose en las consultas SQL de forma flexible y consistente.

   Las funciones almacenadas en Viajate contribuyen significativamente a la personalización y generación de estadísticas dentro del sistema. Al encapsular operaciones específicas, las funciones almacenadas aseguran que las consultas y cálculos se realicen de manera uniforme y con coherencia, mejorando la experiencia del usuario final sin comprometer la seguridad de los datos.

---

## Optimizacion de consultas a través de indices

---

Este capítulo presenta los conceptos y referencias clave que sustentan la investigación y el desarrollo del tema de optimización de bases de datos. Los fundamentos teóricos aquí expuestos ayudan a entender las razones detrás de las técnicas de optimización aplicadas y sitúan el problema en el contexto de la eficiencia y rendimiento en sistemas de información. A continuación, se exponen los conceptos relevantes y un marco referencial sobre tecnologías de optimización de datos, su importancia en la era de la información, y las prácticas avanzadas utilizadas para mejorar el rendimiento de aplicaciones de alto volumen de datos.

## Índices en Bases de Datos

Los índices en bases de datos son estructuras auxiliares que optimizan el acceso a la información al reducir el tiempo de búsqueda de registros. Se comportan como un catálogo que permite localizar rápidamente un conjunto de datos específico sin tener que recorrer toda la tabla. Aunque aumentan la velocidad de consultas `SELECT`, pueden impactar negativamente en las operaciones de modificación de datos como `INSERT`, `DELETE` y `UPDATE`, ya que el índice debe mantenerse actualizado para reflejar los cambios en la tabla.

### Tipos de Índices

1. **Índice Clustered (Agrupado)**
   - Organiza los datos físicamente en el disco según el orden de la clave de índice.
   - Solo puede haber un índice _clustered_ por tabla, ya que determina el orden físico de los datos.
   - Ideal para consultas que involucran rangos de datos (por ejemplo, fechas), ya que los datos se almacenan de manera secuencial.
2. **Índice Nonclustered (No Agrupado)**
   - Crea una copia ordenada del índice sin cambiar el orden físico de los datos.
   - Permite múltiples índices _nonclustered_ en una tabla, útiles para optimizar consultas específicas.
   - Cada índice _nonclustered_ contiene un puntero que hace referencia al registro original en la tabla.

### Plan de Ejecución Estimado

Es un análisis que muestra cómo el motor de la base de datos planea ejecutar una consulta antes de que esta se ejecute realmente. Este plan detalla los pasos y recursos que la base de datos utilizará para obtener los datos solicitados, como la selección de índices, operaciones de búsqueda (Index Seek), exploración (Index Scan), o combinación (Join), y el orden de las operaciones.

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

1. **TEMA 1: Optimizacion de consultas a traves de indices**:
2. **TEMA 3: Optimizacion de consultas a traves de indices**:

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

![Captura de pantalla (156)](https://github.com/user-attachments/assets/ac6658c2-7013-4768-95ac-9033eeab8fd6) 4. **TEMA 1: MANEJO DE PERMISOS A NIVEL DE USUARIOS DE BASE**

### Configuración de Permisos a Nivel de Usuario

Al intentar realizar una operación de inserción directa con el usuario de solo lectura, se observó que este no tenía autorización debido a sus restricciones.
Se confirmó la efectividad de los permisos a nivel de usuario para limitar el acceso a datos críticos y mantener la integridad de los datos.

### Implementación y Comportamiento de Roles de Lectura

Se creó un rol llamado “SoloLecturaViajes”, el cual solo tiene permisos de lectura sobre la tabla "viajes".
Este rol se asignó a un usuario específico (UsuarioLector), y se verificó su acceso comparándolo con otro usuario sin asignación de rol.
Se observó que el usuario asignado al rol de “SoloLecturaViajes” pudo realizar consultas a la tabla, mientras que el usuario sin este rol fue denegado al intentar ejecutar la misma consulta.

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

MANEJO DE JSON EN SQL 
En este capítulo, se presentan los datos y métodos implementados en la base de datos de Viajate para gestionar información compleja y semiestructurada mediante JSON. Esto permitió almacenar detalles adicionales de cada viaje, como características y preferencias de los usuarios, de manera flexible y accesible.

Para cumplir con los objetivos del proyecto, se utilizó SQL Server, aprovechando sus capacidades para manejar datos en formato JSON. Esto permitió una estructura adaptable para almacenar datos variables en cada viaje sin necesidad de modificar el esquema general de la base de datos. La creación de una tabla viajes_datos con una columna JSON facilitó el almacenamiento de información de características adicionales, como el estado de "equipaje permitido", "mascotas permitidas", "opciones de fumar", y una lista de "paradas".

Implementación de la Columna JSON
Se creó la tabla viajes_datos con una columna datos de tipo NVARCHAR(MAX) con validación JSON. Esta columna almacena los detalles adicionales de cada viaje en un formato fácil de interpretar por la aplicación y de manipular en el backend. Cada JSON contiene secciones como "caracteristicas" y "preferencias", que detallan configuraciones del viaje.

Ejemplos de datos JSON insertados:
![alt text](image-5.png)
Consultas y Manipulación de Datos JSON
JSON_VALUE y JSON_QUERY. Estas funciones permiten extraer valores específicos y estructuras JSON completas dentro de una columna JSON, respectivamente.

JSON_VALUE: Esta función permite recuperar valores simples, como texto, números o booleanos, desde una columna JSON. Es ideal para extraer datos individuales en un formato plano.
![alt text](image-6.png)  

Creacion de usuarios y asignacion de permisos
![alt text](image-8.png)

Asignacion de roles
![alt text](image-9.png)
Optimización mediante Columnas Calculadas e Índices
Para optimizar el rendimiento de las consultas sobre datos JSON, se creó la columna calculada bebida_preferida, que extrae la preferencia de bebida de cada viaje. Luego, se agregó un índice a esta columna para mejorar el rendimiento en consultas frecuentes. Esto facilitó el acceso rápido a propiedades JSON específicas sin afectar la flexibilidad de almacenamiento.
![alt text](image-7.png)


## CAPÍTULO V: CONCLUSIONES

### **TEMA 1: MANEJO DE PERMISOS A NIVEL DE USUARIOS DE BASE**

En la administración de la base de datos, es una muy buena práctica la implementación de permisos y roles para asegurar el acceso controlado a los datos y proteger la integridad de la información almacenada.
Asignar permisos puntuales a nivel de usuario permite controlar actividades específicas, mientras que los roles simplifican o “generalizan” la gestión de permisos en entornos con múltiples usuarios.

### **TEMA 3: Optimizacion de consultas a traves de indices**:

#### Análisis de los Resultados

El análisis detallado de los planes de ejecución reveló que el uso de índices _clustered_ y _nonclustered_, así como de índices compuestos, mejoró sustancialmente la rapidez de las consultas de búsqueda y filtrado. No obstante, se observó que el incremento en la cantidad de índices tuvo un impacto en las operaciones de modificación (`INSERT`, `DELETE`, `UPDATE`), lo cual es una consideración importante al equilibrar el rendimiento de consultas con la eficiencia de las operaciones de actualización.

#### Evaluación del Cumplimiento de los Objetivos

Los objetivos principales del trabajo, que incluían mejorar la eficiencia de consultas en grandes volúmenes de datos y evaluar el impacto de los índices en el rendimiento, fueron alcanzados. La implementación de los índices permitió optimizar las consultas sin comprometer significativamente la usabilidad y la integridad de la base de datos, cumpliendo con los requisitos de eficiencia planteados al inicio del trabajo.

#### Reflexión Final

La optimización de consultas mediante índices es una herramienta poderosa en la gestión de bases de datos, especialmente en sistemas que manejan grandes volúmenes de información. Sin embargo, es necesario equilibrar cuidadosamente los beneficios de los índices en las consultas con el impacto en las operaciones de modificación. Esta experiencia resalta la importancia de un diseño de base de datos flexible y de pruebas continuas para adaptarse a las necesidades de rendimiento de la aplicación.

En conclusión, los hallazgos de este trabajo confirman la efectividad de las técnicas de optimización mediante índices en la mejora del rendimiento de consultas y subrayan la relevancia de una evaluación constante para ajustar y mantener la eficiencia en el manejo de datos. Estos resultados sientan las bases para futuras mejoras y adaptaciones en sistemas de información que requieran manejar datos a gran escala.

\***\*TEMA 4: "Procedimientos y Funciones Almacenadas en Viajate"\*\***
La implementación de procedimientos y funciones almacenadas en Viajate ha sido un tema de análisis, considerando su potencial para mejorar la eficiencia y seguridad en la gestión de datos críticos. Estas herramientas permiten encapsular la lógica de negocio directamente en la base de datos, centralizando operaciones complejas como la gestión de usuarios y reservas. En teoría, los procedimientos y funciones almacenadas ofrecen ventajas significativas en rendimiento y seguridad, especialmente al reducir el tráfico de red y al limitar el acceso directo a las tablas, proporcionando una capa adicional de control en el servidor.

Sin embargo, en el contexto de Viajate, que actualmente utiliza un ORM para gestionar las consultas, surgen algunas dudas sobre si esta metodología es la más adecuada. Viajate es una aplicación en constante evolución, con un equipo de trabajo distribuido y cambios frecuentes en la lógica de negocio. La implementación de procedimientos y funciones almacenadas puede plantear desafíos en cuanto a la flexibilidad y la colaboración, ya que centralizar la lógica en el servidor puede dificultar el mantenimiento y la actualización continua en un entorno de desarrollo ágil y distribuido.

En conclusión, aunque el uso de procedimientos y funciones almacenadas ofrece beneficios técnicos en rendimiento y seguridad, su implementación en Viajate debe ser evaluada cuidadosamente. Dado el ritmo de cambios y la colaboración remota en el proyecto, el enfoque actual mediante ORM sigue siendo una metodología adecuada, ya que permite una mayor flexibilidad y facilita la gestión conjunta de los cambios en el código. A medida que la aplicación madure y las necesidades de rendimiento se estabilicen, se podría considerar la implementación de lógica almacenada para ciertas operaciones clave, equilibrando así la eficiencia con la capacidad de adaptación del sistema.

**Viajate** es una plataforma digital diseñada para facilitar la organización de viajes compartidos entre usuarios, promoviendo la movilidad sostenible y la reducción de costos de transporte. Desarrollada por los cuatro integrantes de este proyecto —César Huici, Emilio Barrios, Francisco Leiva y Diego Gauto—, la aplicación surgió como una respuesta a la falta de soluciones eficientes para coordinar trayectos compartidos entre personas que realizan viajes similares. Al ser un proyecto en el que hemos estado trabajando activamente, elegimos **Viajate** como el tema de estudio para la asignatura Bases de Datos I, con el objetivo de mejorar su funcionalidad y optimizar la base de datos que sustenta su operación.

En esta primera entrega del trabajo final, hemos logrado aplicar los conocimientos adquiridos en la asignatura Bases de Datos I al proyecto **Viajate**, una plataforma diseñada para facilitar la organización de viajes compartidos entre usuarios. A través de este proceso, hemos podido optimizar y mejorar la estructura de nuestra base de datos, lo cual es clave para el funcionamiento eficiente de la aplicación.

**Viajate** está estructurada para gestionar varios aspectos esenciales del sistema de viajes compartidos, basados en el modelo entidad-relación presentado.
Gracias a estas mejoras en la estructura de la base de datos, **Viajate** está mejor preparada para manejar la complejidad de los viajes compartidos y ofrecer a sus usuarios una plataforma más organizada y eficiente. La normalización de las tablas y la correcta relación entre las entidades aseguran que el sistema pueda crecer de manera escalable, manteniendo un alto nivel de rendimiento.


TEMA 4: "Manejo de Tipos de Datos JSON en Viajate"

En Viajate, usar JSON en la base de datos ha permitido almacenar información adicional, como preferencias de viaje, de manera flexible y sin modificar la estructura de la base de datos. Esto es útil en una plataforma que cambia constantemente.

Aunque JSON facilita esta flexibilidad, puede hacer que algunas consultas sean más lentas. Para mejorar el rendimiento, se agregaron índices y columnas calculadas en las propiedades JSON que se usan con más frecuencia. En resumen, el uso de JSON en Viajate permite manejar datos de forma flexible y eficiente, ayudando a que la plataforma siga creciendo y mejorando.
---

## BIBLIOGRAFÍA

1. **Título** - Autor(es), Fecha de Publicación, Editorial/Enlace.
2. **Título** - Autor(es), Fecha de Publicación, Editorial/Enlace.
3. **Título** - Autor(es), Fecha de Publicación, Editorial/Enlace.
4. **Título** - Autor(es), Fecha de Publicación, Editorial/Enlace.
5. **Título** - Autor(es), Fecha de Publicación, Editorial/Enlace.
