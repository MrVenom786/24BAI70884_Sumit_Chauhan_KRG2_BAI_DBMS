CREATE MATERIALIZED VIEW mv_product_sales AS
SELECT p.prod_id, p.prod_name,
       COALESCE(SUM(o.qty), 0) AS total_qty
FROM Tbl_Products p
LEFT JOIN Tbl_Orders o ON p.prod_id = o.prod_id
GROUP BY p.prod_id, p.prod_name;
