
select * from entregan

select * from materiales
where clave=1000

select clave,rfc,fecha from entregan

select fecha from materiales,entregan
where materiales.clave = entregan.clave

select * from entregan,proyectos
where entregan.numero < = proyectos.numero

(select * from entregan where clave=1450)
union
(select * from entregan where clave=1300)

select * from entregan where clave=1450 or clave=1300

(select clave from entregan where numero=5001)
intersect
(select clave from entregan where numero=5018)

(select * from entregan)
minus
(select * from entregan where clave=1000)

select * from entregan where clave=1000

select fecha from entregan,materiales

set dateformat dmy
select descripcion from entregan,materiales where materiales.clave = entregan.clave and fecha >= 01-01-2000 and fecha <= 31-12-2000

CREATE TABLE Entregan
(
  Clave numeric(5),
  RFC char(13),
  numero numeric(5),
  fecha datetime,
  Cantidad numeric(8,2)
)
BULK INSERT a1705318.a1705318.[Entregan]
   FROM 'e:\wwwroot\rcortese\entregan.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )
drop table entregan
CREATE TABLE Entregan
(
  Clave numeric(5) not null,
  RFC char(13) not null,
  Numero numeric(5) not null,
  Fecha DateTime not null,
  Cantidad numeric (8,2)
)

SET DATEFORMAT dmy -- especificar formato de la fecha

BULK INSERT a1705318.a1705318.[Entregan]
  FROM 'e:\wwroot\rcortese\Entregan.csv'
  WITH
  (
    CODEPAGE = 'ACP',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = ' '
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


ALTER TABLE Entregan add constraint llaveEntregan PRIMARY KEY (Clave,RFC,Numero)
sp_helpconstraint entregan

Select Distinct Descripcion
From Materiales, Entregan
Where materiales.clave = entregan.clave and Entregan.Fecha >= '01-01-2000'  and Entregan.Fecha <=  '31-12-2000'

Select P.numero, P.Denominacion, E.Fecha,E.cantidad
FROM Proyectos P, Entregan E
Where E.Numero = P.Numero
ORDER BY P.Numero, E.Fecha DESC

SELECT * FROM materiales where Descripcion LIKE 'Si%'

DECLARE @foo varchar(40);
DECLARE @bar varchar(40);
SET @foo = '¿Que resultado';
SET @bar = ' ¿¿¿??? '
SET @foo += ' obtienes?';
PRINT @foo + @bar;

SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%';
SELECT Numero FROM Entregan WHERE Numero LIKE '___6';

Select Distinct Descripcion
From Materiales M, Entregan E 
Where M.clave = E.clave and E.Fecha Between '01-01-2000'  and '31-12-2000'

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND
Exists ( SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] )

Select RFC, Cantidad, Fecha, numero
From Entregan E
where E.RFC In (select RFC from Proveedores where RazonSocial Like 'La%' and Numero Between 5000 and 5010 )

Select E.RFC, Cantidad, Fecha, numero
From Entregan E, Proveedores P
where E.RFC = P.RFC AND E.RFC NOT IN (select E.RFC from Proveedores where Numero < 5000 Union select RFC from Proveedores where numero > 5010) AND P.RazonSocial LIKE 'La%' 

Select E.Cantidad
From Entregan E
where clave =Any (select M.Clave from Materiales M where M.Descripcion = 'Block')

Select * From Materiales
SELECT TOP 2  FROM Proyectos

SELECT TOP Numero FROM Proyectos

ALTER TABLE materiales ADD PorcentajeImpuesto NUMERIC(6,2);

UPDATE materiales SET PorcentajeImpuesto = 2*clave/1000;

Select ((Cantidad*costo)+(M.PorcentajeImpuesto)) as 'Importe'
From Entregan E, Materiales M
Where E.clave= M.Clave 
Group by M.Clave

Create view EntreganTodo
as select clave,rfc,fecha from entregan

Create view Materiales1000
as select * from materiales where clave=1000

Create view descripanio200
as Select Distinct Descripcion
From Materiales M, Entregan E 
Where M.clave = E.clave and E.Fecha Between '01-01-2000'  and '31-12-2000'

Create view EntreganBlock
as Select E.Cantidad
From Entregan E
where clave =Any (select M.Clave from Materiales M where M.Descripcion = 'Block')

Create view DescMateriales
as SELECT * FROM materiales where Descripcion LIKE 'Si%'


Select E.Cantidad
From Entregan E
where clave =Any (select M.Clave from Materiales M where M.Descripcion = 'Block')


SELECT M.Clave, M.Descripcion FROM Materiales M, Entregan E, Proyectos P
Where M.Clave = E.clave And E.Numero= P.Numero and E.Numero IN(Select numero from proyectos p where p.Denominacion like 'Me%')


SELECT M.Clave, M.Descripcion FROM Materiales M, Entregan E, Proyectos P
Where M.Clave = E.clave And E.RFC= P.Numero and E.RFC IN(Select RFC from proveedores p where p.RazonSocial like 'ac%')

SELECT RFC, Sum(Cantidad) as Sum 
FROM Entregan E
Where E.Fecha Between '01-01-2000'  and '31-12-2000'
GROUP BY RFC
Having sum(Cantidad) >=300

SELECT Clave, Sum(E.Cantidad) as 'Total' 
FROM Entregan E
Where E.Fecha Between '01-01-2000'  and '31-12-2000'
GROUP BY Clave

Create View Vendido2001
as select Clave, sum(cantidad) as 'Ventas' from Entregan E where E.fecha Between '01-01-2001'  and '31-12-2001'group by Clave ;

select Clave
From Vendido2001
Having MAX(Ventas);

Select * From Materiales Where Descripcion Like '%ub%'

Select Denominacion, Sum(E.Cantidad) as 'totalpagar' From Proyectos p, Entregan E Where E.numero = p.numero group by E.Numero 
Select * from Entregan

Select Denominacion, Sum(E.Cantidad) as 'totalpagar' From Proyectos p, Entregan E Where E.numero = p.numero group by E.Numero 

Select M.Descripcion , Sum(E.Cantidad) as 'Total' , COUNT(*) as 'Entregas' From Materiales M, Entregan E Where E.clave = M.clave group by E.clave

