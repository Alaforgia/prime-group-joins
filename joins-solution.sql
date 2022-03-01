
--1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON  "addresses"."customer_id" = "customers"."id"
GROUP BY "customers"."id", "addresses"."id";

--2. Get all orders and their line items (orders, quantity and product).
SELECT "order_date", "quantity", "description" 
FROM "orders"
JOIN "line_items" ON "orders"."id" = "line_items"."order_id"
JOIN "products" ON "line_items"."product_id" = "products"."id";

--3. Which warehouses have cheetos?
SELECT "warehouse", "products"."description" 
FROM "warehouse"
JOIN "products" ON "warehouse"."id" = "products"."id"
JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'cheetos';