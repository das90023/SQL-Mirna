/*Creando base de datos*/
create database Prueba2
--Usando la base de datos--
go
use prueba2
go

--Creando tabla "Estudiante" y poniendo sus Atributos--
create table Estudiante(
idEstudiante int Primary key,
nombre varchar (10),
apellido varchar (10),
especialidad varchar (15),
carnet int);

--Seleccionar tabla Estudiante
select *from Estudiante;

-- Insertando en la tabla Estudiante sus valores 'numero' 'nombre' 'apellido' 'espescialidad' 'carnet'
insert into Estudiante values (1, 'Nahum', 'Rodriguez', 'Desarrollo', 20250764);
insert into Estudiante values (2, 'Orlando', 'Zavala', 'Desarrollo', 20240151);
insert into Estudiante values (3, 'Oscar', 'Salazar', 'Desarrollo', 20250739);
insert into Estudiante values (4, 'Walter', 'Ramirez', 'Desarrollo', 20250482);
insert into Estudiante values (5, 'Luis', 'Soriano', 'Desarrollo', 20220011);
insert into Estudiante values (6, 'Hessem', 'Santos', 'Desarrollo', 20250066);

--Seleccionando solo nombre, especialidad, carnet
select nombre, especialidad, carnet from Estudiante;

-- Creando la tabla Departamento con atributos
create table Departamento(
idDepartamento int primary key,
nombreDepartamento varchar (10));

--Creando la tabla Empleado con atributos
create table Empleado(
idEmpleado int PRIMARY KEY,
nombre varchar (10),
correo varchar (20),
idDepartamento int);

--Alterando la tabla Empleado, agregando condición, llave foranea, referencias
alter table Empleado
add constraint fk_departamento
foreign key (departamento)
references Departamento (idDepartamento)