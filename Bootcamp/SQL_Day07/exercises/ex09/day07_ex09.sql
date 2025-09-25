WITH calculation AS (
	SELECT p.address,
		ROUND(MAX(p.age::NUMERIC) - (MIN(p.age::NUMERIC) / MAX(p.age::NUMERIC)), 2) AS formula,
		ROUND(AVG(p.age), 2) AS average
	FROM person p
	GROUP BY p.address
)

SELECT c.address,
	c.formula,
	c.average,
	CASE WHEN c.formula > c.average THEN 'true'
		ELSE 'false'
	END AS comparison
FROM calculation c
ORDER BY 1;
