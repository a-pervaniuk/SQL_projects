SELECT dt.visit_date::DATE AS missing_date
FROM generate_series(DATE '2022-01-01', DATE '2022-01-10', INTERVAL '1 day') AS dt(visit_date)
LEFT JOIN person_visits AS pv ON dt.visit_date = pv.visit_date AND (pv.person_id = 1 OR pv.person_id = 2)
WHERE pv.visit_date IS NULL
ORDER BY dt.visit_date ASC;
