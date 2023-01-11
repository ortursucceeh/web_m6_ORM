SELECT students.student_name AS student,
        AVG(grades.grade) AS avg_rate
FROM students AS students
INNER JOIN grades AS grades
ON students.id = grades.student_id
GROUP BY student
ORDER BY avg_rate DESC
LIMIT 5