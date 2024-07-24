# Salon Management System

## Introduction
The Salon Management System is designed to streamline the management of salons, customers, and reservations. This system enables customers to register, view, and book salon services, while salon owners can manage their services and reservations. Administrators oversee the entire system to ensure smooth operations.

## Features 
•	Customer Management: Register, view, and book salon services.

•	Salon Owner Management: Manage salon details, services, and reservations.

•	Admin Management: Oversee the entire system, including user and salon management.


## Database Schema
The database schema includes the following tables:
- *Admin*: Stores admin login information.
- *Customer*: Stores customer details.
- *Owner*: Stores salon owner details and their salon information.
- *Favorite*: Tracks customer's favorite salons.
- *Reservation*: Manages customer reservations.
- *Review*: Stores reviews and ratings for salons.
- *Service*: Manages the services offered by salons.

### Entity Relationship Diagram (ERD)
The ERD below illustrates the relationships between the different tables in the database:

![Database Schema](https://github.com/Areej20025/Beauty_Salons/blob/main/Entity%20Relationship%20Diagram.png)

#### Explanation
- *Admin Table*: Contains admin login information with id, username, and password.
- *Customer Table*: Stores customer details such as id, first_name, last_name, username, email, password, and mobile.
- *Owner Table*: Stores salon owner details including id, name, username, email, password, mobile, address, lon, lat, commercial_register, logo, status, and subscription details.
- *Service Table*: Represents the services offered by salon owners, with id, name, details, price, max_num, img, and owner_id (foreign key referencing the Owner table).
- *Reservation Table*: Manages customer reservations with id, date, service_id, counts, status, owner_id (foreign key referencing the Owner table), and customer_id (foreign key referencing the Customer table).
- *Review Table*: Stores reviews and ratings provided by customers for salon services, including id, content, rate, date, customer_id (foreign key referencing the Customer table), owner_id (foreign key referencing the Owner table), and reservation_id (foreign key referencing the Reservation table).
- *Favorite Table*: Tracks customer's favorite salons with id, customer_id (foreign key referencing the Customer table), and owner_id (foreign key referencing the Owner table).
