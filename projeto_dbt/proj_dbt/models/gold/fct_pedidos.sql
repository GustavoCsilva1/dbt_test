WITH pedidos AS (
    SELECT * FROM {{ref('silver_pedidos') }}
),


produtos AS (
    SELECT * FROM {{ref('silver_produtos') }}
)


SELECT 
    p.id_pedido,
    p.cliente_id,
    p.produto_id,
    p.valor_pedido,
    p.data_do_pedido,
    p.status_do_pedido,

    pr.nome_produto,
    pr.categoria AS categoria_produto

FROM pedidos AS p
LEFT JOIN produtos AS pr ON p.produto_id = pr.id_produto