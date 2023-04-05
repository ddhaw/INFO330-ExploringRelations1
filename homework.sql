-- (question-1.sql) What are the first names of all the people who live in the city of Omaha?
SELECT first_name FROM persons WHERE city = "Omaha";

-- (question-2.sql) What are the full name(s) (last and first, in sorted order by last name) who have an age less than 30 (meaning age 29 and down)?
SELECT last_name, first_name FROM persons WHERE age < 30 ORDER BY last_name;

-- (question-3.sql) What are the full name(s) (last and first, in sorted order by last name) of all the female clergy in the database? (Hint: look at the "title" column and keep in mind that "Rev" is short for "Reverend".)
SELECT last_name, first_name FROM persons WHERE gender = "Female" AND title = "Rev" ORDER BY last_name;

-- (question-4.sql) What is/are the full name(s) of the youngest people in the database?
SELECT last_name, first_name FROM persons WHERE age = (SELECT MIN(age) FROM persons) ORDER BY last_name;

-- (question-5.sql) What is the first name of everybody who has a last name similar to "Smith" (that is to say, their last name starts with "Smith")?
SELECT first_name FROM persons WHERE last_name LIKE '%Smith%';

-- (question-6.sql) What are all the email domains (just the domain, not the username) of all the people living in the city of Seattle? (Hint: Look at the SQLite documentation here: https://sqlite.org/lang_corefunc.html and at the functions substr and instr.)
SELECT substr(email, instr(email, '@') + 1) AS email_domain FROM persons WHERE city = "Seattle";

-- (question-7.sql) The United States has decided that Sacramento is a terrible place to live, and everybody has to leave. Write a SQL statement to change the city for all persons currently living in Sacramento to now live in the city of Tulsa.
UPDATE persons SET city = "Tusla" WHERE city = "Sacramento";

-- (question-8.sql) President Biden has issued an executive order that everyone who lives on a "Street" (as opposed to a "Trail", "Hill", "Drive" or other kind of address suffix) is actually 18 years old. Update the database accordingly.
UPDATE persons SET age = 18 WHERE address LIKE '%Street%';

-- (question-9.sql) Your instructor has had some bad memories he'd like to purge from the data. Write a single SQL statement to remove anybody who lives in Kansas City (bad experience with BBQ), Pittsburgh (I dislike their football team), or Jacksonville (because Florida) from the database.
DELETE FROM persons WHERE city IN ("Kansas City", "Pittsburgh", "Jacksonville");

-- (question-10.sql) Put your own information into the database. (You may used falsified information for anything you feel is too personal to share, just make sure your first and last name are the same as what we see in Canvas.)
INSERT INTO persons (first_name, last_name, email, gender, title, age, city, state, phone) VALUES ("Dev", "Dhawan", "devdhawan@world.com", "Male", "Coach/Student", 19, "Kirkland", "Washington", "425-240-5586");

-- extra-1.sql) Is the female doctor from West Palm Beach, Florida the same age as the male reverend from Phoenix, Arizona? (1 pt)
-- (extra-2.sql) How many different values are there for "Gender" in this database? (1 pt)
-- (extra-3.sql) What is the maximum, minimum, and average age of the people in this database? (1 pt)
