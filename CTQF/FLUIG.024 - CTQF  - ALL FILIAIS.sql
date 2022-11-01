SELECT CODFILIAL,
       REPLACE(REPLACE(REPLACE(CGC, '.', ''), '/', ''), '-', '')                  AS CNPJ,
       NOMEFANTASIA                                                               AS FILIAL,
       RUA,
       BAIRRO,
       NUMERO,
       CIDADE,
       CONCAT(
        CONCAT(
            CONCAT(
                            CONCAT(
                CONCAT(CODFILIAL, ' - '), 
                CONCAT(NOMEFANTASIA, ' - ')
            ), CGC
            ), ' | '
        ),        
        
        CONCAT(
           CONCAT(
                CONCAT(RUA, ' - '),
                CONCAT(BAIRRO, ' - ')
           ), NUMERO
        )
        ) AS PESQUISA
FROM   GFILIAL
WHERE  CODCOLIGADA = 3
AND
CODFILIAL != 1
ORDER  BY CODFILIAL