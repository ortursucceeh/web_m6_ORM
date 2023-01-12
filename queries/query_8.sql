SELECT t.fullname AS teacher, sub.name AS subject, AVG(g.grade) AS avg_rate
FROM grades AS g
INNER JOIN teachers AS t ON t.id = sub.teacher_id
INNER JOIN subjects AS sub ON g.subject_id = sub.id
WHERE t.id = 5
GROUP BY subject
