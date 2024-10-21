# Customer Order Management System
<div style="text-align: center;">
    <img src="https://d38cf3wt06n6q6.cloudfront.net/tyasuitefront/webgpcs/images/sales-order-management-software.png" alt="Customer Order Management System">
</div>
This project demonstrates a SQL-based system to manage customer information, orders, and shipping statuses. It provides various SQL queries to efficiently retrieve, update, and analyze data from three main tables: `Customers`, `Orders`, and `Shippings`.

## Database Structure

### Customers Table
Stores basic customer information.

| Column Name  | Data Type   | Description                     |
| ------------ | ----------- | ------------------------------- |
| customer_id  | INT         | Unique identifier for customers  |
| first_name   | VARCHAR(50) | Customer's first name            |
| last_name    | VARCHAR(50) | Customer's last name             |
| age          | INT         | Customer's age                  |
| country      | VARCHAR(50) | Customer's country               |

### Orders Table
Records customer orders.

| Column Name  | Data Type   | Description                     |
| ------------ | ----------- | ------------------------------- |
| order_id     | INT         | Unique identifier for orders     |
| item         | VARCHAR(50) | Name of the item ordered         |
| amount       | INT         | Amount paid for the order        |
| customer_id  | INT         | Foreign key referencing `Customers` table |

### Shippings Table
Tracks the shipping status of each customer.

| Column Name  | Data Type   | Description                     |
| ------------ | ----------- | ------------------------------- |
| shipping_id  | INT         | Unique identifier for shipping   |
| status       | VARCHAR(50) | Status of shipping (e.g., Pending, Delivered) |
| customer     | INT         | Foreign key referencing `Customers` table |

## Key Features

The following SQL queries are included to perform various operations:

1. **Get all orders with customer details and shipping status**  
   Displays a list of orders along with customer information and their shipping status.

2. **Find customers who have placed an order but have not yet received their shipment**  
   Identifies customers who placed orders that are still pending delivery.

3. **List the total amount spent by each customer**  
   Calculates the total spending of each customer based on their orders.

4. **Find the details of all delivered orders**  
   Retrieves the details of customers whose orders have been delivered.

5. **Get customers who have made purchases in both the USA or the UK**  
   Lists customers from the USA or UK who have placed orders.

6. **Find the average amount spent on orders by customers from the USA**  
   Calculates the average spending on orders by customers from the USA.

7. **List all customers who have not placed any orders**  
   Identifies customers who are yet to place an order.

8. **Get the number of orders each customer has placed**  
   Displays the number of orders placed by each customer.

9. **Find the customer who has placed the highest number of orders**  
   Identifies the customer with the most orders.

10. **List all items ordered by customers from the UK along with their total amounts**  
    Retrieves the ordered items and total spending for customers from the UK.

11. **Get the shipping status of orders placed by a specific customer (e.g., customer_id = 4)**  
    Fetches the shipping status for a specific customer's orders.

12. **Get the countries of all customers who have placed an order but have not had their order shipped yet**  
    Lists countries of customers whose orders are still pending.

## How to Use

1. Clone the repository and set up your database.
2. Use the provided SQL queries to interact with the tables and retrieve relevant data.

Feel free to customize the tables or queries based on your needs!

- Name: Thirumalai K
- Email: thirumalai.kb2@gmail.com
- GitHub: [thiru-00](https://github.com/thiru-00)
