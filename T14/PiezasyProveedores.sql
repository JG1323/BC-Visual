CREATE DATABASE PiezasyProveedores
USE PiezasyProveedores;

CREATE TABLE piezas(
    codPieza INT AUTO_INCREMENT, 
    nombre VARCHAR(100) NOT NULL, 
    PRIMARY KEY(codPieza)
);

CREATE TABLE proveedores(
    idProveedor INT AUTO_INCREMENT ,
    nombre VARCHAR (100) NOT NULL,
    PRIMARY KEY(idProveedor)
);

CREATE TABLE suministra(
  codPieza INT,  
    idProveedor INT,  
    precio FLOAT NOT NULL, 
    FOREIGN KEY (codPieza) REFERENCES piezas(codPieza)  -- 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (idProveedor) REFERENCES proveedores(idProveedor)  -- 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);
