
USE new_repatriates;

/*Выборка, которая показывает пользователей, которые имеют права на загран паспорт, но не имеют его. Условия получения загран паспорта: или написан отказ
 от ускоренной процедуры отказа от гражданства, или человек находится в стране более 3-х месяцев.
*/

SELECT id_number, firstname, lastname FROM id_numbers
WHERE id_number in 
(SELECT id_number FROM repatriates WHERE YEAR(now()) - YEAR(allia_date) > 0 || MONTH(allia_date) - MONTH(now()) > 3);


/*Выборка, которая показывает все номера документов пользователя.*/

SELECT  t1.firstname, t1.lastname, t1.id_number, t2.passport_id as darcon_id, t3.driver_license_number
FROM
id_numbers as t1 JOIN darcons as t2 USING(id_number)
JOIN driven_licenses as t3 USING(id_number);


/*Представление - отображающее самое часто используемые данные о пользователе*/
DROP VIEW IF EXISTS repatriates_info;
CREATE VIEW repatriates_info as
SELECT  t1.lastname, t1.firstname, t1.id_number, t2.allia_date, t2.pnone_number, t2.email, t2.address FROM 
id_numbers as t1 join repatriates as t2 USING(id_number)
ORDER BY t1.lastname, t1.firstname ;

SELECT * FROM repatriates_info;

/*Представление - отображающее профиль пользователя*/
DROP VIEW IF EXISTS profile;
CREATE VIEW profile as
SELECT  t1.lastname, t1.firstname, t1.id_number, t1.birthday, t2.allia_date, t2.pnone_number, t2.email, t2.address, t2.gender, t4.status,
t2.rejectionn, t3.country, t5.`type` as background, t6.passport_id, t7.driver_license_number, t2.photo FROM 
id_numbers as t1 join repatriates as t2 USING(id_number)
JOIN countries as t3 ON (t2.origin_country_id = t3.id)
JOIN marital_statuses as t4 on (t2.marital_status_id = t4.id)
JOIN background_types as t5 on (t2.background_id = t5.id)
JOIN darcons as t6 on (t2.id_number = t6.id_number )
JOIN driven_licenses as t7 on (t2.id_number = t7.id_number )
ORDER BY t1.lastname, t1.firstname ;

SELECT * FROM profile;


DELIMiTER //
/*Тригггер, который не позволяет обновить данный загранпаспорта, если человек не может получить его*/
/*DROP TRIGGER IF EXISTS update_darcons//
CREATE TRIGGER update_darcons BEFORE UPDATE ON darcons
FOR EACH ROW
BEGIN
	IF  ((SELECT id_number FROM repatriates
		 	WHERE (id_number = NEW.id_number) & (YEAR(now()) - YEAR(allia_date) > 0 || MONTH(allia_date) - MONTH(now()) > 3)) is NULL)
		 THEN
		 	SIGNAL SQLSTATE "45000' SET MESSAGE_TEXT = 'UPDATED canceled, this men/woman can't get darcon";
	END IF;
END//

	 
		 
UPDATE darcons SET
passport_id = '2131231231'
where 
id_number = 9264877349
*/


