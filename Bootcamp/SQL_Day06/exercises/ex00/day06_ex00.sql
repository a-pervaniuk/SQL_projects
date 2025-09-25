-- делаю запрос стандартной системной таблице
--SELECT 
--     table_name, 
--     column_name, 
--     data_type,
--     udt_name
-- FROM 
--     information_schema.columns
-- WHERE 
--     table_name IN ('person', 'pizzeria')
--     AND column_name = 'id';
	
CREATE TABLE person_discounts (
	id BIGINT PRIMARY KEY,
	person_id BIGINT,
	pizzeria_id BIGINT,
	discount NUMERIC,

	CONSTRAINT fk_person_discounts_person_id
		FOREIGN KEY (person_id) REFERENCES person(id),
	CONSTRAINT fk_person_discounts_pizzeria_id
		FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id));
