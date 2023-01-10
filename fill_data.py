from datetime import datetime
from random import randint, choice
import sqlite3

import faker

NUMBER_CLASSES = 3
NUMBER_STUDENTS = 50
NUMBER_TEACHERS = 5
NUMBER_SUBJECTS = 8
NUMBER_GRADES = 10 * NUMBER_STUDENTS


def generate_fake_data(number_students: int, number_teachers: int) -> tuple():
    """Generates fake_classes, fake_students, fake_teachers, fake_subjects and
    returns them as tuple
    """

    fake_data = faker.Faker()

    fake_classes = ["The Immortals",
                    "The Shrewd Shrews", "The Sleepy Scholars"]
    fake_students = [fake_data.name() for _ in range(number_students)]
    fake_teachers = [fake_data.name() for _ in range(number_teachers)]
    fake_subjects = ["English", "Math", "Art", "History",
                     "Music", "Geography", "Chemistry", "Graphic design"]

    return fake_classes, fake_students, fake_teachers, fake_subjects


def prepare_data(classes, students, teachers, subjects) -> tuple():
    """Creates and formats data for correct inserting in database
    """
    for_classes = [(class_, ) for class_ in classes]
    for_students = [(student, randint(1, NUMBER_CLASSES)) for student in students]
    for_teachers = [(teacher, ) for teacher in teachers]
    for_subjects = [(subject, randint(1, NUMBER_TEACHERS)) for subject in subjects]
    for_grades = []

    for _ in range(NUMBER_GRADES):
        grade = randint(40, 100)
        date = datetime(2022, 12, randint(1, 31)).date()
        subject_id = randint(1, NUMBER_SUBJECTS)
        student_id = randint(1, NUMBER_STUDENTS)
        for_grades.append((grade, date, subject_id, student_id))

    return for_classes, for_students, for_teachers, for_subjects, for_grades


def insert_data_to_db(classes, students, teachers, subjects, grades) -> None:

    with sqlite3.connect('school.db') as con:

        cur = con.cursor()

        sql_to_classes = """INSERT INTO classes(class_name)
                               VALUES (?)"""
        cur.executemany(sql_to_classes, classes)

        sql_to_students = """INSERT INTO students(student_name, class_id)
                               VALUES (?, ?)"""
        cur.executemany(sql_to_students, students)

        sql_to_teachers = """INSERT INTO teachers(teacher_name)
                              VALUES (?)"""
        cur.executemany(sql_to_teachers, teachers)

        sql_to_subjects = """INSERT INTO subjects(subject_name, teacher_id)
                               VALUES (?, ?)"""
        cur.executemany(sql_to_subjects, subjects)

        sql_to_grades = """INSERT INTO grades(grade, date_of, subject_id, student_id)
                               VALUES (?, ?, ?, ?)"""
        cur.executemany(sql_to_grades, grades)

        con.commit()


if __name__ == "__main__":
    classes, students, teachers, subjects, grades = prepare_data(
        *generate_fake_data(number_students=NUMBER_STUDENTS, number_teachers=NUMBER_TEACHERS))
    insert_data_to_db(classes, students, teachers, subjects, grades)
