create database if not exists online_sales;

use online_sales;

CREATE TABLE orders (
    order_id    INT AUTO_INCREMENT PRIMARY KEY,
    order_date  DATE           NOT NULL,
    amount      DECIMAL(10,2)  NOT NULL,
    product_id  INT            NOT NULL
);

INSERT INTO orders (order_date, amount, product_id) VALUES
-- 2023
('2023-01-05',  1200.00, 101),
('2023-01-22',   850.00, 102),
('2023-02-10',  2200.00, 101),
('2023-02-28',   430.00, 103),
('2023-03-15',  3100.00, 102),
('2023-03-30',   980.00, 101),
('2023-04-12',  1750.00, 103),
('2023-05-03',   620.00, 102),
('2023-05-19',  2900.00, 101),
('2023-06-07',  1100.00, 103),
('2023-07-14',  2450.00, 101),
('2023-08-21',  1670.00, 102),
('2023-09-09',   340.00, 103),
('2023-10-17',  3300.00, 101),
('2023-11-25',  2100.00, 102),
('2023-12-31',  4800.00, 103),
-- 2024
('2024-01-08',  1500.00, 101),
('2024-01-25',   780.00, 102),
('2024-02-13',  2600.00, 101),
('2024-02-27',   560.00, 103),
('2024-03-06',  3500.00, 102),
('2024-03-21',  1200.00, 101),
('2024-04-18',  2200.00, 103),
('2024-05-05',   900.00, 102),
('2024-05-30',  3100.00, 101),
('2024-06-14',  1350.00, 103),
('2024-07-22',  2750.00, 101),
('2024-08-10',  1900.00, 102),
('2024-09-03',   480.00, 103),
('2024-10-29',  3800.00, 101);

select * from orders;

SELECT
    EXTRACT(YEAR  FROM order_date)   AS year,
    EXTRACT(MONTH FROM order_date)   AS month,
    SUM(amount)                      AS total_revenue,
    COUNT(DISTINCT order_id)         AS order_volume
FROM orders
GROUP BY
    EXTRACT(YEAR  FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year ASC,
    month ASC;
    
    
SELECT
    EXTRACT(YEAR  FROM order_date)   AS year,
    EXTRACT(MONTH FROM order_date)   AS month,
    SUM(amount)                      AS total_revenue,
    COUNT(DISTINCT order_id)         AS order_volume
FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY
    EXTRACT(YEAR  FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year ASC,
    month ASC;
    
SELECT
    EXTRACT(YEAR  FROM order_date)   AS year,
    EXTRACT(MONTH FROM order_date)   AS month,
    SUM(amount)                      AS total_revenue,
    COUNT(DISTINCT order_id)         AS order_volume
FROM orders
GROUP BY
    EXTRACT(YEAR  FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    total_revenue DESC
LIMIT 1;