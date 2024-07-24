
-- إنشاء جدول admin
CREATE TABLE Admin (
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  username NVARCHAR(50) NOT NULL UNIQUE,
  password NVARCHAR(50) NOT NULL
);

-- إنشاء جدول customer
CREATE TABLE Customer (
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  first_name NVARCHAR(50) NOT NULL,
  last_name NVARCHAR(50),
  username NVARCHAR(50) NOT NULL UNIQUE,
  email NVARCHAR(50) NOT NULL UNIQUE,
  password NVARCHAR(50) NOT NULL,
  mobile NVARCHAR(15)
);

-- إنشاء جدول owner
CREATE TABLE Owner (
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  name NVARCHAR(50) NOT NULL,
  username NVARCHAR(50) NOT NULL UNIQUE,
  email NVARCHAR(50) NOT NULL UNIQUE,
  password NVARCHAR(50) NOT NULL,
  mobile NVARCHAR(15) NOT NULL,
  address NVARCHAR(50) NOT NULL,
  lon FLOAT NOT NULL,
  lat FLOAT NOT NULL,
  commercial_register NVARCHAR(50) NOT NULL,
  logo NVARCHAR(255) NOT NULL,
  status NVARCHAR(15) NOT NULL DEFAULT N'تحت المراجعة',
  subscription_begin_date DATE NOT NULL,
  subscription_end_date DATE NOT NULL,
  subscription_status NVARCHAR(20) NOT NULL DEFAULT N'تحت المراجعة'
);

-- إنشاء جدول favorite
CREATE TABLE Favorite (
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  customer_id INT NOT NULL FOREIGN KEY REFERENCES Customer(id) ON DELETE NO ACTION,
  owner_id INT NOT NULL FOREIGN KEY REFERENCES Owner(id) ON DELETE NO ACTION
);

-- إنشاء جدول reservation
CREATE TABLE Reservation (
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  date DATE NOT NULL,
  service_id INT NOT NULL,
  counts INT NOT NULL,
  status NVARCHAR(40) NOT NULL DEFAULT N'تم التأكيد',
  owner_id INT NOT NULL FOREIGN KEY REFERENCES Owner(id) ON DELETE NO ACTION,
  customer_id INT NOT NULL FOREIGN KEY REFERENCES Customer(id) ON DELETE NO ACTION
);

-- إنشاء جدول review
CREATE TABLE Review (
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  content NVARCHAR(255) NOT NULL,
  rate INT NOT NULL,
  date DATETIME NOT NULL DEFAULT GETDATE(),
  customer_id INT NOT NULL FOREIGN KEY REFERENCES Customer(id) ON DELETE NO ACTION,
  owner_id INT NOT NULL FOREIGN KEY REFERENCES Owner(id) ON DELETE NO ACTION,
  reservation_id INT NOT NULL FOREIGN KEY REFERENCES Reservation(id) ON DELETE NO ACTION
);

-- إنشاء جدول service
CREATE TABLE Service (
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  name NVARCHAR(50) NOT NULL,
  details NVARCHAR(255) NOT NULL,
  price INT NOT NULL,
  max_num INT NOT NULL,
  img NVARCHAR(255) NULL,
  owner_id INT NOT NULL FOREIGN KEY REFERENCES Owner(id) ON DELETE NO ACTION
);
