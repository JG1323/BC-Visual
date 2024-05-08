INSERT INTO departamentos (nombre, presupuesto) VALUES 
('Marketing', 10000),
('Finanzas', 12000),
('Recursos Humanos', 11000),
('Ventas', 13000),
('Tecnología', 10500),
('Logística', 12500),
('Soporte', 11500),
('Desarrollo', 13500),
('Calidad', 14000),
('Administración', 14500);

INSERT INTO empleados (dni, nombre, apellidos, departamento) VALUES 
('88112233', 'Sara', 'Morales', 1),
('22445566', 'Adrian', 'Ramírez', 2),
('33778899', 'Clara', 'Navarro', 3),
('44667788', 'Alejandro', 'Gómez', 4),
('55001122', 'Patricia', 'López', 5),
('66334455', 'Miguel', 'Moreno', 6),
('77665544', 'Lucía', 'Vidal', 7),
('88996677', 'Fernando', 'Alonso', 8),
('99223344', 'Susana', 'Castro', 9),
('10011001', 'Luca', 'Pérez', 10);

--2.1 Obtener los apellidos de los empleados.
SELECT apellidos FROM empleados;   

--2.2 Obtener los apellidos de los empleados sin repeticiones
SELECT DISTINCT apellidos FROM empleados;

SELECT `apellidos` FROM `empleados` GROUP BY apellidos;

--2.3 Obtener todos los datos de los empleados que se apellidan 'López'
SELECT * FROM empleados WHERE apellidos = 'López'; 

/* Obtener todos los datos de los empleados que se apellidan 'López' 
 (usamos LIKE '%string%' porque tengo 2 apellidos en la columna de apellidos
 asi busco la cadena 'López' en la cadena 'Apellido1 Apellido2' 
 Si Apellido1 o Apellido2 = la cadena buscada, aparecerá en la consulta)
 La barra baja _ para López con acento o Lopez sin acento */
SELECT * FROM empleados WHERE apellidos LIKE '%L_pez%';

-- 2.4 Obtener todos los datos de los empleados que se apellidan 'López' Obtener y los que se apellidan 'Pérez'.
SELECT * FROM empleados WHERE apellidos = 'López' OR apellidos = 'Pérez'; 

-- 2.5.Obtener todos los datos de los empleados que trabajan para el departamento 14.
SELECT * FROM empleados WHERE departamento = 14; 
-- No tengo valores cambiaria el número de departamento o insertaria datos para el departamento 14

-- 2.6 Obtener todos los datos de los empleados que trabajan para el departamento 37 y para el departamento 77
SELECT * FROM empleados WHERE departamento IN (37, 77);
-- SELECT * FROM empleados WHERE departamento=37 OR departamento=77

--2.7 Obtener todos los datos de los empleados cuyo apellido comience por 'P'.
SELECT * FROM empleados
WHERE apellidos LIKE 'P%';

---2.8 Suma de presupuestos de departamentos
SELECT SUM(presupuesto) AS "Suma de presupuestos" FROM departamentos;

--2.9 Obtener el numero de empleados en cada departamento.
SELECT departamento, COUNT(*) AS "Número de empleados" FROM empleados GROUP by departamento;

--2.10.Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.
SELECT * FROM empleados;

-- 2.11 Obtener un listado completo de empleados, incluyendo el nombre y apellidos del empleado junto al nombre y presupuesto de su departamento.
SELECT empleados.nombre, empleados.apellidos, departamentos.nombre, departamentos.presupuesto 
FROM empleados e INNER JOIN departamentos d 
ON e.departamento = d.codigo;

--2.12 Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60.000 €.
SELECT e.nombre, e.apellidos 
FROM empleados e INNER JOIN departamentos d 
ON e.departamento = d.codigo
WHERE d.presupuesto >= 12000;

--2.13.Obtener los datos de los departamentos cuyo presupuesto es superior al presupues- to medio de todos los departamentos.
SELECT * FROM departamentos
WHERE presupuesto > (SELECT AVG(presupuesto) FROM departamentos);

-- 2.14 Obtener los nombres (únicamente los nombres) de los departamentos que tienen más de dos empleados.
SELECT d.nombre
FROM departamentos d
WHERE  2 < 
(
    SELECT COUNT(em.dni)
    FROM empleados em
    WHERE em.departamento = d.codigo
    GROUP BY em.departamento
)
GROUP BY d.nombre

SELECT d.nombre
FROM empleados e, departamentos d
WHERE e.departamento = d.codigo 
GROUP BY e.departamento
HAVING COUNT(e.dni) > 2;

SELECT d.nombre AS "Departamentos con más de 2 empleados"
FROM empleados e INNER JOIN departamentos d
ON e.departamento = d.codigo 
-- Equipara FK departamento con PK codigo
GROUP BY e.departamento
HAVING COUNT(e.dni) > 2;

--2.15 Añadir un nuevo departamento: 'Calidad', con presupuesto de 40.000 € y código11. Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI: 89267109
INSERT INTO departamentos (codigo, nombre, presupuesto) 
VALUES (11, 'Calidad', 40000);

-- Ejemplo para AUTO_INCREMENT
DELETE FROM departamentos WHERE `departamentos`.`codigo` = 16;
INSERT INTO departamentos (nombre, presupuesto) 
VALUES ('Otros', 150000);
UPDATE `departamentos` SET `codigo` = '16' WHERE `departamentos`.`codigo` = 17;

INSERT INTO empleados (dni, nombre, apellidos, departamento) VALUES ('89267109', 'Esther', 'Vázquez', 11);

-- 2.16.Aplicar un recorte presupuestario del 10 % a todos los departamentos.
UPDATE departamentos
SET presupuesto = presupuesto * 0.9;

-- 2.17. Reasignar a los empleados del departamento de investigaci´on (código 77) al departamento de informática (código 14).
UPDATE empleados
SET departamento = 14
WHERE departamento = 77;

--2.18.Despedir a todos los empleados que trabajan para el departamento de informática
DELETE FROM empleados
WHERE codigo = 14;

--2.19.Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000 €.

-- Conociendo las tablas puedes sacar esta conclusión particular
DELETE FROM empleados WHERE departamento = 5;
-- Genérica para cualquier BD
DELETE FROM empleados
WHERE departamento IN
    (SELECT codigo FROM departamentos
    WHERE presupuesto >= 60000);

-- 2.20 Despedir a todos los empleados
DELETE FROM empleados;