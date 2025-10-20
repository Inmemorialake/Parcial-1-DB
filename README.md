# Servilimar DB — Parcial Práctico 1

**Curso:** 750006-C Bases de Datos  
**Estudiante:** Gerardo González  
**Profesor:** Jefferson A. Peña Torres  
**Universidad del Valle — 2025-II**

---

## 1. Descripción general

Proyecto correspondiente al Parcial Práctico 1 del curso Bases de Datos.  
Implementa el sistema de gestión de turnos “LiMar” utilizando PostgreSQL y pgAdmin, desplegados con Docker.  
Incluye scripts DDL y DML para la creación y carga de la base de datos.

---

## 2. Despliegue del entorno

### Requisitos
- Docker y Docker Compose instalados.
- Puerto 8080 libre para pgAdmin.

### Instrucciones
En la carpeta raíz del proyecto, ejecutar:

docker compose up -d

Verificar los contenedores:

docker ps

**Credenciales de acceso:**

| Servicio  | Dirección               | Usuario                | Contraseña |
|------------|------------------------|------------------------|-------------|
| pgAdmin    | http://localhost:8080  | usuario@servilimar.com | limar#123   |
| PostgreSQL | localhost:5432         | ulimar                 | ex4men_db   |

---

## 3. Conexión desde pgAdmin

1. Abrir pgAdmin y seleccionar **Add New Server**.  
2. En **General**, colocar el nombre: `PostgreSQL Servilimar`.  
3. En **Connection**, usar:
   - Host: `postgres`
   - Port: `5432`
   - Username: `ulimar`
   - Password: `ex4men_db`
4. Guardar y conectar.

---

## 4. Ejecución de scripts

1. En pgAdmin, abrir la base de datos `servilimar`.  
2. Ir a **Tools → Query Tool**.  
3. Ejecutar los scripts en orden:
   - `ddl.sql` → crea las tablas.  
   - `dml.sql` → inserta los datos.

Verificar con:

SELECT * FROM usuario;
SELECT * FROM servicio;
SELECT * FROM turno;

---

## 5. Reinicio del entorno

Para limpiar todos los datos y comenzar desde cero:

docker compose down -v
docker compose up -d

---

## 6. Evidencia

El video de sustentación muestra:
- Ejecución y verificación de contenedores.  
- Acceso a pgAdmin.  
- Creación de la base de datos.  
- Ejecución de los scripts DDL y DML.  
- Visualización de registros.

**Enlaces:**
- Video: [Video en Youtube](https://youtu.be/ScI6viNm5wc)  
- Informe: [Markdown del informe](Informe.md)

---

## 7. Estructura del repositorio

servilimar-db/
├── docker-compose.yml
├── ddl.sql
├── dml.sql
├── README.md
└── Informe_Sustentacion.md
