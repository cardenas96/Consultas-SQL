USE BDSistemaAgua
SELECT COUNT(*) FROM Cuentas
SELECT COUNT(*) FROM Pagos

SELECT *  FROM ServiciosAtendidos
--ALTER TABLE
ALTER TABLE Cuentas ALTER COLUMN nombre varchar(50);

ALTER TABLE Gastos ALTER COLUMN concepto varchar(60) null;

ALTER TABLE GastosRealizados ADD factura varchar(60);

ALTER TABLE Proveedores ADD rfc varchar(30) null;

ALTER TABLE Calles  ADD CONSTRAINT DF_SomeName DEFAULT 0 FOR totalCasas;

ALTER TABLE Cuentas ADD Estado INT DEFAULT 1;
SELECT * FROM Calles

--UPDATES
UPDATE Calles SET totalCasas= 1 WHERE idCalle = 30

UPDATE Cuentas SET ultimoPagoA = 2016 ,ultimoPagoM = 11 WHERE idCuenta = 47
UPDATE Cuentas SET ultimoPagoA=2018 ,ultimoPagoM = 12 WHERE idCuenta = 1889
UPDATE Cuentas SET ultimoPagoA = 2018 ,ultimoPagoM = 12 WHERE cveCuenta = '1-1-156'

UPDATE Cuentas SET ultimoAA = 2016,ultimoMA =2 ,ultimoPagoA=2013,ultimoPagoM=12 WHERE idCuenta = 5
UPDATE Cuentas SET ultimoPagoA= ultimoAA,ultimoPagoM=ultimoMA WHERE idCuenta = 703
UPDATE Cuentas SET noInterior = '96-A' WHERE idCuenta = 469

SELECT * FROM Pagos p INNER JOIN Cuentas cu on p.idCuenta = cu.idCuenta WHERE p.idCuenta = 728 ORDER BY P.idPago desc

UPDATE Empleados SET idEmpleado = 1 WHERE idEmpleado = 4

UPDATE Pagos SET total = total-8 WHERE folio = '8917'
UPDATE Pagos SET fecha = '5-11-2018' WHERE idPago = 14349

UPDATE Pagos SET idCuenta = 1963 WHERE idPago = 6474
UPDATE Pagos SET total = 90 WHERE idPago = 6269
UPDATE Agua SET recargos = 0 WHERE idPago = 5280
UPDATE Agua SET MesInicio = 8, MesFinal = 8 WHERE idPago = 11712

UPDATE Agua SET idPago = 1772 WHERE idPago = 1672
UPDATE Pagos SET idCuenta= 520 WHERE idPago = 1818


UPDATE Pagos SET folio = '13239' WHERE idPago = 13908

UPDATE Agua SET MesInicio = 3, cf = 234.00,recargos = 32.00, tar = 46.8,infra =7.2 WHERE idPago =625

UPDATE Agua SET recargos= 0 WHERE idPago = 4461

UPDATE CUENTAS  SET cveCuenta = REPLACE(cveCuenta,'*','-')

UPDATE Cuentas SET Estado = 1

UPDATE Cuentas SET ultimoPagoA = 2013, ultimoPagoM = 6 WHERE idCuenta = 123

UPDATE Servicios SET descripcion='Sol. de toma de Drenaje' WHERE idServicio = 2

/*Actualizacion por medio del select*/
UPDATE Agua SET tarifa = 2011 
	FROM Pagos p INNER JOIN Agua a ON p.idPago = a.idPago 
	WHERE p.idCuenta = 329

UPDATE Agua SET cf= 121.20,recargos = 16.00, tar = 24.2,infra =3.6
	FROM Pagos p INNER JOIN Agua a ON p.idPago = a.idPago 
	WHERE p.idPago = 1238

UPDATE Pagos SET idCuenta = 1558
	FROM Agua a INNER JOIN Pagos p ON a.idPago = p.idPago
	where p.idPago = 5076 --AND a.tarifa = '2016'

UPDATE Pagos SET idCuenta = 1869
	FROM Agua a INNER JOIN Pagos p ON a.idPago = p.idPago
	where p.idCuenta = 1868

--UPDATE CALLES
UPDATE Calles SET totalCasas=0 WHERE idCalle = 79
--SELECTS

SELECT c.cveCalle,c.nombre FROM Calles c

SELECT COUNT(*) FROM Cuentas cu JOIN Calles ca ON cu.idCalle = ca.idCalle WHERE ca.cveCalle =10
SELECT COUNT(*) FROM Cuentas cu JOIN Calles ca ON cu.idCalle = ca.idCalle WHERE ca.idCalle =45
SELECT * FROM Calles

SELECT CAST(REPLACE(SUBSTRING(cu.cveCuenta, 1,5),'-','') AS numeric),cu.nombre,ca.nombre,cu.noExterior,cu.noInterior,cu.ultimoPagoA,cu.ultimoPagoM FROM CUENTAS cu 
INNER JOIN CALLES ca ON cu.idCalle = ca.idCalle ORDER BY cu.cveCuenta
SELECT cu.idCuenta,cu.cveCuenta,cu.nombre,ca.nombre,cu.noExterior,cu.noInterior,cu.ultimoPagoA,cu.ultimoPagoM FROM CUENTAS cu 
INNER JOIN CALLES ca ON cu.idCalle = ca.idCalle ORDER BY CAST(REPLACE(SUBSTRING(cu.cveCuenta, 1,DATALENGTH(cveCuenta)),'-','') AS int)

SELECT * FROM Cuentas cu INNER JOIN 	
Calles ca ON cu.idCalle = ca.idCalle
WHERE ca.idCalle = 78

SELECT * FROM Empleados

SELECT idCalle,cveCalle,nombre,totalCasas FROM Calles WHERE idCalle	 = 78

SELECT * FROM Pagos p INNER JOIN Agua a ON p.idPago = a.idPago WHERE p.folio like '%A%' or p.folio like '%B%' ORDER BY p.folio

UNION ALL(SELECT * FROM Pagos P)

SELECT COUNT(*) FROM Cuentas WHERE ultimoPagoA = '2013' and ultimoPagoM = '12'

SELECT * FROM Pagos p INNER JOIN Cuentas cu on p.idCuenta = cu.idCuenta WHERE p.idCuenta = 587 ORDER BY P.idPago desc

SELECT * FROM Pagos p INNER JOIN Agua a ON p.idPago = a.idPago WHERE p.idCuenta = 537

SELECT * FROM Pagos p INNER JOIN Agua a ON p.idPago = a.idPago WHERE p.folio = '10309'

SELECT * FROM Pagos p INNER JOIN Agua a ON p.idPago = a.idPago ORDER BY P.idPago ASC

SELECT * FROM Pagos ORDER BY CAST(REPLACE(REPLACE(folio,'A',''),'B','')AS int)

SELECT * FROM Pagos WHERE folio NOT LIKE'%A%' AND folio NOT LIKE '%B%' --ORDER BY CAST(REPLACE(REPLACE(folio,'A',''),'B','') AS int)

UNION

SELECT * FROM Pagos WHERE folio LIKE'%A%' OR folio LIKE '%B%' ORDER BY CAST(REPLACE(REPLACE(folio,'A',''),'B','') AS int)

ORDER BY CAST(REPLACE(REPLACE(folio,'A',''),'B','') AS int)

SELECT * FROM Agua	ORDER BY idPago

SELECT pa.idpago,pa.folio,pa.fecha,cu.nombre,pa.tipo,ag.tarifa,ag.MesInicio,ag.MesFinal,pa.total FROM CUENTAS cu 
INNER JOIN CALLES ca ON cu.idCalle = ca.idCalle
INNER JOIN Pagos pa ON cu.idCuenta = pa.idCuenta
INNER JOIN Agua ag ON pa.idPago = ag.idPago WHERE cu.cveCuenta='1-1-156'

SELECT pa.folio,pa.fecha,cu.nombre,pa.tipo,s.descripcion,pa.total FROM Cuentas cu
INNER JOIN Pagos pa ON cu.idCuenta = pa.idCuenta
INNER JOIN ServiciosAtendidos sa ON pa.idPago = sa.idPago
INNER JOIN Servicios s on sa.idServicio = s.idServicio
INNER JOIN Agua ag ON ag.idPago = pa.idPago

--Unionde select
SELECT pa.folio,pa.fecha,cu.nombre,pa.tipo,CAST(ag.tarifa as nvarchar),pa.total FROM CUENTAS cu 
INNER JOIN CALLES ca ON cu.idCalle = ca.idCalle
INNER JOIN Pagos pa ON cu.idCuenta = pa.idCuenta
INNER JOIN Agua ag ON pa.idPago = ag.idPago

UNION

SELECT pa.folio,pa.fecha,cu.nombre,pa.tipo,s.descripcion,pa.total FROM Cuentas cu
INNER JOIN Pagos pa ON cu.idCuenta = pa.idCuenta
INNER JOIN ServiciosAtendidos sa ON pa.idPago = sa.idPago
INNER JOIN Servicios s on sa.idServicio = s.idServicio

UNION

SELECT pa.folio,pa.fecha,cu.nombre,pa.tipo,pa.otros,pa.total FROM Cuentas cu
INNER JOIN Pagos pa ON cu.idCuenta = pa.idCuenta WHERE tipo like '%otro%'

--ORDER BY pa.idPago ASC
ORDER BY pa.fecha /*'^[0-9]+$'*/ ASC


-- fin de consulta

SELECT cu.idCuenta, cu.cveCuenta, cu.nombre,c.nombre,cu.noExterior,cu.noInterior,cu.fechaAlta,cu.ultimoPagoA,cu.ultimoPagoM FROM Cuentas cu 
INNER JOIN Calles c ON c.idCalle = cu.idCalle



SELECT REPLACE(SUBSTRING(cveCuenta, 1, DATALENGTH(cveCuenta)),'*', '-') FROM Cuentas

--IDENTITY
SET IDENTITY_INSERT Empleados OFF

DBCC CHECKIDENT ('Empleados', RESEED, 0);
GO
--DELETE
DELETE FROM GastosRealizados
DELETE FROM Gastos
DELETE FROM Empleados
DELETE FROM Pagos

DELETE FROM Cuentas WHERE idCuenta = 106
/*DELETE Por Select*/
DELETE Pagos,Agua FROM Pagos p INNER JOIN Agua a ON p.idPago = a.idPago WHERE p.idCuenta = 367

317 318 319
DELETE FROM Agua WHERE idPago = 14077	
DELETE FROM PAGOS WHERE idPago = 14077

DELETE FROM Pagos WHERE idPago = 4562
DELETE FROM ServiciosAtendidos WHERE idPago = 4562

--INSERT
INSERT INTO EMPLEADOS VALUES ('MONICA LIZETT LOPEZ RAMIREZ','RAMON CORONA 170 B',	'CENTRO',49330,3421100550,3421100550),('CLARA ISELA AGUILAR LOPEZ','FRAY BARTOLOME DE LAS CASA 40','CENTRO',49330,3421106884,3421106884)

INSERT INTO Pagos VALUES (17,9,'09-01-2017',1,)


/*Por par de meses*/
INSERT INTO Pagos VALUES (11077,2424,'11-12-2017','','Agua',86.5,'9512')
INSERT INTO Agua VALUES (11077,1,1,6,0,2017,70.00,0,2.5,14)

INSERT INTO Pagos VALUES (205,64,'06-01-2018','','Agua',189,'11232')
INSERT INTO Agua VALUES (205,3,4,6,0,2017,140,16,5,28)

INSERT INTO Pagos VALUES (206,64,'19-02-2018','','Agua',189,'11783')
INSERT INTO Agua VALUES (206,5,6,6,0,2017,140,16,5,28)

INSERT INTO Pagos VALUES (207,64,'05-03-2018','','Agua',189,'12473')
INSERT INTO Agua VALUES (207,7,8,6,0,2017,140,16,5,28)

INSERT INTO Pagos VALUES (208,64,'12-03-2018','','Agua',189,'12724')
INSERT INTO Agua VALUES (208,9,10,6,0,2017,140,16,5,28)

INSERT INTO Pagos VALUES (209,64,'09-04-2018','','Agua',189,'13464')
INSERT INTO Agua VALUES (209,11,12,6,0,2017,140,16,5,28)

/*Por Mes*/
INSERT INTO Pagos VALUES (704,256,'27-06-2016','','Agua',83,'4262B')
INSERT INTO Agua VALUES (704,2,2,6,0,2016,67.5,0,2,13.5)

INSERT INTO Pagos VALUES (705,256,'04-07-2016','','Agua',83,'4374B')
INSERT INTO Agua VALUES (705,3,3,6,0,2016,67.5,0,2,13.5)

INSERT INTO Pagos VALUES (706,256,'11-07-2016','','Agua',83,'4461B')
INSERT INTO Agua VALUES (706,4,4,6,0,2016,67.5,0,2,13.5)

INSERT INTO Pagos VALUES (707,256,'18-07-2016','','Agua',83,'4587B')
INSERT INTO Agua VALUES (707,5,5,6,0,2016,67.5,0,2,13.5)

INSERT INTO Pagos VALUES (708,256,'25-07-2016','','Agua',83,'4806B')
INSERT INTO Agua VALUES (708,6,6,6,0,2016,67.5,0,2,13.5)

INSERT INTO Pagos VALUES (709,256,'01-08-2016','','Agua',86,'4921B')
INSERT INTO Agua VALUES (709,7,7,6,0,2016,67.5,0,2,13.5)

INSERT INTO Pagos VALUES (710,256,'08-08-2016','','Agua',86,'5059B')
INSERT INTO Agua VALUES (710,8,8,6,0,2016,67.5,0,2,13.5)

INSERT INTO Pagos VALUES (711,256,'15-08-2016','','Agua',83,'5183B')
INSERT INTO Agua VALUES (711,9,9,6,0,2016,67.5,0,2,13.5)

INSERT INTO Pagos VALUES (712,256,'22-08-2016','','Agua',83,'5331B')
INSERT INTO Agua VALUES (712,10,10,6,0,2016,67.5,0,2,13.5)

INSERT INTO Pagos VALUES (713,256,'29-08-2016','','Agua',83,'5472B')
INSERT INTO Agua VALUES (713,11,11,6,0,2016,67.5,0,2,13.5)

INSERT INTO Pagos VALUES (714,256,'05-09-2016','','Agua',83,'5613B')
INSERT INTO Agua VALUES (714,12,12,6,0,2016,67.5,0,2,13.5)



INSERT INTO Pagos VALUES (2290,643,'06-11-2017','','Agua',86.5,'8516')
INSERT INTO Agua VALUES (2290,1,1,6,0,2017,70,0,2.5,14)

INSERT INTO Pagos VALUES (2291,643,'13-11-2017','','Agua',86.5,'8723')
INSERT INTO Agua VALUES (2291,2,2,6,0,2017,70,0,2.5,14)

INSERT INTO Pagos VALUES (2292,643,'20-11-2017','','Agua',86.5,'8910')
INSERT INTO Agua VALUES (2292,3,3,6,0,2017,70,0,2.5,14)

INSERT INTO Pagos VALUES (2293,643,'27-11-2017','','Agua',86.5,'9112')
INSERT INTO Agua VALUES (2293,4,4,6,0,2017,70,0,2.5,14)

INSERT INTO Pagos VALUES (2294,643,'04-12-2017','','Agua',86.5,'9293')
INSERT INTO Agua VALUES (2294,5,5,6,0,2017,70,0,2.5,14)

INSERT INTO Pagos VALUES (2295,643,'11-12-2017','','Agua',86.5,'9514')
INSERT INTO Agua VALUES (2295,6,6,6,0,2017,70,0,2.5,14)

INSERT INTO Pagos VALUES (2296,643,'18-12-2017','','Agua',86.5,'9698')
INSERT INTO Agua VALUES (2296,7,7,6,0,2017,70,0,2.5,14)

INSERT INTO Pagos VALUES (2297,643,'02-01-2018','','Agua',86.5,'9900')
INSERT INTO Agua VALUES (2297,8,8,6,0,2017,70,0,2.5,14)

INSERT INTO Pagos VALUES (2298,643,'08-01-2018','','Agua',86.5,'10215')
INSERT INTO Agua VALUES (2298,9,9,6,0,2017,70,0,2.5,14)

INSERT INTO Pagos VALUES (2299,643,'15-01-2018','','Agua',86.5,'10654')
INSERT INTO Agua VALUES (2299,10,10,6,0,2017,70,0,2.5,14)

INSERT INTO Pagos VALUES (2300,643,'22-01-2018','','Agua',86.5,'10802')
INSERT INTO Agua VALUES (2300,11,11,6,0,2017,70,0,2.5,14)

INSERT INTO Pagos VALUES (2301,643,'29-01-2018','','Agua',86.5,'6455')
INSERT INTO Agua VALUES (2301,12,12,6,0,2017,70,0,2.5,14)




INSERT INTO Pagos VALUES (727,256,'26-02-2018','','Agua',90,'12229')
INSERT INTO Agua VALUES (727,1,1,6,0,2018,73,0,2.5,14.5)

INSERT INTO Pagos VALUES (728,256,'05-03-2018','','Agua',90,'12498')
INSERT INTO Agua VALUES (728,2,2,6,0,2018,73,0,2.5,14.5)

INSERT INTO Pagos VALUES (729,256,'12-03-2018','','Agua',90,'12741')
INSERT INTO Agua VALUES (729,3,3,6,0,2018,73,0,2.5,14.5)

INSERT INTO Pagos VALUES (730,256,'20-03-2018','','Agua',90,'12936')
INSERT INTO Agua VALUES (730,4,4,6,0,2018,73,0,2.5,14.5)

INSERT INTO Pagos VALUES (731,256,'26-03-2018','','Agua',90,'13082')
INSERT INTO Agua VALUES (731,5,5,6,0,2018,73,0,2.5,14.5)

INSERT INTO Pagos VALUES (732,256,'02-04-2018','','Agua',90,'13286')
INSERT INTO Agua VALUES (732,6,6,6,0,2018,73,0,2.5,14.5)

INSERT INTO Pagos VALUES (733,256,'09-04-2018','','Agua',90,'13476')
INSERT INTO Agua VALUES (733,7,7,6,0,2018,73,0,2.5,14.5)

INSERT INTO Pagos VALUES (734,256,'16-04-2018','','Agua',90,'13689')
INSERT INTO Agua VALUES (734,8,8,6,0,2017,70,0,2.5,14)

INSERT INTO Pagos VALUES (735,256,'23-04-2018','','Agua',90,'13716')
INSERT INTO Agua VALUES (735,9,9,6,0,2018,73,0,2.5,14.5)

INSERT INTO Pagos VALUES (736,256,'02-05-2018','','Agua',90,'0023')
INSERT INTO Agua VALUES (736,10,10,6,0,2018,73,0,2.5,14.5)

INSERT INTO Pagos VALUES (737,256,'07-05-2018','','Agua',90,'0228')
INSERT INTO Agua VALUES (737,11,11,6,0,2018,73,0,2.5,14.5)

INSERT INTO Pagos VALUES (738,256,'14-05-2018','','Agua',90,'0260')
INSERT INTO Agua VALUES (738,12,12,6,0,2018,73,0,2.5,14.5)
RESTORE DATABASE BDSistemaAgua FROM DISK = 'D:\Respaldo\Respado_18_7_2018.bak' WITH  STATS = 5, REPLACE

BULK INSERT Tarifas FROM 'C:\Users\Escuela\Documents\Tarifas.txt' WITH ( FIELDTERMINATOR= ',', ROWTERMINATOR = '\n' );

