USE BDSistemaAgua

SELECT * FROM Pagos p INNER JOIN Cuentas cu on p.idCuenta = cu.idCuenta WHERE p.idCuenta = 2 ORDER BY P.idPago desc
SELECT * FROM DE
SELECT * FROM Cuentas
UPDATE CUENTAS SET ultimoPagoA = ultimoAA, ultimoPagoM = ultimoMA WHERE idCuenta = 2

