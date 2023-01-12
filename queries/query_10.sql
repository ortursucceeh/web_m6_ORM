SELECT DISTINCT s.fullname AS student, t.fullname AS teacher, sub.name AS subject
FROM grades AS g
INNER JOIN subjects AS sub ON g.subject_id = sub.id
INNER JOIN students AS s ON s.id = g.student_id
INNER JOIN teachers AS t ON t.id = sub.teacher_id
WHERE s.id = 42 AND t.id = 5
ORDER BY subject