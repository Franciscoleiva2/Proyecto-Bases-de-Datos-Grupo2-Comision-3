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

---

## CAPÍTULO II: MARCO CONCEPTUAL O REFERENCIAL

En este capítulo se presenta el marco conceptual que sustenta el desarrollo de la aplicación, basándose en las tecnologías actuales y en la importancia de la movilidad sostenible. Se explorarán temas como:

1. **Movilidad Sostenible**: Importancia de reducir el uso individual de vehículos y promover opciones compartidas.
2. **Bases de Datos Relacionales**: Conceptos clave para el diseño de bases de datos eficientes y seguras.
3. **Desarrollo de APIs**: Metodologías y buenas prácticas para el diseño de APIs RESTful con Golang.

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

En este capítulo se detallan los resultados obtenidos a lo largo del desarrollo del backend de **Viajate**, mostrando cómo se implementaron las funcionalidades clave y cómo se estructuró la base de datos.

### Diagrama Relacional
[Haz clic aquí para ver el Diagrama Relacional](https://github.com/Franciscoleiva2/Proyecto-Bases-de-Datos-Grupo2-Comision-3/blob/main/doc/viajate_model.png)

### Diccionario de Datos
[Haz clic aquí para ver el Diccionario de Datos](https://github.com/Franciscoleiva2/Proyecto-Bases-de-Datos-Grupo2-Comision-3/blob/main/doc/diccionario_datos.pdf)

### Temas Desarrollados

1. **Gestión de Usuarios**: La plataforma permite que los usuarios se registren y gestionen sus perfiles a través de la entidad usuarios, que almacena información básica como nombre, correo electrónico y contraseñas. Además, mediante la tabla usuarios_detalle, se guarda información adicional como género, fecha de nacimiento y términos aceptados, mejorando la personalización de la plataforma.

2. **Viajes y su Detalle**: La entidad viajes se utiliza para gestionar los trayectos creados por los usuarios, almacenando información clave como el origen, destino, fecha, hora y precio del viaje. El detalle adicional de cada viaje, como la disponibilidad de asientos, equipaje y si se aceptan mascotas, se gestiona a través de la entidad viajes_detalle.

3. **Solicitudes de Viaje**: Los usuarios pueden enviar solicitudes para unirse a un viaje mediante la entidad solicitudes, la cual guarda el estado de la solicitud (notificado, aceptado) y relaciona a los usuarios con los viajes.

4. **Comunidades y Viajes Recurrentes**: Uno de los grandes avances logrados durante esta etapa fue la incorporación de la entidad comunidad, que permite a los usuarios formar grupos o pertenecer a comunidades (por ejemplo, empleados de una empresa o estudiantes de una universidad). Esto facilita la creación de viajes compartidos entre personas que tienen un vínculo en común. Además, la nueva entidad viajes_rutina permite la planificación de viajes recurrentes o programados, lo cual es ideal para usuarios que realizan el mismo trayecto de forma regular, como ir al trabajo o a la universidad.

5. **Gestión de Combustibles**: También se ha incorporado la entidad combustibles, que en futuras etapas permitirá calcular los costos de los viajes en función del tipo de combustible utilizado, añadiendo más precisión a la gestión de costos para los conductores.

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
