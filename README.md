# Oracle-RM
[![author](https://img.shields.io/badge/author-patrick-red.svg)](https://www.linkedin.com/in/patrick-cavalcante-moraes-a95635179/) 
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/PatrickCavalcant)

Cláusulas desenvolvidas para utilização como exemplos no dia a dia.

Tabelas
```
GFILIAL - Filiais 
PFUNC - Funcionários
PPESSOA - Dados Pessoais
PSECAO - Seção
AHORARIO
VTABELASALARIAL
VTABSALARIAIS
VNIVELFUNCAO
VFAIXASALARIAL
GDEPTO
```

Rownum
```
SELECT  
* 
FROM PFUNC A 
WHERE ROWNUM  < 100
```

Este exemplo usa o aninhamento para concatenar quatrp strings de caracteres:
```
CONCAT(CONCAT(CONCAT(CONCAT(RUA, ', '), NUMERO), ' - '), BAIRRO)
```

Replace
```
REPLACE(REPLACE(REPLACE(CGC, '.', ''), '/', ''), '-', '')                  AS CNPJ,
```
