CREATE DATABASE IF NOT EXISTS mydatabase;
USE mydatabase;

-- Add your SQL commands here to initialize the database
CREATE TABLE IF NOT EXISTS ia_2_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data VARCHAR(255) NOT NULL
);
INSERT INTO ia_2_table (data) VALUES ('Hello, from 21BCP125 Docker!');