SELECT c.name AS class, s.fullname AS student, sub.name AS subject, g.grade AS grade
FROM grades AS g
INNER JOIN students AS s ON s.id = g.student_id
INNER JOIN classes AS c ON c.id = s.class_id
INNER JOIN subjects AS sub ON sub.id = g.subject_id
WHERE c.id = 3 AND sub.id = 4
ORDER BY grade DESC



--SELECT classes.name AS class, s.fullname AS student, sub.name AS subject, grades.grade AS grade