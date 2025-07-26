CREATE OR REFRESH MATERIALIZED VIEW gold_produtos
AS SELECT 

*
EXCEPT(`__START_AT`,
       `__END_AT`)
       
FROM silver_produtos

WHERE `__END_AT` IS NULL;