--DROP FUNCTION fnc_fibonacci(integer);
CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fib INTEGER) AS
$$
DECLARE
    a INTEGER := 0;
    b INTEGER := 1;
    c INTEGER;
BEGIN
	fib := a;
	RETURN NEXT;
	
    WHILE b < pstop LOOP
		fib := b;
		RETURN NEXT;
	    c := a + b;
	    a := b;
	    b := c;
    END LOOP;
    RETURN;
END;
$$
LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();