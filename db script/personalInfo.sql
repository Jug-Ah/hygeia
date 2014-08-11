-- loraine faith paragoso



create table personal_info(
   ID int primary key,
   name1 text,
   birthday text,
   gender text
);


create or replace
    function setpersonal_info(p_id int, p_name1 text, p_birthday text, p_gender text) 
    returns text as 
$$
  declare
    v_id int;
  begin
    select into  v_id ID from personal_info
      where ID = p_id;

    if v_id isnull then
      insert into personal_info(ID, name1, birthday, gender) values
        (p_id, p_name1, p_birthday, p_gender);
    else

      update personal_info
        set name1 = p_name1, birthday  = p_birthday, gender = p_gender
        where ID = p_id;
    end if;
    
      return 'OK';
  end;
$$
  language 'plpgsql';
--how to use


create or replace function
     get_personal_info_perid(in int, out int, out text, out text, out text)
     returns setof record as
$$
        select ID, name1, birthday, gender from personal_info
        where ID = $1;
        
$$
  language 'sql';
--how to use:

