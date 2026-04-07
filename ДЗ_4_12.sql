-- завдання 1
-- Створення бази даних
CREATE SCHEMA IF NOT EXISTS LibraryManagement;
USE LibraryManagement;

-- Створення таблиці authors
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(50) NOT NULL
);

-- Створення таблиці genres
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);

-- Створення таблиці users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Створення таблиці books (посилається на authors та genres)
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year YEAR,
    author_id INT,
    genre_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- Створення таблиці borrowed_books (посилається на books та users)
CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- завдання 2
-- Додавання авторів
INSERT INTO authors (author_name) 
VALUES 
    ('Джордж Орвелл'), 
    ('Джоан Роулінг');

-- Додавання жанрів
INSERT INTO genres (genre_name) 
VALUES 
    ('Антиутопія'), 
    ('Фентезі');

-- Додавання користувачів
INSERT INTO users (username, email) 
VALUES 
    ('ivan_reader', 'ivan@example.com'), 
    ('maria_bookworm', 'maria@example.com');

-- Додавання книг (використовуємо author_id та genre_id з попередніх запитів)
INSERT INTO books (title, publication_year, author_id, genre_id) 
VALUES 
    ('1984', 1949, 1, 1), 
    ('Гаррі Поттер і філософський камінь', 1997, 2, 2);

-- Додавання записів про взяті книги
INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) 
VALUES 
    (1, 1, '2023-10-01', '2023-10-15'), 
    (2, 2, '2023-10-10', NULL); -- NULL означає, що книгу ще не повернули