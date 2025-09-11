SELECT p.name
FROM (SELECT *
    FROM person
    WHERE gender = 'male' AND (address = 'Moscow' OR address = 'Samara')) AS p
JOIN person_order po ON p.id = po.person_id
JOIN (SELECT *
    FROM menu
    WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza') AS m
	ON po.menu_id = m.id
ORDER BY 1 DESC;
