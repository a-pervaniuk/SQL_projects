--DROP TABLE roads;
CREATE TABLE roads (
point1 VARCHAR,
point2 VARCHAR,
cost bigint NOT NULL);

INSERT INTO roads(point1, point2,cost) VALUES
('a', 'b', 10),
('b', 'a', 10),
('a', 'd', 20),
('d', 'a', 20),
('a', 'c', 15),
('c', 'a', 15),
('b', 'd', 25),
('d', 'b', 25),
('b', 'c', 35),
('c', 'b', 35),
('d', 'c', 30),
('c', 'd', 30);

WITH RECURSIVE cheap_travel AS (
    SELECT 
        ARRAY[point1] AS visited_points,
        point1 AS current,
        0::bigint AS cost
    FROM roads 
    WHERE point1 = 'a'
    
    UNION ALL
    
    SELECT
        ct.visited_points || r.point2,
        r.point2 AS current,
        ct.cost + r.cost
    FROM cheap_travel ct
    JOIN roads r ON ct.current = r.point1
    WHERE NOT r.point2 = ANY(ct.visited_points)
), result AS (SELECT ct.cost + r.cost AS total_cost, visited_points || ARRAY['a'] AS tour
FROM cheap_travel ct
JOIN roads r ON r.point1 = ct.current
WHERE r.point2 = 'a' AND array_length(ct.visited_points, 1) = 4)

SELECT DISTINCT total_cost, tour FROM result
ORDER BY total_cost, tour;