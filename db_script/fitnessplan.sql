-- jorenezra

create table fitnessplan(
  planId int primary key,
  ageBracket text,
  gender text,
  healthBracket text,
  exercisePlan text,
  dietPlan text
);

create or replace
    function setfitnessplan(p_planId int, p_ageBracket text, p_gender text, p_healthBracket text, p_exercisePlan text, p_dietPlan text)
    return text as
$$
  declare
    v_planId int;
  begin
    select into v_planId planId from fitnessplan
    where planId = p_planId;

    if v_planId isnull then
      insert into fitnessplan(planId, ageBracket, gender, healthBracket, exercisePlan, dietPlan) values
      (p_planId, p_ageBracket, p_gender, p_healthBracket, p_exercisePlan, p_dietPlan);
    else

      update fitnessplan
        set ageBracket = p_ageBracket, gender = p_gender, healthBracket = p_healthBracket, exercisePlan = p_exercisePlan, dietPlan = p_dietPlan
        where planId = p_planId;
    end if;

      return 'OK';
  end;
$$

  language 'plpgsql';


create or replace function
    get_fitnessplan(in int, out text, out text)
    returns setof record as
$$
      select exercisePlan, dietPlan
      where planId = $1;

$$
  language 'sql';

