import sqlite3

def execute_query(sql: str) -> list:
    with sqlite3.connect('school.db') as con:
        cur = con.cursor()
        cur.execute(sql)
        return cur.fetchall()


sql = """
SELECT students.student_name AS student,
        AVG(grades.grade) AS avg_rate
FROM students AS students
INNER JOIN grades AS grades
ON students.id = grades.student_id
GROUP BY student
ORDER BY avg_rate DESC
LIMIT 5
"""

print(execute_query(sql))