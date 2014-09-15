create table fitnessplan(
  gender text,
  ageBracket text,
  healthStatus text,
  exercisePlan text,
  dietPlan text,
  constraint fitnessPlanPk primary key(gender, ageBracket, healthStatus)
);

-- shortcuts used on plans
-- 1=male, 2=female
-- a=teen, b=young_adult, c=adult
-- x=underweight, y=normal, z=overweight

insert into fitnessplan(gender, ageBracket, healthStatus, exercisePlan, dietPlan)
   values ('male', 'teen', 'underweight', 'exercise plan 1ax', 'diet plan 1ax'),
   ('male', 'teen', 'normal', 'exercise plan 1ay', 'diet plan 1ay'),
   ('male', 'teen', 'overweight', 'exercise plan 1az', 'diet plan 1az'),
   ('female', 'teen', 'underweight', 'exercise plan 2ax', 'diet plan 2ax'),
   ('female', 'teen', 'normal', 'exercise plan 2ay', 'diet plan 2ay'),
   ('female', 'teen', 'overweight', 'exercise plan 2az', 'diet plan 2az'),
   ('male', 'young_adult', 'underweight', 'exercise plan 1bx', 'diet plan 1bx'),
   ('male', 'young_adult', 'normal', 'exercise plan 1by', 'diet plan 1bz'),
   ('male', 'young_adult', 'overweight', 'exercise plan 1bz', 'diet plan 1bz'),
   ('female', 'young_adult', 'underweight', 'exercise plan 2bx', 'diet plan 2bx'),
   ('female', 'young_adult', 'normal', 'exercise plan 2by', 'diet plan 2by'),
   ('female', 'young_adult', 'overweight', 'exercise plan 2bz', 'diet plan 2bz'),
   ('male', 'adult', 'underweight', 'exercise plan 1cx', 'diet plan 1cx'),
   ('male', 'adult', 'normal', 'exercise plan 1cy', 'diet plan 1cy'),
   ('male', 'adult', 'overweight', 'exercise plan 1cz', 'diet plan 1cz'),
   ('female', 'adult', 'underweight', 'exercise_plan_2cx', 'diet plan 2cx'),
   ('female', 'adult', 'normal', 'exercise plan 2cy', 'diet plan 2cy'),
   ('female', 'adult', 'overweight', 'exercise plan 2cz', 'diet plan 2cz');

  
create or replace function get_fitnessplan_bykey(in text, in text, in text, out text, out text)
    returns setof record as
$$
       select exercisePlan, dietPlan from fitnessplan
       where gender = $1 and ageBracket = $2 and healthStatus = $3;
$$
   language 'sql';
   
create or replace function get_exerciseplan_bykey(in text, in text, in text, out text)
    returns setof text as
$$
       select exercisePlan from fitnessplan
       where gender = $1 and ageBracket = $2 and healthStatus = $3;
$$
   language 'sql';

create or replace function get_dietplan_bykey(in text, in text, in text, out text)
    returns setof text as
$$
       select dietPlan from fitnessplan
       where gender = $1 and ageBracket = $2 and healthStatus = $3;
$$
   language 'sql';