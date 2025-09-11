SELECT gd.generated_date AS missing_date
FROM v_generated_dates gd
LEFT JOIN person_visits pv ON pv.visit_date = gd.generated_date
WHERE pv.visit_date IS NULL
ORDER BY 1;