CREATE DATABASE Directores
USE Directores;


CREATE TABLE despachos(
    num_despacho INT, 
    capacidad INT, 
    PRIMARY KEY (num_despacho)
);

CREATE TABLE directores(
    dni VARCHAR(8), 
    PRIMARY KEY (dni), 
    nom_apels VARCHAR(255), 
    dni_Jefe VARCHAR(8), 
    FOREIGN KEY (dni_Jefe)
    REFERENCES directores (dni)
    ON DELETE CASCADE 
    ON UPDATE CASCADE, 
    num_Despacho INT, 
    FOREIGN KEY (num_Despacho)
    REFERENCES despachos (num_Despacho)
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);