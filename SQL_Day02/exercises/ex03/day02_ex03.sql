WITH date_series AS (
	SELECT generate_series(DATE '2022-01-01', DATE '2022-01-10', INTERVAL '1 day')
	AS visit_date)
SELECT ds.visit_date::DATE AS missing_date
FROM date_series AS ds
LEFT JOIN person_visits AS pv ON ds.visit_date = pv.visit_date
	AND (pv.person_id = 1 OR pv.person_id = 2)
WHERE pv.visit_date IS NULL
ORDER BY ds.visit_date ASC;
