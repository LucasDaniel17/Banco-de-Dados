use bdescola;

Select * from aluno;
Select * from disciplina;

-- exercícios de consultas com subquery (09/08/2022)

-- A) QUANTIDADE DE DISCIPLINAS QUE CADA ALUNO CURSA (subquery na coluna)
Select a.nome_Aluno, (select COUNT(d.NOME_DISCIPLINA) from disciplina d, notas n where a.id_Aluno = n.id_Aluno and d.ID_DISCIPLINA = n.id_Disciplina) 
	AS Quantidade_Disciplina from aluno a;
    
-- B) ALUNOS QUE NÃO TEM NENHUMA NOTA (subquery como filtro)
Select a.nome_aluno from aluno a where a.nome_Aluno not in (select a.id_Aluno from notas); 

-- C) ALUNOS QUE CURSAM MENOS DE 2 DISCIPLINAS (subquery como fonte de dados)
Select x.nome_aluno, x.Quantidade_Disciplina from (select a.nome_Aluno, (select count(d.nome_disciplina) from disciplina d, notas n where 
	a.id_Aluno = n.id_Aluno and d.ID_DISCIPLINA = n.id_Disciplina) AS Quantidade_Disciplina from aluno a group by a.id_aluno) x where x.Quantidade_Disciplina < 2;
