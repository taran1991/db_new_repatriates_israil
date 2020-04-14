
DROP DATABASE IF EXISTS new_repatriates;
CREATE DATABASE new_repatriates CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE new_repatriates;


DROP TABLE IF EXISTS id_numbers;
CREATE TABLE id_numbers (
	id_number BIGINT UNSIGNED NOT NULL UNIQUE PRIMARY KEY,
	firstname VARCHAR(100) NOT NULL,
	lastname VARCHAR(100) NOT NULL,
	birthday DATE NOT NULL,
	day_of_issue DATE NOT NULL,
	expiration_day Date NOT NULL,
	INDEX (firstname),
    INDEX (lastname)
);


DROP TABLE IF EXISTS marital_statuses;
CREATE TABLE marital_statuses (
	id SERIAL PRIMARY KEY,
	status VARCHAR(50)
);


DROP TABLE IF EXISTS countries;
CREATE TABLE countries (
	id SERIAL PRIMARY KEY,
	country VARCHAR(50)
);


DROP TABLE IF EXISTS background_types;
CREATE TABLE background_types (
	id SERIAL PRIMARY KEY,
	`type` VARCHAR(50)
);


DROP TABLE IF EXISTS repatriates;
CREATE TABLE repatriates (
	id serial PRIMARY KEY,
	id_number BIGINT UNSIGNED NOT NULL,
	gender CHAR(1),
	allia_date DATE,
	marital_status_id BIGINT UNSIGNED NOT NULL,
	rejectionn TINYINT DEFAULT 0 COMMENT 'отказ от ускоренного отказа от гражданства ',
	photo VARCHAR(100) DEFAULT NULL COMMENT 'URL фотографии',
	origin_country_id BIGINT UNSIGNED NOT NULL,
	background_id BIGINT UNSIGNED NOT NULL COMMENT 'Образование',
	pnone_number BIGINT,
	email VARCHAR(100) UNIQUE,
	address VARCHAR(300), 
	FOREIGN KEY (id_number) REFERENCES id_numbers(id_number) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (marital_status_id) REFERENCES marital_statuses(id) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (origin_country_id) REFERENCES countries(id) ON UPDATE CASCADE ON DELETE RESTRICT,
	FOREIGN KEY (background_id) REFERENCES background_types(id) ON UPDATE CASCADE ON DELETE RESTRICT,
	INDEX (id_number),
    INDEX (pnone_number)
);


DROP TABLE IF EXISTS darcons;
CREATE TABLE darcons (
	id SERIAL PRIMARY KEY,
	passport_id BIGINT UNSIGNED UNIQUE,
	id_number BIGINT UNSIGNED NOT NULL,
	available TINYINT DEFAULT 0 COMMENT 'Разрешение на получение',
	nationality VARCHAR(100),
	day_of_issue DATE,
	expiration_day Date,
	FOREIGN KEY (id_number) REFERENCES id_numbers(id_number) ON UPDATE CASCADE ON DELETE CASCADE,
	INDEX (id_number),
	INDEX (passport_id)
) COMMENT = 'Загран паспорт';


DROP TABLE IF EXISTS driven_licenses;
CREATE TABLE driven_licenses (
	id SERIAL PRIMARY KEY,
	driver_license_number BIGINT UNSIGNED UNIQUE,
	id_number BIGINT UNSIGNED NOT NULL,
	day_of_issue DATE,
	expiration_day Date,
	origin_driven_license TINYINT DEFAULT 0 COMMENT 'Наличие водительских прав в стране исхода',
	origin_experience INT UNSIGNED DEFAULT 0 COMMENT 'Опыт вождения в стране исхода',
	change_driver_license TINYINT DEFAULT 0 COMMENT 'Замена прав без сдачи экзамена',
	easy_pass TINYINT DEFAULT 0 COMMENT 'Упращенная сдача экзамена',
	FOREIGN KEY (id_number) REFERENCES id_numbers(id_number) ON UPDATE CASCADE ON DELETE CASCADE,
	INDEX (id_number),
	INDEX (driver_license_number)
);


DROP TABLE IF EXISTS sickness_funds;
CREATE TABLE sickness_funds (
	id SERIAL PRIMARY KEY,
	fund VARCHAR(50)
) COMMENT='Больничные кассы, учереждения для медецинского страхования';


DROP TABLE IF EXISTS repatriate_funds;
CREATE TABLE repatriate_funds (
	id SERIAL PRIMARY KEY,
	id_number BIGINT UNSIGNED NOT NULL,
	fund BIGINT UNSIGNED,
	FOREIGN KEY (id_number) REFERENCES id_numbers(id_number) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (fund) REFERENCES sickness_funds(id) ON UPDATE CASCADE ON DELETE SET NULL,
	INDEX (id_number)
);


DROP TABLE IF EXISTS free_education_types;
CREATE TABLE free_education_types (
	id SERIAL PRIMARY KEY,
	education_type VARCHAR(50)
) COMMENT='Виды бесплатного обучения для репатриантов';


DROP TABLE IF EXISTS repatriate_courses;
CREATE TABLE repatriate_courses (
	id SERIAL PRIMARY KEY,
	id_number BIGINT UNSIGNED NOT NULL,
	name VARCHAR(100),
	education_type BIGINT UNSIGNED,
	FOREIGN KEY (id_number) REFERENCES id_numbers(id_number) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (education_type) REFERENCES free_education_types(id) ON UPDATE CASCADE ON DELETE SET NULL,
	INDEX (id_number)
);

