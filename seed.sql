CREATE DATABASE IF NOT EXISTS restaurant_db;
USE restaurant_db;

CREATE TABLE restaurants (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  city VARCHAR(100)
);

CREATE TABLE menu_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  restaurant_id INT,
  name VARCHAR(255),
  price INT,
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  menu_item_id INT,
  restaurant_id INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (menu_item_id) REFERENCES menu_items(id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants(id)
);

INSERT INTO restaurants (name, city) VALUES
('Hyderabadi Spice House', 'Hyderabad'),
('Biryani Blues', 'Bangalore');

INSERT INTO menu_items (restaurant_id, name, price) VALUES
(1, 'Chicken Biryani', 220),
(1, 'Mutton Biryani', 280),
(2, 'Chicken Biryani', 250);

INSERT INTO orders (menu_item_id, restaurant_id) VALUES
(1,1),(1,1),(1,1),(1,1),(1,1),
(3,2),(3,2),(3,2);
