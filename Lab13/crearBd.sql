drop TABLE entregan
drop TABLE materiales
drop TABLE proyectos
drop TABLE Proveedores

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales')
CREATE TABLE Materiales
(
  Clave numeric(5) not null,
  Descripcion varchar(50),
  Costo numeric (8,2)
)
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')

CREATE TABLE Proveedores
(
  RFC char(13) not null,
  RazonSocial varchar(50)
)
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos')

CREATE TABLE Proyectos
(
  Numero numeric(5) not null,
  Denominacion varchar(50)
)
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')

CREATE TABLE Entregan
(
  Clave numeric(5) not null,
  RFC char(13) not null,
  Numero numeric(5) not null,
  Fecha DateTime not null,
  Cantidad numeric (8,2)
)

BULK INSERT a1705318.a1705318.[Materiales]
   FROM 'e:\wwwroot\rcortese\materiales.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
BULK INSERT a1705318.a1705318.[Proyectos]
   FROM 'e:\wwwroot\rcortese\proyectos.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
BULK INSERT a1705318.a1705318.[Proveedores]
   FROM 'e:\wwwroot\rcortese\proveedores.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

SET DATEFORMAT dmy

BULK INSERT a1705318.a1705318.[Entregan]

		FROM 'e:\wwwroot\rcortese\entregan.csv'
		WITH
			(
			CODEPAGE = 'ACP',
			FIELDTERMINATOR = ',',
			ROWTERMINATOR='\n'
			
			)

SELECT * FROM Materiales
INSERT INTO Materiales values(1000, 'xxx', 1000)
Delete from Materiales where Clave = 1000 and Costo = 1000
ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave)
INSERT INTO Materiales values(1000, 'xxx', 1000)
ALTER TABLE Proyectos add constraint llaveProyectos PRIMARY KEY (Numero)
ALTER TABLE Proveedores add constraint llaveProveedores PRIMARY KEY (RFC)
ALTER TABLE Entregan add constraint llaveEntregan PRIMARY KEY (Clave,RFC,Numero,Fecha)
sp_helpconstraint entregan

SELECT * from Entregan;

INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0) ;
Delete from Entregan where Clave = 0

  ALTER TABLE entregan add constraint cfentreganclave
  foreign key (clave) references materiales(clave);

  ALTER TABLE entregan add constraint cfentreganrfc
  foreign key (rfc) references proveedores(rfc);

   ALTER TABLE entregan add constraint cfentregannumero
  foreign key (numero) references proyectos(numero);

  INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0);
   Delete from Entregan where cantidad = 0
  ALTER TABLE entregan add constraint cantidad check (cantidad > 0) ;
   INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), -4);

   