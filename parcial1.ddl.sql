
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