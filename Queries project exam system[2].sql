use ExaminationSystem
--Find all student  instructor name
select student.FirstName+' '+student.LastName,instructor.name from student
left join instructor on student.id=instructor.id

--Find all Questions with Answer
select question,QuestionAnswer.answer from question
left join QuestionAnswer on question.QId=QuestionAnswer.questionId

--To know courses for all student
select student.FirstName+' '+student.LastName,course.name from student
left join course on student.id=course.id
 
--To know branch name and location for all student
select student.FirstName+' '+student.LastName,branch.name,branch.location from student
left join branch on student.id=branch.id

--To know all instructor department and branch
select instructor.name,department.name,branch.name from instructor
left join department on  instructor.id=department.id 
left join branch on  instructor.id=branch.id

--Find instructor with department
select instructor.name,department.name from instructor
left join department on  instructor.id=department.id

--To know type of all questions
select question.question,QuestionType.questionType from question
inner join QuestionType on  question.QId=QuestionType.questionId


--To know student answer for question
select question.question,student.FirstName+' '+student.LastName,StudentAnswerExamQustions.StudentAnswer from question
left join student on  question.QId=student.id
left join StudentAnswerExamQustions on  question.QId=StudentAnswerExamQustions.QesID

--To know coursrs name of tracks
select course.name,track.name from track
inner join course on  course.id=track.id

--To know what's track on the branch
select branch.name,track.name from track
inner join branch on  branch.id=track.id



