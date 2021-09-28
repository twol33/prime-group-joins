-- 1 . Get all customers and their addresses.
SELECT * FROM "addresses" JOIN "customers" ON "customers"."id" = "addresses"."id";

-- 2 . Get all orders and their line items (orders, quantity and product).
SELECT "orders"."id", "orders"."order_date", "products"."description", "line_items"."quantity" FROM "orders" 
JOIN "line_items" 
ON "orders"."id" = "line_items"."order_id"
JOIN "products"
ON "products"."id" = "line_items"."product_id";

-- 3. Which warehouses have cheetos?
SELECT "products"."description", "warehouse"."warehouse" FROM "warehouse" 
JOIN "warehouse_product"
ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products"
ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT "products"."description", "warehouse"."warehouse" FROM "warehouse" 
JOIN "warehouse_product"
ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products"
ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.


-- 6. How many customers do we have?
SELECT count(*) FROM "customers";

-- 7. How many products do we carry?
SELECT count(*) FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product"."on_hand") FROM "products"
JOIN "warehouse_product"
ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" = 'diet pepsi';
