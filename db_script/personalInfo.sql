 create table personalinfo(
   userId int references useraccount(userid),
   infoID serial primary key,
   fullname text,
   birthday text,
   gender text
);


create or replace
    function set_personalinfo(userId int,  fullname text,  birthday text,  gender text) 
    returns text as 
$$
    begin
      insert into personalinfo(userId, fullname, birthday,gender) values
        ( userId,  fullname,  birthday, gender);
	  return 'OK'
    end;

$$
  language  'plpgsql';



create or replace function
     get_personalinfo(in int, out text, out text, out text)
     returns setof record as
$$
     select fullname, birthday, gender from personalinfo
     where userId = $1;
        
$$
  language  'sql';

