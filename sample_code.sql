SELECT id, name, department 
FROM employees 
WHERE department = 'HR';

INSERT INTO archived_orders (order_id, customer_id, order_date)
SELECT id, customer_id, date
FROM orders
WHERE status = 'completed';

UPDATE employees e
SET e.salary = e.salary * 1.1
FROM departments d
WHERE e.department_id = d.id
AND d.name = 'Engineering';

DELETE FROM customers
WHERE id IN (
    SELECT customer_id
    FROM orders
    WHERE order_date < '2020-01-01'
);

SELECT o.id, c.name, p.product_name, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.id
JOIN products p ON o.product_id = p.id
WHERE o.status = 'shipped';

INSERT INTO products (id, name, price)
VALUES (101, 'Laptop', 1200), (102, 'Tablet', 600);

