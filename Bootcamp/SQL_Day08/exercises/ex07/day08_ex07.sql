--Session #1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--Session #2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--Session #1
UPDATE pizzeria SET rating = 1.0 WHERE id = 1;
--Session #2
UPDATE pizzeria SET rating = 3.3 WHERE id = 2;
--Session #1
UPDATE pizzeria SET rating = 3.0 WHERE id = 2;
--Session #2
UPDATE pizzeria SET rating = 1.1 WHERE id = 1;
--Session #1
COMMIT;
--Session #2
COMMIT;