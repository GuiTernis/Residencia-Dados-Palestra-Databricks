CREATE OR REFRESH MATERIALIZED VIEW gold_vendas
AS SELECT 

id_transacao,
id_produto,
quantidade,
ROUND(
(preco_unitario * quantidade),2) as valor_venda,
timestamp,
IFNULL(forma_pagamento,'-') as forma_pagamento,
arquivo_origem,
ingestao_registro,
recebimento_arquivo

FROM silver_vendas

WHERE NOT flag_cancelado;
