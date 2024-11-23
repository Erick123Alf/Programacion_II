CREATE DATABASE Actividad_1;

CREATE TABLE Empleados (
NumeroEmpleado INT IDENTITY (1,1) PRIMARY KEY,
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

INSERT INTO Empleados(Nombre, ApellidoPaterno, ApellidoMaterno,FechaNacimiento, RFC, CentroTrabajo, 
Puesto, DescripcionPuesto, Directivo)
VALUES
('Juan', 'Perez', 'Gomez', '1985-06-15', 'Oficina Central', 'Gerente de Ventas', 'Responsable de la gestión del equipo de ventas', 1),
('Maria', 'Lopez', 'Sanchez', '1990-04-22', 'Sucursal Norte', 'Analista de Datos', 'Analiza y reporta datos de ventas y mercado', 0),
('Pedro', 'Ramirez', 'Torres', '1978-12-03', 'Oficina Central', 'Director Financiero', 'Responsable de la planificación financiera y estrategia', 1),
('Laura', 'Martinez', 'Jimenez', '1983-08-19', 'Sucursal Sur', 'Jefa de Recursos Humanos', 'Gestiona el departamento de recursos humanos', 0),
('Carlos', 'Herrera', 'Ruiz', '1995-02-10', 'Oficina Central', 'Desarrollador de Software', 'Desarrollo y mantenimiento de aplicaciones internas', 0);

CREATE TABLE Directivos (
NumeroDirectivo INT IDENTITY (1,1) PRIMARY KEY,
Nombre_Dir VARCHAR (50) NOT NULL,
ApePaterno_Dir VARCHAR (50) NOT NULL,
ApeMaterno_Dir VARCHAR (50), 
FechaNacimiento_Dir DATE NOT NULL,
RFC AS (UPPER(LEFT(Nombre_Dir, 1)+
LEFT (ApePaterno_Dir, 2)+
LEFT (ApeMaterno_Dir, 3)+
FORMAT(FechaNacimiento_Dir, 'YYMMDD'))),
CentroTrabajo VARCHAR (15) NOT NULL,
Puesto VARCHAR (100) NOT NULL,
DescripcionPuesto VARCHAR (100) NOT NULL,
Directivo BIT NOT NULL,
Centro_Supervision INT NOT NULL,
Prestacion_Combustible BIT NOT NULL
);

