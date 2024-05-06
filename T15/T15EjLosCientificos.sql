INSERT INTO cientificos (dni_cientifico, nom_apels) VALUES
('8765432B','Alejandro Martinez Calvo'),
('9012345J', 'Adrian Vega Belsue'),
('8901234I', 'Jose Vazquez Rodriguez'),
('4567890E', 'Alba García Lopez'),
('7890123H', 'Vanessa Pérez Martinez'),
('3769824A', 'Ian Vega Cano'),
('3456789D', 'Nuria Gópmez Fernández'),
('6789012G', 'Nerea Martinez Sole'),
('2345678C', 'Kyle García Rodriguez'),
('56789012', 'Luca Ortega Marin');

INSERT INTO proyecto  (id_proyecto , nombre, horas) VALUES
('P001', 'Desarrollo de Software', 100),
('P002', 'Investigación Médica', 220),
('P003', 'Ingeniería Ambiental', 150),
('P004', 'Robótica Avanzada', 190),
('P005', 'Inteligencia Artificial', 130),
('P006', 'Nanotecnología', 120),
('P007', 'Bioinformática', 90),
('P008', 'Realidad Virtual', 200),
('P009', 'Exploración Espacial', 240),
('P010', 'Biotecnología', 170);

INSERT INTO asignado_a (dni_cientifico, id_proyecto) VALUES
('8765432B', 'P001'),
('9012345J', 'P002'),
('8901234I', 'P003'),
('4567890E', 'P004'),
('7890123H', 'P005'),
('3769824A', 'P006'),
('3456789D', 'P007'),
('6789012G', 'P008'),
('2345678C', 'P009'),
('56789012', 'P010');