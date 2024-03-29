Use SISTEMA

--SELECT a.idCodigo,t.Concepto,a.Descripcion,a.Precio FROM ARTICULOS a INNER JOIN TIPO t ON a.idTipo = t.idTipo

--SELECT * FROM ARTICULOS
DROP PROCEDURE ArticuloRead

CREATE PROCEDURE ArticulosRead
@art_cod varchar(10)
AS
BEGIN 
	SET NOCOUNT ON
	SELECT idCodigo As isCodigo,
	Descripcion As Descripcion,
	Precio As Precio
	FROM ARTICULOS
	WHERE idCodigo = @art_cod
END

SELECT * FROM ARTICULOS

CREATE PROCEDURE ArticulosWrite
(	
	@C1 INT,
	@C2 INT,
	@C3 VARCHAR(20),
	@C4 FLOAT
)
AS
BEGIN
	SET NOCOUNT ON
	IF not exists (SELECT * FROM ARTICULOS WHERE idCodigo = @C1)
	BEGIN
		--NO EXISTE EL CODIGO, APLICA EL INSERT
		INSERT INTO ARTICULOS(idCodigo,idTipo,Descripcion,Precio)
		VALUES (@C1,@C2,@C3,@C4)
		SELECT 1 AS Valor
	END
	ELSE
	BEGIN
		--SI EXISTE EL CODIGO, APLICA EL UPDATE
		UPDATE ARTICULOS SET idTipo = @C2, Descripcion = @C3,Precio = @C4
		WHERE idCodigo = @C1
		SELECT 2 AS Valor
	END
END

CREATE TABLE VENTA
(
	idVenta INT PRIMARY KEY,
	Fecha Date,
	Iva float,
	Subtotal float,
	Total float
);
INSERT VENTA VALUES(1,'01/01/2018',0.10,200,220)

CREATE TABLE DETALLE_VENTA
(
	idVenta INT,
	idCodigo INT,
	Cantidad INT,
	Costo Float,
	PRIMARY KEY(idVenta,idCodigo)
);
INSERT DETALLE_VENTA VALUES (1,2,4,25)
INSERT DETALLE_VENTA VALUES (1,4,1,100)

CREATE PROCEDURE ArticulosRemove
@art_cod varchar(10)
AS
BEGIN
	SET NOCOUNT ON
	IF not exists (SELECT * FROM ARTICULOS WHERE idCodigo = @art_cod)
	BEGIN
		--NO EXISSTE EL REGISTRO
		SELECT 2 AS Valor
	END
	ELSE
	BEGIN
		IF(not exists(SELECT * FROM DETALLE_VENTA WHERE idCodigo = @art_cod))
		BEGIN
			--NO EXISTEN DETALLES DE VENTAS EN ESE CODIGO
			DELETE ARTICULOS WHERE idCodigo = @art_cod
			SELECT 1 AS Valor
		END
		ELSE
		BEGIN
			--TIENE DEPENDECIAS Y NO SE PUEDE BORRAR EL ARTICULO
				SELECT 3 AS Valor
		END
	END
END