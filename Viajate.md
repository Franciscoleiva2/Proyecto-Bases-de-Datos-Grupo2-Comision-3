# Proyecto de Estudio

### Desarrollo de una aplicación de viajes compartidos: `Viajate`

**Asignatura**: Bases de Datos I (FaCENA-UNNE)

**Integrantes**:
- **Huici, Cesar Raúl**
- **Barrios, Emilio Farid**
- **Leiva, Francisco Emanuel**
- **Gauto, Diego Ignacio**

**Año**: 2024

---

## CAPÍTULO I: INTRODUCCIÓN

### Caso de estudio

Este proyecto se enfoca en el desarrollo de **Viajate**, una aplicación para la organización de viajes compartidos. Su objetivo es conectar a personas que desean compartir trayectos en sus vehículos particulares, optimizando recursos y reduciendo costos y emisiones de carbono.

### Definición o planteamiento del problema

El problema identificado es la falta de una plataforma centralizada que permita a los usuarios coordinar viajes compartidos de manera eficiente y segura. Esto genera inconvenientes como altos costos de transporte, mayor congestión vehicular y un impacto ambiental significativo debido al uso individual de vehículos. **Viajate** busca resolver estos problemas proporcionando una solución que reduzca los costos de transporte y las emisiones de gases de efecto invernadero.

 <!-- CAPÍTULO II: MARCO CONCEPTUAL O REFERENCIAL
Este capítulo presenta el marco conceptual que sustenta el desarrollo de la aplicación, basándose en las tecnologías actuales y en la importancia de la movilidad sostenible. Se exploran temas como:

Tema 1:

Tema 2:  -->

<!-- CAPÍTULO III: METODOLOGÍA SEGUIDA
a) Cómo se realizó el Trabajo Práctico
El desarrollo de la plataforma Viajate se centró en el diseño y creación del backend utilizando Golang como lenguaje de programación y MySQL como sistema de base de datos. Se trabajó en diferentes fases:

Definición de requisitos: Identificación de las necesidades de los usuarios y las funcionalidades clave que debía cubrir la plataforma.
Diseño de la arquitectura: Estructuración del sistema mediante el uso de una base de datos relacional con MySQL y la creación de APIs RESTful con Golang.
Desarrollo del backend: Implementación de las funcionalidades clave como el registro de usuarios, creación de viajes y mensajería interna.
b) Herramientas (Instrumentos y procedimientos)
Para la implementación y el desarrollo del backend, se utilizaron las siguientes herramientas:

Golang: Lenguaje de programación eficiente para la creación de APIs.
MySQL: Sistema de gestión de bases de datos relacional.
Postman: Herramienta para probar y documentar las APIs desarrolladas.
Cursos en línea y ChatGPT: Fuentes de conocimiento que permitieron adquirir las habilidades necesarias para el desarrollo del backend, complementando con ejemplos y asistencia técnica.
Google Forms: Herramienta utilizada para realizar encuestas y recopilar datos de usuarios potenciales sobre sus necesidades de movilidad. -->

---

## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS

En este capítulo, se detallan los resultados obtenidos a lo largo del desarrollo del backend de **Viajate**. Se muestra cómo se implementaron las funcionalidades clave y cómo se estructuró la base de datos.

### Diagrama relacional

[Haz clic aquí para ver el Diagrama relacional](https://drawsql.app/teams/viajate/diagrams/viajate-v1)

### Diccionario de datos

[Haz clic aquí para ver el Diccionario de datos](https://github.com/Franciscoleiva2/Proyecto-Bases-de-Datos-Grupo2-Comision-3/blob/main/doc/diccionario_datos.pdf)

<!-- ### Desarrollo TEMA 1 "----"

Fusce auctor finibus lectus, in aliquam orci fermentum id. Fusce sagittis lacus ante, et sodales eros porta interdum. Donec sed lacus et eros condimentum posuere. 

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_1](script/tema01_nombre_tema)

### Desarrollo TEMA 2 "----"

Proin aliquet mauris id ex venenatis, eget fermentum lectus malesuada. Maecenas a purus arcu. Etiam pellentesque tempor dictum. 

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_2](script/tema02_nombre_tema)

...  -->

<!-- CAPÍTULO V: CONCLUSIONES
Viajate es una plataforma digital diseñada para facilitar la organización de viajes compartidos entre usuarios, promoviendo la movilidad sostenible y la reducción de costos de transporte. Desarrollada por los cuatro integrantes de este proyecto —César Huici, Emilio Barrios, Francisco Leiva y Diego Gauto—, la aplicación surgió como una respuesta a la falta de soluciones eficientes para coordinar trayectos compartidos entre personas que realizan viajes similares. Al ser un proyecto en el que hemos estado trabajando activamente, elegimos Viajate como el tema de estudio para la asignatura Bases de Datos I, con el objetivo de mejorar su funcionalidad y optimizar la base de datos que sustenta su operación.

En esta primera entrega del trabajo final, hemos logrado aplicar los conocimientos adquiridos en la asignatura Bases de Datos I al proyecto Viajate, una plataforma diseñada para facilitar la organización de viajes compartidos entre usuarios. A través de este proceso, hemos podido optimizar y mejorar la estructura de nuestra base de datos, lo que es clave para el funcionamiento eficiente de la aplicación.

Viajate está estructurada para gestionar varios aspectos esenciales del sistema de viajes compartidos, basados en el modelo entidad-relación presentado. A continuación, se describe un panorama general de cómo funciona la aplicación y el alcance de las mejoras realizadas en la base de datos:

Gestión de usuarios: La plataforma permite que los usuarios se registren y gestionen sus perfiles a través de la entidad usuarios, que almacena información básica como nombre, correo electrónico y contraseñas. Además, mediante la tabla usuarios_detalle, se guarda información adicional como género, fecha de nacimiento y términos aceptados, mejorando la personalización de la plataforma.

Viajes y su detalle: La entidad viajes se utiliza para gestionar los trayectos creados por los usuarios, almacenando información clave como el origen, destino, fecha, hora y precio del viaje. El detalle adicional de cada viaje, como la disponibilidad de asientos, equipaje y si se aceptan mascotas, se gestiona a través de la entidad viajes_detalle.

Solicitudes de viaje: Los usuarios pueden enviar solicitudes para unirse a un viaje mediante la entidad solicitudes, la cual guarda el estado de la solicitud (notificado, aceptado) y relaciona a los usuarios con los viajes.

Comunidades y viajes recurrentes: Uno de los grandes avances logrados durante esta etapa fue la incorporación de la entidad comunidad, que permite a los usuarios formar grupos o pertenecer a comunidades (por ejemplo, empleados de una empresa o estudiantes de una universidad). Esto facilita la creación de viajes compartidos entre personas que tienen un vínculo en común. Además, la nueva entidad viajes_rutina permite la planificación de viajes recurrentes o programados, lo cual es ideal para usuarios que realizan el mismo trayecto de forma regular, como ir al trabajo o a la universidad.

Gestión de combustibles: También se ha incorporado la entidad combustibles, que en futuras etapas permitirá calcular los costos de los viajes en función del tipo de combustible utilizado, añadiendo más precisión a la gestión de costos para los conductores.

Gracias a estas mejoras en la estructura de la base de datos, Viajate está mejor preparada para manejar la complejidad de los viajes compartidos y ofrecer a sus usuarios una plataforma más organizada y eficiente. La normalización de las tablas y la correcta relación entre las entidades aseguran que el sistema pueda crecer de manera escalable, manteniendo un alto nivel de rendimiento.

En resumen, esta primera etapa ha sido fundamental para consolidar la estructura de datos de Viajate, alineando su diseño con las necesidades del sistema y preparándolo para futuras funcionalidades. A medida que avancemos en el trabajo final, continuaremos optimizando la base de datos y explorando nuevas oportunidades para mejorar el funcionamiento de la plataforma. -->



<!-- ## BIBLIOGRAFÍA DE CONSULTA

 1. List item
 2. List item
 3. List item
 4. List item
 5. List item
 -->
