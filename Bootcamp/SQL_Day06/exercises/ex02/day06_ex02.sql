SELECT p.name,
	m.pizza_name,
	m.price,
	(m.price * (1 - pd.discount / 100))::INT AS discount_price,
	pz.name AS pizzeria_name
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person_discounts pd ON pz.id = pd.pizzeria_id AND p.id = pd.person_id
ORDER BY p.name, m.pizza_name;