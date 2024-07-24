-- Create the database
CREATE DATABASE Beauty_Salons;

-- Create table Admin
CREATE TABLE Admin (
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,  -- Unique identifier, auto-incremented
  username NVARCHAR(50) NOT NULL UNIQUE,      -- Unique username
  password NVARCHAR(50) NOT NULL              -- Password
);

-- Create table Customer
CREATE TABLE Customer (
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,  -- Unique identifier, auto-incremented
  first_name NVARCHAR(50) NOT NULL,           -- First name
  last_name NVARCHAR(50),                     -- Last name
  username NVARCHAR(50) NOT NULL UNIQUE,      -- Unique username
  email NVARCHAR(50) NOT NULL UNIQUE,         -- Unique email
  password NVARCHAR(50) NOT NULL,             -- Password
  mobile NVARCHAR(15)                         -- Mobile number
);


-- Create table Owner
CREATE TABLE Owner (
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,           -- Unique identifier, auto-incremented
  name NVARCHAR(50) NOT NULL,                          -- Owner's name
  username NVARCHAR(50) NOT NULL UNIQUE,               -- Unique username
  email NVARCHAR(50) NOT NULL UNIQUE,                  -- Unique email
  password NVARCHAR(50) NOT NULL,                      -- Password
  mobile NVARCHAR(15) NOT NULL,                        -- Mobile number
  address NVARCHAR(50) NOT NULL,                       -- Address
  lon FLOAT NOT NULL,                                  -- Longitude
  lat FLOAT NOT NULL,                                  -- Latitude
  commercial_register NVARCHAR(50) NOT NULL,           -- Commercial register number
  logo NVARCHAR(255) NOT NULL,                         -- Logo
  status NVARCHAR(15) NOT NULL DEFAULT N'تحت المراجعة', -- Status with default value 'Under Review'
  subscription_begin_date DATE NOT NULL,               -- Subscription start date
  subscription_end_date DATE NOT NULL,                 -- Subscription end date
  subscription_status NVARCHAR(20) NOT NULL DEFAULT N'تحت المراجعة' -- Subscription status with default value 'Under Review'
);

-- Create table Favorite
CREATE TABLE Favorite (
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,           -- Unique identifier, auto-incremented
  customer_id INT NOT NULL FOREIGN KEY REFERENCES Customer(id) ON DELETE NO ACTION, -- Foreign key to Customer
  owner_id INT NOT NULL FOREIGN KEY REFERENCES Owner(id) ON DELETE NO ACTION        -- Foreign key to Owner
);

-- Create table Reservation
CREATE TABLE Reservation (
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,           -- Unique identifier, auto-incremented
  date DATE NOT NULL,                                  -- Reservation date
  service_id INT NOT NULL,                             -- Service identifier
  counts INT NOT NULL,                                 -- Number of reservations
  status NVARCHAR(40) NOT NULL DEFAULT N'تم التأكيد', -- Status with default value 'Confirmed'
  owner_id INT NOT NULL FOREIGN KEY REFERENCES Owner(id) ON DELETE NO ACTION, -- Foreign key to Owner
  customer_id INT NOT NULL FOREIGN KEY REFERENCES Customer(id) ON DELETE NO ACTION -- Foreign key to Customer
);

-- Create table Review
CREATE TABLE Review (
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,           -- Unique identifier, auto-incremented
  content NVARCHAR(255) NOT NULL,                      -- Review content
  rate INT NOT NULL,                                   -- Rating
  date DATETIME NOT NULL DEFAULT GETDATE(),            -- Date with default value as current date and time
  customer_id INT NOT NULL FOREIGN KEY REFERENCES Customer(id) ON DELETE NO ACTION, -- Foreign key to Customer
  owner_id INT NOT NULL FOREIGN KEY REFERENCES Owner(id) ON DELETE NO ACTION,       -- Foreign key to Owner
  reservation_id INT NOT NULL FOREIGN KEY REFERENCES Reservation(id) ON DELETE NO ACTION -- Foreign key to Reservation
);

-- Create table Service
CREATE TABLE Service (
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,           -- Unique identifier, auto-incremented
  name NVARCHAR(50) NOT NULL,                          -- Service name
  details NVARCHAR(255) NOT NULL,                      -- Service details
  price INT NOT NULL,                                  -- Service price
  max_num INT NOT NULL,                                -- Maximum number of services available
  img NVARCHAR(255) NULL,                              -- Image URL
  owner_id INT NOT NULL FOREIGN KEY REFERENCES Owner(id) ON DELETE NO ACTION -- Foreign key to Owner
);
