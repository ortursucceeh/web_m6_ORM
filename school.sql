-- Table: classes
DROP TABLE IF EXISTS classes;
CREATE TABLE classes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    class_name VARCHAR(255) UNIQUE NOT NULL
);


-- Table: students
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_name VARCHAR(255) UNIQUE NOT NULL,
    class_id INTEGER,
    FOREIGN KEY (class_id) REFERENCES classes (id) -- one student has one class, and one class has many students
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- Table: teachers
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    teacher_name VARCHAR(255) UNIQUE NOT NULL
);


-- Table: subjects
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject_name VARCHAR(255) UNIQUE NOT NULL,
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teachers (id) -- one teacher has many subjects, and one subject can be readed by only one teacher
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- Table: grades
DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    grade INTEGER NOT NULL,
    date_of DATE NOT NULL,
    subject_id INTEGER,
    student_id INTEGER,
    FOREIGN KEY (subject_id) REFERENCES subjects (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (student_id) REFERENCES students (id) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

