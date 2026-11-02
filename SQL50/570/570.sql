WITH Counts as (
    SELECT e2.id, e2.name, count(*)
    FROM Employee e1
        CROSS JOIN Employee e2
    WHERE e1.managerid = e2.id
    GROUP BY e2.id, e2.name
)
SELECT c.name
FROM Counts c
WHERE c.count >= 5