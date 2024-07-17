
CREATE DATABASE IF NOT EXISTS greet_db;
USE greet_db;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

INSERT INTO users (name) VALUES ('John Doe');

SELECT CONCAT('Hello, ', name, '!') AS greeting FROM users;
