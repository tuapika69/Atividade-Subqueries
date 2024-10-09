-- 1) Liste os nomes dos funcionários cujos nomes de departamento contêm a palavra "Recursos Humanos" (estude o operador LIKE).
SELECT nome_funcionario
FROM funcionario
WHERE sigla_depto IN (
    SELECT sigla_depto
    FROM departamento
    WHERE nome_depto LIKE '%Recursos Humanos%'
);

-- 2) Liste os nomes dos funcionários que estão trabalhando em projetos do departamento contidos em 'MKT' e também 'RH'.
SELECT nome_funcionario
FROM funcionario
WHERE sigla_depto IN ('MKT', 'RH');

-- 3) Liste os nomes dos departamentos e a soma dos salários de todos os funcionários em cada departamento (estude o operador SUM).
SELECT nome_depto,
       (SELECT SUM(salario) 
        FROM funcionario 
        WHERE funcionario.sigla_depto = departamento.sigla_depto) AS soma_salarios
FROM departamento;

-- 4) Liste os nomes dos funcionários que trabalham em projetos do departamento 'TI' e que ganham mais do que a média salarial dos funcionários do departamento 'TI' (estude o operador AVG).
SELECT nome_funcionario
FROM funcionario
WHERE sigla_depto = 'TI'
AND salario > (
    SELECT AVG(salario) 
    FROM funcionario 
    WHERE sigla_depto = 'TI'
);

-- 5) Liste os nomes dos departamentos e a quantidade de funcionários em cada departamento (estude o operador COUNT).
SELECT nome_depto,
       (SELECT COUNT(*) 
        FROM funcionario 
        WHERE funcionario.sigla_depto = departamento.sigla_depto) AS qtd_funcionarios
FROM departamento;

-- 6) Liste os nomes dos funcionários que estão trabalhando em projetos do departamento 'RH' e têm um salário superior à média dos salários do departamento 'RH'.
SELECT nome_funcionario
FROM funcionario
WHERE sigla_depto = 'RH'
AND salario > (
    SELECT AVG(salario) 
    FROM funcionario 
    WHERE sigla_depto = 'RH'
);

-- 7) Liste todos os departamentos e para cada departamento, liste os nomes dos funcionários separados por vírgula (estude o operador GROUP_CONCAT).
SELECT nome_depto,
       (
           SELECT GROUP_CONCAT(nome_funcionario ORDER BY nome_funcionario)
           FROM funcionario
           WHERE funcionario.sigla_depto = departamento.sigla_depto
       ) AS funcionarios
FROM departamento;
