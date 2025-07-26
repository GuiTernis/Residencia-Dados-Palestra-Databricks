CREATE OR REFRESH STREAMING TABLE
    bronze_vendas

AS SELECT 

*,
_metadata.file_name AS arquivo_origem,
_metadata.file_modification_time AS recebimento_arquivo,
now() as ingestao_registro

FROM STREAM READ_FILES(
'/Volumes/varejo_demo/simulacao_vendas/landing/vendas',
format => 'json'
);

CREATE OR REFRESH STREAMING TABLE
    bronze_produtos

AS SELECT 

*,
_metadata.file_name AS arquivo_origem,
_metadata.file_modification_time AS recebimento_arquivo,
now() as ingestao_registro

FROM STREAM READ_FILES(
'/Volumes/varejo_demo/simulacao_vendas/landing/produtos',
format => 'json'
);