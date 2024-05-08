INSERT INTO peliculas (codigo, nombre, calificacion_edad) VALUES
	(100, 'El Señor de los Anillos ', 12),
	(101, 'Un espía y medio', 12),
	(102, 'Creed 3', 5),
	(103, 'Guardiana de Dragones', 8),
	(104, 'Joker', 5),
	(105, 'Los Mercenarios', 16),
	(106, 'Fast & Furious', 16),
	(107, 'Bailando (Step Up)', 5),
	(108, '22 Jump Street', 12),
	(109, 'G.I.Joe: The Rise of Cobra', 12);

INSERT INTO salas (codigo, nombre, pelicula) VALUES
	(1, 'Sala 1', 100),
	(2, 'Sala 2', 101),
	(3, 'Sala 3', 102),
	(4, 'Sala 4', 103),
	(5, 'Sala 5', 104),
	(6, 'Sala 6', 105),
	(7, 'Sala 7', 106),
	(8, 'Sala 8', 107),
	(9, 'Sala 9', 108),
	(10, 'Sala 10', 109);
	
-- 4.1 Mostrar el nombre de todas las películas.
SELECT nombre FROM peliculas;

-- 4.2 Mostrar las distintas calificaciones de edad que existen.
SELECT DISTINCT calificacion_edad FROM peliculas;

-- 4.3 Mostrar todas las películas que no han sido calificadas. 
SELECT * FROM peliculas WHERE calificacion_edad IS NULL;

-- 4.4 Mostrar todas las salas que no proyectan ninguna películas.
SELECT * FROM salas WHERE pelicula IS NULL;

-- 4.5 Mostrar la información de todas las salas y, si se proyecta alguna película en la sala, mostrar también la información de la película.
SELECT salas.*, peliculas.nombre AS pelicula_proyectada, peliculas.calificacion_edad
FROM salas INNER JOIN peliculas ON salas.pelicula = peliculas.codigo;

-- 4.6 Mostrar la información de todas las películas y, si se proyecta en alguna sala, mostrar también la información de la sala.
SELECT peliculas.*, salas.nombre AS sala_proyeccion
FROM peliculas INNER JOIN salas ON peliculas.codigo = salas.pelicula;

-- 4.7 Mostrar los nombres de las películas que no se proyectan en ninguna sala.
SELECT peliculas.nombre FROM peliculas
WHERE peliculas.codigo NOT IN (SELECT pelicula FROM salas WHERE pelicula IS NOT NULL);

-- 4.8 Añadir una nueva película 'Uno, Dos ,Tres', para mayores de 7 años.
INSERT INTO peliculas (codigo, nombre, calificacion_edad) VALUES 
	(110, 'Uno, Dos ,Tres', 7);
	
-- 4.9 Hacer constar que todas las películas no calificadas han sido calificadas 'no recomendables para menores de 13 años'.	
UPDATE peliculas SET calificacion_edad = 13 WHERE calificacion_edad IS NULL;

-- 4.10 Eliminar todas las salas que proyectan películas recomendadas para todos los públicos. 
DELETE FROM salas WHERE pelicula IN (SELECT codigo FROM peliculas WHERE calificacion_edad IS NULL);