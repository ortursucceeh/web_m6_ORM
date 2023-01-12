SELECT students.student_name, subjects.subject_name, grades.grade
FROM grades
INNER JOIN students ON students.id = grades.student_id
INNER JOIN subjects ON subjects.id = grades.subject_id
WHERE subjects.id = 8
ORDER BY grades.grade DESC
LIMIT 1
