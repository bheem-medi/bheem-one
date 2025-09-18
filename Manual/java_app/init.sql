-- Initialize Bheema's Food Truck Database
CREATE DATABASE IF NOT EXISTS bheemas_food_truck;
USE bheemas_food_truck;

-- Menu items table
CREATE TABLE menu_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category ENUM('veg', 'nonveg', 'snax', 'tiffins') NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL
);

-- Orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_phone VARCHAR(15) NOT NULL,
    customer_address TEXT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL
);

-- Order items table
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    menu_item_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (menu_item_id) REFERENCES menu_items(id)
);

-- Insert sample menu items
INSERT INTO menu_items (name, category, description, price) VALUES
('Masala Dosa', 'veg', 'Crispy crepe filled with spiced potatoes', 80.00),
('Idli Sambar', 'veg', 'Steamed rice cakes with lentil soup', 60.00),
('Paneer Butter Masala', 'veg', 'Cottage cheese in rich tomato gravy', 150.00),
('Vegetable Biryani', 'veg', 'Fragrant rice with mixed vegetables', 120.00),
('Chicken Biryani', 'nonveg', 'Fragrant rice with chicken and spices', 180.00),
('Mutton Curry', 'nonveg', 'Tender mutton in rich gravy', 220.00),
('Butter Chicken', 'nonveg', 'Chicken in creamy tomato sauce', 200.00),
('Fish Curry', 'nonveg', 'Fish cooked in traditional spices', 190.00),
('Samosa', 'snax', 'Crispy pastry filled with spiced potatoes', 40.00),
('Vada Pav', 'snax', 'Spicy potato fritter in bun', 35.00),
('Pani Puri', 'snax', 'Hollow puris filled with spicy water', 50.00),
('Bhel Puri', 'snax', 'Puffed rice with chutneys and vegetables', 45.00),
('Pongal', 'tiffins', 'Rice and lentil dish with ghee', 70.00),
('Upma', 'tiffins', 'Semolina cooked with vegetables', 50.00),
('Medu Vada', 'tiffins', 'Savory lentil donuts', 60.00),
('Pesarattu', 'tiffins', 'Green gram crepe', 65.00);

-- Display confirmation
SELECT 'Bheema''s Food Truck database initialized successfully!' AS Status;
