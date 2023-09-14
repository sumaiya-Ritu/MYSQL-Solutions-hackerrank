SELECT 
    x1, y1
FROM (
    -- get records where x1=y2 & y1=x2
    SELECT 
        f1.x AS x1, 
        f1.y AS y1,
        f2.x AS x2,
        f2.y AS y2
    FROM functions f1 
    INNER JOIN functions f2
    ON f1.x = f2.y AND f1.y = f2.x
) base
-- only keeps rows such that x1 <= y1
WHERE x1 <= y1
GROUP BY x1, y1
HAVING count(*) > 1 OR x1 != y1
ORDER BY x1;
