CREATE TABLE progressrecord(
	userId int primary key,
	height int,
	weight int,
	bmi double precision,
	healthStatus text,
	age int,
	changePercentage double precision	
);


create or replace
	function set_progressrecord(p_userId int, p_height int, p_weight int, p_bmi double precision, p_healthStatus text, p_age int, p_changePercentage double precision)
	returns text as

$$
  declare
     v_uid int;
  begin
     select into v_uid user_id from progressrecord
        where userId = p_uid;

     if v_uid isnull then
        insert into progressrecord values
        (p_userId, p_height, p_weight, p_bmi, p_healthStatus, p_age, p_changePercentage);  

     else
        update progressrecord
           set height = p_height, weight = p_weight, bmi = p_bmi, healthStatus = p_healthStatus, age = p_age, changePercentage = p_changePercentage
           where userId = p_userId;
     end if;

     return 'OK';
  end;	
$$
  language 'plpgsql';
  
--insert into progresshistory values (1, 180, 67, 18.0, 'normal', 18, 0);
--select setproghist(2, 167, 80, 20, 'overweight', 18, 0);  
  
create or replace function
	get_progressrecord(in int, out int, out int, out int, out double precision, out text, out int, out double precision)
	returns setof record as

$$

    select userId, height, weight, bmi, healthStatus, age, changePercentage from progressrecord
    where userId = $1;
    
$$
language 'sql';

--select * from progresshistory where user_id = 1;
--getproghist(2);