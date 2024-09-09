#Task 2 - Create database by Nuhamin Teshome
DROP DATABASE IF EXISTS P3_DB;
CREATE DATABASE P3_DB;

USE P3_DB;
SHOW DATABASES;

#Task 3 - Create tables by Nuhamin Teshome
SHOW TABLES;

CREATE TABLE CLASS_NT(
CODE_NT CHAR(2) PRIMARY KEY,
COLOR_NT VARCHAR(6) NOT NULL,
AGE_LEVEL_NT VARCHAR(10) NOT NULL, 
ROOM_NT VARCHAR(5) NOT NULL,
PHONE_NT CHAR(11) NOT NULL UNIQUE,
CAPACITY_NT VARCHAR(33) NOT NULL,
DIRECTIONS_NT VARCHAR(140) NOT NULL);

CREATE TABLE TEACHER_NT(
ID_NT VARCHAR(5) PRIMARY KEY,
FIRST_NAME_NT VARCHAR(23) NOT NULL,
MIDDLE_NAME_NT VARCHAR(23),
LAST_NAME_NT VARCHAR(23) NOT NULL,
HOME_PHONE_NT CHAR(11) NOT NULL,
WORK_EMAIL_NT VARCHAR(30) NOT NULL UNIQUE,
PERSONAL_EMAIL_NT VARCHAR(30) NOT NULL UNIQUE,
COLLEGE_NT VARCHAR(35) NOT NULL,
HIGHEST_DEGREE_NT VARCHAR(5) NOT NULL,
DEGREE_AREA_NT VARCHAR(25) NOT NULL,
CLASS_CODE_NT CHAR(2) NOT NULL REFERENCES CLASS_NT(CODE_NT));
CREATE TABLE STUDENT_NT(
ID_NT VARCHAR(5) PRIMARY KEY,
FIRST_NAME_NT VARCHAR(23) NOT NULL,
MIDDLE_NAME_NT VARCHAR(23),
LAST_NAME_NT VARCHAR(23) NOT NULL,
NICKNAME_NT VARCHAR(25),
DOB_NT DATE NOT NULL,
CLASS_NT VARCHAR(5) NOT NULL,
CITY_NT VARCHAR(15) NOT NULL,
ZIPCODE_NT CHAR(5) NOT NULL,
STREET_NT VARCHAR(35) NOT NULL,
CLASS_CODE_NT CHAR(2) NOT NULL REFERENCES CLASS_NT(CODE_NT));

CREATE TABLE PARENT_NT(
ID_NT VARCHAR(5) PRIMARY KEY,
FIRST_NAME_NT VARCHAR(23) NOT NULL,
MIDDLE_NAME_NT VARCHAR(23),
LAST_NAME_NT VARCHAR(23) NOT NULL,
HOME_PHONE_NT CHAR(11),
MOBILE_PHONE_NT CHAR(11) NOT NULL,
WORK_PHONE_NT CHAR(11),
PERSONAL_EMAIL_NT VARCHAR(30) UNIQUE,
RELATIONSHIP_NT VARCHAR(20) NOT NULL);

CREATE TABLE REGISTRATION_NT(
PARENT_ID_NT VARCHAR(5) NOT NULL REFERENCES PARENT_NT(ID_NT),
STUDENT_ID_NT VARCHAR(5) NOT NULL REFERENCES STUDENT_NT(ID_NT));

SHOW TABLES;
DESCRIBE CLASS_NT;
DESCRIBE TEACHER_NT;
DESCRIBE STUDENT_NT;
DESCRIBE PARENT_NT;
DESCRIBE REGISTRATION_NT;

#Task 4 - Add data by Nuhamin Teshome
SELECT * FROM CLASS_NT;
SELECT * FROM TEACHER_NT;
SELECT * FROM STUDENT_NT;
SELECT * FROM PARENT_NT;
SELECT * FROM REGISTRATION_NT;

INSERT INTO CLASS_NT VALUES
('RT', 'Red', 'Turtles', 'R1001', '333 1209876', '27', '1st floor Happy Learning Building'),
('GF', 'Green', 'Foxes', 'R2001', '333 8063201', '25', '2nd floor Happy Learning Building'),
('BM', 'Blue', 'Monkeys', 'R3001', '333 2418700', '30', '3rd floor Happy Learning Building'),
('GT', 'Green', 'Turtles', 'R2002', '333 9904321', '26', '2nd floor Happy Learning Building'),
('BF', 'Blue', 'Foxes', 'R3002', '333 6704207', '32', '3rd floor Happy Learning Building');

INSERT INTO TEACHER_NT VALUES
('T1', 'Luke', NULL, 'Johnson', '444 1230987', 'ljohnson@hlk.edu', 'lukej@gmail.com', 'George Mason University', 'BS', 'Education', 'RT'),
('T2', 'Madison', NULL, 'Scott', '444 3450091', 'mscott@hlk.edu', 'madisscot@gmail.com', 'University of Texas', 'BS', 'Education', 'GF'),
('T3', 'Shawn', NULL, 'Smith', '444 7801234', 'ssmith@hlk.edu', 'shawnsmith@gmail.com', 'University of Virginia', 'BS', 'Education', 'BM'),
('T4', 'Letisha', NULL, 'Drew', '444 5601098', 'ldrew@hlk.edu', 'letishad@gmail.com', 'University of San Francisco', 'BS', 'Education', 'GT'),
('T5', 'Maya', NULL, 'Gomez', '444 9552096', 'mgomez@hlk.edu', 'mayagomez@gmail.com', 'Towson University', 'BS', 'Education', 'BF'),
('T6', 'Brian', NULL, 'Williams', '444 2300455', 'bwilliams@hlk.edu', 'brianwill@gmail.com', 'Minnesota University', 'BS', 'Education', 'BM'),
('T7', 'Zoe', NULL, 'Brown', '444 2136008', 'zbrown@hlk.edu', 'zoebrwn@gmailcom', 'University of Las Vegas', 'BS', 'Education', 'BF');

INSERT INTO STUDENT_NT VALUES
('S1', 'Nuhamin', NULL, 'Daniel', NULL, '2017-01-04', 'Red', 'Fairfax', '22030', 'X Street', 'RT'),
('S2', 'Austin', NULL, 'Jones', NULL, '2016-09-15', 'Blue', 'Ashburn', '20103', 'Y Street', 'BM'),
('S3', 'Bethlehem', NULL, 'Belay', 'Bethy', '2017-02-16', 'Green', 'Springfield', '22100', 'Z Street', 'GF'),
('S4', 'Samuel', NULL, 'Davis', 'Sami', '2016-05-23', 'Blue', 'Herndon', '21000', '6th Street', 'BF'),
('S5', 'Nathanim', NULL, 'Mesfin', 'Nathan', '2017-09-17', 'Green', 'Burke', '23000', '7th Street', 'GT');

INSERT INTO PARENT_NT VALUES
('P1', 'Hagos', NULL, 'Mesfin', NULL, '777 0092143', '222 0905213', 'hmesfin@gmail.com', 'Father'),
('P2', 'Sara', NULL, 'Belay', NULL, '777 2210987', NULL, 'sbelay@gmail.com', 'Mother'),
('P3', 'Mike', NULL, 'Jones', '555 6005671', '777 7002198', NULL, 'mjones@gmail.com', 'Father'),
('P4', 'Alicia', NULL, 'Davis', NULL, '777 2880112', NULL, NULL, 'Mother'),
('P5', 'Eyerus', NULL, 'Daniel', NULL, '777 3450021', NULL, 'edaniel@gmail.com', 'Mother');

INSERT INTO REGISTRATION_NT VALUES
('P1', 'S5'),
('P2', 'S3'),
('P3', 'S2'),
('P4', 'S4'),
('P5', 'S1');

#Task 5 - Query the data by Nuhamin Teshome
#q1 
SELECT CONCAT(S.FIRST_NAME_NT, ' ', S.LAST_NAME_NT) AS 'Student', C.AGE_LEVEL_NT AS 'Level',
C.COLOR_NT AS 'Color', C.PHONE_NT AS 'Class Phone', CONCAT(T.FIRST_NAME_NT, ' ', T.LAST_NAME_NT) AS 'Teacher'
FROM CLASS_NT C INNER JOIN STUDENT_NT S ON C.CODE_NT = S.CLASS_CODE_NT INNER JOIN TEACHER_NT T
ON C.CODE_NT = T.CLASS_CODE_NT
ORDER BY 'Student';

#q2 
SELECT C.COLOR_NT AS 'Color', C.AGE_LEVEL_NT AS 'Level', CONCAT(S.FIRST_NAME_NT, ' ', S.LAST_NAME_NT)
AS 'Student name', S.DOB_NT AS 'DOB' FROM CLASS_NT C INNER JOIN STUDENT_NT S ON 
C.CODE_NT = S.CLASS_CODE_NT
ORDER BY 'Color', 'Level', 'Student name';

#q3 
SELECT CONCAT(P.FIRST_NAME_NT, ' ', P.LAST_NAME_NT) AS 'Parent name', P.HOME_PHONE_NT AS 'Home phone', 
CONCAT(S.FIRST_NAME_NT, ' ', S.LAST_NAME_NT) AS 'Student name', C.COLOR_NT AS 'Color', C.AGE_LEVEL_NT
AS 'Level' FROM PARENT_NT P INNER JOIN REGISTRATION_NT RT ON P.ID_NT = RT.PARENT_ID_NT INNER JOIN
STUDENT_NT S ON S.ID_NT = RT.STUDENT_ID_NT INNER JOIN CLASS_NT C ON C.CODE_NT = S.CLASS_CODE_NT
ORDER BY 'Parent name';

#q4
SELECT CONCAT(T.FIRST_NAME_NT, ' ', T.LAST_NAME_NT) AS 'Teacher', 
CONCAT(P.FIRST_NAME_NT, ' ', P.LAST_NAME_NT) AS 'Parent', CONCAT(S.FIRST_NAME_NT, ' ', S.LAST_NAME_NT)
AS 'Student' FROM PARENT_NT P INNER JOIN REGISTRATION_NT RT ON P.ID_NT = RT.PARENT_ID_NT INNER JOIN
STUDENT_NT S ON S.ID_NT = RT.STUDENT_ID_NT INNER JOIN CLASS_NT C ON C.CODE_NT = S.CLASS_CODE_NT 
INNER JOIN TEACHER_NT T ON C.CODE_NT = T.CLASS_CODE_NT
ORDER BY 'Teacher', 'Parent', 'Student';



