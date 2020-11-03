 IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaMaterial' AND type = 'P')
                DROP PROCEDURE creaMaterial
            GO

            CREATE PROCEDURE creaMaterial
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
                INSERT INTO Materiales VALUES(@uclave, @udescripcion, @ucosto, @uimpuesto)
            GO

EXECUTE creaMaterial 5000,'Martillos Acme',250,15

select * from materiales


IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaMaterial' AND type = 'P')
                DROP PROCEDURE modificaMaterial
            GO

            CREATE PROCEDURE modificaMaterial
                @uclave NUMERIC(5,0),
                @udescripcion VARCHAR(50),
                @ucosto NUMERIC(8,2),
                @uimpuesto NUMERIC(6,2)
            AS
                Update Materiales set Descripcion=@udescripcion, Costo=@ucosto, PorcentajeImpuesto=@uimpuesto
				where clave=@uclave
            GO

EXECUTE modificaMaterial 5000,'Martillos Acme',200,20


select * from materiales

IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaMaterial' AND type = 'P')
                DROP PROCEDURE eliminaMaterial
            GO

            CREATE PROCEDURE eliminaMaterial
                @uclave NUMERIC(5,0)
            AS
                Delete from Materiales  where clave= @uclave
            GO

EXECUTE eliminaMaterial 5000

select * from materiales

 IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaProyectos' AND type = 'P')
                DROP PROCEDURE creaProyectos
            GO
            CREATE PROCEDURE creaProyectos
                @unumero NUMERIC(5,0),
                @udenominacion VARCHAR(50)
            AS
                INSERT INTO Proyectos VALUES(@unumero, @udenominacion)
            GO
EXECUTE creaProyectos 6000,'Somos Oaxaca'

select * from Proyectos


IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaProyecto' AND type = 'P')
                DROP PROCEDURE modificaProyecto
            GO

            CREATE PROCEDURE modificaProyecto
                @unumero NUMERIC(5,0),
                @udenominacion VARCHAR(50)
            AS
                Update Proyectos set Numero=@unumero, Denominacion=@udenominacion where Numero=@unumero
            GO

EXECUTE modificaProyecto 6000,'Somos Toluca'
select * from Proyectos


IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaProyecto' AND type = 'P')
                DROP PROCEDURE eliminaProyecto
            GO

            CREATE PROCEDURE eliminaProyecto
               @unumero NUMERIC(5,0)
            AS
                Delete from Proyectos where Numero= @unumero
            GO

EXECUTE eliminaProyecto 6000

select * from Proyectos

IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaProveedores' AND type = 'P')
                DROP PROCEDURE creaProveedores
            GO
            CREATE PROCEDURE creaProveedores
                @uRFC CHAR(13),
                @uRazonSocial VARCHAR(50)
            AS
                INSERT INTO Proveedores VALUES(@uRFC, @uRazonSocial)
            GO
EXECUTE creaProveedores IIII800101,'Walmart'

select * from Proveedores


IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaProveedores' AND type = 'P')
                DROP PROCEDURE modificaProveedores
            GO

            CREATE PROCEDURE modificaProveedores
                 @uRFC CHAR(13),
                @uRazonSocial VARCHAR(50)
            AS
                Update Proveedores set RFC=@uRFC, RazonSocial=@uRazonSocial where RFC=@uRFC
            GO

EXECUTE modificaProveedores IIII800101,'Soriana'
select * from Proveedores


IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaProveedores' AND type = 'P')
                DROP PROCEDURE eliminaProveedores
            GO

            CREATE PROCEDURE eliminaProveedores
               @uRFC CHAR(13)
            AS
                Delete from Proveedores where RFC= @uRFC
            GO

EXECUTE eliminaProveedores IIII800101

select * from Proveedores

set datetime dmy
IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'creaEntregan' AND type = 'P')
                DROP PROCEDURE creaEntregan
            GO
            CREATE PROCEDURE creaEntregan
                @uclave NUMERIC(5,0),
				@uRFC CHAR(13),
				@unumero NUMERIC(5,0),
				@ufecha DATETIME,
                @uCantidad NUMERIC(6,2)
            AS
                INSERT INTO Entregan VALUES(@uclave, @uRFC, @unumero,@ufecha, @uCantidad)
            GO
EXECUTE creaEntregan 100, AAAA800101, 1521, 15/10/2020,500



IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'modificaEntregan' AND type = 'P')
                DROP PROCEDURE modificaEntregan
            GO

            CREATE PROCEDURE modificaEntregan
                @uclave NUMERIC(5,0),
				@uRFC CHAR(13),
				@unumero NUMERIC(5,0),
				@ufecha DATETIME,
                @uCantidad NUMERIC(6,2)
            AS
                Update Entregan set Clave=@uclave, RFC=@uRFC, Numero=@unumero, Cantidad=@uCantidad where Clave=@uclave and  RFC=@uRFC and  Numero=@unumero and Cantidad=@uCantidad
            GO

EXECUTE modificaEntregan IIII800101,'Soriana'
select * from Proveedores


IF EXISTS (SELECT name FROM sysobjects
                       WHERE name = 'eliminaEntregan' AND type = 'P')
                DROP PROCEDURE eliminaEntregan
            GO

            CREATE PROCEDURE eliminaEntregan
                @uclave NUMERIC(5,0),
				@uRFC CHAR(13),
				@unumero NUMERIC(5,0),
				@ufecha DATETIME,
                @uCantidad NUMERIC(6,2)
            AS
                Delete from Entregan where Clave=@uclave and  RFC=@uRFC and  Numero=@unumero and Fecha=@ufecha and Cantidad=@uCantidad 
            GO

EXECUTE eliminaProveedores IIII800101

select * from Proveedores




IF EXISTS (SELECT name FROM sysobjects
                                       WHERE name = 'queryMaterial' AND type = 'P')
                                DROP PROCEDURE queryMaterial
                            GO

                            CREATE PROCEDURE queryMaterial
                                @udescripcion VARCHAR(50),
                                @ucosto NUMERIC(8,2)

                            AS
                                SELECT * FROM Materiales WHERE descripcion
                                LIKE '%'+@udescripcion+'%' AND costo > @ucosto
                            GO

EXECUTE queryMaterial 'Lad',20
