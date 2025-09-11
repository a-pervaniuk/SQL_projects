WITH fem AS (
	SELECT *
	FROM person p
	JOIN person_order po ON p.id = po.person_id
	JOIN menu m ON po.menu_id = m.id
	WHERE p.gender = 'female')
(SELECT name
FROM fem
WHERE fem.pizza_name = 'pepperoni pizza'

INTERSECT

SELECT name
FROM fem
WHERE fem.pizza_name = 'cheese pizza')
ORDER BY 1;