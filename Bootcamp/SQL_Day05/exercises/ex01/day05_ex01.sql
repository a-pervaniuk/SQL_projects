-- было включено последовательное сканирование (seq scan), так как оптимизатор
-- по умолчанию выбирает его, вероятно, потому что у нас маленькая таблица
SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT m.pizza_name, pz.name
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id