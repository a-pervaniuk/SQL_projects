WITH f_orders AS (
    SELECT m.pizzeria_id
    FROM menu m
    JOIN person_order po ON po.menu_id = m.id
    JOIN person p ON po.person_id = p.id
    WHERE p.gender = 'female'),
    m_orders AS (
    SELECT m.pizzeria_id
    FROM menu m
    JOIN person_order po ON po.menu_id = m.id
    JOIN person p ON po.person_id = p.id
    WHERE p.gender = 'male')

SELECT pz.name AS pizzeria_name
FROM pizzeria pz
WHERE pz.id IN (
    SELECT fo.pizzeria_id
    FROM f_orders fo
    WHERE fo.pizzeria_id NOT IN (SELECT mo.pizzeria_id
                                FROM m_orders mo))

UNION

SELECT pz.name AS pizzeria_name
FROM pizzeria pz
WHERE pz.id IN (
    SELECT mo.pizzeria_id
    FROM m_orders mo
    WHERE mo.pizzeria_id NOT IN (SELECT fo.pizzeria_id
                                FROM f_orders fo))

ORDER BY 1;