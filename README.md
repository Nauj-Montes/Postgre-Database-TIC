# Postgre-Database-TIC

![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)
![Express.js](https://img.shields.io/badge/Express.js-000000?style=for-the-badge&logo=express&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

## Descripción

**Postgre-Database-TIC** es un proyecto universitario que busca implementar un sistema de CRM (Customer Relationship Management) utilizando una base de datos PostgreSQL. Este sistema gestiona la información de una organización, ofreciendo funcionalidades como gestión de contactos, seguimiento de interacciones, historial de actividades, gestión de ventas, automatización básica y generación de reportes.

## Desarrollo y Colaboración

Para contribuir al proyecto, sigue estos pasos:

1. Crea un fork del repositorio.
2. Crea un codespace para tu fork del repositorio.
3. *De hacer cambios en la base de datos ejecutar* `./scripts/export_db.sh`
4. Realiza tus cambios y realiza commits (`git commit -m 'Funcionalidad añadida en archivo.js'`).
5. Empuja tus cambios al repositorio fork (`git push`).
6. Crea un pull request en GitHub hacia el repositorio fuente.


    - **Email PgAdmin**: admin@mail.com
    - **Contaseña**: root
    - **Contraseña DB**: postgres

## Funcionalidades

- **Gestión de contactos**: CRUD de contactos con campos como nombre, correo, teléfono, dirección, etc.
- **Seguimiento de interacciones**: Registro y manejo de interacciones con los clientes, como llamadas y correos electrónicos.
- **Historial de actividades**: Seguimiento del historial de interacciones y actividades de los clientes.
- **Gestión de ventas**: Creación y manejo de oportunidades de venta y su progreso.
- **Automatización básica**: Tareas automatizadas para mejorar la eficiencia del sistema.
- **Reporting básico**: Generación de reportes sobre diferentes aspectos del CRM.

## Tecnologías

El proyecto utiliza las siguientes tecnologías y herramientas:

- **PostgreSQL**: Base de datos relacional para almacenar datos de CRM.
- **Node.js**: Entorno de ejecución para construir la aplicación de servidor.
- **Express**: Framework para desarrollar aplicaciones web con Node.js.
- **JavaScript**: Lenguaje de programación principal para la lógica del servidor.
- **Faker**: Biblioteca para generar datos de prueba y simulación.
- **Boom**: Biblioteca para manejar errores HTTP.
- **Pool**: Para la conexión eficiente a la base de datos PostgreSQL.
- **Sequelize**: Para comprobación de tipo de datos de los modelos.


### Explicación de la Estructura

- **config**: Configuración de la base de datos y otros aspectos del entorno.
- **middlewares**: Funciones de middleware para manejar errores y autenticación.
- **controllers**: Controladores que manejan las solicitudes HTTP y ejecutan la lógica de negocio.
- **models**: Modelos que representan las entidades y realizan operaciones en la base de datos.
- **routes**: Define los endpoints de la API y asocia rutas con controladores.
- **services**: Implementa la lógica de negocio y operaciones sobre los datos.
- **utils**: Utilidades y funciones auxiliares.

## Instalación

Proceso automatizado.

## Uso

La aplicación estará disponible en `http://localhost:3000` por defecto. Puedes realizar solicitudes a los endpoints definidos para interactuar con el sistema CRM.

### Endpoints Principales

- **Contactos**: `/api/contacts`
- **Interacciones**: `/api/interactions`
- **Ventas**: `/api/sales`
- **Reportes**: `/api/reports`

## Licencia

![License](https://img.shields.io/badge/license-MIT-blue.svg)

## Docs
- [Instalar Insomnia](https://insomnia.rest/download)
