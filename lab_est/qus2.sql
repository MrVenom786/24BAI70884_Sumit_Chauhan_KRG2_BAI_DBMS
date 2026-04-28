CREATE OR REPLACE FUNCTION check_order_qty()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.qty > (SELECT stock_qty
                  FROM Tbl_Products
                  WHERE prod_id = NEW.prod_id) THEN
        RAISE EXCEPTION 'Order quantity exceeds available stock';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_order_qty
BEFORE INSERT ON Tbl_Orders
FOR EACH ROW
EXECUTE FUNCTION check_order_qty();
