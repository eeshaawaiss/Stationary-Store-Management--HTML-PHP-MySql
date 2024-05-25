CREATE SCHEMA inventory;
use inventory;

CREATE TABLE inventory.Category (
  category_id integer PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL
);
CREATE TABLE inventory.Categorystationary (
  stationary_id INTEGER PRIMARY KEY,
  stationary_name VARCHAR(100) NOT NULL,
  stationary_price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE inventory.Stock (
  stock_id INTEGER PRIMARY KEY AUTO_INCREMENT,  
  stationary_id INTEGER,
  FOREIGN KEY (stationary_id) REFERENCES inventory.Categorystationary(stationary_id),
  stock_quantity INTEGER,
  reorder_level VARCHAR(100)  
);

CREATE TABLE inventory.Supplier (
  supplier_id INTEGER PRIMARY KEY,
  supplier_name VARCHAR(100) NOT NULL,
  supplier_contactinfo VARCHAR(255)  
);

CREATE TABLE inventory.Order (
  order_id INTEGER PRIMARY KEY,
  order_date DATE,
  order_status VARCHAR(100) NOT NULL,
  supplier_id INTEGER,
  FOREIGN KEY (supplier_id) REFERENCES inventory.Supplier(supplier_id)
);

INSERT INTO inventory.Category VALUES(22299, 'Writings');
INSERT INTO inventory.Category VALUES(2873, 'Paper');
INSERT INTO inventory.Category VALUES(2224, 'Fastener');
INSERT INTO inventory.Category VALUES(2225, 'Books');
INSERT INTO inventory.Category VALUES(2226, 'Cutting & Measuring');
INSERT INTO inventory.Category VALUES(2227, 'Adhesives');
INSERT INTO inventory.Category VALUES(2228, 'Art supplies');
INSERT INTO inventory.Category VALUES(2221, 'Desk Essentials');
INSERT INTO inventory.Category VALUES(22225, 'Books');
INSERT INTO inventory.Category VALUES(22288, 'Art supplies');
INSERT INTO inventory.Category VALUES(22244, 'Fastener');
INSERT INTO inventory.Category VALUES(22228, 'Art supplies');
INSERT INTO inventory.Category VALUES(2230, 'Organizational Use');


INSERT INTO inventory.Categorystationary VALUES (7, 'Fountain pen', 2.55);
INSERT INTO inventory.Categorystationary VALUES (70, 'Ink pen', 2.55);
INSERT INTO inventory.Categorystationary VALUES (76, 'Gel pen', 2.55);
INSERT INTO inventory.Categorystationary VALUES (75, 'Fibre tip pen', 4.55);
INSERT INTO inventory.Categorystationary VALUES (72, 'Ballpoint pen', 1.55);
INSERT INTO inventory.Categorystationary VALUES (78, 'Fountain pen', 2.55);
INSERT INTO inventory.Categorystationary VALUES (79, 'Feather pen', 6.55);
INSERT INTO inventory.Categorystationary VALUES (71, 'Highlighter pen', 3.55);
INSERT INTO inventory.Categorystationary VALUES (26, 'Eraser', 0.99);
INSERT INTO inventory.Categorystationary VALUES (22, 'Funky coloured eraser', 2.11);
INSERT INTO inventory.Categorystationary VALUES (28, 'Eraser', 0.99);
INSERT INTO inventory.Categorystationary VALUES (29, 'Eraser', 0.99);
INSERT INTO inventory.Categorystationary VALUES (46, 'Small Ruler', 1.00);
INSERT INTO inventory.Categorystationary VALUES (41, 'Small Ruler', 1.00);
INSERT INTO inventory.Categorystationary VALUES (40, 'Medium Ruler', 1.00);
INSERT INTO inventory.Categorystationary VALUES (44, 'Large Ruler', 3.00);


INSERT INTO inventory.Stock VALUES (1, 7, 10, 'Reorder');
INSERT INTO inventory.Stock VALUES (2, 70, 10, 'Reorder');
INSERT INTO inventory.Stock VALUES (3, 76, 10, 'Reorder');
INSERT INTO inventory.Stock VALUES (4, 75, 10, 'Reorder');
INSERT INTO inventory.Stock VALUES (5, 72, 10, 'Reorder');
INSERT INTO inventory.Stock VALUES (6, 78, 10, 'Reorder');
INSERT INTO inventory.Stock VALUES (7, 26, 10, 'Reorder');
INSERT INTO inventory.Stock VALUES (8, 22, 10, 'Reorder');
INSERT INTO inventory.Stock VALUES (9, 28, 10, 'Reorder');
INSERT INTO inventory.Stock VALUES (10, 29, 10, 'Reorder');
INSERT INTO inventory.Stock VALUES (11, 46, 10, 'Reorder');
INSERT INTO inventory.Stock VALUES (12, 41, 10, 'Reorder');
INSERT INTO inventory.Stock VALUES (13, 40, 10, 'Reorder');
INSERT INTO inventory.Stock VALUES (15, 44, 10, 'Reorder');



INSERT INTO inventory.Supplier VALUES(1010,'Alice',0341);
INSERT INTO inventory.Supplier VALUES(1011,'Mona',0342);
INSERT INTO inventory.Supplier VALUES(1012,'Ahmed',0344);
INSERT INTO inventory.Supplier VALUES(1013,'Omar',0345);
INSERT INTO inventory.Supplier VALUES(1014,'Ali',0347);
INSERT INTO inventory.Supplier VALUES(1015,'Jasmine',0348);
INSERT INTO inventory.Supplier VALUES(1016,'Lisa',0340);
INSERT INTO inventory.Supplier VALUES(1017,'Bob',0349);
INSERT INTO inventory.Supplier VALUES(1018,'John',0301);
INSERT INTO inventory.Supplier VALUES(1028,'Adam',0322);
INSERT INTO inventory.Supplier VALUES(1029,'Ahmed',0344);
INSERT INTO inventory.Supplier VALUES(1025,'Omar',0345);
INSERT INTO inventory.Supplier VALUES(1024,'Ali',0347);
INSERT INTO inventory.Supplier VALUES(1023,'Alice',0341);
INSERT INTO inventory.Supplier VALUES(1021,'Mona',0342);


INSERT INTO inventory.Order VALUES(1, '2024-01-24', 'Delivered', 1010);
INSERT INTO inventory.Order VALUES(2,'2024-01-29', 'Delivered', 1010);
INSERT INTO inventory.Order VALUES(3, '2024-04-13', 'Delivered', 1015);
INSERT INTO inventory.Order VALUES(4, '2024-05-12', 'Pending', 1018);
INSERT INTO inventory.Order VALUES(5, '2024-01-22', 'Delivered', 1014);
INSERT INTO inventory.Order VALUES(6, '2024-02-01', 'Delivered', 1015);
INSERT INTO inventory.Order VALUES(7, '2023-12-24', 'Delivered', 1016);
INSERT INTO inventory.Order VALUES(8, '2024-02-09', 'Pending', 1012);
INSERT INTO inventory.Order VALUES(9, '2024-04-14', 'On its way', 1013);
INSERT INTO inventory.Order VALUES(11, '2024-04-04', 'Delivered', 1015);
INSERT INTO inventory.Order VALUES(12, '2024-02-27', 'Delivered', 1016);
INSERT INTO inventory.Order VALUES(13, '2024-05-10', 'Shipped to courier', 1012);
INSERT INTO inventory.Order VALUES(14, '2023-10-24', 'Delivered', 1013);

-- category name
SELECT s.stationary_name, s.stationary_price, c.category_name
FROM inventory.Categorystationary s
INNER JOIN inventory.Category c ON s.stationary_id = c.category_id;

-- stationary details
SELECT st.stock_id, st.stock_quantity, st.reorder_level, s.stationary_name, s.stationary_price
FROM inventory.Stock st
INNER JOIN inventory.Categorystationary s ON st.stationary_id = s.stationary_id;

--  supplier information
SELECT o.order_id, o.order_date, o.order_status, s.supplier_name
FROM inventory.Order o
INNER JOIN inventory.Supplier s ON o.supplier_id = s.supplier_id;

--  low stock (reorder level reached)
SELECT s.stationary_name, s.stationary_price, st.stock_quantity
FROM inventory.Categorystationary s
INNER JOIN inventory.Stock st ON st.stationary_id = s.stationary_id
WHERE st.stock_quantity <= st.reorder_level;

SELECT * FROM inventory.Categorystationary;
SET stationary_price = stationary_price * 0.1;


-- displaying records from tables
SELECT * FROM inventory.category;
SELECT * FROM inventory.categoryStationary;
SELECT * FROM inventory.stock;
SELECT * FROM inventory.order;
SELECT * FROM inventory.supplier;
