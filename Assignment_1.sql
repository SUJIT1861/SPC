-- ----------------------------------------------Suppliers--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


create table suppliers(
supplier_id serial,
supplier_name varchar(150),
contact_person VARCHAR(100),
phone_number VARCHAR(20),
email VARCHAR(150),
country VARCHAR(100),
created_at TIMESTAMP
);

INSERT INTO suppliers VALUES
(1,'Supplier 1', 'Contact 1', '+91-9619-216739', 'supplier1@example.com', 'India', '2025-10-16 23:11:14'),
(2,'Supplier 2', 'Contact 2', '+91-8003-334053', 'supplier2@example.com', 'India', '2025-10-13 05:28:08'),
(3,'Supplier 3', 'Contact 3', '+91-9771-876646', 'supplier3@example.com', 'India', '2025-09-18 13:20:40'),
(4,'Supplier 4', 'Contact 4', '+91-7356-719176', 'supplier4@example.com', 'India', '2025-10-04 08:02:37'),
(5,'Supplier 5', 'Contact 5', '+91-7122-198246', 'supplier5@example.com', 'India', '2025-10-11 00:43:47');


select * from suppliers;





-- ------------------------------------------------Warehouses------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


create table warehouses(
warehouse_id SERIAL,
warehouse_name VARCHAR(150),
city VARCHAR(100),
state VARCHAR(100),
country VARCHAR(100),
capacity_units INT,
created_at TIMESTAMP
)

INSERT INTO warehouses
(warehouse_name, city, state, country, capacity_units, created_at)
VALUES
('Warehouse 1', 'Pune', 'Maharashtra', 'India', 1000, '2025-10-15 11:16:55'),
('Warehouse 2', 'Mumbai', 'Maharashtra', 'India', 1500, '2025-10-31 12:45:59'),
('Warehouse 3', 'Nashik', 'Maharashtra', 'India', 1200, '2025-10-25 09:32:21'),
('Warehouse 4', 'Nagpur', 'Maharashtra', 'India', 1800, '2025-10-09 13:21:36'),
('Warehouse 5', 'Aurangabad', 'Maharashtra', 'India', 2000, '2025-10-19 01:10:29');

select * from warehouses;



-- -------------------------------------------------Customers-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



create table customers(
customer_id SERIAL,
customer_name VARCHAR(150),
phone_number VARCHAR(20),
email VARCHAR(150),
city VARCHAR(100),
country VARCHAR(100),
created_at TIMESTAMP
)

INSERT INTO customers
(customer_name, phone_number, email, city, country, created_at)
VALUES
('Customer 1', '+91-8839-717889', 'customer1@example.com', 'Pune', 'India', '2025-11-08 08:57:51'),
('Customer 2', '+91-7653-832052', 'customer2@example.com', 'Mumbai', 'India', '2025-11-02 20:48:45'),
('Customer 3', '+91-8138-263032', 'customer3@example.com', 'Thane', 'India', '2025-11-09 20:56:44'),
('Customer 4', '+91-7418-197251', 'customer4@example.com', 'Satara', 'India', '2025-11-04 05:40:46'),
('Customer 5', '+91-8470-988662', 'customer5@example.com', 'Kolhapur', 'India', '2025-11-04 11:13:11');

select * from customers;

-- -------------------------------------------------Purchase_Orders-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


create table purchase_orders(
po_id SERIAL,
supplier_id INT,
po_date DATE,
expected_date DATE,
status VARCHAR(50),
total_amount NUMERIC(12,2),
created_at TIMESTAMP
)

INSERT INTO purchase_orders
(supplier_id, po_date, expected_date, status, total_amount, created_at)
VALUES
(1, '2025-11-18', '2025-11-21', 'Open', 12500.00, '2025-11-16 16:28:25'),
(2, '2025-11-09', '2025-11-13', 'Approved', 8900.50, '2025-11-22 06:19:54'),
(3, '2025-11-09', '2025-11-16', 'Received', 15420.75, '2025-11-17 10:40:52'),
(4, '2025-11-15', '2025-11-27', 'Closed', 6100.00, '2025-11-25 06:40:06'),
(5, '2025-11-25', '2025-12-08', 'Cancelled', 3000.25, '2025-11-24 22:39:52');


select * from purchase_orders;

-- --------------------------------------------------Purchase_Order_Items----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


create table purchase_order_items(
po_item_id SERIAL,
po_id INT,
product_id INT,
quantity INT,
unit_price NUMERIC(10,2),
created_at TIMESTAMP
)

INSERT INTO purchase_order_items
(po_id, product_id, quantity, unit_price, created_at)
VALUES
(1, 101, 10, 250.00, '2025-11-30 00:43:30'),
(1, 102, 5, 500.00, '2025-11-29 19:21:39'),
(2, 101, 12, 200.00, '2025-11-26 16:41:33'),
(3, 103, 7, 350.00, '2025-11-20 19:55:03'),
(4, 104, 3, 1000.00, '2025-11-28 19:43:22');


select * from purchase_order_items;

-- ----------------------------------------------------Inventory--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


create table inventory(
inventory_id SERIAL,
warehouse_id INT,
product_id INT,
quantity_on_hand INT,
reorder_level INT,
last_updated TIMESTAMP
)


INSERT INTO inventory
(warehouse_id, product_id, quantity_on_hand, reorder_level, last_updated)
VALUES
(1, 101, 50, 20, '2025-12-06 01:34:22'),
(2, 102, 30, 15, '2025-12-06 09:36:23'),
(3, 103, 70, 25, '2025-12-09 11:01:22'),
(4, 104, 20, 10, '2025-12-08 13:45:12'),
(5, 105, 90, 30, '2025-12-08 03:15:05');


select * from inventory;


-- -------------------------------------------------Sales_Orders-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


create table sales_orders(
sales_order_id SERIAL,
customer_id INT,
order_date DATE,
status VARCHAR(50),
total_amount NUMERIC(12,2),
created_at TIMESTAMP
)

INSERT INTO sales_orders
(customer_id, order_date, status, total_amount, created_at)
VALUES
(1, '2025-12-04', 'Pending',   3200.50, '2025-11-30 23:22:20'),
(2, '2025-12-01', 'Confirmed', 4500.00, '2025-11-26 01:12:17'),
(3, '2025-12-01', 'Shipped',   2100.75, '2025-12-03 07:09:51'),
(4, '2025-12-08', 'Delivered',  980.00, '2025-12-11 21:42:55'),
(5, '2025-12-05', 'Cancelled', 1500.00, '2025-12-05 06:47:27');

select * from sales_orders;

-- ---------------------------------------------------Sales_Order_Items---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


create table sales_order_items(
so_item_id serial,
sales_order_id int,
product_id int,
quantity int,
unit_price NUMERIC(10,2),
created_at TIMESTAMP
)

INSERT INTO sales_order_items
(sales_order_id, product_id, quantity, unit_price, created_at)
VALUES
(1, 101, 2, 1600.00, '2025-12-10 12:33:01'),
(1, 102, 1, 4500.00, '2025-12-09 01:27:33'),
(2, 103, 3, 700.25, '2025-12-03 15:01:27'),
(3, 104, 4, 245.00, '2025-12-07 09:47:43'),
(4, 105, 5, 300.00, '2025-12-07 03:59:56');

select * from sales_order_items;

-- -----------------------------------------------------------Shipments-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table shipments(
shipment_id SERIAL,
sales_order_id INT,
warehouse_id INT,
shipment_date DATE,
delivery_date DATE,
shipment_status VARCHAR(50),
tracking_number VARCHAR(100),
created_at TIMESTAMP
)

INSERT INTO shipments
(sales_order_id, warehouse_id, shipment_date, delivery_date, shipment_status, tracking_number, created_at)
VALUES
(1, 1, '2025-12-07', '2025-12-10', 'Processing', 'TRK10001', '2025-12-11 12:45:43'),
(2, 2, '2025-12-06', '2025-12-11', 'In Transit', 'TRK10002', '2025-12-05 17:36:07'),
(3, 2, '2025-12-06', '2025-12-13', 'Delivered',  'TRK10003', '2025-12-10 01:12:56'),
(4, 3, '2025-12-10', '2025-12-19', 'Delayed',    'TRK10004', '2025-12-08 05:53:27'),
(5, 4, '2025-12-12', '2025-12-13', 'Returned',   'TRK10005', '2025-12-14 03:38:09');

select * from shipments;

-- --------------------------------------------------------------------------------------------
-- 1) List all suppliers located in India.
	select * from suppliers where country like 'India';
	
-- ===================================================================================================================	

-- 2) Find suppliers where supplier_name contains 'Tech' and country is not 'USA'.
	SELECT *
FROM suppliers
WHERE supplier_name LIKE '%Tech%'
  AND country <> 'USA';
  
-- ===================================================================================================================

-- 3) Show suppliers created after 2024-01-01 and before 2024-12-31 (inclusive).
SELECT *
FROM suppliers
WHERE created_at BETWEEN '2024-01-01' AND '2024-12-31';

-- ===================================================================================================================

-- 4) Return suppliers where contact_person IS NULL OR email IS NULL
Select * from suppliers 
where contact_person is Null OR email is Null;

-- ===================================================================================================================

-- 5 Get suppliers whose phone_number starts with '+91' AND email ends with '.com'.
SELECT * FROM suppliers
WHERE phone_number LIKE '+91%'AND email LIKE '%.com';

-- ===================================================================================================================

-- 6) List warehouses in the state 'Maharashtra' OR city = 'Pune'.
select * from warehouses 
where state = 'Maharasthra' OR city = 'Pune'

-- ===================================================================================================================

-- 7) Find warehouses in India AND capacity_units >= 10000.
select * from warehouses 
where country = 'India' AND capacity_units >= 10000

-- ===================================================================================================================

-- 8) Show warehouses where warehouse_name ILIKE '%central%' AND country = 'India'.
select * from warehouses 
where warehouse_name ILIKE '%central%' AND country = 'India'

-- ===================================================================================================================

-- 9) Return warehouses created in the last 30 days (use current_date) OR capacity_units < 1000.
SELECT *FROM warehouses
WHERE created_at >= current_date - INTERVAL '30 days'OR capacity_units < 1000;

-- ===================================================================================================================

-- 10) Get warehouses where state IS NULL OR city IS NULL (missing location details).
SELECT *FROM warehouses
WHERE state IS NULL OR city IS NULL

-- ===================================================================================================================

-- 11) List customers with email ending in '@gmail.com' AND country = 'India'.
SELECT * FROM customers 
WHERE email LIKE '%@gmail.com'AND country = 'India';

-- ===================================================================================================================

-- 12) Find customers whose city IN ('Mumbai', 'Pune', 'Delhi') OR phone_number LIKE '022%'.
SELECT * FROM customers 
WHERE city IN ('Mumbai', 'Pune', 'Delhi') OR phone_number LIKE '022%';

-- ===================================================================================================================

-- 13) Show customers created_at between two dates, e.g., 2025-01-01 AND 2025-06-30.
SELECT * FROM customers WHERE created_at BETWEEN '2025-01-01' AND '2025-06-30';

-- ===================================================================================================================

-- 14) Return customers where customer_name ILIKE '%store%' OR ILIKE '%mart%'.
SELECT * FROM customers WHERE customer_name ILIKE '%store%'OR customer_name ILIKE '%mart%'

-- ===================================================================================================================

-- 15) Get customers with missing phone_number OR invalid phone_number (NOT LIKE '+%').
SELECT * FROM customers WHERE phone_number IS NULL OR phone_number NOT LIKE '+%';

-- ===================================================================================================================

-- 16) List purchase orders where status = 'Pending' OR status = 'Approved'.
SELECT * FROM purchase_orders where status = 'Pending' OR status = 'Approved'

-- ===================================================================================================================

-- 17) Find purchase orders for supplier_id = 5 AND total_amount > 100000.
SELECT * FROM purchase_orders WHERE supplier_id = 5 AND total_amount > 10000

-- ===================================================================================================================

-- 18) Show purchase orders expected_date < po_date (late entry) OR expected_date IS NULL.
SELECT * FROM purchase_orders 
WHERE expected_date < po_date OR expected_date IS NULL;

-- ===================================================================================================================

-- 19) Return purchase orders in 2025 (po_date between 2025-01-01 and 2025-12-31).
SELECT * FROM purchase_orders WHERE po_date BETWEEN 2025-01-01 and 2025-12-31

-- ===================================================================================================================

-- 20) Get purchase orders with total_amount BETWEEN 5000 AND 20000 AND status <>'Cancelled'.
SELECT * FROM purchase_orders
WHERE total_amount BETWEEN 5000 AND 20000 AND status <>'Cancelled'

-- ===================================================================================================================

-- 21) List PO items where quantity >= 100 AND unit_price <= 50.
SELECT * FROM purchase_order_items
WHERE quantity >= 100 AND unit_price <= 50;

-- ===================================================================================================================

-- 22) Find PO items for a given po_id (e.g., 101) OR product_id IN (10, 20, 30).
SELECT * FROM purchase_order_items
WHERE po_id = 101 OR product_id IN (10, 20, 30);

-- ===================================================================================================================

-- 23) Show PO items created_at IS NOT NULL AND quantity % 2 = 0 (even quantities).
SELECT * FROM purchase_order_items
WHERE created_at IS NOT NULL AND quantity % 2 = 0;

-- ===================================================================================================================

-- 24) Return PO items where unit_price * quantity > 5000 OR unit_price IS NULL.
SELECT * FROM purchase_order_items where unit_price * quantity > 5000 OR unit_price IS NULL

-- ===================================================================================================================

-- 25) Get PO items with quantity BETWEEN 1 AND 10 AND NOT (unit_price > 100).
SELECT * FROM purchase_order_items where quantity BETWEEN 1 AND 10 AND NOT (unit_price > 100)

-- ===================================================================================================================

-- 26) List inventory rows where quantity_on_hand < reorder_level OR quantity_on_hand = 0.
select * from inventory where quantity_on_hand < reorder_level OR quantity_on_hand = 0

-- ===================================================================================================================

-- 27) Find inventory for warehouse_id = 3 AND product_id = 1001.
select * from inventory where warehouse_id = 3 AND product_id = 1001

-- ===================================================================================================================

-- 28) Show inventory last_updated > now() - interval '7 days' OR quantity_on_hand > 1000.
select * from inventory where last_updated > now() - interval '7 days' OR quantity_on_hand > 1000

-- ===================================================================================================================

-- 29) Return inventory with product_id IN (SELECT product_id FROM purchase_order_items)AND quantity_on_hand > 0.
select * from inventory where product_id IN (SELECT product_id FROM purchase_order_items)AND quantity_on_hand > 0

-- ===================================================================================================================

-- 30) Get inventory records where warehouse_id IN (SELECT warehouse_id FROM warehousesWHERE country = 'India') AND reorder_level >= 50.
select * from inventory where warehouse_id IN (SELECT warehouse_id FROM warehouses WHERE country = 'India') AND reorder_level >= 50

-- ===================================================================================================================

-- 31) List sales orders where status IN ('Pending','Shipped') AND total_amount > 20000.
SELECT * FROM sales_orders WHERE status IN ('Pending', 'Shipped') AND total_amount > 20000;

-- ===================================================================================================================

-- 32) Find sales order items for sales_order_id = 200 OR quantity >= 50.
SELECT * FROM sales_order_items WHERE sales_order_id = 200 OR quantity >= 50;

-- ===================================================================================================================

-- 33) Show shipments where shipment_status = 'Delivered' AND delivery_date BETWEEN'2025-01-01' AND '2025-12-31'.
SELECT * FROM shipments WHERE shipment_status = 'Delivered' AND delivery_date BETWEEN'2025-01-01' AND '2025-12-31'

===================================================================================================================