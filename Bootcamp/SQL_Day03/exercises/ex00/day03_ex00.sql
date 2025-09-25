SELECT m.pizza_name, m.price, pz.name AS pizzeria_name, pv.visit_date
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person_visits pv ON pv.pizzeria_id = pz.id
JOIN person p ON pv.person_id = p.id
WHERE m.price >= 800 AND m.price <= 1000 AND p.name = 'Kate'
ORDER BY 1, 2, 3;
