WITH Combinations as (
    SELECT *
    FROM Students st
        CROSS JOIN Subjects su
    ORDER BY st.student_id, subject_name
),
Attendance as (
    SELECT
        c.student_id,
        c.student_name,
        c.subject_name,
        CASE
            WHEN c.subject_name = e.subject_name
                THEN 1
            ELSE 0
        END AS taken
    FROM Combinations c
        LEFT JOIN Examinations e using (student_id)
)
SELECT 
    student_id, 
    student_name,
    subject_name,
    SUM(taken) as attended_exams
FROM Attendance
GROUP BY student_id, student_name, subject_name
ORDER BY student_id, subject_name