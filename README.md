# 9311DB
PLPGSQL querying project

This project for COMP9311 Database Systems involved creation of several queries towards a large university database modelling fake data from UNSW.
The exercises (summarised) included:

Q1
Define an SQL view Q1(unswid, name) that gives the student id and name of any student who has
studied more than 65 courses at UNSW.

Q2
Define an SQL view Q2(nstudents, nstaff, nboth) which produces a table with a single row containing
counts of:
  the total number of students (who are not also staff)
  the total number of staff (who are not also students)
  the total number of people who are both staff and student.

Q3
Define an SQL view Q3(name, ncourses) that prints the name of the person(s) who has been
lecturer-in-charge (LIC) of the most courses at UNSW and the number of courses they have been LIC
for. 

Q4
Define SQL views Q4a(id), Q4b(id), and Q4c(id), which give the student IDs of, respectively
  all students enrolled in 05s2 in the Computer Science (3978) degree
  all students enrolled in 05s2 in the Software Engineering (SENGA1) stream
  all students enrolled in 05s2 in degrees offered by CSE

Q5
Define an SQL view Q5(name) which gives the faculty with the maximum number of committees.
Include in the count for each faculty, both faculty-level committees and also the committees under
the schools within the faculty. 

Q6
Define an SQL function (not PLpgSQL) called Q6(text) that takes as parameter a UNSW course code
(e.g. COMP1917) and returns a list of all offerings of the course for which a Course Convenor is
known. 

