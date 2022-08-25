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
```
(B.RUA || ', N° ' || B.NUMERO || ', ' || B.COMPLEMENTO || ', ' ||  B.BAIRRO || ', ' || B.CIDADE || '-' ||  B.ESTADO || ', CEP: ' || B.CEP) ENDERECO,
```

Replace
```
REPLACE(REPLACE(REPLACE(CGC, '.', ''), '/', ''), '-', '')                  AS CNPJ,
```

Pegar a primeira e segunda posição e retirar os espações
```
RTRIM(LTRIM(SUBSTR(ZOOM_FILIAL, 1, 2)))

SUBSTR(ZOOM_FILIAL, 1, 2) - Pegar as 2 primeiras posições
RTRIM(LTRIM()) - Retira os espaços
```

Insert
```
INSERT ALL
INTO MP_SUPERINTENDENCIA (SOLICITACAO_MP, FILIAIS_MP) VALUES (36220,  71) 
INTO MP_SUPERINTENDENCIA (SOLICITACAO_MP, FILIAIS_MP) VALUES (36219,  4) 
SELECT * FROM DUAL 
```

Create
```
CREATE TABLE MP_SUPERINTENDENCIA(SOLICITACAO_MP VARCHAR(50) NOT NULL, FILIAIS_MP VARCHAR(50) NOT NULL)
```

Alter
```
ALTER TABLE MP_GERAL_ANTERIOR MODIFY (TXT_JUSTIFICATIVA VARCHAR2(2000))
```

Como pegar o nome e tipo de dados das colunas de uma tabela?
```
SELECT * FROM ALL_TAB_COLUMNS WHERE TABLE_NAME = 'MP_GERAL_ANTERIOR'
```
