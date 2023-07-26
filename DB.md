![image](https://github.com/Rookies13/Senanam/assets/140288335/00e4cd71-0726-473d-8ee0-64da4113f316)

# QUERY 
*ver 0.1*

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

