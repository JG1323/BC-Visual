INSERT INTO almacenes (lugar, capacidad) VALUES
    ('Reus', 2),
    ('Tarragona', 5),
    ('Salou', 3),
    ('Cambrils', 10),
    ('La Selva Del Camp', 15),
    ('Riudoms', 17),
    ('Valls', 20),
    ('Siurana', 30),
    ('Lleida', 6),
    ('Sitges', 7);

INSERT INTO cajas (nref, contenido, valor, almacen) VALUES
    ('CA001', 'Libros', 50.50, 1),
    ('CA002', 'Electrodomésticos', 980, 1),
    ('CA003', 'Ropa', 110.70, 3),
    ('CA004', 'Herramientas', 120, 4),
    ('CA005', 'Juguetes', 40.70, 5),
    ('CA006', 'Joyería', 1250, 1),
    ('CA007', 'Material de jardinería', 330, 7),
    ('CA008', 'Equipos de deporte', 110, 8),
    ('CA009', 'Material de oficina', 60, 9),
    ('CA010', 'Instrumentos musicales', 150, 10);


-- 3. 1 Obtener todos los almacenes
SELECT * FROM almacenes;

-- 3.2 Obtener todas las cajas cuyo contenido tenga un valor superior a 150
SELECT * FROM cajas WHERE valor > 150;

-- 3.3 Obtener los tipos de contenidos de las cajas
SELECT DISTINCT contenido FROM cajas; 

SELECT contenido FROM `cajas` GROUP BY contenido;

-- 3.4 Obtener el valor medio de todas las cajas.
SELECT ROUND(AVG(valor),2) AS "Valor medio (€)" FROM cajas;

--3.5 Obtener el valor medio de las cajas de cada almacen

SELECT almacen, ROUND(AVG(valor),2) AS `Valor medio de las cajas (€)` FROM cajas GROUP BY almacen;

--3.6.Obtener los códigos de los almacenes en los cuales el valor medio de las cajas sea superior a 150 €
SELECT almacen AS "Almacenes con valor medio >150€" FROM cajas GROUP BY almacen HAVING AVG(valor) > 150;

-- 3.7.Obtener el numero de referencia de cada caja junto con el nombre de la ciudad en el que se encuentra.
SELECT nref AS "Número de referéncia", lugar AS "Ciudad" 
FROM cajas c INNER JOIN almacenes a 
ON c.almacen=a.codigo;

-- 3.8.Obtener el numero de cajas que hay en cada almacén.
SELECT almacen, COUNT(*)
FROM cajas
GROUP BY almacen;

-- Aparecen todos los almacenes aunque no tengan cajas
SELECT codigo, COUNT(nref), lugar
FROM almacenes a LEFT JOIN cajas c
ON a.codigo = c.almacen
GROUP BY codigo;

--3.9.Obtener los códigos de los almacenes que están saturados (los almacenes donde el numero de cajas es superior a la capacidad)
SELECT a.lugar AS "Almacenes que superan su capacidad"
FROM almacenes a
WHERE capacidad <
(SELECT COUNT(*)
FROM cajas c
WHERE c.almacen = a.codigo);

-- 3.10.Obtener los numeras de referencia de las cajas que están en Bilbao.
SELECT c.nref AS "Cajas en Salou"
FROM cajas c RIGHT JOIN almacenes a 
ON c.almacen = a.codigo
WHERE a.lugar = 'Salou';

SELECT c.nref AS "Cajas en Salou"
FROM almacenes a LEFT JOIN cajas c 
ON c.almacen = a.codigo
WHERE a.lugar = 'Salou';

SELECT nref
FROM cajas
WHERE almacen IN
(SELECT codigo
FROM almacenes
WHERE `lugar` = 'Bilbao');

-- 3.11 Insertar un nuevo almacén en Barcelona con capacidad para 3 cajas.
INSERT INTO almacenes (codigo, nombre, lugar, capacidad) VALUES 
    (12,'Almacén L', 'Barcelona', 3);

-- 3.12 Insertar una nueva caja con número de referencia 'H5RT', con contenido 'Papel', valor 200, situada en el almacén 2.
INSERT INTO cajas (num_ref, contenido, valor, almacen) VALUES
    (13, 'Papel', 200, 2);

-- 3.13 Rebajar el valor de todas las cajas un 15%.
UPDATE cajas SET valor = valor * 0.85;

-- 3.14 Rebajar un 20% el valor de todas las cajas cuyo valor sea superior al valor medio de todas las cajas.
UPDATE cajas SET valor = valor * 0.8 WHERE valor > (SELECT AVG(valor) FROM cajas); 

-- 3.15 Eliminar todas las cajas cuyo valor sea inferior a 100€.
DELETE FROM cajas WHERE valor < 100;

-- 3.16 Vaciar el contenido de los almacenes que están saturados. 
DELETE FROM almacenes WHERE codigo IN (SELECT almacen FROM cajas GROUP BY almacen 
HAVING COUNT(*) > (SELECT capacidad FROM almacenes WHERE almacenes.codigo = cajas.almacen));