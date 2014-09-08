create table progressrecord(
	userID serial primary key,  --(userId be 'int' soon and will be procured from useraccount.sql table)
	height int,
	weight int,
	bmi double precision,
	healthStatus text,
	age int,
	changePercentage double precision	
);


create or replace
	function set_progressrecord(p_height int, p_weight int, p_bmi double precision, p_healthStatus text, p_age int, p_changePercentage double precision) --(add first parameter 'p_userID int')
	returns text as

$$
  --declare
     --v_uid int;
  begin
     --select into v_uid user_id from progressrecord
        --where userID = p_uid;

     --if v_uid isnull then
        insert into progressrecord values
        (p_height, p_weight, p_bmi, p_healthStatus, p_age, p_changePercentage);  
		--(add first parameter 'p_userID')
     --else
        --update progressrecord
           --set height = p_height, weight = p_weight, bmi = p_bmi, healthStatus = p_healthStatus, age = p_age, changePercentage = p_changePercentage
           --where userID = p_userID;
     --end if;

     return 'OK';
  end;	
$$
  language 'plpgsql';
  
--insert into progressrecord values (1, 180, 67, 18.0, 'normal', 18, 0);
--select setprogressrecord(2, 167, 80, 20, 'overweight', 18, 0);  
  
create or replace function
	get_progressrecord(in int, out int, out int, out double precision, out text, out int, out double precision)
	returns setof record as

$$

    select height, weight, bmi, healthStatus, age, changePercentage from progressrecord
    where userID = $1;
    
$$
language 'sql';



--select * from progressrecord where user_id = 1;
--getprogressrecord(2);