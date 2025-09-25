CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC AS
$$
DECLARE minimum NUMERIC;
BEGIN
    SELECT MIN(num) INTO minimum
    FROM unnest(arr) AS num;
    RETURN minimum;
END;
$$
LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);