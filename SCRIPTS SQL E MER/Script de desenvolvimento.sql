insert into funcionarios(idFuncionarios,Nome,Cpf,Salario)
values(1, 'Vinicius', 097044879, 1570);

-- INSERI VIA APPLY AS 15 REQUISIÇÕES ?


select * from funcionarios;
ALTER TABLE funcionarios ADD supervisor char(1);
-----------------------------------------------------------------

INSERT INTO `empresa_tech`.`atas` (`Nome_da_etapa`) VALUES ('Inicial');
INSERT INTO `empresa_tech`.`atas` (`Nome_da_etapa`) VALUES ('Intermediaria');
INSERT INTO `empresa_tech`.`atas` (`Nome_da_etapa`) VALUES ('Desenvolvimento');
INSERT INTO `empresa_tech`.`atas` (`Nome_da_etapa`) VALUES ('Final');
select * from atas;

----------------------------------------------------------------
INSERT INTO `empresa_tech`.`departamentos` (`Nome_Setor`, `Codigo_do_departamento`) VALUES ('ADM', '2');
INSERT INTO `empresa_tech`.`departamentos` (`Nome_Setor`, `Codigo_do_departamento`) VALUES ('INFRA', '3');
INSERT INTO `empresa_tech`.`departamentos` (`Nome_Setor`, `Codigo_do_departamento`) VALUES ('DESENVOLVIMENTO', '4');
INSERT INTO `empresa_tech`.`departamentos` (`Nome_Setor`, `Codigo_do_departamento`) VALUES ('ENGENHARIA', '5');
INSERT INTO `empresa_tech`.`departamentos` (`Nome_Setor`, `Codigo_do_departamento`) VALUES ('MARKETING', '6');
select * from departamentos;

----------------------------------------------------------------
insert into dependentes(idDependentes,Nome,Idade,idFuncionarios)
values (3, 'Lorena', '2',5 );
SELECT * FROM dependentes;
-----------------------------------------------
SELECT funcionarios.nome, dependentes.nome
FROM funcionarios join dependentes
on funcionarios.idFuncionarios = dependentes.idFuncionarios;
-----------------------------------------
select * from funcionarios;

SELECT funcionarios.nome, projetos.nome_do_projeto
FROM funcionarios join projetos
on funcionarios.idFuncionarios=projetos.idProjetos;

select * from funcionarios_projetos;
-----------------------------------------
INSERT INTO `empresa_tech`.`projetos` (`idProjetos`, `Nome_do_projeto`, `Data_Inicial`, `id_fases`, `Nome_da_etapa`) VALUES ('2', 'Projeto Intermediaria', '2020-02-02', '5', 'Intermediaria');
UPDATE `empresa_tech`.`projetos` SET `Nome_do_projeto` = 'Projeto Desenvolvimento' WHERE (`idProjetos` = '1');
INSERT INTO `empresa_tech`.`projetos` (`idProjetos`, `Nome_do_projeto`, `Data_Inicial`, `id_fases`, `Nome_da_etapa`) VALUES ('3', 'Projeto evo', '2010-01-01', '1', 'Inicial');
INSERT INTO `empresa_tech`.`projetos` (`idProjetos`, `Nome_do_projeto`, `Data_Inicial`, `id_fases`, `Nome_da_etapa`) VALUES ('4', 'Projeto burn', '2011-12-02', '3', 'Final');
select * from projetos;
----------------------------------------
select * from supervisor;
INSERT INTO supervisor(Nome_supervisor,Id_funcionario)
VALUES ('Vinicius',1);

----------------------------------------
DROP TABLE IF exists atas;
DROP TABLE IF exists departamentos;
DROP TABLE IF exists dependentes;
DROP TABLE IF exists funcionarios;
DROP TABLE IF exists funcionarios_projetos;
DROP TABLE IF exists projetos;
DROP TABLE IF exists supervisor;
-----------------------------------------------
-- CRIANDO STORED PARA SALARIO ESTÁ NO STORE PROCEDURES ?



 



-- Maior salario ?


SELECT  Nome.max(Salario) from funcionarios;

select * from Maximo_salario;

-- Do maior pro menor?
SELECT Nome,Salario FROM `funcionarios` ORDER BY Salario DESC;

-- Media salarial funcionarios ?
Select avg(Salario) AS 'Média salarial' FROM funcionarios;

-- RETORNA QUEM E SUPERVISOR ?
SELECT Nome, supervisor from funcionarios
WHERE supervisor = 'S'