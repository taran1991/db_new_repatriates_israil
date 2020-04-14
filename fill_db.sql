
USE new_repatriates;

INSERT INTO id_numbers (id_number, firstname, lastname, birthday, day_of_issue, expiration_day) VALUES
	('3433777599', 'Ivan', 'Poklushka', '2000-11-12', '2019-07-28', '2024-07-28'),
	('3543879509', 'Alexey', 'Kozletskiy', '1989-09-02', '2018-06-21', '2023-06-21'),
	('3422781019', 'Svetlana', 'Ponamarenka', '2002-02-02', '2019-07-28', '2024-07-28'),
	('3433372979', 'Kristina', 'Ivanova', '1990-01-11', '2019-07-24', '2024-07-24'),
	('4334353599', 'Sergey', 'Kugilko', '1972-12-13', '2016-07-28', '2021-07-28'),
	('5673893661', 'Lera', 'Delegach', '1992-07-02', '2019-07-28', '2023-07-28'),
	('1745692188', 'Zoia', 'Kosmedianskya', '1989-03-29', '2019-12-21', '2024-12-21'),
	('1783177874', 'Anna', 'Zotova', '1989-01-30', '2020-02-28', '2024-07-28'),
	('7777777777', 'Schastlivchick', 'Luckius', '1977-11-11', '2019-07-28', '2024-07-28'),
	('4799326499', 'Tatiana', 'Bubulushka', '1991-11-12', '2019-07-18', '2024-07-18'),
	('9264877349', 'Kim', 'Alekseevich', '1995-01-02', '2017-10-18', '2022-10-18');


INSERT INTO marital_statuses (status) VALUES
	('single'),
	('married'),
	('divorced'),
	('widower/widow');


INSERT INTO countries (country) VALUES
	('Russia'),
	('Belorussia'),
	('Ukraine'),
	('Spain'),
	('France'),
	('UK'),
	('USA'),
	('Canada'),
	('Germany'),
	('Argentina');


INSERT INTO background_types (`type`) VALUES
	('MSc'),
	('BA'),
	('BS'),
	('Specialty'),
	('PhD'),
	('PostDoc'),
	('High School'),
	('Middle School'),
	('Uneducated');

INSERT INTO repatriates
(id_number, gender, allia_date, marital_status_id, rejectionn, photo, origin_country_id, background_id, pnone_number, email, address)
VALUES
	('3433777599', 'm', '2019-07-28', '1', '0', NULL, '3', '2', '0508883234', 'ivan@mail.ru', 'Haifa'),
	('3543879509', 'm', '2018-06-21', '2', '1', NULL, '2', '3', '0508453234', 'alexey@mail.ru', 'TA'),
	('3422781019', 'f', '2019-07-28', '4', '0', NULL, '5', '1', '0522253234', 'svetlana@mail.ru', 'TA'),
	('3433372979', 'f', '2019-07-24', '1', '1', NULL, '6', '4', '0342323234', 'kristina@mail.ru', 'TA'),
	('4334353599', 'm', '2016-07-28', '3', '0', NULL, '6', '4', '0342323234', 'sergey@mail.ru', 'TA'),
	('5673893661', 'f', '2019-07-28', '2', '1', NULL, '6', '4', '0342433564', 'lera@mail.ru', 'TA'),
	('1745692188', 'f', '2019-12-21', '4', '1', NULL, '6', '4', '0507737737', 'zoia@mail.ru', 'TA'),
	('1783177874', 'f', '2020-02-28', '4', '1', NULL, '6', '4', '0458982988', 'anna@mail.ru', 'TA'),
	('7777777777', 'm', '2019-07-28', '2', '0', NULL, '6', '4', '0329837987', 'lucky@mail.ru', 'TA'),
	('4799326499', 'f', '2019-07-18', '3', '0', NULL, '6', '4', '0232132245', 'tata@mail.ru', 'TA'),
	('9264877349', 'm', '2017-10-18', '1', '1', NULL, '6', '4', '0784774774', 'kim@mail.ru', 'TA');


TRUNCATE darcons;
INSERT INTO darcons
(passport_id, id_number, available, nationality, day_of_issue, expiration_day)
VALUES
	('6333777599', '3433777599', '1', 'ISRAILY', '2019-09-28', '2024-09-28'),
	('6543879509', '3543879509', '1', 'ISRAILY', '2019-09-28', '2024-09-28'),
	('6422781019', '3422781019', '1', 'ISRAILY', '2019-09-28', '2024-09-28'),
	('6733372979', '3433372979', '1', 'ISRAILY', '2019-09-28', '2024-09-28'),
	(NULL, '4334353599', '0',NULL, NULL, NULL),
	(NULL,'5673893661', '0',NULL, NULL, NULL),
	(NULL,'1745692188', '0',NULL, NULL, NULL),
	(NULL,'1783177874', '0',NULL, NULL, NULL),
	(NULL,'7777777777', '0',NULL, NULL, NULL),
	(NULL,'4799326499', '0',NULL, NULL, NULL),
	(NULL,'9264877349', '0',NULL, NULL, NULL);


INSERT INTO driven_licenses
(driver_license_number, id_number, day_of_issue, expiration_day)
VALUES
	('6333777599', '3433777599', '2019-09-28', '2024-09-28'),
	('6543879509', '3543879509', '2019-09-28', '2024-09-28'),
	('6422781019', '3422781019', '2019-09-28', '2024-09-28'),
	('6733372979', '3433372979', '2019-09-28', '2024-09-28'),
	(NULL, '4334353599',NULL, NULL),
	(NULL,'5673893661', NULL, NULL),
	(NULL,'1745692188', NULL, NULL),
	(NULL,'1783177874', NULL, NULL),
	(NULL,'7777777777', NULL, NULL),
	(NULL,'4799326499', NULL, NULL),
	(NULL,'9264877349', NULL, NULL);


INSERT INTO sickness_funds (fund) VALUES
	('clalit'),
	('makabie'),
	('meuhedet'),
	('leumit');


INSERT INTO repatriate_funds (id_number, fund) VALUES
	('3433777599', '1'),
	('3543879509', '1'),
	('3422781019', '4'),
	('3433372979', '3'),
	('4334353599', '3'),
	('5673893661', '1'),
	('1745692188', '1'),
	('1783177874', '2'),
	('7777777777', '4'),
	('4799326499', '1'),
	('9264877349', '2');


INSERT INTO free_education_types (education_type) VALUES
	('ulpan'),
	('course'),
	('university');


INSERT INTO repatriate_courses (id_number, name, education_type) VALUES
	('3433777599', 'Etzion', '1'),
	('3433777599', 'Technion', '3'),
	('3543879509', 'Etzion', '1'),
	('3422781019', 'Etzion', '1'),
	('3433372979', 'Etzion', '1'),
	('4334353599', 'Etzion', '1'),
	('5673893661', 'Etzion', '1'),
	('1745692188', 'Etzion', '1'),
	('1783177874', 'Animal therapy course', '2'),
	('7777777777', 'Technion', '3'),
	('4799326499', 'Etzion', '1'),
	('9264877349', 'Technion', '3');

