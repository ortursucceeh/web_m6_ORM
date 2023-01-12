SELECT c.name AS class, s.fullname AS student, sub.name AS subject,
      g.grade AS grade, g.date_of AS last_lesson_date 
FROM grades AS g 
INNER JOIN students AS s ON g.student_id = s.id
INNER JOIN classes AS c ON s.class_id = c.id
INNER JOIN subjects AS sub ON sub.id = g.subject_id
WHERE c.id = 2 AND sub.id = 1 AND last_lesson_date in (SELECT MAX(g.date_of)
                                            FROM grades AS g 
                                            INNER JOIN students AS s ON g.student_id = s.id
                                            INNER JOIN classes AS c ON s.class_id = c.id
                                            INNER JOIN subjects AS sub ON sub.id = g.subject_id
                                            WHERE c.id = 2 AND sub.id = 1)
-- GROUP BY last_lesson_date
-- ORDER BY last_lesson_date DESC






