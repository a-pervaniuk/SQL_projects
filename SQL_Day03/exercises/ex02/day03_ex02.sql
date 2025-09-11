SELECT m.pizza_name, m.price, pz.name
FROM menu m
JOIN pizzeria pz ON pz.id = m.pizzeria_id 
WHERE m.id NOT IN (SELECT menu_id FROM person_order)
ORDER BY 1, 2;