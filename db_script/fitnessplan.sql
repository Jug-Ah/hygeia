create table fitnessplan(
  gender text,
  ageBracket text,
  healthBracket text,
  exercisePlan text,
  dietPlan text,
  constraint fitnessPlanPk primary key(gender, ageBracket, healthBracket)
);

-- shortcuts used on plans
-- 1=male, 2=female
-- a=teen, b=young_adult, c=adult
-- x=underweight, y=normal, z=overweight

insert into fitnessplan(gender, ageBracket, healthBracket, exercisePlan, dietPlan)
   values ('male', 'teen', 'underweight', 'exercise_plan_1ax', 'diet_plan_1ax'),
   values ('male', 'teen', 'normal', 'exercise_plan_1ay', 'diet_plan_1ay'),
   values ('male', 'teen', 'overweight', 'exercise_plan_1az', 'diet_plan_1az'),
   values ('female', 'teen', 'underweight', 'exercise_plan_2ax', 'diet_plan_2ax'),
   values ('female', 'teen', 'normal', 'exercise_plan_2ay', 'diet_plan_2ay'),
   values ('female', 'teen', 'overweight', 'exercise_plan_2az', 'diet_plan_2az'),
   values ('male', 'young_adult', 'underweight', 'exercise_plan_1bx', 'diet_plan_1bx'),
   values ('male', 'young_adult', 'normal', 'exercise_plan_1by', 'diet_plan_1bz'),
   values ('male', 'young_adult', 'overweight', 'exercise_plan_1bz', 'diet_plan_1bz'),
   values ('female', 'young_adult', 'underweight', 'exercise_plan_2bx', 'diet_plan_2bx'),
   values ('female', 'young_adult', 'normal', 'exercise_plan_2by', 'diet_plan_2by'),
   values ('female', 'young_adult', 'overweight', 'exercise_plan_2bz', 'diet_plan_2bz'),
   values ('male', 'adult', 'underweight', 'exercise_plan_1cx', 'diet_plan_1cx'),
   values ('male', 'adult', 'normal', 'exercise_plan_1cy', 'diet_plan_1cy'),
   values ('male', 'adult', 'overweight', 'exercise_plan_1cz', 'diet_plan_1cz'),
   values ('female', 'adult', 'underweight', 'exercise_plan_2cx', 'diet_plan_2cx'),
   values ('female', 'adult', 'normal', 'exercise_plan_2cy', 'diet_plan_2cy'),
   values ('female', 'adult', 'overweight', 'exercise_plan_2cz', 'diet_plan_2cz');

  
-- function for getting plans from the table using primary key
create or replace function get_fitnessplan(in text, in text, in text, out text, out text)
    returns setof record as
$$
       select exercisePlan, dietPlan from fitnessplan
       where gender = $1 and ageBracket = $2 and healthBracket = $3;
$$
   language 'sql';

-- for showing a list/s of plan using the function get_fitness_plan
-- select * from get_fitness_plan('male','young_adult','overweight')
-- returns
-- exercise_plan_1az diet_plan_1az