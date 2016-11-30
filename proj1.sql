-- COMP9311 15s1 Project 1
--
-- MyMyUNSW Solution Template

-- Q1: ...

create or replace view q1(unswid, name)
as
select distinct unswid, name 
from people 
join course_enrolments 
on id = student 
where id in 
(select id from people join course_enrolments on id = student group by id having count(course_enrolments) > 65)
;

-- q2: ...

create or replace view q2(nstudents, nstaff, nboth)
as
select (select count(*) from students) as nstudents, 
(select count(*) from staff) as nstaff, 
(select count(id) from people where id in (select id from staff) and id in (select id from students)) as nboth
;

-- q3: ...
create or replace view q3helper as
select staff, count(role) 
from course_staff
where role = 1870
group by staff
;

create or replace view q3(name, ncourses)
as
select name, count 
from people join q3helper 
on id = staff 
where count in (select max(count) from q3helper)
;

-- q4: ...
create or replace view q4ahelper as
select student
from program_enrolments
where program = 554 
and semester = 138
;

create or replace view q4a(id)
as
select unswid 
from people join q4ahelper 
on people.id = student
;

create or replace view q4bhelper as
select student 
from program_enrolments join stream_enrolments 
on id  = partof
where stream = 1771 and semester = 138
;

create or replace view q4b(id)
as
select unswid 
from people join q4bhelper 
on student  = people.id
;

create or replace view q4chelper as
select student 
from program_enrolments join programs
on program = programs.id
where offeredby = 89 and semester = 138
;

create or replace view q4c(id)
as
select unswid
from people join q4chelper 
on people.id = student
;

-- q5: ...
create or replace view q5helper as
select name, id, facultyof(id) 
from orgunits
where utype = 9
;

create or replace view q5helper2 as
select facultyof, count(facultyof) 
from q5helper 
group by facultyof
;

create or replace view q5(name) as
select name
from orgunits
join q5helper2 on id = facultyof
where count in
    (select max(count)
     from q5helper2)
;

--Q6: ...

create or replace function q6(text) 
	returns table (course text, year integer, term text, convenor text) as $$
select cast(subjects.code as text),
       year,
       cast(term as text),
       cast(people.name as text)
from courses
join semesters on semesters.id = semester
join subjects on courses.subject = subjects.id
join course_staff on courses.id = course_staff.course
join people on course_staff.staff = people.id
where courses.subject in
    (select id
     from subjects
     where code = $1)
  and course_staff.role = 1870 
  $$language sql
;