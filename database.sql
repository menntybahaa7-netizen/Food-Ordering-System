CREATE TABLE users (
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(100) NOT NULL,
    email    VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role     VARCHAR(20)  NOT NULL
);

CREATE TABLE fooditems (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    price       DECIMAL(10,2) NOT NULL,
    image       VARCHAR(255)
);

CREATE TABLE cart (
    id      SERIAL PRIMARY KEY,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE cartitems (
    id       SERIAL PRIMARY KEY,
    cart_id  INT,
    food_id  INT,
    quantity INT NOT NULL,
    FOREIGN KEY (cart_id) REFERENCES cart(id),
    FOREIGN KEY (food_id) REFERENCES fooditems(id)
);

CREATE TABLE orders (
    id          SERIAL PRIMARY KEY,
    user_id     INT,
    total_price DECIMAL(10,2),
    status      VARCHAR(50),
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE orderitems (
    id       SERIAL PRIMARY KEY,
    order_id INT,
    food_id  INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (food_id) REFERENCES fooditems(id)
);

INSERT INTO food_items (name, description, price) VALUES
('Margherita Pizza', 'Classic tomato base, fresh mozzarella & basil', 12.99),
('Spicy Chicken Burger', 'Crispy chicken fillet with jalapeño sauce & slaw', 10.99),
('Truffle Fries', 'Golden fries with truffle oil & parmesan', 6.99),
('BBQ Beef Ribs', 'Slow-cooked full rack with house BBQ sauce', 24.99),
('Caesar Salad', 'Romaine, croutons, parmesan & Caesar dressing', 9.99),
('Lava Chocolate Cake', 'Warm molten centre with vanilla ice cream', 7.99),
('Garlic Flatbread', 'Crispy flatbread with garlic butter & herbs', 5.99),
('Mango Smoothie', 'Fresh mango blended with yogurt & honey', 5.99);