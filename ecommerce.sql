-- E-Commerce Database Schema

-- 1. Brand
CREATE TABLE brand (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 2. Product Category
CREATE TABLE product_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

-- 3. Product
CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    base_price DECIMAL(10,2) NOT NULL,
    brand_id INT,
    category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (category_id) REFERENCES product_category(id)
);

-- 4. Product Image
CREATE TABLE product_image (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url VARCHAR(255) NOT NULL,
    alt_text VARCHAR(150),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- 5. Color
CREATE TABLE color (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    hex_code VARCHAR(7)
);

-- 6. Size Category
CREATE TABLE size_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- 7. Size Option
CREATE TABLE size_option (
    id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,
    size_label VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(id)
);

-- 8. Product Item
CREATE TABLE product_item (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    sku VARCHAR(100) UNIQUE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- 9. Product Variation
CREATE TABLE product_variation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_item_id INT,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_item_id) REFERENCES product_item(id),
    FOREIGN KEY (color_id) REFERENCES color(id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(id)
);

-- 10. Attribute Type
CREATE TABLE attribute_type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- 11. Attribute Category
CREATE TABLE attribute_category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- 12. Product Attribute
CREATE TABLE product_attribute (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    name VARCHAR(100) NOT NULL,
    value TEXT,
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id)
);
