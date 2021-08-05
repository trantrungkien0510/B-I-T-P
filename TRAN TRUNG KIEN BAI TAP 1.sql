DROP DATABASE IF EXISTS testing_system;
CREATE DATABASE testing_system;
USE testing_system;

CREATE TABLE department (
	department_id 				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_name 			NVARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE `position`(
	position_id					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    position_name				NVARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE `account`(
	account_id 					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email 			        	VARCHAR(30) NULL UNIQUE,
    username 			 		VARCHAR(20) NOT NULL ,
    fullname		 			NVARCHAR(30) NOT NULL,
    department_id	 			TINYINT UNSIGNED NOT NULL,
    position_id					TINYINT UNSIGNED NOT NULL,
    create_date					DATE,
    FOREIGN KEY (position_id) 	REFERENCES `position`(position_id),
    FOREIGN KEY (department_id) REFERENCES department (department_id)
);

CREATE TABLE `group` (
	group_id					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    group_name					NVARCHAR(30) UNIQUE ,
    creator_id					TINYINT UNSIGNED NOT NULL UNIQUE,
    create_date					DATE
);

CREATE TABLE group_acount (
	group_id					TINYINT UNSIGNED PRIMARY KEY,
    account_id					TINYINT UNSIGNED UNIQUE,
    join_date					DATE,
    FOREIGN KEY (group_id) 		REFERENCES `group`(group_id),
    FOREIGN KEY (account_id) 	REFERENCES  `account`(account_id)
);

CREATE TABLE type_question (
	type_id						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	type_name					VARCHAR(30)
);

CREATE TABLE category_question(
 category_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 Category_Name NVARCHAR(50) NOT NULL UNIQUE KEY
);

CREATE TABLE question (
	question_id 				TINYINT UNSIGNED  AUTO_INCREMENT PRIMARY KEY,
    content						NVARCHAR(100) NOT NULL,
    category_id 				TINYINT UNSIGNED NOT NULL,
    type_id 					TINYINT UNSIGNED NOT NULL,
    creator_id 					TINYINT UNSIGNED ,
    create_date					DATE,
    FOREIGN KEY (category_id) 	REFERENCES category_question (category_id),
    FOREIGN KEY(type_id) 		REFERENCES type_question(type_id),
	FOREIGN KEY(creator_id) 	REFERENCES `account`(account_id)
);

CREATE TABLE answer (
	answer_id					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content						NVARCHAR(50),
    question_id 				TINYINT UNSIGNED,
    iscorrect					VARCHAR(50),
    FOREIGN KEY (question_id) REFERENCES question(question_id )
);

CREATE TABLE exam ( 
	exam_id						TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `code`						CHAR(10) NOT NULL,
    title						NVARCHAR(50) NOT NULL,
    category_id					TINYINT UNSIGNED NOT NULL,
    duration					TINYINT UNSIGNED NOT NULL,
    creator_id					TINYINT UNSIGNED NOT NULL,
    create_date					DATE,
    FOREIGN KEY (category_id) REFERENCES category_question(category_id),
    FOREIGN KEY (creator_id) REFERENCES `account`(account_id)
);

DROP TABLE IF EXISTS exam_question;
CREATE TABLE exam_question (
	exam_id						TINYINT UNSIGNED PRIMARY KEY,
    question_id					TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (exam_id) REFERENCES exam(exam_id),
    FOREIGN KEY (question_id) REFERENCES question(question_id)
);

INSERT INTO department (department_name)
VALUES				  	('Giam Doc'),
						('Sale'),
                        ('Bao ve'),
                        ('Nhan su');
                        
INSERT INTO `position` 	(position_name)
VALUES					('Dev'),
						('test'),
                        ('Scrum Master');
                        
INSERT INTO `account` 	(email, username, fullname, department_id, position_id, create_date)
Values 					('trantrungkien0510@gmail.com','trankien','trantrungkien','3','1','2020-03-05'),
						('taphuc@gmail.com','phucbua','taluuphuc','2','3','2020-03-06');

INSERT INTO `group`		(group_name, creator_id, create_date)
VALUES					('testing_System', '5','2019-03-05'),
						('Development', '1','2020-03-07'),
						('VTI Sale 01', '2','2020-03-09'),
						('VTI Sale 02', '3','2020-03-10');
                        
INSERT INTO group_acount (group_id, account_id, join_date)
VALUES					(1,1,'2019-03-05');

INSERT INTO type_question (type_name)
VALUES					('Essay' ), 
						('Multiple-Choice' );

INSERT INTO category_question (Category_Name )
VALUES 					('Java' ),
						('ADO.NET' ),
						('SQL' ),
						('Postman' ),
						('Ruby' ),
						('Python' ),
						('C++' ),
						('C Sharp' ),
						('PHP' );
                        
INSERT INTO question (content, category_id, type_id, creator_id, create_date)
VALUES 					('Câu hỏi về Java' , 1 , '1' , '2' ,'2020-04-05'),
						('Câu Hỏi về PHP' , 9 , '2' , '2' ,'2020-04-05'),
						('Hỏi về C#' , 9 , '2' , '2' ,'2020-04-06'),
						('Hỏi về Ruby' , 6 , '1' , '2' ,'2020-04-06'),
						('Hỏi về Postman' , 5 , '1' , '2' ,'2020-04-06'),
						('Hỏi về ADO.NET' , 3 , '2' , '2' ,'2020-04-06'),
						('Hỏi về ASP.NET' , 2 , '1' , '1' ,'2020-04-06'),
						('Hỏi về C++' , 8 , '1' , '1' ,'2020-04-07'),
						('Hỏi về SQL' , 4 , '2' , '2' ,'2020-04-07'),
						('Hỏi answervề Python' , 7 , '1' , '1' ,'2020-04-07');
                        
INSERT INTO answer (content, question_id, iscorrect)
VALUES 					('Trả lời 01' , 1 , 0),
						('Trả lời 02' , 1 , 1),
						('Trả lời 03', 1 , 0 ),
						('Trả lời 04', 1 , 1 ),
						('Trả lời 05', 2 , 1 ),
						('Trả lời 06', 3 , 1 ),
						('Trả lời 07', 4 , 0 ),
						('Trả lời 08', 8 , 0 ),
						('Trả lời 09', 9 , 1 ),
						('Trả lời 10', 10 , 1 );
                        
INSERT INTO exam 		(`code`, title, category_id, duration, creator_id, create_date)
VALUES 					('VTIQ001' , 'Đề thi C#' ,1 , 60 , '2' ,'2019-04-05'),
						('VTIQ002' , 'Đề thi PHP' ,9 , 60 , '2' ,'2019-04-05'),
						('VTIQ003' , 'Đề thi C++' , 9 ,120 , '2' ,'2019-04-07'),
						('VTIQ004' , 'Đề thi Java' , 6 , 60, '1' ,'2020-04-08'),
						('VTIQ005' , 'Đề thi Ruby' , 5 , 120, '2' ,'2020-04-10'),
						('VTIQ006' , 'Đề thi Postman' , 3 ,60 , '1' ,'2020-04-05'),
						('VTIQ007' , 'Đề thi SQL' , 2 ,60 , '2' ,'2020-04-05'),
						('VTIQ008' , 'Đề thi Python' , 8 ,60 , '1' ,'2020-04-07'),
						('VTIQ009' , 'Đề thi ADO.NET' , 4 ,90 , '2' ,'2020-04-07'),
						('VTIQ010' , 'Đề thi ASP.NET' , 7 ,90 , '1' ,'2020-04-08');
INSERT INTO exam_question (exam_id, question_id) 
VALUES 					( 1 , 5 ),
						( 2 , 10 ), 
						( 3 , 4 ), 
						( 4 , 3 ), 
						( 5 , 7 ), 
						( 6 , 10 ), 
						( 7 , 2 ), 
						( 8 , 10 ), 
						( 9 , 9 ), 
						( 10 , 8 );
                        
                        


-- Question 1: Thêm ít nhất 10 record vào mỗi table
USE testing_system;
INSERT INTO department	(department_name)
VALUES					('bốc vác'),
						('kế toán'),
                        ('hành chính')
;


INSERT INTO `account` (email				, username		,		 fullname, 	department_id,	position_id		,		 create_date)
VALUES 				('tranhailong@gmail.com','hailong'		,'trần hải long',			'4',	'2'				,'2020-01-03'),
					('tranngoclong@gmail.com','tranlong'	,'trần ngọc long',			'5',	'2'				,'2020-01-03'),
					('tranngocphong@gmail.com','ngocphong'	,'trần ngọc phong',			'3',	"1"				,'2020-02-03'),
                    ('phankimlien@gmail.com','kimlien'		,'phan kim liên',			'1',	'3'				,'2020-02-04'),
					('rolondinhon@gmail.com','rolon'		,	'dolondinho',			'2',	'3'				,'2020-01-04'),
                    ('tranmoccac@gmail.com','moccac'		,'trần mộc cắc',			'5',	'3'				,'2020-02-04'),
                    ('taymonkhanh@gmail.com','monkhanh'		,'tây môn khánh',			'6',	'2'				,'2020-03-04'),
                    ('huanhoahong@gmail.com','huanrose'		,'huấn hoa hồng',			'3',	'2'				,'2020-04-04'),
                    ('tienbip@gmail.com'	,'tienbip'		,'nguyễn việt tiến',		'2',	'3'				,'2020-05-04'),
                    ('duongnguyen@gmail.com','duongnguyen'	,'nguyễn tuấn dương',		'3',	'1'				,'2020-06-04')
;

INSERT INTO  `group` (group_name	, 	creator_id,	 create_date)
VALUES				('VTI Sale 03'	, '8'		,'2020-03-09'),
					('VTI Sale 04'	, '4'		,'2020-03-09'),
                    ('VTI Sale 05'	, '11'		,'2020-03-09'),
                    ('VTI Sale 06'	, '6'		,'2020-03-09'),
                    ('VTI Sale 07'	, '7'		,'2020-03-09'),
                    ('VTI Sale 08'	, '9'		,'2020-03-09'),
                    ('VTI Sale 09'	, '10'		,'2020-03-09')
;

-- Question 2: lấy ra tất cả các phòng ban
SELECT* From department;


-- Question 3: lấy ra id của phòng ban "Sale"
SELECT department_id
From department
WHERE department_name = "Sale  "
;

-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT  *
FROM `account`
WHERE LENGTH(fullname) = (SELECT MAX(LENGTH(fullname)) FROM `account`)
ORDER BY fullname DESC;


-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id= 3
WITH `account` AS
(
SELECT * FROM `account` WHERE department_id =3
)
SELECT * FROM  `account`
WHERE LENGTH(fullname) = (SELECT MAX(LENGTH(fullname)) FROM `account`) 
ORDER BY fullname ASC;

-- Question 6: Lấy ra tên group đã tạo trước ngày 20/12/2019
SELECT group_name
FROM `group` 
WHERE create_date < '2019-12-20';


-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT * FROM testing_system.`answer`;
SELECT question_id, COUNT(question_id) AS SL FROM `answer` 
GROUP BY question_id
HAVING count(question_id) >= 4;


-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT `code` 
FROM `exam`
WHERE Duration >= 60 AND create_date < '2019-12-20';


-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT * 
FROM `Group`
ORDER BY create_date DESC 
LIMIT 5;


-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT department_id, COUNT(account_id) AS SL 
FROM `account`
WHERE department_id = 2;


-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT fullname 
FROM `account`
WHERE (SUBSTRING_INDEX(fullname, ' ', -1)) LIKE 'D%o' ;


-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE 
FROM `exam`
WHERE create_date < '2019-12-20';

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE 
FROM `question`
WHERE (SUBSTRING_INDEX(content,' ',2)) ='câu hỏi';


-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `account` 
SET Fullname = N'Nguyễn Bá Lộc', 
Email = 'loc.nguyenba@vti.com.vn'
WHERE account_id = 5;


-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
UPDATE `group_acount` SET account_id = 5 
WHERE group_id = 4;


# nháp
SELECT* from `group`;
SELECT* from `account`;
select G.* FROM `group` G where group_name like 'vti%';

select * from `group` WHERE creator_id = 5;
select * from `group` WHERE group_id = 
(select group_id from `group` where creator_id=5 limit 1);



