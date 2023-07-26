![image](https://github.com/Rookies13/Senanam/assets/140288335/00e4cd71-0726-473d-8ee0-64da4113f316)

# QUERY 
*ver 0.1*
## **Create**
### Users Table
CREATE TABLE Users (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR2(50) NOT NULL,
    password VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    registration_date DATE NOT NULL
);

### Products Table
CREATE TABLE Products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    price NUMBER NOT NULL,
    description VARCHAR2(200),
    category VARCHAR2(50) NOT NULL
);

### Orders Table
CREATE TABLE Orders (
    order_id NUMBER PRIMARY KEY,
    user_id NUMBER NOT NULL,
    order_date DATE NOT NULL,
    total_price NUMBER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

### OrderItems Table
CREATE TABLE OrderItems (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    quantity NUMBER NOT NULL,
    subtotal NUMBER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

### Reviews Table
CREATE TABLE Reviews (
    review_id NUMBER PRIMARY KEY,
    user_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    rating NUMBER NOT NULL,
    review_text VARCHAR2(500),
    review_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

## **Insert Sample Data**
### Sample Data for Users Table:
INSERT INTO Users (user_id, username, password, email, registration_date)
VALUES (1, 'john_doe', 'password123', 'john.doe@example.com', TO_DATE('2023-07-25', 'YYYY-MM-DD'));

INSERT INTO Users (user_id, username, password, email, registration_date)
VALUES (2, 'jane_smith', 'securepass', 'jane.smith@example.com', TO_DATE('2023-07-25', 'YYYY-MM-DD'));

### Sample Data for Products Table:
INSERT INTO Products (product_id, product_name, price, description, category)
VALUES (101, 'Smartphone', 500, 'High-end smartphone', 'Electronics');

INSERT INTO Products (product_id, product_name, price, description, category)
VALUES (102, 'Laptop', 800, 'Powerful laptop for work and gaming', 'Electronics');

### Sample Data for Orders Table:
INSERT INTO Orders (order_id, user_id, order_date, total_price)
VALUES (1001, 1, TO_DATE('2023-07-25', 'YYYY-MM-DD'), 1200);

INSERT INTO Orders (order_id, user_id, order_date, total_price)
VALUES (1002, 2, TO_DATE('2023-07-26', 'YYYY-MM-DD'), 500);

### Sample Data for OrderItems Table:
INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity, subtotal)
VALUES (2001, 1001, 101, 2, 1000);

INSERT INTO OrderItems (order_item_id, order_id, product_id, quantity, subtotal)
VALUES (2002, 1002, 102, 1, 800);

### Sample Data for Reviews Table:
INSERT INTO Reviews (review_id, user_id, product_id, rating, review_text, review_date)
VALUES (3001, 1, 101, 4, 'Great smartphone!', TO_DATE('2023-07-26', 'YYYY-MM-DD'));

INSERT INTO Reviews (review_id, user_id, product_id, rating, review_text, review_date)
VALUES (3002, 2, 102, 5, 'Excellent laptop!', TO_DATE('2023-07-27', 'YYYY-MM-DD'));

