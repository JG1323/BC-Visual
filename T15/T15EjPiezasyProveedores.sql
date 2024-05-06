INSERT INTO piezas (codPieza) VALUES 

INSERT INTO proveedores (idProveedor) VALUES 
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

INSERT INTO piezas (nombre) VALUES
('Pieza-Motor'),
('Pieza-Frenos'),
('Pieza-Volante'),
('Pieza-Luces'),
('Pieza-Bujias'),
('Pieza-Retrovisor'),
('Pieza-Transmisión'),
('Pieza-Luces de freno'),
('Pieza-Asiento'),
('Pieza-Cambio de marchas');

INSERT INTO proveedores (nombre) VALUES
('Proveedores-Bosch'),
('Proveedores-A.B.S'),
('Proveedores-Ridex'),
('Proveedores-Stark'),
('Proveedores-TRW'),
('Proveedores-ATE'),
('Proveedores-Brembo'),
('Proveedores-Vaico'),
('Proveedores-Mapco'),
('Proveedores-Valeo');

INSERT INTO suministra (codPieza, idProveedor, precio) VALUES
(1, 1, 200.25),
(2, 2, 69.99),
(3, 3, 82.05),
(4, 4, 3000.00),
(5, 5, 252.55),
(6, 6, 120.34),
(7, 7, 230.34),
(8, 8, 527.76),
(9, 9, 199.56),
(10, 10, 246.88);