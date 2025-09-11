INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
	(SELECT MAX(id) + 1 FROM person_visits),
	(SELECT id FROM person WHERE name = 'Dmitriy'),
	(SELECT m.pizzeria_id FROM menu m
        JOIN pizzeria pz ON pz.id = m.pizzeria_id
        JOIN mv_dmitriy_visits_and_eats mv ON pz.name <> mv.name
        WHERE m.price < 800
	LIMIT 1),
	'2022-01-08');
	
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;