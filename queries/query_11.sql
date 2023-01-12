SELECT t.fullname AS teacher, s.fullname AS student, ROUND(AVG(g.grade), 2) AS avg_rate
FROM grades AS g
INNER JOIN subjects AS sub ON g.subject_id = sub.id
INNER JOIN students AS s ON s.id = g.student_id
INNER JOIN teachers AS t ON t.id = sub.teacher_id
WHERE s.id = 2 AND t.id = 2
