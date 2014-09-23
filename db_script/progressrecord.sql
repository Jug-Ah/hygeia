create table progressrecord  (
	progrecID serial primary key,
	userID int references useraccount(userid),
	height decimal(5,2),
	weight decimal(5,2),
	bmi decimal(4,2),
	healthStatus text,
	age int,
	changePercentage decimal(4,2)	
);


create or replace
	function set_progressrecord(p_userID int, p_height decimal(5,2), p_weight decimal(5,2), p_bmi decimal(4,2), p_healthStatus text, p_age int, p_changePercentage decimal(4,2))
	returns text as

$$
  begin
	 insert into progressrecord(userID, height, weight, bmi, healthStatus, age, changePercentage) values
	 (p_userID, p_height, p_weight, p_bmi, p_healthStatus, p_age, p_changePercentage);
     return 'OK';
  end;	
$$
  language 'plpgsql';

  
create or replace function
	get_progressrecord(in int, out decimal(5,2), out decimal(5,2), out decimal(4,2), out text, out int, out decimal(4,2))
	returns setof record as

$$
    select height, weight, bmi, healthStatus, age, changePercentage from progressrecord
    where userID = $1;
$$
language 'sql';


