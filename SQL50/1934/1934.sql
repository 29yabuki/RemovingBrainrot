WITH Processed_confirmations AS (
    SELECT
        user_id,
        CASE
            WHEN c.action = 'confirmed' THEN 1
            ELSE 0
        END as confirmation
    FROM Signups s
        LEFT JOIN Confirmations c USING (user_id)
)
SELECT 
    user_id,
    ROUND(AVG(confirmation)::numeric, 2) as confirmation_rate
FROM Processed_confirmations
GROUP BY user_id