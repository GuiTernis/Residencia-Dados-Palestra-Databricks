CREATE OR REFRESH STREAMING TABLE silver_produtos;

CREATE FLOW upsert_produtos_silver AS AUTO CDC INTO
  silver_produtos
FROM
  stream(bronze_produtos)
KEYS
  (id_produto)
SEQUENCE BY
  recebimento_arquivo
COLUMNS 

id_produto,
categoria,
marca,
nome_produto,
preco_lista,
arquivo_origem,
recebimento_arquivo,
ingestao_registro

STORED AS
  SCD TYPE 2;