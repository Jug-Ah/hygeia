create table personalinfo(
   userId int references useraccount(userid),
   infoID serial primary key,
   fullName text,
   birthday text,
   gender text,
   height int,
   weight int,
   bmi numeric(4,2),
   healthStatus text
);


create or replace
    function set_personalinfo( userId int,  fullName text,  birthday text,  gender text,  height int,  weight int,  bmi numeric(4,2),  healthStatus text) 
    returns text as 
$$
     begin
      insert into personalinfo(userId, fullName, birthday,gender, height, weight, bmi, healthStatus) values
        ( userId,  fullName,  birthday, gender,  height,  weight,  bmi,  healthStatus);
    end;
  language  'plpgsql';
--how to use


create or replace function
     get_personalinfo(in int, out text, out text, out text, out int, out int, out numeric(4,2), out text)
     returns setof record as
$$
     select fullName, birthday, gender, height, weight, bmi, healthStatus from personalinfo
     where userId = $1;
        
$$
  language  'sql';
--how to use:

