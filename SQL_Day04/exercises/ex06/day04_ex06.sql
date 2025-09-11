CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pz.name
FROM pizzeria pz
JOIN (SELECT person_id, visit_date, pizzeria_id
	  FROM person_visits
	  WHERE visit_date = '2022-01-08') AS pv ON pz.id = pv.pizzeria_id
JOIN (SELECT name, id
	 FROM person
	 WHERE name = 'Dmitriy') AS p ON pv.person_id = p.id
JOIN (SELECT pizzeria_id, price
	 FROM menu
	 WHERE price < 800) AS m ON m.pizzeria_id = pz.id;
