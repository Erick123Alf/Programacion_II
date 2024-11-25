CREATE DATABASE Actividad_1;
USE Actividad_1

CREATE TABLE Empleado2 (
NumeroEmpleado INT PRIMARY KEY IDENTITY (1,1) ,
Nombre VARCHAR (50) NOT NULL,
ApellidoPaterno VARCHAR (50) NOT NULL,
ApellidoMaterno VARCHAR (50), 
FechaNacimiento DATE NOT NULL,
RFC AS (UPPER(LEFT(Nombre, 1)+
LEFT (ApellidoPaterno, 2)+
LEFT (ApellidoMaterno, 3)+
FORMAT(FechaNacimiento, 'YYMMDD'))),
CentroTrabajo VARCHAR (15) NOT NULL,
Puesto VARCHAR (100) NOT NULL,
DescripcionPuesto VARCHAR (100) NOT NULL,
Directivo BIT NOT NULL
);

INSERT INTO Empleado2(Nombre, ApellidoPaterno, ApellidoMaterno,FechaNacimiento, CentroTrabajo, 
Puesto, DescripcionPuesto, Directivo)
VALUES
('Juan', 'Perez', 'Gomez', '1985-06-15', 'Oficina Central', 'Gerente de Ventas', 'Responsable de la gestión del equipo de ventas', 1),
('Maria', 'Lopez', 'Sanchez', '1990-04-22', 'Sucursal Norte', 'Analista de Datos', 'Analiza y reporta datos de ventas y mercado', 0),
('Pedro', 'Ramirez', 'Torres', '1978-12-03', 'Oficina Central', 'Director Financiero', 'Responsable de la planificación financiera y estrategia', 1),
('Laura', 'Martinez', 'Jimenez', '1983-08-19', 'Sucursal Sur', 'Jefa de Recursos Humanos', 'Gestiona el departamento de recursos humanos', 0),
('Carlos', 'Herrera', 'Ruiz', '1995-02-10', 'Oficina Central', 'Desarrollador de Software', 'Desarrollo y mantenimiento de aplicaciones internas', 0);

CREATE TABLE Directivo2 (
NumeroEmpleado INT PRIMARY KEY IDENTITY (1,1) ,
Centro_Supervision VARCHAR NOT NULL,
Prestacion_Combustible BIT NOT NULL
);

INSERT INTO Directivo2(Centro_Supervision, Prestacion_Combustible)
VALUES
('Ventas', 1),
('No tiene', 0),
('Finanzas', 1),
('RH', 0),
('No Tiene', 1);
