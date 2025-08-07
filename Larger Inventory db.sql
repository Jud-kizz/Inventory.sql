-- create a larger inventory table--
-- create the product table--

CREATE TABLE products( -- create a product table category--
	product_id SERIAL PRIMARY KEY, -- product id is the unique number for the products, int means the dp should be all integers and primary key means it should be unique and not be null
	product_name VARCHAR(50), -- product name is the name of the products, while VARCHAR means it should store the input as a text with up to 50 characters
	product_category VARCHAR(50) -- product category is similar to product name
);



-- create the warehouse table--

CREATE TABLE warehouse(
	warehouse_id SERIAL PRIMARY KEY,
	warehouse_name VARCHAR (50),
	warehouse_manager VARCHAR (50),
	location_warehouse VARCHAR(50)
);



--create the items table--
CREATE TABLE items(
	item_id SERIAL PRIMARY KEY,
	item_name VARCHAR(50),
	product_id INT REFERENCES products(product_id), -- REFERENCES enforces valid references to products (act as FOREIGN KEY) --
	warehouse_id INT REFERENCES warehouse(warehouse_id), -- REFERENCES enforces valid references to warehouse (act as FOREIGN KEY) --
	manufacturing_date DATE,
	expiration_date DATE CHECK (expiration_date > manufacturing_date),
	stock_quantity INT CHECK (stock_quantity >=0),
	warranty_months INT,
	products_rating INT
);

-- N.B- products and warehouse table must be created before the items because the items table depends on them via foreign keys.

DROP TABLE IF EXISTS items;-- to check if the items table exists with wrong structure or doesn't exist and then drop it and recreate it --
DROP TABLE IF EXISTS warehouse;
DROP TABLE IF EXISTS products;




-- insert values in the products table--
INSERT INTO products (product_id, product_name, product_category)
VALUES
	(01, 'Laptop Pro', 'Electronics'),
	(02, 'Running Shoes', 'Footwear'),
	(03, 'Coffee Maker', 'Appliances'),
	(04, 'Graphic Novel', 'Books'),
	(05, 'Wireless Headphones', 'Electronics'),
	(06, 'Smartphone X', 'Electronics'),
	(07, 'Leather Jacket', 'Clothing'),
	(08, 'Blender', 'Appliances'),
	(09, 'Mystery Novel', 'Books'),
	(10, 'Fitness Tracker', 'Electronics'),
	(11, 'Sneakers', 'Footwear'),
	(12, 'Toaster Oven', 'Appliances'),
	(13, 'Sci-Fi Book', 'Books'),
	(14, 'Gaming Mouse', 'Electronics'),
	(15, 'Winter Boots', 'Footwear'),
	(16, 'Microwave', 'Appliances'),
	(17, 'Cookbook', 'Books'),
	(18, 'Smart Watch', 'Electronics'),
	(19, 'Denim Jeans', 'Clothing'),
	(20, 'Air Fryer', 'Appliances'),
	(21, 'History Book', 'Books'),
	(22, 'Bluetooth Speaker', 'Electronics'),
	(23, 'Hiking Boots', 'Footwear'),
	(24, 'Vacuum Cleaner', 'Appliances'),
	(25, 'Fantasy Novel', 'Books'),
	(26, 'Tablet', 'Electronics'),
	(27, 'T-Shirt', 'Clothing'),
	(28, 'Food Processor', 'Appliances'),
	(29, 'Biography', 'Books'),
	(30, 'Wireless Mouse', 'Electronics'),
	(31, 'Sandals', 'Footwear'),
	(32, 'Electric Kettle', 'Appliances'),
	(33, 'Poetry Collection', 'Books'),
	(34, 'Gaming Keyboard', 'Electronics'),
	(35, 'Sweater', 'Clothing'),
	(36, 'Juicer', 'Appliances'),
	(37, 'Self-Help Book', 'Books'),
	(38, 'Smart TV', 'Electronics'),
	(39, 'Dress Shoes', 'Footwear'),
	(40, 'Rice Cooker', 'Appliances'),
	(41, 'Thriller Novel', 'Books'),
	(42, 'Portable Charger', 'Electronics'),
	(43, 'Scarf', 'Clothing'),
	(44, 'Dishwasher', 'Appliances'),
	(45, 'Children Book', 'Books'),
	(46, 'Webcam', 'Electronics'),
	(47, 'Casual Shirt', 'Clothing'),
	(48, 'Slow Cooker', 'Appliances'),
	(49, 'Romance Novel', 'Books'),
	(50, 'USB Drive', 'Electronics');





-- insert values into warehouse table
INSERT INTO warehouse (warehouse_id, warehouse_name, warehouse_manager, location_warehouse) 
VALUES
	(01, 'Central Hub', 'John Smith', 'New York, NY'),
	(02, 'West Coast Depot', 'Emma Johnson', 'Los Angeles, CA'),
	(03, 'Midwest Storage', 'Michael Brown', 'Chicago, IL'),
	(04, 'Southern Stock', 'Sarah Davis', 'Houston, TX'),
	(05, 'Eastside Facility', 'David Wilson', 'Boston, MA'),
	(06, 'Northern Base', 'Lisa Taylor', 'Seattle, WA'),
	(07, 'Plains Warehouse', 'James Anderson', 'Dallas, TX'),
	(08, 'Coastal Store', 'Emily Martinez', 'Miami, FL'),
	(09, 'Metro Depot', 'Robert Thomas', 'Atlanta, GA'),
	(10, 'Riverfront Hub', 'Jennifer Lee', 'Portland, OR'),
	(11, 'Urban Storage', 'William Clark', 'Philadelphia, PA'),
	(12, 'Sunbelt Warehouse', 'Ashley Walker', 'Phoenix, AZ'),
	(13, 'Lakeside Facility', 'Daniel Hall', 'Minneapolis, MN'),
	(14, 'Bay Area Depot', 'Jessica Young', 'San Francisco, CA'),
	(15, 'Heartland Stock', 'Christopher King', 'Kansas City, MO'),
	(16, 'Gulf Coast Hub', 'Amanda Wright', 'New Orleans, LA'),
	(17, 'Mountain Storage', 'Matthew Scott', 'Denver, CO'),
	(18, 'Capital Warehouse', 'Megan Green', 'Washington, DC'),
	(19, 'Prairie Depot', 'Steven Adams', 'Omaha, NE'),
	(20, 'Harbor Facility', 'Laura Baker', 'San Diego, CA'),
	(21, 'City Central', 'Mark Gonzalez', 'Charlotte, NC'),
	(22, 'Valley Warehouse', 'Rachel Perez', 'Las Vegas, NV'),
	(23, 'Downtown Hub', 'Kevin Carter', 'Baltimore, MD'),
	(24, 'Highland Stock', 'Nicole Mitchell', 'Salt Lake City, UT'),
	(25, 'Riverside Depot', 'Brian Roberts', 'Memphis, TN'),
	(26, 'Northwest Base', 'Heather Turner', 'Boise, ID'),
	(27, 'Southside Storage', 'Paul Phillips', 'Orlando, FL'),
	(28, 'Plaza Warehouse', 'Kimberly Cook', 'Raleigh, NC'),
	(29, 'East Coast Hub', 'Jeffrey Hill', 'Richmond, VA'),
	(30, 'Central Depot', 'Michelle Parker', 'Columbus, OH'),
	(31, 'Westside Facility', 'Jason Edwards', 'Albuquerque, NM'),
	(32, 'Portside Stock', 'Stephanie Kelly', 'Tampa, FL'),
	(33, 'Uptown Warehouse', 'Andrew Rivera', 'Louisville, KY'),
	(34, 'Skyline Hub', 'Melissa Brooks', 'Sacramento, CA'),
	(35, 'Midtown Storage', 'Eric Gray', 'Indianapolis, IN'),
	(36, 'Southwest Depot', 'Tiffany Ward', 'Tucson, AZ'),
	(37, 'Lakeshore Facility', 'Gregory Cox', 'Milwaukee, WI'),
	(38, 'Metro Stock', 'Brittany James', 'Nashville, TN'),
	(39, 'Harborfront Hub', 'Patrick Bailey', 'Norfolk, VA'),
	(40, 'Central Storage', 'Christina Foster', 'Cleveland, OH'),
	(41, 'Bayfront Depot', 'Timothy Hughes', 'Jacksonville, FL'),
	(42, 'Hillside Warehouse', 'Deborah Price', 'Oklahoma City, OK'),
	(43, 'Urban Hub', 'Jonathan Russell', 'Providence, RI'),
	(44, 'Coastline Stock', 'Katherine Bell', 'Charleston, SC'),
	(45, 'Cityside Depot', 'Scott Murphy', 'Birmingham, AL'),
	(46, 'Northside Facility', 'Rebecca Diaz', 'Anchorage, AK'),
	(47, 'Plainside Hub', 'Ryan Hayes', 'Des Moines, IA'),
	(48, 'South Coast Depot', 'Christine Wood', 'Savannah, GA'),
	(49, 'Midland Warehouse', 'Brandon Fisher', 'Fargo, ND'),
	(50, 'Eastside Stock', 'Angela Bennett', 'Burlington, VT');




-- insert into item tables--
-- Insert 50 rows into the items table
INSERT INTO items (item_id, item_name, product_id, warehouse_id, manufacturing_date, expiration_date, stock_quantity, warranty_months, products_rating) 
VALUES
	(01,'Laptop Pro 2024', 1, 1, '2024-01-15', '2026-01-15', 120, 24, 4),
	(02,'Running Shoes Blue', 2, 2, '2023-06-10', '2025-06-10', 200, 12, 3),
	(03,'Coffee Maker Deluxe', 3, 3, '2024-03-22', '2026-03-22', 80, 24, 5),
	(04,'Graphic Novel Vol 1', 4, 4, '2023-09-05', '2025-09-05', 150, 0, 4),
	(05,'Wireless Headphones X', 5, 5, '2024-02-10', '2026-02-10', 90, 12, 4),
	(06,'Smartphone X Plus', 6, 6, '2024-05-18', '2027-05-18', 100, 24, 5),
	(07,'Leather Jacket Black', 7, 7, '2023-11-12', '2025-11-12', 60, 0, 3),
	(08,'Blender Pro', 8, 8, '2024-04-01', '2026-04-01', 70, 18, 4),
	(09,'Mystery Novel 2023', 9, 9, '2023-07-20', '2025-07-20', 200, 0, 4),
	(10,'Fitness Tracker S1', 10, 10, '2024-06-15', '2026-06-15', 110, 12, 3),
	(11,'Sneakers White', 11, 11, '2023-08-25', '2025-08-25', 180, 12, 4),
	(12,'Toaster Oven Compact', 12, 12, '2024-01-30', '2026-01-30', 65, 18, 3),
	(13,'Sci-Fi Book Saga', 13, 13, '2023-10-10', '2025-10-10', 140, 0, 5),
	(14,'Gaming Mouse RGB', 14, 14, '2024-03-05', '2026-03-05', 95, 12, 4),
	(15,'Winter Boots Warm', 15, 15, '2023-12-01', '2025-12-01', 85, 12, 3),
	(16,'Microwave 1200W', 16, 16, '2024-02-20', '2026-02-20', 50, 24, 4),
	(17,'Cookbook Italian', 17, 17, '2023-05-15', '2025-05-15', 160, 0, 4),
	(18,'Smart Watch V2', 18, 18, '2024-07-10', '2027-07-10', 75, 24, 5),
	(19,'Denim Jeans Slim', 19, 19, '2023-09-30', '2025-09-30', 130, 0, 3),
	(20,'Air Fryer 5L', 20, 20, '2024-04-15', '2026-04-15', 60, 18, 4),
	(21,'History Book WW2', 21, 21, '2023-11-05', '2025-11-05', 170, 0, 5),
	(22,'Bluetooth Speaker Mini', 22, 22, '2024-06-01', '2026-06-01', 100, 12, 4),
	(23,'Hiking Boots Pro', 23, 23, '2023-07-12', '2025-07-12', 90, 12, 3),
	(24,'Vacuum Cleaner Smart', 24, 24, '2024-03-18', '2026-03-18', 55, 24, 4),
	(25,'Fantasy Novel Epic', 25, 25, '2023-08-10', '2025-08-10', 180, 0, 5),
	(26,'Tablet 10in', 26, 26, '2024-05-25', '2027-05-25', 80, 24, 4),
	(27,'T-Shirt Cotton', 27, 27, '2023-10-20', '2025-10-20', 200, 0, 3),
	(28,'Food Processor 8C', 28, 28, '2024-02-28', '2026-02-28', 70, 18, 4),
	(29,'Biography Lincoln', 29, 29, '2023-06-05', '2025-06-05', 150, 0, 5),
	(30,'Wireless Mouse Lite', 30, 30, '2024-01-10', '2026-01-10', 110, 12, 3),
	(31,'Sandals Beach', 31, 31, '2023-12-15', '2025-12-15', 140, 0, 3),
	(32,'Electric Kettle 1.7L', 32, 32, '2024-04-10', '2026-04-10', 85, 18, 4),
	(33,'Poetry Collection', 33, 33, '2023-09-15', '2025-09-15', 160, 0, 4),
	(34,'Gaming Keyboard RGB', 34, 34, '2024-06-20', '2026-06-20', 90, 12, 5),
	(35,'Sweater Wool', 35, 35, '2023-11-25', '2025-11-25', 120, 0, 3),
	(36,'Juicer Citrus', 36, 36, '2024-03-10', '2026-03-10', 60, 18, 4),
	(37,'Self-Help Book Mind', 37, 37, '2023-07-30', '2025-07-30', 170, 0, 4),
	(38,'Smart TV 55in', 38, 38, '2024-05-05', '2027-05-05', 45, 24, 5),
	(39,'Dress Shoes Black', 39, 39, '2023-08-20', '2025-08-20', 100, 12, 3),
	(40,'Rice Cooker 3C', 40, 40, '2024-02-15', '2026-02-15', 75, 18, 4),
	(41,'Thriller Novel 2024', 41, 41, '2023-10-05', '2025-10-05', 190, 0, 5),
	(42,'Portable Charger 10K', 42, 42, '2024-06-10', '2026-06-10', 130, 12, 4),
	(43,'Scarf Silk', 43, 43, '2023-12-10', '2025-12-10', 150, 0, 3),
	(44,'Dishwasher Compact', 44, 44, '2024-01-25', '2026-01-25', 40, 24, 4),
	(45,'Children Book Adventure', 45, 45, '2023-09-25', '2025-09-25', 200, 0,5),
	(46,'Webcam HD', 46, 46, '2024-04-20', '2026-04-20', 95, 12, 4),
	(47,'Casual Shirt Blue', 47, 47, '2023-11-15', '2025-11-15', 140, 0, 3),
	(48,'Slow Cooker 6Qt', 48, 48, '2024-03-01', '2026-03-01', 65, 18, 4),
	(49,'Romance Novel 2023', 49, 49, '2023-06-20', '2025-06-20', 180, 0, 5),
	(50,'USB Drive 64GB', 50, 50, '2024-05-15', '2026-05-15', 200, 12, 4);

-- to select from products table --
SELECT *
FROM products;

-- to select from warehouse table--
SELECT *
FROM warehouse;

-- to select from items table--
SELECT *
FROM items;