--Ejemplo Procedure con parametro 
GO 
CREATE OR ALTER PROCEDURE psaluda @nombre as varchar(10)
AS
BEGIN
  --PON AQUI EL ALGORITMO PARA RESOLVER EL PROCEDURE
  print 'hola' + @nombre
  -- FIN ALGORITMO PARA RESOLVER EL PROCEDURE
END
GO

--Ejemplo Funcion con parametro
GO
CREATE OR ALTER FUNCTION dbo.fsaluda(@nombre as varchar(10))
RETURNS VARCHAR(15)
AS
BEGIN
  DECLARE @resultado as varchar(15)
  -- PONGO EL ALGORITMO PARA CALCULAR EL RESULTADO DE LA FUNCIÓN
  SET @resultado = 'hola ' + @nombre 
  -- FIN ALGORITMO 
  RETURN @resultado
END