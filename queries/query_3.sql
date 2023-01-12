SELECT classes.name AS class_name, AVG(grades.grade) AS avg_rate
FROM grades
INNER JOIN students ON grades.student_id = students.id
INNER JOIN subjects ON subjects.id = grades.subject_id
INNER JOIN classes ON classes.id = students.class_id
WHERE subjects.id = 8
GROUP BY class_name
ORDER BY class_name
