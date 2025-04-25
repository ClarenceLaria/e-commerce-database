The database schema is designed to support an e-commerce platform. It consists of 12 tables, each serving a specific purpose. Below is a detailed explanation of the tables and their relationships:

1. Brand
Purpose: Stores information about product brands.
Columns:
id: Unique identifier for each brand.
name: Name of the brand.
description: Description of the brand.
2. Product Category
Purpose: Categorizes products into different groups.
Columns:
id: Unique identifier for each category.
name: Name of the category.
description: Description of the category.
3. Product
Purpose: Represents individual products.
Columns:
id: Unique identifier for each product.
name: Name of the product.
description: Description of the product.
base_price: Base price of the product.
brand_id: Foreign key referencing the brand table.
category_id: Foreign key referencing the product_category table.
Relationships:
A product belongs to a brand (brand_id).
A product belongs to a category (category_id).
4. Product Image
Purpose: Stores images for products.
Columns:
id: Unique identifier for each image.
product_id: Foreign key referencing the product table.
image_url: URL of the image.
alt_text: Alternative text for the image.
Relationships:
A product can have multiple images.
5. Color
Purpose: Stores color options for products.
Columns:
id: Unique identifier for each color.
name: Name of the color.
hex_code: Hexadecimal code for the color.
6. Size Category
Purpose: Groups size options into categories (e.g., clothing sizes, shoe sizes).
Columns:
id: Unique identifier for each size category.
name: Name of the size category.
7. Size Option
Purpose: Represents individual size options.
Columns:
id: Unique identifier for each size option.
size_category_id: Foreign key referencing the size_category table.
size_label: Label for the size (e.g., "Small", "Medium").
Relationships:
A size option belongs to a size category.
8. Product Item
Purpose: Represents specific items of a product with unique SKUs.
Columns:
id: Unique identifier for each product item.
product_id: Foreign key referencing the product table.
sku: Unique stock-keeping unit for the product item.
price: Price of the product item.
stock_quantity: Quantity of the product item in stock.
Relationships:
A product can have multiple product items.
9. Product Variation
Purpose: Represents variations of a product item (e.g., color and size).
Columns:
id: Unique identifier for each variation.
product_item_id: Foreign key referencing the product_item table.
color_id: Foreign key referencing the color table.
size_option_id: Foreign key referencing the size_option table.
Relationships:
A product item can have multiple variations based on color and size.
10. Attribute Type
Purpose: Defines types of attributes (e.g., material, weight).
Columns:
id: Unique identifier for each attribute type.
name: Name of the attribute type.
11. Attribute Category
Purpose: Groups attributes into categories.
Columns:
id: Unique identifier for each attribute category.
name: Name of the attribute category.
12. Product Attribute
Purpose: Stores additional attributes for products.
Columns:
id: Unique identifier for each attribute.
product_id: Foreign key referencing the product table.
attribute_category_id: Foreign key referencing the attribute_category table.
attribute_type_id: Foreign key referencing the attribute_type table.
name: Name of the attribute.
value: Value of the attribute.
Relationships:
A product can have multiple attributes.
Relationships Summary
One-to-Many:
A brand can have many products.
A product_category can have many products.
A product can have many product_items, product_images, and product_attributes.
A size_category can have many size_options.
Many-to-Many:
A product_item can have multiple product_variations combining color and size_option.
This schema is highly normalized and ensures flexibility for managing products, their variations, and attributes in an e-commerce platform.