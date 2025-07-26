CREATE TEMPORARY  VIEW trat_silver_vendas

AS SELECT 

id_transacao,
explode(itens) as item,
item.id_produto as id_produto,
item.quantidade as quantidade,
ROUND(
  CAST(
    REPLACE(
      REPLACE(item.preco_unitario, "R$ ", ""), ",", "."
    ) AS DOUBLE
  ), 2
) as preco_unitario,
timestamp(timestamp) as timestamp,
forma_pagamento,
boolean(cancelado) as flag_cancelado,
arquivo_origem,
ingestao_registro,
recebimento_arquivo

FROM STREAM(bronze_vendas);

CREATE OR REFRESH STREAMING TABLE silver_vendas(
CONSTRAINT forma_pagamento_valida EXPECT (forma_pagamento 

IN('Pix','Cartão de Crédito','Cartão de Débito','Dinheiro')

) ON VIOLATION DROP ROW

);

CREATE FLOW upsert_vendas_silver AS AUTO CDC INTO
  silver_vendas
FROM
  stream(trat_silver_vendas)
KEYS
  (id_transacao, id_produto)
SEQUENCE BY
  recebimento_arquivo
COLUMNS * EXCEPT
  (item)
STORED AS
  SCD TYPE 1;