CREATE DATABASE empleados
USE empleados; 

CREATE TABLE departamentos(
cod_departamento INT, 
nombre VARCHAR(100), 
presupuesto INT, 
PRIMARY KEY (cod_departamento)
);

CREATE TABLE Empleados(
dni VARCHAR(8), 
PRIMARY KEY (dni), 
nombre VARCHAR(100), 
apellidos VARCHAR(255), 
cod_departamento INT, 
FOREIGN KEY (cod_departamento)
    REFERENCES departamentos (cod_departamento)
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);