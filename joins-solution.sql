
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
SELECT "warehouse"."warehouse", "products"."description" 
FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'cheetos';

--4. Which warehouses have diet pepsi?
SELECT "warehouse"."warehouse", "products"."description" 
FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi';

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers"."first_name", count("orders"."id")
FROM "customers"
JOIN "addresses" ON "addresses"."customer_id" = "customers"."id"
JOIN "orders" ON "addresses"."id" = "orders"."address_id"
GROUP BY "customers"."id";

--6. How many customers do we have?
SELECT count("customers"."id") AS "total customers" FROM "customers";

--7. How many products do we carry?
SELECT count("products"."id") AS "total products" FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?
SELECT "products"."id", "description", SUM("warehouse_product"."on_hand")
 FROM "products"
JOIN "warehouse_product" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi'
GROUP BY "products"."id";
