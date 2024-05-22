--this proc returns number of q and takes examid
CREATE proc sp_get_number_of_qestions_in_exam_by_examid 
@examid int
as
begin
	select COUNT([QuestionId]) AS 'Number of qestions'
	from InstructorQestionExam
	WHERE [ExamId] = @examid
end
--this proc get total degree 
CREATE PROC sp_get_total_degree_of_student_by_studentID_And_ExamID 
@StudentID INT,
@ExamID INT
AS
BEGIN
	SELECT SEAQ.[StudID], SEAQ.[ExID], SEAQ.[StudentAnswer], QA.[answer]
	FROM StudentAnswerExamQustions SEAQ INNER JOIN question Q
	ON SEAQ.QesID = Q.QId INNER JOIN QuestionAnswer QA
	ON Q.QId = QA.questionId
	WHERE SEAQ.StudentAnswer = QA.answer AND SEAQ.[StudID] = @StudentID AND SEAQ.[ExID] = @ExamID
	SELECT @@ROWCOUNT * 10 AS 'Student Degree', (select SUM([degree]) from[dbo].[InstructorQestionExam] WHERE [ExamId] = @ExamID) AS 'Course Degree'
END
--this proc return available tracks and takes branch id
CREATE PROC SP_GetAvilableTracksInBranchByBranchID 
@BranchID INT 
AS
BEGIN
	SELECT b.id, b.name AS 'Branch Name', t.name AS 'Track'
	FROM branch b INNER JOIN trackBranch tb
	ON b.id = tb.BranchId INNER JOIN track t
	ON tb.TrackId = t.id
	WHERE b.id = @BranchID
END
--this proc return students name by branch id 
CREATE PROC SP_GetStudentNameAndBranchByID 
@ID INT
AS 
BEGIN
	SELECT CONCAT(S.FirstName,' ',S.LastName) AS 'Student Name', b.name AS 'Branch Name'
	FROM student s INNER JOIN branch b
	ON s.BranchID = b.id
	WHERE s.id = @ID
END
--this proc takes student,exam,question id and returns question type
select * from student,exam,question
CREATE PROCEDURE sp_GetQuestionTypee 
    @student_id INT,
    @exam_id INT,
    @question_id INT
AS
BEGIN
    SELECT qt.questionType
    FROM Question q
    INNER JOIN QuestionType qt ON q.QId= qt.questionId
    WHERE q.QId = @question_id;
END

--views
create view branchView
as
select * from branch

CREATE VIEW ChoicesQesions
AS
SELECT Q.question
FROM Question Q INNER JOIN QustionTypes QT
ON Q.QId= QT.id
WHERE QT.id = 3;

CREATE VIEW TextQesions
AS
SELECT Q.question
FROM Question Q INNER JOIN QustionTypes QT
ON Q.QId= QT.id
WHERE QT.id = 1;

create view StudentDegreeView
as
select degree from InstructorQestionExam

CREATE VIEW TrueAndFalaseQesions
AS
SELECT Q.question
FROM Question Q INNER JOIN QustionTypes QT
ON Q.QId = QT.id
WHERE QT.id = 6 ;
select * from QuestionType

create function GetStudentWithCity (@city varchar(50))
returns table
as
return(
	select student.FirstName , student.LastName 
	from student
	where student.address = @city
) 
SELECT * FROM GetStudentWithCity('alex')


CREATE function GetTheDomainByStudentID (@id int)
returns varchar(50)
as
begin
return(
	select SUBSTRING (email, CHARINDEX( '@', [email]) + 1,LEN([email])) AS 'Domain'
	from student
	where student.id = @id
)
end
print dbo.GetTheDomainByStudentID(1)
