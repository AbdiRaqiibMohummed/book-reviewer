-- -- Create database
-- CREATE DATABASE IF NOT EXISTS book_review
--   CHARACTER SET utf8mb4
--   COLLATE utf8mb4_general_ci;

-- USE book_review;

-- Books table
CREATE TABLE IF NOT EXISTS books (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255),
  description TEXT,
  cover_url TEXT
);

-- Reviews table
CREATE TABLE IF NOT EXISTS reviews (
  id INT AUTO_INCREMENT PRIMARY KEY,
  book_id INT,
  reviewer_name VARCHAR(100),
  rating INT,
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_book
    FOREIGN KEY (book_id)
    REFERENCES books(id)
    ON DELETE CASCADE
);

-- Seed data 
INSERT INTO books (title, author, description, cover_url) VALUES
('Clean Code', 'Robert C. Martin', 'A handbook of agile software craftsmanship',
 'https://covers.openlibrary.org/b/isbn/9780132350884-L.jpg'),
('The Pragmatic Programmer', 'Andrew Hunt', 'Classic software engineering book',
 'https://covers.openlibrary.org/b/isbn/9780201616224-L.jpg'),
('Atomic Habits', 'James Clear', NULL,
 'https://covers.openlibrary.org/b/isbn/9780735211292-L.jpg'),
('Deep Work', 'Cal Newport', NULL,
 'https://covers.openlibrary.org/b/isbn/9781455586691-L.jpg');
