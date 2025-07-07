CREATE DATABASE EVENTOS_20250711
GO
USE EVENTOS_20250711
GO

GO

CREATE TABLE Eventos(
id_Eventos  INT IDENTITY (1,1) PRIMARY KEY,
nombre VARCHAR (100) NOT NULL,
fecha DATE NOT NULL,
ubicacion VARCHAR (100) NOT NULL);

GO


CREATE TABLE Participantes(
id_Participantes INT IDENTITY (1,1) PRIMARY KEY,
nombre VARCHAR (100) NOT NULL,
apellido VARCHAR (100) NOT NULL,
email VARCHAR (100) NOT NULL);

GO

CREATE TABLE Inscripciones(
id_Inscripciones INT IDENTITY (1,1) PRIMARY KEY,
id_Eventos INT NOT NULL,
id_Participantes INT NOT NULL,
FOREIGN KEY (id_Eventos) REFERENCES Eventos(id_Eventos),
FOREIGN KEY (id_Participantes) REFERENCES Participantes(id_Participantes));

GO

SELECT *FROM Eventos
SELECT *FROM Participantes
SELECT *FROM Inscripciones

GO

INSERT INTO Eventos (nombre, fecha, ubicacion)
VALUES ('ORLANDO MAGIC', '2028-07-05', 'ORLANDO, FLORIDA'),
('DRAFT NBA','2025-06-25','Barclays Center, Brooklyn, Nueva York'),
('Versus','2025-07-09','6A Avenida 11-02, Cdad. de Guatemala 01001, Guatemala'),
('MUNDIAL','2026-06-11','E.E.U.U , MEXICO , CANADA');


INSERT INTO Participantes  VALUES
('Orlando','Zavala','vidohir196@bulmp3.com','E.E.U.U.'),
('Walter', 'Hernandez', 'kokim48587@datingso.com', 'MEXICO'),
('Oscar','Salazar','gededeh683@bulmp3.com','NO SE DONDE'),
('Hessem','Santos','bojocin502@bulmp3.com', 'ALEMANIA');

INSERT INTO Inscripciones (id_Eventos, id_Participantes) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);




SELECT 
    p.nombre AS Nombre_Participante,
    p.apellido AS Apellido_Participante,
    e.nombre AS Evento,
    e.fecha,
    e.ubicacion
FROM Inscripciones i
JOIN Participantes p ON i.id_Participantes = p.id_Participantes
JOIN Eventos e ON i.id_Eventos = e.id_Eventos;



ALTER TABLE Participantes ADD ubicacion varchar(100)