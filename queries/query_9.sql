SELECT DISTINCT s.fullname AS student, sub.name AS subject 
FROM students AS s
INNER JOIN grades AS g ON s.id = g.student_id
INNER JOIN subjects AS sub ON sub.id = g.subject_id
WHERE s.id = 50
ORDER BY subject