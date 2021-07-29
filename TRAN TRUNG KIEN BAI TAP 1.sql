
CREATE DATABASE IF NOT EXISTS `Testing_System_Assignment_1`;
USE `Testing_System_Assignment_1`;

CREATE TABLE IF NOT EXISTS `Department`(
`DepartmentID`		INT,
`DepartmentName`	VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `Position`(
`PositionID`		INT,
`PositionName`		VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `Account`(
`AccountID`		INT,
`Email`			VARCHAR(50),
`Username`		VARCHAR(50),
`FullName`		VARCHAR(50),	
`DepartmentID`	INT,
`PositionID`	INT,
`CreateDate`	DATETIME
);

CREATE TABLE IF NOT EXISTS `Group`(
`GroupID`		INT,
`GroupName`		VARCHAR(50),
`CreatorID`		INT,
`CreateDate`	DATETIME
);

CREATE TABLE IF NOT EXISTS `GroupAccount`(
`GroupID`		INT,
`AccountID`		INT,
`JoinDate`		DATETIME
);

CREATE TABLE IF NOT EXISTS `TypeQuestion`(
`TypeID`		INT,
`TypeName`		VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `CategoryQuestion`(
`CategoryID`	INT,
`CategoryName`	VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `Question`(
`QuestionID`	INT,
`Content`		VARCHAR(50),
`CategoryID`	INT,
`TypeID`		INT,
`CreatorID`		INT,
`CreateDate`	DATETIME
);

CREATE TABLE IF NOT EXISTS `Answer`(
`AnswerID`		INT,
`Content`		VARCHAR(50),
`QuestionID`	INT,
`isCorrect`		VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `Exam`(
`ExamID`		INT,
`Code`			INT,
`Title`			VARCHAR(50),
`CategoryID`	INT,
`Duration`		DATETIME,
`CreatorID`		INT,
`CreateDate`	DATETIME
);

CREATE TABLE IF NOT EXISTS `ExamQuestion`(
`ExamID`		INT,
`QuestionID`	INT
);

 SELECT* FROM `Department`;
 INSERT INTO `Department` VALUES 	("1"	,	"SALE" 		),
									 ("2"	,	"MARKETTING"),
									 ("3"	,	"BAO VE"	),
                                     ("4"	,	"KE TOAN"	),
                                     ("5"	,	"GIAM DOC"	),
                                     ("6"	,	"PHO GIAM DOC");
                                     
SELECT* FROM `Position`;
INSERT INTO  `Position`		VALUES	("1"	,	"Dev"			),
									("2"	,	"test"			),
									("3"	,	"Scrum Master"	),
                                    ("4"	,	"PM"			);
                        
SELECT* FROM `categoryquestion`;
INSERT INTO `categoryquestion` VALUES 	("1",	"Java" 		),
										("2",	"ADO.NET" 	),
										("3",	"SQL"	 	),
										("4",	"Postman" 	),
										("5",	"Ruby" 		),
										("6",	"Python" 	),
										("7",	"C++" 		),
										("8",	"C Sharp" 	),
										("9",	"PHP"		 );
           
                                     

