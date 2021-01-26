-- ## Tasks
-- 1. Get all customers and their addresses.
SELECT "customers".first_name, "customers".last_name, "addresses".street, "addresses".city, "addresses".state, "addresses".zip FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;


-- 2. Get all orders and their line items (orders, quantity and product).
SELECT "products".description, "line_items".quantity, "orders".id, "orders".order_date FROM "products"
JOIN "line_items" ON "products".id = "line_items".product_id
JOIN "orders" ON "orders".id = "line_items".product_id;


-- 3. Which warehouses have cheetos?
-- Delta!
SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".id = 5;

-- 4. Which warehouses have diet pepsi?
-- alpha
-- delta
-- gamma

SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".id = 6;


-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT COUNT("orders"), "customers".last_name, "customers".first_name FROM "customers"
JOIN "addresses" ON "addresses".customer_id = "customers".id
JOIN "orders" ON "orders".address_id = "addresses".id
GROUP BY "customers".id;


-- 6. How many customers do we have?
SELECT COUNT("customers") AS "number_of_customers" FROM "customers";


-- 7. How many products do we carry?
SELECT COUNT("products") AS "number_of_products" FROM "products";


-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product".on_hand) AS "diet_pepsi_amount" FROM "warehouse_product"
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".id = 6;


-- ## Stretch
-- 9. How much was the total cost for each order?
-- 10. How much has each customer spent in total?≈
-- 11. How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).