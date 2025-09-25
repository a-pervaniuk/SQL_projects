DROP FUNCTION IF EXISTS fnc_persons_female();
DROP FUNCTION IF EXISTS fnc_persons_male();
--DROP FUNCTION IF EXISTS fnc_persons(VARCHAR);

CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (
    id BIGINT,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR
) AS $$
    SELECT *
    FROM person
    WHERE gender = pgender
$$
LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();