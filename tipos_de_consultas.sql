use BDSistemaAgua;
Select nombre from calles Union select nombre from cuentas
select * from Cuentas
Select nombre from cuentas where nombre like '%j%'
select sum(totalCasas) from Calles
select avg(costo) from Material
select count(nombre) from Proveedores
select count(Distinct idCalle) from Cuentas
select descripcion,MIN(existencias) from Material Group by descripcion having MIN(existencias) <20;
select idCalle,nombre from Calles where idCalle in(2,4)
select e.Nombre, g.descripcion from Empleados as e inner join Empleados_Gastos As eg
select fechaAlta,nombre from Cuentas where fechaAlta between '2014-01-01' and '2016-12-30'
SELECT Cuentas.nombre,Calles.nombre FROM Cuentas INNER JOIN Calles ON Cuentas.idCalle = Calles.idCalle
delete from Cuentas where idCuenta = '12';
select SUBSTRING(nombre,1,4) from Cuentas
Update nombre 