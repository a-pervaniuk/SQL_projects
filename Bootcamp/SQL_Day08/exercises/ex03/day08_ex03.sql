--Session #1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--Session #2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--Session #1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
--Session #2
--этот запрос у меня не сработал, показано на скрине
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
--ROLLBACK;
COMMIT;
--Session #1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
--Session #2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';