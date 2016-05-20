create table person
(
person_id int(11) primary key,
address_id int(11),
first_name varchar(50) not null,
middle_name varchar(50),
last_name varchar(50) not null,
phone int(11) not null,
type char(1) not null,
email varchar(100) null
);




create table student (
student_id int(11) primary key,
person_id int(11) ,
major varchar(100) not null,
student_level varchar(100) not null
);

create table skill (
skill_id int(11)  primary key,
student_id int(11),
skill_name varchar(100) not null,
description varchar(2000) 
);

CREATE TABLE login
(
person_id int(11) NOT NULL,
user_name varchar(50) NOT NULL,
password varchar(100) NOT NULL,
CONSTRAINT pk_PersonID PRIMARY KEY (person_id)
);

CREATE TABLE admin
(
admin_id int(11) NOT NULL,
person_id int(11) NOT NULL,
title varchar(100) NOT NULL,
CONSTRAINT pk_PersonID PRIMARY KEY (admin_id)
);

CREATE TABLE internship_oppurtunities
(
   internship_id int(11) PRIMARY KEY NOT NULL,
   business_id int(11),
   supervisor_fname varchar(50) NOT NULL,
   supervisor_mname varchar(50),
   supervisor_lname varchar(50) NOT NULL,
   supervisor_contact varchar(20) NOT NULL,
   pay int NOT NULL,
   start_date date NOT NULL,
   end_date date,
   weekly_hours int NOT NULL,
   job_description varchar(2000) NOT NULL,
   internship_type varchar(50) NOT NULL,
   status varchar(10) DEFAULT 'O',
   no_of_positions int,
   internship_name varchar(100) NOT NULL
)
; 

 CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `line1` TEXT(10) NOT NULL,
  `line2` TEXT(10) NULL,
  `city` VARCHAR(45) NOT NULL,
  `zip` INT NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`address_id`));


  CREATE TABLE `business` (
  `business_id` int(11) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `approved` varchar(3) DEFAULT NULL,
  business_name varchar(100),
  PRIMARY KEY (`Business_Id`)
);


CREATE TABLE `student_skill_mapping` (
student_skill_mpg_id int(11) not null,
  `skill_id` int(11) NOT NULL DEFAULT '0',
  `student_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (student_skill_mpg_id)
);

create table department (
   department_id int(11) not null,
   department_name varchar(100) not null
 );
 
 alter table department add constraint pk_department primary key (department_id);
 
 
create table admin_department_mapping (
   admin_dept_id int(11) not null,
   admin_id int(11) not null,
   department_id int(11) not null
 );


alter table admin_department_mapping add constraint pk_admin_dept_mapping primary key (admin_dept_id);


CREATE TABLE placement (
  internship_id int(11) NOT NULL,
  student_id int(11) NOT NULL,
  supervisor_eval char(2) DEFAULT NULL,
  start_date date NOT NULL,
  supervisor_phone int(11) NOT NULL,
  supervisor_email varchar(100) NOT NULL,
  student_eval char(2),
  PRIMARY KEY (internship_id,student_id)
);



alter table person add constraint fk_person_address
Foreign key(address_id) references address(address_id);

alter table student add constraint fk_student_person foreign key (person_id) references person(person_id);




ALTER TABLE admin
ADD CONSTRAINT fk_person_id
FOREIGN KEY (person_id)
REFERENCES person(person_id);


alter table internship_oppurtunities add constraint fk_int_opp_bus foreign key (business_id) references business(business_id);


alter table business add constraint fk_business_person
Foreign key(person_id) references person(person_id);


alter table student_skill_mapping add constraint fk_student_ssm
Foreign key(student_id) references student(student_id);


alter table student_skill_mapping add constraint fk_skill_ssm
Foreign key(skill_id) references skill(skill_id);


alter table admin_department_mapping add constraint fk_dept_admin_dept_mapping foreign key (department_id) references department(department_id);



alter table admin_department_mapping add constraint fk_admin_admin_dept_mapping foreign key (admin_id) references admin(admin_id);



alter table placement add constraint fk_placement_internship foreign key (internship_id) references internship_oppurtunities(internship_id);


alter table placement add constraint fk_placement_student foreign key (student_id) references student(student_id);

alter table login add constraint fk_login_person foreign key (person_id) references person(person_id);

CREATE TABLE application
(
   internship_id int(11) DEFAULT 0 NOT NULL,
   student_id int(11) DEFAULT 0 NOT NULL,
   semester int(11) DEFAULT 0 NOT NULL,
   description varchar(45),
   CONSTRAINT PRIMARY KEY (internship_id,student_id)
)
;


alter table application add constraint fk_application_internship foreign key (internship_id) references internship_oppurtunities(internship_id);

alter table application add constraint fk_application_student foreign key (student_id) references student(student_id);

create unique index login_username
on login(user_name);

create index person_fname
on person(first_name);

create index person_lname
on person(last_name);

create index skillname
on skill(skill_name);

create index internship_type
on internship_oppurtunities(internship_type);

create index placement_start
on placement (start_date);

INSERT INTO address (address_id,line1,line2,city,zip,state) VALUES (1,'9234 Barton Creek DR','Near Chipotle','Charlotte',22345,'NC');
INSERT INTO address (address_id,line1,line2,city,zip,state) VALUES (2,'9011 Cameron BLVD ','Behind big lake','Charlotte',22345,'NC');
INSERT INTO address (address_id,line1,line2,city,zip,state) VALUES (3,'2313 University lane ','Near parking lot','Charlotte',22345,'NC');
INSERT INTO address (address_id,line1,line2,city,zip,state) VALUES (4,'2112 Mallard lake ','Near UNCC','Charlotte',22345,'NC');
INSERT INTO address (address_id,line1,line2,city,zip,state) VALUES (5,'4141 East Deck ','Behind petrol pump','Charlotte',22345,'NC');




INSERT INTO person (person_id,address_id,first_name,middle_name,last_name,phone,type,email) VALUES (1,1,'Shiv','D','Desai',112211,'S','asd1@asd.com');
INSERT INTO person (person_id,address_id,first_name,middle_name,last_name,phone,type,email) VALUES (2,2,'Nachiket',null,'Doke',112211,'A','asd2@asd.com');
INSERT INTO person (person_id,address_id,first_name,middle_name,last_name,phone,type,email) VALUES (3,3,'Sanghi',null,'Paladu',112211,'B','asd3@asd.com');
INSERT INTO person (person_id,address_id,first_name,middle_name,last_name,phone,type,email) VALUES (4,5,'william',null,'tom',112244,'S','asd4@asd.com');
INSERT INTO person (person_id,address_id,first_name,middle_name,last_name,phone,type,email) VALUES (5,5,'tom',null,'cruise',112233,'A','asd5@asd.com');

INSERT INTO login (person_id,user_name,password) VALUES (1,'smith','test');
INSERT INTO login (person_id,user_name,password) VALUES (2,'allen','test');
INSERT INTO login (person_id,user_name,password) VALUES (3,'ward','test');
INSERT INTO login (person_id,user_name,password) VALUES (4,'jones','test');
INSERT INTO login (person_id,user_name,password) VALUES (5,'scott','test');



INSERT INTO student (student_id,person_id,major,student_level) VALUES (1,2,'Computer Science','graduate');
INSERT INTO student (student_id,person_id,major,student_level) VALUES (2,1,'Electronics','graduate');
INSERT INTO student (student_id,person_id,major,student_level) VALUES (3,1,'Mechanical','undergraduate');
INSERT INTO student (student_id,person_id,major,student_level) VALUES (4,2,'Electronics','graduate');
INSERT INTO student (student_id,person_id,major,student_level) VALUES (5,4,'Civil Science','graduate');



INSERT INTO business (business_id,person_id,approved,business_name) VALUES (1,1,'Y','Apple');
INSERT INTO business (business_id,person_id,approved,business_name) VALUES (2,2,'Y','Microsoft');
INSERT INTO business (business_id,person_id,approved,business_name) VALUES (3,3,'Y','Amazon');
INSERT INTO business (business_id,person_id,approved,business_name) VALUES (4,4,'Y','Bank of America');
INSERT INTO business (business_id,person_id,approved,business_name) VALUES (5,5,'Y','eBay');



INSERT INTO admin (admin_id,person_id,title) VALUES (1,1,'JuniorAdmin');
INSERT INTO admin (admin_id,person_id,title) VALUES (2,3,'SeniorAdmin');

INSERT INTO department (department_id,department_name) VALUES (1,'Computer Science');
INSERT INTO department (department_id,department_name) VALUES (2,'Architecture');
INSERT INTO department (department_id,department_name) VALUES (3,'Mechanical');
INSERT INTO department (department_id,department_name) VALUES (4,'Psychology');
INSERT INTO department (department_id,department_name) VALUES (5,'Electronics');



INSERT INTO admin_department_mapping (admin_dept_id,admin_id,department_id) VALUES (1,1,1);
INSERT INTO admin_department_mapping (admin_dept_id,admin_id,department_id) VALUES (2,2,2);
INSERT INTO admin_department_mapping (admin_dept_id,admin_id,department_id) VALUES (3,1,3);
INSERT INTO admin_department_mapping (admin_dept_id,admin_id,department_id) VALUES (4,2,4);
INSERT INTO admin_department_mapping (admin_dept_id,admin_id,department_id) VALUES (5,1,5);



INSERT INTO skill (skill_id,student_id,skill_name,description) VALUES (1,2,'Web development','Web develpoment in .NET,Java,Python');
INSERT INTO skill (skill_id,student_id,skill_name,description) VALUES (2,3,'Manual Testing','Manual Testing');
INSERT INTO skill (skill_id,student_id,skill_name,description) VALUES (3,4,'Weblogic','Weblogic Administration');
INSERT INTO skill (skill_id,student_id,skill_name,description) VALUES (4,1,'Android','Application development in Android');

INSERT INTO student_skill_mapping (student_skill_mpg_id,skill_id,student_id) VALUES (1,1,1);
INSERT INTO student_skill_mapping (student_skill_mpg_id,skill_id,student_id) VALUES (2,2,2);
INSERT INTO student_skill_mapping (student_skill_mpg_id,skill_id,student_id) VALUES (3,3,3);
INSERT INTO student_skill_mapping (student_skill_mpg_id,skill_id,student_id) VALUES (4,4,4);



INSERT INTO internship_oppurtunities (internship_id,business_id,supervisor_fname,supervisor_mname,supervisor_lname,supervisor_contact,pay,start_date,end_date,weekly_hours,job_description,internship_type,status,no_of_positions,internship_name) VALUES (1,3,'Derby','Robbile','Tirrell','(202)-555-0186',5400,{d '2015-06-15'},{d '2015-09-30'},16,'The computer programmer job involves responsibility for the design, development and administration of transactional and analytical data structures','paid','open',20,'Business Analyst Programmer');
INSERT INTO internship_oppurtunities (internship_id,business_id,supervisor_fname,supervisor_mname,supervisor_lname,supervisor_contact,pay,start_date,end_date,weekly_hours,job_description,internship_type,status,no_of_positions,internship_name) VALUES (2,1,'Jespon','Lex','Terry','(404)-354-0141',4500,{d '2015-05-28'},{d '2015-10-30'},20,'The Director of IT oversees and administers company platforms, technology and strategies.  Identifies information system enhancements that will improve business and support future business needs','paid','closed',0,'IT Administrator');
INSERT INTO internship_oppurtunities (internship_id,business_id,supervisor_fname,supervisor_mname,supervisor_lname,supervisor_contact,pay,start_date,end_date,weekly_hours,job_description,internship_type,status,no_of_positions,internship_name) VALUES (3,5,'Wardell','Philander','Gilbert','(803)-745-0153',0,{d '2015-06-22'},{d '2016-02-10'},19,'The IT Systems Analyst job is responsible for the defining, developing, configuring and supporting computer applications','unpaid','open',15,'IT System Analyst');
INSERT INTO internship_oppurtunities (internship_id,business_id,supervisor_fname,supervisor_mname,supervisor_lname,supervisor_contact,pay,start_date,end_date,weekly_hours,job_description,internship_type,status,no_of_positions,internship_name) VALUES (4,2,'Luke','James','Pryor','(515)-658-0104',6200,{d '2015-05-03'},{d '2015-10-25'},24,'The IT Consultant job position provides external management of a broad range of information technology initiatives, projects and programs including the creation and implementation of technology and business solutions','paid','closed',0,'IT Consultant');
INSERT INTO internship_oppurtunities (internship_id,business_id,supervisor_fname,supervisor_mname,supervisor_lname,supervisor_contact,pay,start_date,end_date,weekly_hours,job_description,internship_type,status,no_of_positions,internship_name) VALUES (5,4,'Aldous',null,'Walter','(617)-146-1212',0,{d '2015-07-19'},null,18,'The IT Program Manager oversees all aspects of large scale information technology programs from design and development to production','unpaid','open',10,'IT Program Manager');


INSERT INTO application (internship_id,student_id,semester,description) VALUES (1,1,2,'HTML');
INSERT INTO application (internship_id,student_id,semester,description) VALUES (2,2,2,'PYTHON');
INSERT INTO application (internship_id,student_id,semester,description) VALUES (3,3,2,'RUBY');
INSERT INTO application (internship_id,student_id,semester,description) VALUES (4,4,2,'PHP');
INSERT INTO application (internship_id,student_id,semester,description) VALUES (5,5,2,'JAVA');

INSERT INTO placement (internship_id,student_id,supervisor_eval,start_date,supervisor_phone,supervisor_email,student_eval) VALUES (1,1,'N',{d '2015-07-04'},1234568978,'tarun@uncc.edu','N');
INSERT INTO placement (internship_id,student_id,supervisor_eval,start_date,supervisor_phone,supervisor_email,student_eval) VALUES (3,3,'N',{d '2015-05-04'},1584566698,'vamsi@uncc.edu','N');
INSERT INTO placement (internship_id,student_id,supervisor_eval,start_date,supervisor_phone,supervisor_email,student_eval) VALUES (4,4,'y',{d '2015-08-01'},1587462258,'sanghi@uncc.edu','N');
INSERT INTO placement (internship_id,student_id,supervisor_eval,start_date,supervisor_phone,supervisor_email,student_eval) VALUES (5,1,'N',{d '2015-02-06'},1238426356,'ravina@uncc.edu','N');


alter table application add column app_status char(2) default '';
ALTER TABLE student_skill_mapping MODIFY COLUMN student_skill_mpg_id INT(11) auto_increment;
CREATE TABLE IF NOT EXISTS `archieve_internship_oppurtunities` (
  `internship_id` int(11) NOT NULL,
  `business_id` int(11) DEFAULT NULL,
  `supervisor_fname` varchar(50) NOT NULL,
  `supervisor_mname` varchar(50) DEFAULT NULL,
  `supervisor_lname` varchar(50) NOT NULL,
  `supervisor_contact` varchar(20) NOT NULL,
  `pay` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `weekly_hours` int(11) NOT NULL,
  `job_description` varchar(2000) NOT NULL,
  `internship_type` varchar(50) NOT NULL,
  `status` varchar(10) DEFAULT 'O',
  `no_of_positions` int(11) DEFAULT NULL,
  `internship_name` varchar(100) NOT NULL
);
DELIMITER $$
--
-- Procedures
--
CREATE  PROCEDURE `check_hours`(IN `p_internship_id` INT, IN `p_student_id` INT, OUT `p_result` BOOLEAN)
begin
declare total_hours,p_hour int;
set total_hours=0;
set p_hour=0;
select sum(i.weekly_hours) into total_hours from application a,internship_oppurtunities i where a.student_id=p_student_id and i.internship_id=a.internship_id and (app_status='Y' or app_status='y');
select weekly_hours into p_hour from internship_oppurtunities where internship_id=p_internship_id;  
if((total_hours +p_hour) >25)
then
set p_result=false;
else
   set p_result=true;
   end if;
   end$$
DELIMITER ;

DELIMITER //
CREATE TRIGGER `archieve_internship` BEFORE DELETE ON `internship_oppurtunities`
 FOR EACH ROW INSERT INTO archieve_internship_oppurtunities (internship_id,business_id,supervisor_fname,supervisor_mname,supervisor_lname,supervisor_contact,pay,start_date,end_date,weekly_hours,job_description,internship_type,status,no_of_positions,internship_name) VALUES (OLD.internship_id,OLD.business_id,OLD.supervisor_fname,OLD.supervisor_mname,OLD.supervisor_lname,OLD.supervisor_contact,OLD.pay,OLD.start_date,OLD.end_date,OLD.weekly_hours,OLD.job_description,OLD.internship_type,OLD.status,OLD.no_of_positions,OLD.internship_name)
//
DELIMITER ;