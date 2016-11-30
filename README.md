# 9311DB
PLPGSQL querying project

This project for COMP9311 Database Systems involved creation of several queries towards a large university database modelling UNSW.
The exercises were as follows:

Q1
Define an SQL view Q1(unswid, name) that gives the student id and name of any student who has
studied more than 65 courses at UNSW. The name should be taken from the People.name field for
the student, and the student id should be taken from People.unswid.

Q2
Define an SQL view Q2(nstudents, nstaff, nboth) which produces a table with a single row containing
counts of:
  the total number of students (who are not also staff)
  the total number of staff (who are not also students)
  the total number of people who are both staff and student.

Q3
Define an SQL view Q3(name, ncourses) that prints the name of the person(s) who has been
lecturer-in-charge (LIC) of the most courses at UNSW and the number of courses they have been LIC
for. In the database, the LIC has the role of "Course Convenor".

Q4
Define SQL views Q4a(id), Q4b(id), and Q4c(id), which give the student IDs of, respectively
  all students enrolled in 05s2 in the Computer Science (3978) degree
  all students enrolled in 05s2 in the Software Engineering (SENGA1) stream
  all students enrolled in 05s2 in degrees offered by CSE

Q5
Define an SQL view Q5(name) which gives the faculty with the maximum number of committees.
Include in the count for each faculty, both faculty-level committees and also the committees under
the schools within the faculty. You can use the facultyOf() function, which is already available in the
database, to assist with this (You can view the function definition using proper psql command). You
can assume that committees are defined only at the faculty and school level. Use
the OrgUnits.name field as the faculty name.

Q6
Define an SQL function (not PLpgSQL) called Q6(text) that takes as parameter a UNSW course code
(e.g. COMP1917) and returns a list of all offerings of the course for which a Course Convenor is
known. Note that this means just the Course Convenor role, not Course Lecturer or any other role
associated with the course. Also, if there happen to be several Course Convenors, they should all be
returned (in separate tuples). If there is no Course Convenor registered for a particular offering of
the course, then that course offering should not appear in the result.
The function must use the following interface:

create or replace function Q6(text)
returns table (course text, year integer, term text, convenor text)

The course field in the result tuples should be the UNSW course code (i.e. that same thing that was
used as the parameter). If the parameter does not correspond to a known UNSW course, then
simply return an empty result set.
