WITH visited AS (
    SELECT pv.pizzeria_id
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    WHERE p.name = 'Andrey'),
ordered AS (
    SELECT m.pizzeria_id
    FROM menu m
    JOIN person_order po ON po.menu_id = m.id
    JOIN person p ON po.person_id = p.id
    WHERE p.name = 'Andrey')

SELECT pz.name AS pizzeria_name
FROM pizzeria pz
WHERE pz.id IN (SELECT v.pizzeria_id FROM visited v)
    AND pz.id NOT IN (SELECT o.pizzeria_id FROM ordered o)
ORDER BY 1;