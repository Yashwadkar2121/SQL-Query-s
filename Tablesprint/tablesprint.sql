-- Create the database
CREATE DATABASE nodedb;
USE nodedb;

-- Create the users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  image VARCHAR(255),
  sequence INT
);

CREATE TABLE sub_categories (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  category_name VARCHAR(255) NOT NULL,
  image VARCHAR(255),
  sequence INT
);

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  category_name VARCHAR(255) NOT NULL,
  sub_category_name VARCHAR(255) NOT NULL,
  image VARCHAR(255)
);



