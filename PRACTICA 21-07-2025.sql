/*CREANDO BASE DE DATOS*/

CREATE DATABASE TIENDA_20250711
GO
USE TIENDA_20250711
GO

CREATE TABLE Proveedores (
idProveedor INT IDENTITY (1,1) PRIMARY KEY,
nombreProveedor VARCHAR (100) NOT NULL);

CREATE TABLE Marca (
idMarca INT IDENTITY (1,1) PRIMARY KEY,
nombreMarca VARCHAR (100) NOT NULL,
id_Proveedor INT NOT NULL,
CONSTRAINT FKPROVEEDOR FOREIGN KEY (id_Proveedor) REFERENCES Proveedores (idProveedor) ON DELETE CASCADE);

CREATE TABLE Producto (
idProducto INT IDENTITY (1,1) PRIMARY KEY,
nombreProducto VARCHAR (100) NOT NULL,
id_Marca INT NOT NULL,
precioProducto DECIMAL (7,2) NOT NULL,
CONSTRAINT FKMARCA FOREIGN KEY (id_Marca) REFERENCES Marca (idMarca) ON DELETE CASCADE);

SELECT *FROM Proveedores
SELECT *FROM Marca
SELECT *FROM Producto

INSERT INTO Proveedores VALUES 
('ORLANDO'),
('OSCAR');

INSERT INTO Marca (nombreMarca, id_Proveedor) VALUES
('MERCEDEZ', 1),
('FERRARI', 1),
('ASTON MARTIN', 2),
('RED BULL', 2),
('McLAREN', 1);


INSERT INTO Producto (nombreProducto, id_Marca, precioProducto) VALUES
('ROPA', 1, 50.00),
('CASCOS', 2, 70.00),
('AUTOS', 3, 9000.00),
('GORRAS', 4, 5.00),
('SUDADERAS', 5, 60.00);

CREATE VIEW productoMarcaPrecio AS

SELECT
Producto.nombreProducto AS [PRODUCTO],
Producto.precioProducto AS [PRECIO],
Marca.nombreMarca AS [MARCA],
Proveedores.nombreProveedor AS [PROVEEDOR]

FROM Producto
INNER JOIN
Marca ON Producto.id_Marca = Marca.idMarca
INNER JOIN
Proveedores ON Marca.id_Proveedor = Proveedores.idProveedor

SELECT *FROM Producto WHERE nombreProducto LIKE 'G%';

SELECT SUM (precioProducto) AS SumaTotal FROM Producto

SELECT AVG (precioProducto) AS PromedioTotal FROM Producto

SELECT SUM (precioProducto) AS Total FROM Producto WHERE id_Marca = 1;

SELECT *FROM Producto WHERE id_Marca = 1

SELECT m.nombreMarca, AVG(p.precioProducto) AS PROMEDIO
FROM Producto p
JOIN Marca m ON p.id_Marca = m.idMarca
GROUP BY m.nombreMarca;

select *from Producto where precioProducto <=300 AND precioProducto >=20

SELECT M.nombreMarca AS MARCA, PR.nombreProveedor AS PROVEEDORES, AVG (precioProducto) AS Promedio FROM Producto P
INNER JOIN
Marca M ON P.id_Marca = M.idMarca
INNER JOIN
Proveedores PR ON M.id_Proveedor = PR.idProveedor
GROUP BY nombreMarca, nombreProveedor

SELECT idProducto, nombreProducto, precioProducto
FROM Producto
WHERE precioProducto BETWEEN 20 AND 1000;