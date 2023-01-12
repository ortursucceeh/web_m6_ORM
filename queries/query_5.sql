SELECT teachers.fullname AS teacher_name, subjects.name AS subject
FROM subjects
INNER JOIN teachers ON subjects.teacher_id = teachers.id
ORDER BY teacher_name