create table personalfitnessplan (
    userId int primary key,
    personalDietPlan text,
    personalExercisePlan text
);

create or replace 
    function set_personalfitnessplan(p_userId int, p_personalDietPlan text, p_personalExercisePlan text)
    returns text as
$$
  declare
    v_id int;
  begin
        select into v_id userId from personalfitnessplan
        where userId = p_userId;

      if v_id isnull then
          insert into personalfitnessplan(userId, personalDietPlan, personalExercisePlan) values
              (p_userId, p_personalDietPlan, p_personalExercisePlan);
      else
          update personalfitnessplan
            set personalDietPlan = p_personalDietPlan, personalExercisePlan = p_personalExercisePlan
            where userId = p_userId;
      end if;

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
