INSERT INTO cajeros (cod_cajero, nom_apels) VALUES
(1, 'Roberto Molina'),
(2, 'Carmen Herrero'),
(3, 'Javier Moreno'),
(4, 'Isabel Jiménez'),
(5, 'Oscar Vargas'),
(6, 'Patricia Torres'),
(7, 'Diego Ramirez'),
(8, 'Claudia Navarro'),
(9, 'Ricardo Gil'),
(10, 'Sara Alonso');

INSERT INTO productos (cod_producto, nombre, precio) VALUES
(1, 'Producto A', 19),
(2, 'Producto B', 48),
(3, 'Producto C', 36),
(4, 'Producto D', 32),
(5, 'Producto E', 25),
(6, 'Producto F', 10),
(7, 'Producto G', 22),
(8, 'Producto H', 40),
(9, 'Producto I', 12),
(10, 'Producto J', 35);

INSERT INTO maquinas_registradoras (cod_maquina, piso) VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 3),
(5, 2),
(6, 1),
(7, 3),
(8, 2),
(9, 1),
(10, 3);

INSERT INTO venta (cod_cajero, cod_maquina, cod_producto) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);