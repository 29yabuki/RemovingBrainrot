WITH Combined AS (
SELECT *
FROM Project p
    LEFT JOIN Employee e using (employee_id)
)
SELECT 
    project_id,
    ROUND(AVG(experience_years), 2) as average_years
FROM Combined
GROUP BY project_id