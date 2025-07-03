SELECT

    id_pedido,
    id_cliente AS cliente_id,
    id_produto AS produto_id,
    CAST(valor AS numeric(10,2)) AS valor_pedido,
    TO_DATE(data_pedido, 'DD-MM-YYYY') AS data_do_pedido,
    LOWER(status) as status_do_pedido

FROM {{ ref("stg_pedidos") }}