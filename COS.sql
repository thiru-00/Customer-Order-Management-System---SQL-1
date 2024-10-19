CREATE TABLE Customers (
    customer_id INT ,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    country VARCHAR(50)
)
INSERT INTO Customers (customer_id, first_name, last_name, age, country) VALUES
(1, 'John', 'Doe', 31, 'USA'),
(2, 'Robert', 'Luna', 22, 'USA'),
(3, 'David', 'Robinson', 22, 'UK'),
(4, 'John', 'Reinhardt', 25, 'UK'),
(5, 'Betty', 'Doe', 28, 'UAE')


CREATE TABLE Orders (
    order_id INT ,
    item VARCHAR(50),
    amount INT,
    customer_id INT
)
INSERT INTO Orders (order_id, item, amount, customer_id) VALUES
(1, 'Keyboard', 400, 4),
(2, 'Mouse', 300, 4),
(3, 'Monitor', 12000, 3),
(4, 'Keyboard', 400, 1),
(5, 'Mousepad', 250, 2)

CREATE TABLE Shippings (
    shipping_id INT ,
    status VARCHAR(50),
    customer INT
)
INSERT INTO Shippings (shipping_id, status, customer) VALUES
(1, 'Pending', 2),
(2, 'Pending', 4),
(3, 'Delivered', 3),
(4, 'Pending', 5),
(5, 'Delivered', 1)


/* Get all orders with customer details and shipping status*/

SELECT C.customer_id,C.first_name,C.last_name,C.age,C.country,O.order_id,O.item,O.amount,S.status,S.shipping_id
FROM Customers AS C
 JOIN Orders AS O
ON C.customer_id=O.customer_id
 JOIN Shippings AS S
ON C.customer_id=S.customer;

/*Find customers who have placed an order but have not yet received their shipment*/
SELECT C.customer_id,C.first_name,C.last_name,C.age,C.country,O.order_id,O.item,O.amount
FROM Customers AS C
 JOIN Orders AS O
ON C.customer_id=O.customer_id
 JOIN Shippings AS S
ON C.customer_id=S.customer
WHERE S.status='Pending';

/*List the total amount spent by each customer*/
SELECT C.customer_id,C.first_name,C.last_name,SUM(O.amount) AS Total_Amount_Spent
FROM Customers AS C
 JOIN Orders AS O
ON C.customer_id=O.customer_id
 JOIN Shippings AS S
ON C.customer_id=S.customer
GROUP BY  C.customer_id,C.first_name,C.last_name;

/*Find the details of all delivered orders*/

SELECT C.customer_id,C.first_name,C.last_name,C.age,C.country,O.order_id,O.item,O.amount,S.status,S.shipping_id
FROM Customers AS C
 JOIN Orders AS O
ON C.customer_id=O.customer_id
 JOIN Shippings AS S
ON C.customer_id=S.customer
WHERE S.status='Delivered';

/*Get customers who have made purchases in both the USA or the UK*/
SELECT C.customer_id,C.first_name,C.last_name
FROM Customers AS C
 JOIN Orders AS O
ON C.customer_id=O.customer_id
 JOIN Shippings AS S
ON C.customer_id=S.customer
WHERE country='USA' OR country='UK'
GROUP BY C.customer_id,C.first_name,C.last_name;

/*Find the average amount spent on orders by customers from the USA*/
SELECT AVG(O.amount) AS AVG_AMOUNT
FROM Orders AS O
JOIN Customers AS C
ON C.customer_id=O.customer_id
WHERE country='USA'

/*List all customers who have not placed any orders*/
SELECT C.customer_id,C.first_name,C.last_name
FROM  Customers AS C
LEFT JOIN Orders AS O
ON C.customer_id= O.customer_id
WHERE O.order_id IS NULL;


/*Get the number of orders each customer has placed*/
SELECT C.customer_id,C.first_name,c.last_name,COUNT(O.customer_id) AS Total_Order_placed
FROM Customers AS C
LEFT JOIN Orders AS O
ON C.customer_id=O.customer_id
GROUP BY C.customer_id,C.first_name,c.last_name


/*Find the customers who have placed the highest number of orders*/
SELECT  TOP 1 C.customer_id,C.first_name,c.last_name,COUNT(O.customer_id) AS Total_Order_placed
FROM Customers AS C
LEFT JOIN Orders AS O
ON C.customer_id=O.customer_id
GROUP BY C.customer_id,C.first_name,c.last_name
ORDER BY COUNT(O.customer_id) DESC


/*List all items ordered by customers from the UK along with their total amounts*/
SELECT C.customer_id,C.first_name,C.last_name,C.country,SUM(O.amount) AS Total_Amounts,STRING_AGG(O.item,',') AS items
FROM Customers AS C
LEFT JOIN Orders AS O
ON C.customer_id=O.customer_id
WHERE C.country='UK'
GROUP BY C.customer_id,C.first_name,C.last_name,C.country


/*Get the shipping status of orders placed by a specific customer (e.g., customer_id = 4)*/
SELECT C.customer_id,C.first_name,C.last_name,S.status
FROM Customers AS C
INNER JOIN Shippings AS S
ON C.customer_id=S.customer
WHERE C.customer_id=4


/*Get the countries of all customers who have placed an order but have not had their order shipped yet.*/
SELECT C.country,S.status
FROM Orders AS O
LEFT JOIN Customers AS C
ON O.customer_id=C.customer_id
LEFT JOIN Shippings AS S
ON C.customer_id=S.customer
WHERE S.status='Pending'
GROUP BY C.country,S.status
