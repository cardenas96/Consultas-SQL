use BDSistemaAgua
SELECT p.idProveedor, p.nombre,p.domicilio,p.telefono,p.email FROM Proveedores p
SELECT * FROM CompraMaterial
SELECT * FROM DetalleCompraMaterial
SELECT * FROM Material

SELECT * FROM Empleados
DElETE FROM CompraMaterial
DELETE FROM DetalleCompraMaterial
INSERT INTO CompraMaterial VALUES (1, 3, '129831092', '27/03/2017 23:23:58', 188.75, 16, 216.7)
INSERT INTO CompraMaterial (idOrden, idProveedor, factura, fecha, subtotal, iva, total);
ALTER TABLE CompraMaterial ALTER COLUMN total decimal;
ALTER TABLE CompraMaterial ALTER COLUMN idOrden int primary key

VALUES (" & c1 & ", " & c2 & ", '" & c3 & "','" & c4 & "'," & c5 & "," & c6 & "," & c7 & ")

SELECT * FROM GastosRealizados
SELECT sm.idSalida, c.nombre, e.nombre, sm.fecha, sm.Concepto FROM SalidaMaterial sm INNER JOIN Calles c ON c.idCalle = sm.idCalle INNER JOIN Empleados e ON e.idEmpleado = sm.idEmpleado

SELECT dsm.idSalida, m.descripcion, dsm.cantidad, dsm.costo FROM DetalleSalidaMaterial dsm 
INNER JOIN Material m ON m.idMaterial = dsm.idMaterial 
INNER JOIN SalidaMaterial sm ON dsm.idSalida = sm.idSalida
INNER JOIN Empleados e ON e.idEmpleado = sm.idEmpleado WHERE e.nombre = 'Alonso' OR e.idEmpleado = 2

SELECT sm.idSalida, c.nombre, e.nombre, sm.fecha, sm.Concepto FROM SalidaMaterial sm INNER JOIN Calles c ON c.idCalle = sm.idCalle INNER JOIN Empleados e ON e.idEmpleado = sm.idEmpleado
SELECT e.idEmpleado, e.domicilio, e.telefono ,sm.idSalida FROM SalidaMaterial sm INNER JOIN Empleados e ON sm.idEmpleado = sm.idEmpleado WHERE sm.idSalida = 1

SELECT sm.idEmpleado, e.nombre, e.domicilio, e.celular FROM SalidaMaterial sm INNER JOIN Empleados e ON e.idEmpleado = sm.idEmpleado WHERE idSalida = 1

SELECT sm.idCalle, c.nombre, c.colonia, c.cp, c.totalCasas FROM SalidaMaterial sm INNER JOIN Calles c ON c.idCalle = sm.idCalle WHERE idSalida = 1

SELECT dsm.idSalida, m.descripcion, dsm.cantidad, dsm.costo FROM DetalleSalidaMaterial dsm 
INNER JOIN Material m ON m.idMaterial = dsm.idMaterial 
INNER JOIN SalidaMaterial sm ON dsm.idSalida = sm.idSalida
INNER JOIN Calles c ON c.idCalle = sm.idCalle WHERE c.nombre = '' OR c.idCalle = 4
SELECT sm.idCalle, c.nombre, c.colonia, c.cp, c.totalCasas, sm.Concepto FROM SalidaMaterial sm INNER JOIN Calles c ON c.idCalle = sm.idCalle WHERE SM.idSalida = 1