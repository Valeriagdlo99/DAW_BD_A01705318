CREATE TABLE Materiales
(
  Clave numeric(5),
  Descripcion varchar(50),
  Costo numeric(8,2)
)
CREATE TABLE Provedores
(
  RFC char(13),
  RazonSocial varchar(50)
)
CREATE TABLE Proyectos
(
  Numero numeric (5),
  Denominacion varchar(50)
)
drop table entregan
CREATE TABLE Entregan
(
  Clave numeric(5),
  RFC Char(13),
  Fecha datetime,
  Cantidad NUMERIC(8,2)
)
CREATE Table Entregan
(
    Clave numeric(5),
    RFC Char(13),
    Numero NUMERIC(5),
    Fecha DATETIME,
    Cantidad NUMERIC(8,2)
)