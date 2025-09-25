SELECT m.pizza_name, pz.name AS pizzeria_name
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person_order po ON m.id = po.menu_id
JOIN person p ON po.person_id = p.id
WHERE p.name = 'Denis' or p.name = 'Anna'
ORDER BY 1, 2;