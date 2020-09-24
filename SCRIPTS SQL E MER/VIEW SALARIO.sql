CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `maximo_salario` AS
    SELECT 
        `funcionarios`.`Nome` AS `Nome`,
        MAX(`funcionarios`.`Salario`) AS `max(Salario)`
    FROM
        `funcionarios`