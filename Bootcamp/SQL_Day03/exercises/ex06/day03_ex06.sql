WITH selection AS (
    SELECT m.pizza_name, pz.name, m.price, m.pizzeria_id
    FROM menu m
    JOIN pizzeria pz ON pz.id = m.pizzeria_id)

SELECT s1.pizza_name, s1.name AS pizzeria_name_1, s2.name AS pizzeria_name_2, s1.price
FROM selection s1
JOIN selection s2 ON s1.pizza_name = s2.pizza_name AND s1.price = s2.price AND
    s1.pizzeria_id > s2.pizzeria_id
ORDER BY pizza_name;