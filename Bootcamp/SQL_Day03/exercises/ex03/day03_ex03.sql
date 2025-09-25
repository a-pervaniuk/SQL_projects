WITH women AS (
    SELECT pv.pizzeria_id, COUNT(*) AS visit_count
    FROM person_visits pv
    JOIN person p ON p.id = pv.person_id
    WHERE p.gender = 'female'
    GROUP BY pv.pizzeria_id),
men AS (
    SELECT pv.pizzeria_id, COUNT(*) AS visit_count
    FROM person_visits pv
    JOIN person p ON p.id = pv.person_id
    WHERE p.gender = 'male'
    GROUP BY pv.pizzeria_id)

SELECT pz.name AS pizzeria_name
FROM pizzeria pz
JOIN women w ON pz.id = w.pizzeria_id
JOIN men m ON pz.id = m.pizzeria_id
WHERE w.visit_count > m.visit_count

UNION ALL

SELECT pz.name AS pizzeria_name
FROM pizzeria pz
JOIN women w ON pz.id = w.pizzeria_id
JOIN men m ON pz.id = m.pizzeria_id
WHERE w.visit_count < m.visit_count

ORDER BY 1;