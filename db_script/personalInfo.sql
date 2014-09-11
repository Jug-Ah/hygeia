create table personalinfo(
   userId int primary key,
   fullName text,
   birthday text,
   age int,
   gender text,
   height int,
   weight int,
   bmi double precision,
   healthStatus text
);


create or replace
    function set_personalinfo(p_userId int, p_fullName text, p_birthday text, p_age int, p_gender text, p_height int, p_weight int, p_bmi double precision, p_healthStatus text) 
    returns text as 
$$
  declare
    v_id int;
  begin
    select into  v_id ID from personalinfo
      where ID = p_id;

    if v_id isnull then
      insert into personalinfo(userId, fullName, birthday, age, gender, height, weight, bmi, healthStatus) values
        (p_userId, p_fullName, p_birthday, p_age, p_gender, p_height, p_weight, p_bmi, p_healthStatus);
    else

      update personalinfo
        set fullName = p_fullName, birthday = p_birthday, age = p_age, gender = p_gender, height = p_height, weight = p_weight, bmi = p_bmi, healthStatus = p_healthStatus
        where userId = p_userId;
    end if;
    
      return 'OK';
  end;
$$
  language 'plpgsql';
--how to use


create or replace function
     get_personalinfo(in int, out text, out text, out int, out text, out int, out int, out double precision, out text)
     returns setof record as
$$
        select fullName, birthday, age, gender, height, weight, bmi, healthStatus from personalinfo
        where userID = $1;
        
$$
  language 'sql';
--how to use:

