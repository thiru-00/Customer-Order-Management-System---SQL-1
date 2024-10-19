Customer Order Management System
This project demonstrates a SQL-based system to manage customer information, orders, and shipping statuses. It provides various SQL queries to efficiently retrieve, update, and analyze data from three main tables: Customers, Orders, and Shippings.

Database Structure
Customers Table
Stores basic customer information.

Column Name	Data Type	Description
customer_id	INT	Unique identifier for customers
first_name	VARCHAR(50)	Customer's first name
last_name	VARCHAR(50)	Customer's last name
age	INT	Customer's age
country	VARCHAR(50)	Customer's country
Orders Table
Records customer orders.

Column Name	Data Type	Description
order_id	INT	Unique identifier for orders
item	VARCHAR(50)	Name of the item ordered
amount	INT	Amount paid for the order
customer_id	INT	Foreign key referencing Customers table
Shippings Table
Tracks the shipping status of each customer.

Column Name	Data Type	Description
shipping_id	INT	Unique identifier for shipping
status	VARCHAR(50)	Status of shipping (e.g., Pending, Delivered)
customer	INT	Foreign key referencing Customers table
