CREATE PROCEDURE Process_Orders_And_Employees()
BEGIN
    -- Selecting employees from HR department
    SELECT id, name, department 
    FROM employees 
    WHERE department = 'HR';

    -- Inserting completed orders into archived_orders
    INSERT INTO archived_orders (order_id, customer_id, order_date)
    SELECT id, customer_id, date
    FROM orders
    WHERE status = 'completed';

    -- Updating salaries for employees in the Engineering department
    UPDATE employees e
    JOIN departments d ON e.department_id = d.id
    SET e.salary = e.salary * 1.1
    WHERE d.name = 'Engineering';

    -- Deleting customers who placed orders before 2020-01-01
    DELETE FROM customers
    WHERE id IN (
        SELECT customer_id
        FROM orders
        WHERE order_date < '2020-01-01'
    );

    -- Selecting orders with customer and product details where status is shipped
    SELECT o.id, c.name, p.product_name, o.order_date
    FROM orders o
    JOIN customers c ON o.customer_id = c.id
    JOIN products p ON o.product_id = p.id
    WHERE o.status = 'shipped';

    -- Inserting new products
    INSERT INTO products (id, name, price)
    VALUES 
        (101, 'Laptop', 1200), 
        (102, 'Tablet', 600);
END;
