SELECT 
PFUNC.NOME,
PFUNC.CHAPA,
PFCOMPL.GRPFLUIG3 AS NIVEL,
PFUNC.CODFILIAL

FROM 
PFUNC

INNER JOIN PFCOMPL
ON	PFCOMPL.CODCOLIGADA=PFUNC.CODCOLIGADA
AND PFCOMPL.CHAPA=PFUNC.CHAPA

INNER JOIN PSECAO
ON	PSECAO.CODCOLIGADA=PFUNC.CODCOLIGADA
AND	PSECAO.CODIGO=PFUNC.CODSECAO

WHERE PFUNC.CODCOLIGADA=3
AND PFUNC.CODSITUACAO<>'D'
AND PFCOMPL.GRPFLUIG IS NOT NULL
AND PFUNC.CODFILIAL LIKE CONCAT(:CODFILIAL, '%')