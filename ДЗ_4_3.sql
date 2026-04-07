-- завдання 3
USE mydb3;

SELECT *
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN suppliers su ON p.supplier_id = su.id
INNER JOIN categories cat ON p.category_id = cat.id;
-- завдання 4.1
SELECT COUNT(*) AS total_rows
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN suppliers su ON p.supplier_id = su.id
INNER JOIN categories cat ON p.category_id = cat.id;
-- завдання 4.2
SELECT COUNT(*) AS total_rows
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
LEFT JOIN products p ON od.product_id = p.id
LEFT JOIN customers c ON o.customer_id = c.id
RIGHT JOIN employees e ON o.employee_id = e.employee_id
RIGHT JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN suppliers su ON p.supplier_id = su.id
INNER JOIN categories cat ON p.category_id = cat.id;
-- завдання від 4.3 до 4.7
SELECT 
    cat.name AS category_name, 
    COUNT(*) AS row_count, 
    AVG(od.quantity) AS avg_quantity
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN suppliers su ON p.supplier_id = su.id
INNER JOIN categories cat ON p.category_id = cat.id
WHERE o.employee_id > 3 AND o.employee_id <= 10
GROUP BY cat.name
HAVING avg_quantity > 21
ORDER BY row_count DESC
LIMIT 4 OFFSET 1;