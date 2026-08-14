CREATE DATABASE tourism;

USE tourism;

CREATE TABLE tourists (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE tours (
    id INT PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    start_date DATE,
    end_date DATE
);

CREATE TABLE bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tourist_id INT NOT NULL,
    tour_id INT NOT NULL,
    booking_date DATE,
    FOREIGN KEY (tourist_id) REFERENCES tourists(id),
    FOREIGN KEY (tour_id) REFERENCES tours(id)
);

INSERT INTO tourists (full_name, phone, email) VALUES
('Иван Иванов', '+79990001122', 'ivan@mail.ru'),
('Анна Петрова', '+79990003344', 'anna@mail.ru'),
('Сергей Смирнов', '+79990005566', 'sergey@mail.ru');

INSERT INTO tours (country, city, price, start_date, end_date) VALUES
('Турция', 'Анталья', 85000.00, '2026-09-10', '2026-09-17'),
('Египет', 'Хургада', 92000.00, '2026-10-05', '2026-10-12'),
('ОАЭ', 'Дубай', 130000.00, '2026-11-01', '2026-11-08');

INSERT INTO bookings (tourist_id, tour_id, booking_date) VALUES
(1, 1, '2026-08-10'),
(2, 3, '2026-08-11'),
(3, 2, '2026-08-12');

SELECT
    tourists.full_name,
    tours.country,
    tours.city,
    tours.price,
    bookings.booking_date
FROM bookings
JOIN tourists ON bookings.tourist_id = tourists.id
JOIN tours ON bookings.tour_id = tours.id;
