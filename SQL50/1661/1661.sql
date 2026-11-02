WITH differences AS (
    SELECT 
        s.machine_id,
        s.process_id,
        s.activity_type as state_0,
        e.activity_type as state_1,
        ROUND((e.timestamp - s.timestamp)::numeric, 3) as time_taken
    FROM Activity s
        JOIN Activity e 
            ON (s.machine_id = e.machine_id)
            AND (s.process_id = e.process_id)
            AND (s.activity_type = 'start')
            AND (e.activity_type = 'end')
)
SELECT 
    machine_id,
    ROUND(AVG(time_taken), 3) as processing_time
FROM differences
GROUP BY machine_id