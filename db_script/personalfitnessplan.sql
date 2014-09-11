create table personalfitnessplan(
    userId int references useraccount(userid),
	pfpid serial primary key,
    personalDietPlan text,
    personalExercisePlan text
);

create or replace 
    function set_personalfitnessplan(p_userId int, p_personalDietPlan text, p_personalExercisePlan text)
    returns text as
$$
  begin
          insert into personalfitnessplan(userId, personalDietPlan, personalExercisePlan) values
              (p_userId, p_personalDietPlan, p_personalExercisePlan);
      return 'OK';
  end;
$$
  language 'plpgsql';


create or replace function
    get_personalfitnessplan(in int, out text, out text)
    returns setof record as
$$
    select personalDietPlan, personalExercisePlan from personalfitnessplan
    where userId = $1;
$$
  language 'sql';
