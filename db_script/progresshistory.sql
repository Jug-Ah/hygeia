CREATE TABLE progresshistory(
	user_id int primary key,
	height int,
	weight int,
	bmi double precision,
	status text,
	age int,
	prog_perc double precision	
);


create or replace
	function setproghist(p_uid int, p_h int, p_w int, p_bmi double precision, p_s text, p_age int, p_progperc double precision)
	returns text as

$$
  declare
     v_uid int;
  begin
     select into v_uid user_id from progresshistory
        where user_id = p_uid;

     if v_uid isnull then
        insert into progresshistory values
        (p_uid, p_h, p_w, p_bmi, p_s, p_age, p_progperc);  

     else
        update progresshistory
           set height = p_h, weight = p_w, bmi = p_bmi, status = p_s, age = p_age, prog_perc = p_progperc
           where user_id = p_uid;
     end if;

     return 'OK';
  end;	
$$
  language 'plpgsql';
  
--insert into progresshistory values (1, 180, 67, 18.0, 'normal', 18, 0);
--select setproghist(2, 167, 80, 20, 'overweight', 18, 0);  
  
create or replace function
	getproghist(in int, out int, out int, out int, out double precision, out text, out int, out double precision)
	returns setof record as

$$

    select user_id, height, weight, bmi, status, age, prog_perc from progresshistory
    where user_id = $1;
    
$$
language 'sql';

--select * from progresshistory where user_id = 1;
--getproghist(2);