CREATE DATABASE PiezasyProveedores
USE PiezasyProveedores;

CREATE TABLE piezas(
    codPieza INT, 
    nombre VARCHAR(100), 
    PRIMARY KEY(codPieza)
);

CREATE TABLE proveedores(
    id_proveedor CHAR(4), 
    nombre VARCHAR(100),
    PRIMARY KEY (idProveedor)
);

CREATE TABLE suministra(
    precio INT, 
    codPieza INT,  
    idProveedor CHAR(4), 
    PRIMARY KEY (codPieza, idProveedor),
     FOREIGN KEY (codPieza)
    REFERENCES piezas (codPieza)
    ON DELETE CASCADE 
    ON UPDATE CASCADE,
    FOREIGN KEY (idProveedor)
    REFERENCES proveedores (idProveedor)
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);