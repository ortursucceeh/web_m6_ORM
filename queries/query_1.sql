SELECT s.fullname AS student, ROUND(AVG(g.grade), 2) AS avg_rate
FROM students AS s
INNER JOIN grades AS g ON s.id = g.student_id
GROUP BY student
ORDER BY avg_rate DESC
LIMIT 5