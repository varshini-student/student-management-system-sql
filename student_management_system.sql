create database student_management;

use student_management;
--  Student Table Creation
create table Students(
Student_id int primary key,
Name varchar(50),
Department Varchar(50),
Year int,
Email varchar(50)
);
-- Course Table Creation
create table Courses(
Course_id int primary key,
Course_name varchar(50),
Credits int
);
-- Enrollments Table Creation
create table Enrollments(
Enroll_id int primary key,
Student_id int,
Course_id int,
Marks int,
foreign key (Student_id) references Students(Student_id),
foreign key (Course_id) references Courses(Course_id)
);
-- Insert the value into Students Table
insert into Students values
(1,"Sugu","IT",2,"sugu2002@gmail.com"),
(2,"Karthi","CSE",3,"karthi2001@gmail.com"),
(3,"Ragul","BME",4,"ragul2000@gmail.com"),
(4,"Chandhru","ROBOSTICS",1,"chandhru2003@gmail.com");
-- Insert the value into Courses Table
insert into Courses values
(102,"Software Project Management",4),
(103,"Operating System",4),
(104,"Information Technology",4),
(105,"Devops",4);
-- Insert the value into Enrollment Table
insert into Enrollments values
(1,1,102,95),
(2,2,103,90),
(3,3,104,85),
(4,4,105,80);
-- Dql 
select * from Students;
select * from Courses;
select * from Enrollments; 
--  Students + Course + Marks
select S.Name, C.Course_Name,E.Marks
from Students S
join Enrollments E on S.Student_id=E.Student_id
join Courses C on E.Course_id=C.Course_id;
-- Average Marks
select S.Name, avg(E.Marks) as average_marks
from Students S
join Enrollments E on S.Student_id=E.Student_id
group by S.Name;
--  Top Scorer
select S.Name,E.Marks
from Students S
join Enrollments E on S.Student_id=E.Student_id
limit 1;
-- Marks>80
select S.Name,E.Marks
from Students S
join Enrollments E on S.Student_id=	E.Student_id
where E.Marks>80;

