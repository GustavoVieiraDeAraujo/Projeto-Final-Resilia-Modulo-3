CREATE DATABASE Lego;

Use Lego;

CREATE TABLE colors(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    rgb VARCHAR(10),
    is_trans CHAR
);

CREATE TABLE inventories(
	id INT PRIMARY KEY AUTO_INCREMENT,
    version INT,
    set_num VARCHAR(20)
);

CREATE TABLE part_categories(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE themes(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE inventory_parts(
	color_id INT,
	inventory_id INT,
    part_num VARCHAR(30), 
    quantity INT,
    is_spare CHAR,
    FOREIGN KEY (color_id) REFERENCES colors(id),
    FOREIGN KEY (inventory_id) REFERENCES inventories(id)
);

CREATE TABLE inventory_sets(
	inventory_id INT,
    set_num VARCHAR(20), 
    quantity INT,
    FOREIGN KEY (inventory_id) REFERENCES inventories(id)
);

CREATE TABLE parts(
	part_cat_id INT,
	part_num VARCHAR(20),
    name VARCHAR(500),
    FOREIGN KEY (part_cat_id) REFERENCES part_categories(id)
);

CREATE TABLE sets(
	 theme_id INT,
	 set_num VARCHAR(20), 
	 name VARCHAR(100),
	 year INT,
	 num_parts INT, 
	 FOREIGN KEY (theme_id) REFERENCES themes(id)
);
