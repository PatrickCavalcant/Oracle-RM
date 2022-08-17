SELECT
PFUNC.CHAPA, 
PFUNC.NOME, 
PFUNC.CODSECAO, 
PFUNC.CODFUNCAO, 
PFUNC.CODSITUACAO, 
PFUNCAO.NOME FUNCAO, 
PSECAO.DESCRICAO SECAO, 
PFUNC.CODFILIAL, 
AHORARIO.DESCRICAO EXPEDIENTE, 
PFUNC.JORNADA/60 JORNADA, 
PFUNC.CODTIPO, 
PFUNC.CODRECEBIMENTO, 
PFUNC.SALARIO, 
VTABELASALARIAL.CODTABELA, 
VT.NOMETABELA, 
VTABELASALARIAL.FAIXA, 
VFS.NOMEFAIXA, 
VTABELASALARIAL.NIVEL, 
VNF.NOMENIVEL, 
CONCAT(PFUNC.CHAPA, PFUNC.NOME) CHAPA_NOME, 
PSECAO.CODIGO CODDEPTO, 
DEP.NOME DEPARTAMENTO, 
PFUNC.CODSITUACAO, 
PFUNC.DATADEMISSAO,
PFUNC.DATAADMISSAO,
PFUNC.PISPARAFGTS,
PPES.CPF
FROM PFUNC (NOLOCK) 
LEFT JOIN AHORARIO (NOLOCK) ON AHORARIO.CODCOLIGADA = PFUNC.CODCOLIGADA AND AHORARIO.CODIGO = PFUNC.CODHORARIO 
LEFT JOIN PFUNCAO (NOLOCK) ON PFUNCAO.CODCOLIGADA = PFUNC.CODCOLIGADA AND PFUNCAO.CODIGO = PFUNC.CODFUNCAO 
LEFT JOIN PSECAO (NOLOCK) ON PSECAO.CODCOLIGADA = PFUNC.CODCOLIGADA AND PSECAO.CODIGO = PFUNC.CODSECAO 
LEFT JOIN VTABELASALARIAL (NOLOCK) ON VTABELASALARIAL.CODCOLIGADA = PFUNC.CODCOLIGADA AND PFUNC.CODTABELASALARIAL = VTABELASALARIAL.CODTABELA 
AND PFUNC.GRUPOSALARIAL = VTABELASALARIAL.FAIXA AND PFUNC.CODNIVELSAL = VTABELASALARIAL.NIVEL 
LEFT JOIN VTABSALARIAIS (NOLOCK) VT ON VTABELASALARIAL.CODCOLIGADA = VT.CODCOLIGADA AND VT.CODTABELA = VTABELASALARIAL.CODTABELA  
LEFT JOIN VNIVELFUNCAO VNF (NOLOCK) ON VNF.CODCOLIGADA = VTABELASALARIAL.CODCOLIGADA AND VNF.CODNIVEL = VTABELASALARIAL.NIVEL 
LEFT JOIN VFAIXASALARIAL VFS (NOLOCK) ON VTABELASALARIAL.CODCOLIGADA = VFS.CODCOLIGADA AND VTABELASALARIAL.FAIXA = VFS.CODFAIXA 
LEFT JOIN GDEPTO DEP (NOLOCK) ON PSECAO.CODCOLIGADA = DEP.CODCOLIGADA AND PSECAO.CODFILIAL = DEP.CODFILIAL AND PSECAO.CODDEPTO = DEP.CODDEPARTAMENTO 
LEFT JOIN PPESSOA PPES (NOLOCK) ON PFUNC.CODPESSOA = PPES.CODIGO

WHERE PFUNC.CODFILIAL = :FILIAL 
AND PFUNC.CODCOLIGADA = 3 
AND (PFUNC.NOME LIKE CONCAT(UPPER(:CHNO), '%') OR PFUNC.CHAPA LIKE CONCAT(UPPER(:CHNO), '%')) 
AND (PFUNC.CODSITUACAO <> 'D' 
OR (PFUNC.CODSITUACAO = 'D' AND ( 
	PFUNC.DATADEMISSAO >= (SELECT ADD_MONTHS(TRUNC(SYSDATE), -12) FROM DUAL) AND 
	PFUNC.DATADEMISSAO <= (SYSDATE) 
	)))  
ORDER BY PFUNC.NOME ASC