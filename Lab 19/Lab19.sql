
SET DATEFORMAT dmy
select sum(e.cantidad) as sumaCantidades, sum(e.cantidad* (m.costo +(m.costo*m.PorcentajeImpuesto/100))) as total 
from materiales m, entregan e
WHERE e.Clave=m.Clave AND e.Fecha BETWEEN ' 01-01-1997' AND '31-12-1997' 
GROUP BY E.Fecha

select * from  proveedores 
select * from entregan
select * from materiales 
entregan

select p.RazonSocial, count(e.rfc) as entregas, sum(e.cantidad* (m.costo +(m.costo*m.PorcentajeImpuesto/100))) as total  from proveedores p, materiales m, entregan e 
where p.rfc= e.rfc and m.clave = e.clave 
group by p.RazonSocial

select   m.clave, m.descripcion, sum(e.cantidad) as cantidadTotal, min(e.cantidad) as cantminima, max(e.cantidad) as cantmaximo, avg(e.cantidad) as cantpromedio  from materiales m, entregan e where m.clave=e.Clave group by m.clave, m.Descripcion
having avg(e.cantidad) > 400

select * from  proveedores 
select * from entregan
select * from materiales 

select distinct  p.razonsocial, avg(e.cantidad) as Cantpromedio, m.Clave, m.descripcion 
from materiales m, Entregan e, Proveedores p 
where m.clave=e.Clave and p.rfc = e.rfc 
group by p.RazonSocial, m.Clave, m.descripcion
having avg(e.cantidad) > 500


select distinct p.RazonSocial,  e.Clave, m.descripcion 
from materiales m, Entregan e, Proveedores p 
where m.clave=e.Clave and p.rfc = e.rfc 
group by p.RazonSocial, e.Clave, m.descripcion 

select * from Entregan 

select distinct  p.razonsocial, avg(e.cantidad) as Cantpromedio, m.Clave, m.descripcion 
from materiales m, Entregan e, Proveedores p 
where m.clave=e.Clave and p.rfc = e.rfc 
group by p.RazonSocial, m.Clave, m.descripcion
having avg(e.cantidad) < 370 or avg(e.cantidad) > 450

INSERT INTO Materiales VALUES (1600, 'Madera', 1500, 2.86)
INSERT INTO Materiales VALUES (1610, 'Metal', 700, 2.87)
INSERT INTO Materiales VALUES (1620, 'Tela', 150, 2.88)
INSERT INTO Materiales VALUES (1630, 'Piedra', 500, 2.89)
INSERT INTO Materiales VALUES (1640, 'Hormigón', 300, 2.90)

select * from materiales

select m.clave, m.descripcion
from materiales m 
where m.clave not in (select e.clave from entregan e)

SELECT p.RazonSocial
FROM Proveedores p
WHERE RFC IN ( SELECT DISTINCT e.RFC FROM Entregan e, Proyectos p  WHERE e.Numero=p.Numero AND p.Denominacion LIKE 'Vamos Mexico' )
AND RFC IN( SELECT DISTINCT e.RFC  FROM Entregan e, Proyectos p WHERE e.Numero=p.Numero AND p.Denominacion LIKE 'Queretaro limpio')

SELECT m.descripcion FROM Materiales m WHERE m.Clave NOT IN ( SELECT distinct e.Clave FROM Entregan e, Proyectos p WHERE p.Numero=e.Numero AND p.Denominacion LIKE 'CI%')

SELECT p.RazonSocial, AVG(e.Cantidad) AS promcantidad
FROM Entregan e, Proveedores p
WHERE E.RFC=p.RFC
GROUP BY P.RazonSocial
HAVING AVG(E.Cantidad)> ( SELECT AVG(Cantidad) AS prom  FROM Entregan WHERE RFC LIKE 'VAGO780901')



CREATE VIEW CANTIDADcero AS ( SELECT e.rfc, SUM(e.cantidad) AS cantidadtotal2000 FROM Entregan e WHERE Fecha BETWEEN '2000-01-01' AND '2000-31-12' GROUP BY rfc)
CREATE VIEW CANTIDAADuno AS ( SELECT e.rfc, SUM(e.cantidad) AS cantidadtotal2001 FROM Entregan e WHERE Fecha BETWEEN '2001-01-01' AND '2001-31-12' GROUP BY RFC)

SET DATEFORMAT dmy
SELECT DISTINCT e.rfc, pro.RazonSocial
FROM Entregan e, Proyectos p, cantidad2000 c, cantidad2001 c1,  Proveedores pro
WHERE e.Numero=p.Numero AND pro.rfc=e.rfc AND c.RFC=e.RFC AND c1.rfc =e.RFC AND c.cantidad2000 > c1.cantidad2001 AND p.Denominacion LIKE 'In%'

select * from CANTIDAD20007

CREATE VIEW CANTIDADESTOTALPROV2000 AS (
SELECT RFC, SUM(Cantidad) AS CantidadEntregadaTotal
FROM Entregan
WHERE Fecha BETWEEN '2000-01-01' AND '2000-31-12'
GROUP BY RFC)

CREATE VIEW CANTIDADESTOTALPROV2001 AS (
SELECT RFC, SUM(Cantidad) AS CantidadEntregadaTotal
FROM Entregan
WHERE Fecha BETWEEN '2001-01-01' AND '2001-31-12'
GROUP BY RFC)

SELECT DISTINCT E.RFC, Pro.RazonSocial
FROM Entregan E, Proyectos P, CANTIDADESTOTALPROV2000 C00, CANTIDADESTOTALPROV2001 C01, Proveedores Pro
WHERE E.Numero=P.Numero AND Pro.RFC=E.RFC AND C00.RFC=E.RFC AND C01.RFC=E.RFC AND C00.CantidadEntregadaTotal>C01.CantidadEntregadaTotal AND P.Denominacion LIKE 'Infonavit Durango'

select * from materiales