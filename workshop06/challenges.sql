#Challenge #1
desc inventory_transaction_types;

SELECT
    id as 'Codigo',
    type_name as 'Descripción'
From
    inventory_transaction_types;

#Challenge #2
DESC orders;

DESC employees;

SELECT
    concat(e.first_name, ' ', e.last_name) as 'Vendedor',
    count(1) as 'Cantidad'
FROM
    orders o
    JOIN employees e ON e.id = o.employee_id
GROUP BY
    o.employee_id;

#Challenge #3
DESC order_details;

DESC products;

SELECT
    p.product_name,
    sum(od.quantity) as 'Cantidad'
FROM
    order_details od
    JOIN products p ON p.id = od.product_id
GROUP BY
    od.product_id
ORDER BY
    sum(od.quantity) DESC
LIMIT
    10;

#Challenge #4
DESC invoices;

DESC orders;

DESC order_details;

DESC products;

DESC employees;

SELECT
    count(1) as `Cantidad`,
    concat(e.first_name, ' ', e.last_name) as `Vendedor`,
    round(sum(od.unit_price * od.quantity), 2) as `Monto_factura`
FROM
    invoices i
    JOIN orders o ON o.id = order_id
    JOIN order_details od ON od.order_id = o.id
    JOIN employees e ON e.id = o.employee_id
WHERE
    o.status_id <> 0
    AND od.status_id in (2, 3)
GROUP BY
    o.employee_id
ORDER BY
    count(1) DESC,
    concat(e.first_name, ' ', e.last_name) ASC;

#Challegen #5
select
    p.product_code as 'Codigo',
    p.product_name as 'Producto',
    it.quantity as 'Cantidad'
from
    northwind.inventory_transactions it
    join northwind.products p on it.product_id = p.id
where
    it.transaction_type = 1
group by
    it.product_id;

#Challenge #6
select
    p.product_code as 'Codigo',
    p.product_name as 'Producto',
    sum(it.quantity) as 'Cantidad'
from
    northwind.inventory_transactions it
    join northwind.products p on it.product_id = p.id
where
    it.transaction_type in (2, 3, 4)
group by
    it.product_id;

#Challenge #7
desc inventory_transactions;

desc products;

select
    p.product_name as 'Producto',
    i.transaction_type as 'Tipo de transaccion',
    i.transaction_created_date as 'Fecha de inicio',
    i.transaction_modified_date as 'Fecha final',
    sum(od.quantity) as 'Cantidad'
from
    northwind.products p
    inner join northwind.inventory_transactions i on p.id = i.product_id
    inner join northwind.order_details od on p.id = od.product_id
WHERE
    transaction_created_date BETWEEN '2006/03/22'
    AND '2006/03/24'
GROUP BY
    p.product_name,
    i.transaction_type;

#Change #8
select
    p.product_code as 'Codigo',
    p.product_name as 'Producto',
    sum(
        if(
            i.transaction_type = 1,
            i.quantity,
            0
        )
    ) as 'Ingresos',
    sum(
        if(
            i.transaction_type > 1,
            i.quantity,
            0
        )
    ) as 'Salidas',
    sum(
        if(
            i.transaction_type = 1,
            i.quantity,
            0
        )
    ) - sum(
        if(
            i.transaction_type > 1,
            i.quantity,
            0
        )
    ) as 'Disponible'
from
    products p
    inner join inventory_transactions i on p.id = i.product_id
group by
    i.product_id;