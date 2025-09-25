SELECT person_order.order_date,
       CONCAT(p.name, ' (age:', p.age, ')') AS person_information
FROM person_order
NATURAL JOIN (SELECT person.id AS person_id, person.name,
			 person.age
			 FROM person) AS p
ORDER BY 1 ASC, 2 ASC;