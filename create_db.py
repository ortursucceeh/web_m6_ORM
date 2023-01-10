import sqlite3

def create_db():
    # read file with script for creating database
    with open('school.sql', 'r') as f:
        sql = f.read()

    # create connection with db (if db file doesn't exists, it will be created)
    with sqlite3.connect('school.db') as con:
        cur = con.cursor()
        # execute script from file to create db
        cur.executescript(sql)


if __name__ == "__main__":
    create_db()