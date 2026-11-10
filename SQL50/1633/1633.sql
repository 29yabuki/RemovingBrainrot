WITH UserCount AS (
    SELECT COUNT(*) AS num_users
    FROM Users
), 
Matches as (
    SELECT 
        r.contest_id,
        u.user_id as u_id,
        r.user_id as r_id,
        CASE
            WHEN u.user_id = r.user_id
                THEN 1
            ELSE 0
        END AS registered
    FROM Register r
    CROSS JOIN Users u
),
GroupedRegistered AS (
    SELECT contest_id, SUM(registered)
    FROM Matches
    WHERE u_id = r_id
    GROUP BY contest_id
)
SELECT 
    contest_id,
    COALESCE(ROUND((sum::numeric/NULLIF(num_users, 0))*100, 2), 0) as percentage
FROM GroupedRegistered
    CROSS JOIN UserCount
ORDER BY percentage DESC, contest_id ASC