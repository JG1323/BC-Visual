INSERT INTO fabricantes (nombre) VALUES
('Fabricante A'),
('Fabricante B'),
('Fabricante C'),
('Fabricante D'),
('Fabricante E'),
('Fabricante F'),
('Fabricante G'),
('Fabricante H'),
('Fabricante I'),
('Fabricante J');

INSERT INTO articulos (nombre, precio, fabricante) VALUES
('Artículo 1', 10.50, 1),
('Artículo 2', 20.25, 2),
('Artículo 3', 15.75, 3),
('Artículo 4', 30.00, 4),
('Artículo 5', 25.50, 5),
('Artículo 6', 18.75, 6),
('Artículo 7', 22.00, 7),
('Artículo 8', 35.25, 8),
('Artículo 9', 28.50, 9),
('Artículo 10', 40.00, 10);

-- 1.1 nombres de los productos de la tienda
SELECT nombre FROM articulos;
-- 1.2 nombres y precio de los productos de la tienda
SELECT nombre, precio FROM articulos;
-- 1.3 articulos con precio menor o igual a 200
SELECT nombre FROM articulos WHERE precio <= 200;
-- 1.4 AS para el alias y ROUND  para redondear entre 60 y 120
SELECT * FROM articulos WHERE precio BETWEEN 60 AND 120;
SELECT * FROM articulos WHERE precio >= 60 AND precio <=120;
-- 1.5 Precios en pesetas
SELECT nombre, precio, ROUND(precio * 166.386) AS `Precio Pesetas` FROM articulos;
-- 1.6 Precio medio de articulos
SELECT AVG(precio) AS `Precio Medio` FROM articulos;
-- 1.7 Actualizamos para que se repita el fabricante
-- UPDATE `articulos` SET `fabricante` = '2' WHERE `articulos`.`codart` = 5;
SELECT AVG(precio) AS `Precio Medio` FROM articulos WHERE fabricante = 2;
-- 1.8 Contamos registros, se suele utilizar el * para todos los campos o la clave primaria
SELECT COUNT(codart) AS `Número de articulos` FROM articulos WHERE precio >= 180;
SELECT COUNT(*) AS `Número de articulos` FROM articulos WHERE precio >= 180;

INSERT INTO articulos (nombre, precio, fabricante) VALUES
('Teléfono Inteligente iPhone 13', 799.99, 1),
('Computadora Portátil HP Spectre x360', 1349.99, 2),
('Televisor QLED Samsung 55"', 1299.99, 3),
('Cámara Mirrorless Nikon Z6', 1799.99, 4),
('Refrigerador Whirlpool French Door', 2399.99, 5),
('Secadora Siemens iQ500', 749.99, 6),
('Robot de Limpieza Roomba s9+', 899.99, 7),
('Bicicleta de montaña Specialized Turbo Levo', 4500.99, 8),
('Consola de videojuegos PS5', 499.99, 9),
('Monitor curvo Samsung 49"', 1099.99, 10);

-- 1.9.Obtener el nombre y precio de los artículos cuyo precio dea mayor o igual a 180 euros y ordenalos descendentemente por precio, y luego ascendentemente por nombre.
SELECT nombre, precio FROM articulos WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;

-- 1.10, 1.11
SELECT articulos.nombre AS "Artículo", fabricantes.nombre AS "Fabricante", precio AS "Precio de artículos por cada fabricante" FROM articulos, fabricantes WHERE articulos.fabricante = fabricantes.codigo;
SELECT fabricantes.nombre AS "Fabricante", articulos.nombre AS "Artículo",  precio AS "Precio de artículos por cada fabricante" FROM articulos INNER JOIN fabricantes ON articulos.fabricante = fabricantes.codigo ORDER BY fabricantes.nombre;

-- 1.12 Obtener el precio medio de los productos de cada fabricante, mostrando solo los códigos de fabricante.
SELECT fabricante AS "Código fabricante", ROUND(AVG(precio),2) AS "Media de precios" FROM articulos GROUP BY fabricante ORDER BY ROUND(AVG(precio),2);

-- 1.13.Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante.
SELECT f.nombre AS "Nombre fabricante", ROUND(AVG(a.precio),2) AS "Media de precios" FROM articulos a INNER JOIN fabricantes f
ON a.fabricante = f.codigo 
GROUP BY a.fabricante ORDER BY ROUND(AVG(a.precio),2);

-- 1.14 Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150
SELECT f.nombre AS "Fabricantes AVG(a.precio) >= 150", ROUND(AVG(a.precio),2) AS "Precio Medio"
FROM articulos a INNER JOIN fabricantes f 
ON a.fabricante = f.codigo
GROUP BY f.nombre
HAVING AVG(a.precio) >= 150
ORDER BY AVG(a.precio);

--1.15.Obtener el nombre y precio del artículo más barato.
SELECT nombre, precio FROM articulos
WHERE precio = (SELECT MIN(precio) FROM articulos);

SELECT nombre, precio FROM articulos ORDER BY precio LIMIT 1;

-- 1.16 Obtener una lista con el nombre y precio de los artículos más caros de cada proveedor (incluyendo el nombre del proveedor).
SELECT a.nombre AS "Articulo más caro", a.precio, f.nombre AS "por Fabricante"
FROM articulos a, fabricantes f
WHERE a.fabricante = f.codigo AND a.precio = 
(
    SELECT MAX(ar.precio)
    FROM articulos ar
    WHERE ar.fabricante = f.codigo
)
ORDER BY a.fabricante;

--1.17.Añadir un nuevo producto: Altavoces de 70 euros (del fabricante 2).
INSERT INTO articulos (nombre, precio, fabricante) 
VALUES ('Altavoces LG', 69.99, 2);

--1.18.Cambiar el nombre del producto 8 a 'Impresora Laser'.
UPDATE articulos 
SET nombre = 'Impresora Laser'
WHERE codart = 8;

-- 1.19.Aplicar un descuento del 10% (multiplicar el precio por0'9) a todos los productos.
UPDATE articulos 
SET precio = precio * 0.9;

-- 1.20.Aplicar un descuento de 10 euros a todos los productos cuyo precio sea mayor o igual.
UPDATE articulos
SET precio = precio - 10
WHERE precio >= 120;