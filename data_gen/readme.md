# Gerador de Dados Fictícios

Este repositório fornece uma solução em Python que gera dados fictícios para simular vendas e produtos, especialmente desenvolvido para ser usado em uma demonstração para a turma da Residência de Dados Serratec 2025, utilizando o Databricks e processando dados em sua arquitetura Medalhão (Bronze-Silver-Gold).

## Estrutura

- `GeradorDadosFakeVendas` (classe principal)
  - `gerar_catalogo_produtos`: Gera um catálogo inicial de produtos.
  - `gerar_vendas`: Cria registros de vendas com itens, preços e forma de pagamento.
  - `carga_inicial`: Inicializa o diretório e gera a primeira carga de dados.
  - `gerar_incremental`: Gera cargas incrementais, incluindo novas vendas, cancelamentos e alterações nos produtos.
  - `verificar_e_gerar_dados`: Verifica existência dos dados e gera carga inicial ou incremental automaticamente.
  - `stream`: Simula streaming de dados gerando cargas incrementais em intervalos definidos.

## Pré-requisitos

- Acesso ao Databricks (Unity Catalog e Volumes)

## Instalação

Clone este repositório ou importe o arquivo diretamente em um notebook Databricks:

```bash
git clone https://github.com/GuiTernis/Residencia-Dados-Palestra-Databricks.git
```

ou diretamente no Databricks:

## Como usar

```python
from datagenerator import GeradorDadosFakeVendas

volume_base_path = "/Volumes/<catalog>/<schema>/<volume>"
generator = FakeSalesDataGenerator(volume_base_path)

# Geração automática inicial/incremental:
generator.verificar_e_gerar_dados()

# Simulação streaming com 5 lotes, intervalo padrão (15 segundos):
generator.stream(num_lotes=5)
```

## Parâmetros configuráveis

- `volume_base_path`: Caminho base para armazenamento dos dados no Unity Catalog.
- `num_produtos`: Quantidade de produtos para geração inicial.
- `num_vendas_iniciais`: Quantidade inicial de vendas para primeira carga.

## Exemplo de estrutura de dados

### Produtos

```json
{
  "id_produto": 1,
  "nome_produto": "Camisa Azul Marca A",
  "categoria": "Camisas",
  "marca": "Marca A",
  "preco_atual": 89.90
}
```

### Vendas

```json
{
  "id_transacao": 1001,
  "timestamp": "2024-07-24 13:45:00",
  "forma_pagamento": "Cartão de Crédito",
  "cancelado": 0,
  "itens": [
    {
      "id_produto": 1,
      "quantidade": 2,
      "preco_unitario": "R$ 89,90"
    }
  ]
}
```
