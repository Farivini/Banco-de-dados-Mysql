CREATE DEFINER=`root`@`localhost` PROCEDURE `Aumento`(Percentual Integer)
begin
	update funcionarios
		set  Salario =  Salario + Salario*(Percentual)/100;
end