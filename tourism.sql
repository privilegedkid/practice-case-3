CREATE DATABASE tourism;

USE tourism;

CREATE TABLE tourists (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE countries (
    id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100) NOT NULL
);

CREATE TABLE hotels (
    id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_name VARCHAR(100) NOT NULL,
    stars INT,
    city VARCHAR(100)
);

CREATE TABLE bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tourist_id INT NOT NULL,
    country_id INT NOT NULL,
    hotel_id INT NOT NULL,
    booking_date DATE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (tourist_id) REFERENCES tourists(id),
    FOREIGN KEY (country_id) REFERENCES countries(id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

INSERT INTO tourists (full_name, phone, email) VALUES
('Иван Иванов', '+79990001122', 'ivan@mail.ru'),
('Анна Петрова', '+79990003344', 'anna@mail.ru'),
('Сергей Смирнов', '+79990005566', 'sergey@mail.ru');

INSERT INTO countries (country_name) VALUES
('Турция'),
('Египет'),
('ОАЭ');

INSERT INTO hotels (hotel_name, stars, city) VALUES
('Sunrise Resort', 5, 'Анталья'),
('Sea View Hotel', 4, 'Хургада'),
('Dubai Palace', 5, 'Дубай');

INSERT INTO bookings (
    tourist_id,
    country_id,
    hotel_id,
    booking_date,
    start_date,
    end_date,
    price
) VALUES
(1, 1, 1, '2026-08-10', '2026-09-10', '2026-09-17', 85000.00),
(2, 3, 3, '2026-08-11', '2026-11-01', '2026-11-08', 130000.00),
(3, 2, 2, '2026-08-12', '2026-10-05', '2026-10-12', 92000.00);

SELECT
    bookings.id AS booking_id,
    tourists.full_name,
    countries.country_name,
    hotels.hotel_name,
    hotels.city,
    hotels.stars,
    bookings.start_date,
    bookings.end_date,
    bookings.price
FROM bookings
JOIN tourists
    ON bookings.tourist_id = tourists.id
JOIN countries
    ON bookings.country_id = countries.id
JOIN hotels
    ON bookings.hotel_id = hotels.id;
