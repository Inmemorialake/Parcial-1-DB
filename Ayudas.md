# Ayudas para el parcial 1 de DB

## Esquema relacional

- **Usuario**(id varchar(50) PRIMARY KEY, codigo_postal_ciudad varchar(10) FK, nombre varchar(100), apellido varchar(100), tipo varchar(20), empleado_id varchar(50) (no se que poner aca, es un "id que pueden tener los empleados" segun el enunciado), cargo varchar(50) (solo para empleados), departamento varchar(50) (solo para empleados), producto varchar(100) (solo para proveedores))
- **Contacto_usuario**(Usuario_id varchar(50) FK, contacto varchar(100))
- **Condicion_usuario**(Usuario_id varchar(50) FK, condicion varchar(100))
- **Turno**(id varchar(50) PRIMARY KEY, Fecha date, Hora_inicio time, Hora_fin time, Usuario_id varchar(50) FK, Empleado_id varchar(50) FK)
- **Servicio**(id varchar(50) PRIMARY KEY, nombre varchar(100), descripcion varchar(255))
- **Turno_servicio**(Turno_id varchar(50) FK, Servicio_id varchar(50) FK, Estado varchar(20))
- **Notificacion**(User_id varchar(50) FK, medio varchar(50) FK, estado varchar(20), mensaje varchar(255), envio datetime)
- **Ciudad**(codigo_postal varchar(10) PRIMARY KEY, nombre varchar(100))

## DDL

```sql

-- Tabla Ciudad
CREATE TABLE Ciudad (
    codigo_postal VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla Usuario
CREATE TABLE Usuario (
    id VARCHAR(50) PRIMARY KEY,
    codigo_postal_ciudad VARCHAR(10),
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    tipo VARCHAR(20),
    empleado_id VARCHAR(50),
    cargo VARCHAR(50),
    departamento VARCHAR(50),
    producto VARCHAR(100),
    FOREIGN KEY (codigo_postal_ciudad) REFERENCES Ciudad(codigo_postal)
);

-- Tabla Contacto_usuario
CREATE TABLE Contacto_usuario (
    Usuario_id VARCHAR(50),
    contacto VARCHAR(100),
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
);

-- Tabla Condicion_usuario
CREATE TABLE Condicion_usuario (
    Usuario_id VARCHAR(50),
    condicion VARCHAR(100),
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
);

-- Tabla Servicio
CREATE TABLE Servicio (
    id VARCHAR(50) PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(255)
);

-- Tabla Turno
CREATE TABLE Turno (
    id VARCHAR(50) PRIMARY KEY,
    Fecha DATE,
    Hora_inicio TIME,
    Hora_fin TIME,
    Usuario_id VARCHAR(50),
    Empleado_id VARCHAR(50),
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (Empleado_id) REFERENCES Usuario(id)
);

-- Tabla Turno_servicio
CREATE TABLE Turno_servicio (
    Turno_id VARCHAR(50),
    Servicio_id VARCHAR(50),
    Estado VARCHAR(20),
    FOREIGN KEY (Turno_id) REFERENCES Turno(id),
    FOREIGN KEY (Servicio_id) REFERENCES Servicio(id)
);

-- Tabla Notificacion
CREATE TABLE Notificacion (
    User_id VARCHAR(50),
    medio VARCHAR(50),
    estado VARCHAR(20),
    mensaje VARCHAR(255),
    envio TIMESTAMP,
    FOREIGN KEY (User_id) REFERENCES Usuario(id)
);

```

## DML

```sql

-- Ciudades
INSERT INTO Ciudad (codigo_postal, nombre) VALUES
('1000', 'Ciudad A'),
('1001', 'Ciudad B'),
('1002', 'Ciudad C'),
('1003', 'Ciudad D'),
('1004', 'Ciudad E'),
('1005', 'Ciudad F'),
('1006', 'Ciudad G'),
('1007', 'Ciudad H'),
('1008', 'Ciudad I'),
('1009', 'Ciudad J');

-- Usuarios
INSERT INTO Usuario (id, codigo_postal_ciudad, nombre, apellido, tipo, empleado_id, cargo, departamento, producto) VALUES
('U123', '1000', 'Juan', 'Perez', 'cliente', NULL, NULL, NULL, NULL),
('U124', '1001', 'Maria', 'Gomez', 'empleado', 'E456', 'Gerente', 'Ventas', NULL),
('U125', '1002', 'Carlos', 'Lopez', 'proveedor', NULL, NULL, NULL, 'Productos Electronicos'),
('U126', '1003', 'Ana', 'Martinez', 'cliente', NULL, NULL, NULL, NULL),
('U127', '1004', 'Luis', 'Rodriguez', 'empleado', 'E457', 'Asistente', 'Atencion al Cliente', NULL),
('U128', '1005', 'Sofia', 'Fernandez', 'proveedor', NULL, NULL, NULL, 'Materiales de Oficina'),
('U129', '1006', 'Diego', 'Gonzalez', 'cliente', NULL, NULL, NULL, NULL),
('U130', '1007', 'Elena', 'Sanchez', 'empleado', 'E458', 'Supervisor', 'Logistica', NULL),
('U131', '1008', 'Javier', 'Ramirez', 'proveedor', NULL, NULL, NULL, 'Servicios de Limpieza'),
('U132', '1009', 'Laura', 'Torres', 'cliente', NULL, NULL, NULL, NULL);

-- Turnos
INSERT INTO Turno (id, Fecha, Hora_inicio, Hora_fin, Usuario_id, Empleado_id) VALUES
('T001', '2024-05-01', '10:00', '11:00', 'U123', 'U124'),
('T002', '2024-05-02', '12:00', '13:00', 'U126', 'U127'),
('T003', '2024-05-03', '14:00', '15:00', 'U129', 'U130'),
('T004', '2024-05-04', '09:00', '10:00', 'U132', 'U124'),
('T005', '2024-05-05', '11:00', '12:00', 'U123', 'U127'),
('T006', '2024-05-06', '13:00', '14:00', 'U126', 'U130'),
('T007', '2024-05-07', '15:00', '16:00', 'U129', 'U124'),
('T008', '2024-05-08', '10:00', '11:00', 'U132', 'U127'),
('T009', '2024-05-09', '12:00', '13:00', 'U123', 'U130'),
('T010', '2024-05-10', '14:00', '15:00', 'U126', 'U124');

-- Servicios
INSERT INTO Servicio (id, nombre, descripcion) VALUES
('S001', 'Corte de cabello', 'Servicio de corte de cabello profesional.'),
('S002', 'Manicura', 'Servicio de cuidado y embellecimiento de uñas.'),
('S003', 'Masaje relajante', 'Servicio de masaje para aliviar el estrés y la tensión muscular.'),
('S004', 'Tratamiento facial', 'Servicio de limpieza y cuidado de la piel del rostro.'),
('S005', 'Depilación', 'Servicio de depilación con cera caliente.'),
('S006', 'Peinado', 'Servicio de peinado para ocasiones especiales.'),
('S007', 'Coloración de cabello', 'Servicio de cambio de color de cabello.'),
('S008', 'Extensiones de pestañas', 'Servicio de aplicación de extensiones de pestañas.'),
('S009', 'Maquillaje profesional', 'Servicio de maquillaje para eventos y ocasiones especiales.'),
('S010', 'Tratamiento capilar', 'Servicio de nutrición y reparación del cabello.');

-- Turno_servicio
INSERT INTO Turno_servicio (Turno_id, Servicio_id, Estado) VALUES
('T001', 'S001', 'confirmado'),
('T002', 'S002', 'pendiente'),
('T003', 'S003', 'cancelado'),
('T004', 'S004', 'confirmado'),
('T005', 'S005', 'pendiente'),
('T006', 'S006', 'confirmado'),
('T007', 'S007', 'cancelado'),
('T008', 'S008', 'pendiente'),
('T009', 'S009', 'confirmado'),
('T010', 'S010', 'pendiente');

-- Notificaciones
INSERT INTO Notificacion (User_id, medio, estado, mensaje, envio) VALUES
('U123', 'email', 'enviado', 'Su turno ha sido confirmado.', '2024-04-25 09:00:00'),
('U126', 'sms', 'pendiente', 'Recuerde su turno mañana a las 12:00.', '2024-04-25 10:00:00'),
('U129', 'email', 'enviado', 'Su turno ha sido cancelado.', '2024-04-25 11:00:00'),
('U132', 'sms', 'pendiente', 'Su turno es el próximo sábado a las 10:00.', '2024-04-25 12:00:00'),
('U123', 'email', 'enviado', 'Gracias por elegir nuestros servicios.', '2024-04-25 13:00:00'),
('U126', 'sms', 'pendiente', 'No olvide traer su identificación.', '2024-04-25 14:00:00'),
('U129', 'email', 'enviado', 'Le esperamos en su próximo turno.', '2024-04-25 15:00:00'),
('U132', 'sms', 'pendiente', 'Confirme su asistencia al turno.', '2024-04-25 16:00:00'),
('U123', 'email', 'enviado', 'Su turno ha sido reprogramado.', '2024-04-25 17:00:00'),
('U126', 'sms', 'pendiente', 'Gracias por su preferencia.', '2024-04-25 18:00:00');
```
