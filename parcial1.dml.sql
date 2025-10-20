
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