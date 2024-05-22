CREATE TABLE Branch
(
	id INT PRIMARY KEY,
	name NVARCHAR(50),
	location NVARCHAR(50)
)

CREATE TABLE Track
(		
	id INT PRIMARY KEY,
	name NVARCHAR(100)
)

CREATE TABLE BranchTracks
(	
	branch_id INT,
	track_id INT,
	PRIMARY KEY(branch_id, track_id),
	FOREIGN KEY(branch_id) REFERENCES Branch(id),
	FOREIGN KEY(track_id) REFERENCES Track(id)
)

CREATE TABLE Course
(
	id INT PRIMARY KEY,
	name NVARCHAR(100),
	duration TINYINT,
	max_degree TINYINT,
	min_degree TINYINT
)

CREATE TABLE TrackCourses
(
	track_id INT,
	course_id INT,
	PRIMARY KEY(track_id, course_id),
	FOREIGN KEY(track_id) REFERENCES Track(id),
	FOREIGN KEY(course_id) REFERENCES Course(id)
)

CREATE TABLE Department
(	
	id INT PRIMARY KEY,
	name NVARCHAR(50)
)

CREATE TABLE BranchDepartments
(	
	branch_id INT,
	department_id INT,
	PRIMARY KEY (branch_id, department_id),
	FOREIGN KEY (branch_id) REFERENCES Branch(id),
	FOREIGN KEY (department_id) REFERENCES Department(id)
)

CREATE TABLE Employee
(
	id INT PRIMARY KEY,
	name NVARCHAR(50),
	salary FLOAT,
	mobile_number VARCHAR(15),
	email VARCHAR(max),
	username VARCHAR(100),
	password VARCHAR(100),
	hire_date DATE,
	department_id INT,
	branch_id INT,
	FOREIGN KEY(department_id) REFERENCES Department(id),
	FOREIGN KEY(branch_id) REFERENCES Branch(id),
	CHECK(LEN(mobile_number) = 11)
)


CREATE TABLE Student(
	id INT PRIMARY KEY ,
	first_name NVARCHAR(50) NOT NULL,
	last_name NVARCHAR(50) NOT NULL,
	birth_date DATE,
	mobile_number VARCHAR(15),
	email VARCHAR(max),
	username VARCHAR(100),
	password VARCHAR(100),
	branch_id int,
	track_id int,
	FOREIGN KEY(branch_id) REFERENCES Branch(id),
	FOREIGN KEY(track_id) REFERENCES Track(id),
	CHECK(LEN(mobile_number) = 11)
)

CREATE TABLE Exam
(
	id INT PRIMARY KEY,
	start_time TIME NOT NULL,
	end_time TIME NOT NULL,
	branch_id INT,
	course_id INT,
	FOREIGN KEY(branch_id) REFERENCES Branch(id),
	FOREIGN KEY(course_id) REFERENCES Course(id)
)

CREATE TABLE QustionTypes
(	
	id INT PRIMARY KEY,
	type VARCHAR(10)
)

CREATE TABLE Question
(
	id int PRIMARY KEY ,
	question NVARCHAR(MAX),
	answer NVARCHAR(MAX),
	type_id INT,
	FOREIGN KEY(type_id) REFERENCES QustionTypes(id)
)

CREATE TABLE InstructorQestionExam
(
	instructor_id INT,
	qestion_id INT,
	exam_id INT,
	degreeb TINYINT,
	PRIMARY KEY(instructor_id, qestion_id, exam_id),
	FOREIGN KEY(instructor_id) REFERENCES Employee(id),
	FOREIGN KEY(qestion_id) REFERENCES Question(id),
	FOREIGN KEY(exam_id) REFERENCES Exam(id)
)

CREATE TABLE StudentAnswerExamQestions
(
	student_id INT,
	student_answer VARCHAR(MAX),
	question_id INT,
	exam_id INT,
	PRIMARY KEY(student_id, exam_id, question_id),
	FOREIGN KEY(student_id) REFERENCES Student(id),
	FOREIGN KEY(question_id) REFERENCES Question(id),
	FOREIGN KEY(exam_id) REFERENCES Exam(id)
)

