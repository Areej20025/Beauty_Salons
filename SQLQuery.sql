-- Customer Functionalities:

-- Login:
SELECT * 
FROM Customer
WHERE username = @username AND password = @password;

-- Register:
INSERT INTO Customer (first_name, last_name, username, email, password, mobile)
VALUES (@first_name, @last_name, @username, @email, @password, @mobile);

-- Update Profile:
UPDATE Customer
SET first_name = @first_name, last_name = @last_name, email = @email, mobile = @mobile
WHERE id = @id;

-- View Salons:
SELECT *
FROM Owner;

-- Search Salon:
SELECT *
FROM Owner
WHERE name LIKE N'%@name_owner%';

-- Make Reservation:
INSERT INTO Reservation (date, service_id, counts, owner_id, customer_id)
VALUES (@date, @service_id, @counts, @owner_id, @customer_id);

-- View Reservations:
SELECT *
FROM Reservation 
WHERE customer_id = @customer_id;

-- Cancel Reservation:
DELETE FROM Reservation
WHERE id = @reservation_id AND customer_id = @customer_id;

-- Add Evaluation:
INSERT INTO Review (content, rate, customer_id, owner_id, reservation_id)
VALUES (@content, @rate, @customer_id, @owner_id, @reservation_id);


-- Salon Owner Functionalities:

-- Login:
SELECT * 
FROM Owner
WHERE username = @username AND password = @password;

-- Register:
INSERT INTO Owner (name, username, email, password, mobile, address, lon, lat, commercial_register, logo, subscription_begin_date, subscription_end_date)
VALUES (@name, @username, @email, @password, @mobile, @address, @lon, @lat, @commercial_register, @logo, @subscription_begin_date, @subscription_end_date);

-- Update Profile:
UPDATE Owner
SET name = @name, email = @email, mobile = @mobile, address = @address, lon = @lon, lat = @lat, commercial_register = @commercial_register, logo = @logo
WHERE id = @id;

-- View and Renew Subscription:
SELECT subscription_status, subscription_end_date 
FROM Owner 
WHERE id = @id;

UPDATE Owner
SET subscription_status = N'مفعلة', subscription_end_date = @new_end_date
WHERE id = @id;

-- Manage Services (Add, Update, Delete):

-- Add Service:
INSERT INTO Service (name, details, price, max_num, img, owner_id)
VALUES (@name, @details, @price, @max_num, @img, @owner_id);

-- Update Service:
UPDATE Service
SET name = @name, details = @details, price = @price, max_num = @max_num, img = @img
WHERE id = @service_id AND owner_id = @owner_id;

-- Delete Service:
DELETE FROM Service 
WHERE id = @service_id AND owner_id = @owner_id;

-- Manage Reservations:
SELECT *
FROM Reservation 
WHERE owner_id = @owner_id;

DELETE FROM Reservation 
WHERE id = @reservation_id AND owner_id = @owner_id;

-- View Evaluations:
SELECT *
FROM Review 
WHERE owner_id = @owner_id;


-- Admin Functionalities:

-- Login:
SELECT * 
FROM Admin 
WHERE username = @username AND password = @password;

-- Manage Salon Owners (View, Delete, Approve):

-- View Salon Owners:
SELECT * 
FROM Owner;

-- Delete Salon Owner:
DELETE FROM Owner 
WHERE id = @owner_id;

-- Approve Salon Owner:
UPDATE Owner
SET status = N'مفعل'
WHERE id = @owner_id;

-- Manage Customers (View, Delete):

-- View Customers:
SELECT * 
FROM Customer;

-- Delete Customer:
DELETE FROM Customer 
WHERE id = @customer_id;

-- Manage Subscriptions (View, Accept, Refuse):

-- View Pending Subscriptions:
SELECT * 
FROM Owner 
WHERE subscription_status = N'تحت المراجعة';

-- Accept Subscription:
UPDATE Owner
SET subscription_status = N'مقبولة'
WHERE id = @owner_id;

-- Refuse Subscription:
UPDATE Owner
SET subscription_status = N'مرفوضة'
WHERE id = @owner_id;