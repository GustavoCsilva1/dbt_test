WITH clientes AS (
    SELECT * FROM {{ ref('silver_clientes') }}
),

pedidos AS (
    SELECT * FROM {{ ref("silver_pedidos") }}
)

SELECT 
    c.id_cliente,
    c.nome,
    c.email,

MIN(p.data_do_pedido) AS primeira_data_de_compra,

MAX(p.data_do_pedido) AS ultima_data_de_compra,

COALESCE(COUNT(p.id_pedido), 0) AS quantidade_de_pedido,
COALESCE(SUM(p.valor_pedido), 0) AS valor_total_gasto

FROM clientes AS c
LEFT JOIN pedidos AS p ON c.id_cliente = p.cliente_id

GROUP BY
    c.id_cliente,
    c.nome,
    c.email