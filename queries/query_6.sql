SELECT classes.name AS class_name, students.fullname AS student_name
FROM students
INNER JOIN classes ON students.class_id = classes.id
WHERE classes.id = 1
ORDER BY student_name