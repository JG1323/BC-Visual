--2.12.Obtener los nombres y apellidos de los empleados que trabajen e departamentos cuyo presupuesto sea mayor de 60.000 €.

SELECT empleados.nombre, empleados.apellidos 
FROM Empleados 
INNER JOIN departamentos ON e.departamento = d.presupuesto;
WHERE d.presupuesto > 60000

--3.9.Obtener los códigos de los almacenes que están saturados (los almacenes donde el numero de cajas es superior a la capacidad)

SELECT cod_almacen
FROM Almacenes
WHERE  > Capacidad;

---4.10.Eliminar todas las salas que proyectan películas recomendadas para todos los públicos 
DELETE FROM salas
WHERE cod_pelicula IN (
    SELECT cod_pelicula
    FROM peliculas
    WHERE calificacion_edad = 0  -- El 0 es para representar todas las edades
);

-- Eliminar todas las salas que proyectan películas recomendadas para todos los públicos
DELETE FROM salas WHERE cod_pelicula IN (SELECT cod_pelicula FROM peliculas WHERE calificacion_edad <= 7);