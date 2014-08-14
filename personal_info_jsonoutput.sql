-- lorainefaithparagoso	


create table personal_info(

  ID numeric,
  name1 text,
  birthday text,
  gender text
  constraint personal_info primary key (ID, name1, birthday, gender)
);

insert into personal_info (ID, name1, birthday, gender)
  values('0001', 'Joren Ezra Apal', 'MAy 17,1993', 'Male');
insert into personal_info (ID, name1, birthday, gender)
  values('0002', 'Angelo Sembrano', 'November 28,1995','MAle'); 
insert into personal_info (ID, name1, birthday, gender)
  values('0003', 'Silver Gems Serate', 'November 26,1993', 'Male');
insert into personal_info (ID, name1, birthday, gender)
  values('0004', 'Loraine Faith Paragoso', 'March 1,1996', 'Female');
insert into personal_info (ID, name1, birthday, gender)
  values('0005', 'Arlene Yosoya', 'September 20,1994', 'Female');


create or replace function get_info( in text, out numeric, out text, out text, out text)     returns setof record as

$$

    select ID, name1, birthday, gender from personal_info where
	  ID = $1;
	  
$$
  language 'sql';
  
  
--How to use :
-- select * fron get_info('ID'); 
-- returns 
--
--0001  0001  Joren Ezra Apal         MAy 17,1993        Male
--0002  0002  Angelo Sembrano         November 28,1995   MAle
--0003  0003  Silver Gems Serate      November 26,1993   Male
--0004  0004  Loraine Faith Paragoso  March 1,1996       Female
--0005  0005  Arlene Yosoya           September 20,1994  Female