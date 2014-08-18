-- jorenezra

create table fitness_plan(
  gender text,
  age_bracket text,
  health_bracket text,
  exercise_plan text,
  diet_plan text,
  constraint fitness_plan_pk primary key(gender, age_bracket, health_bracket)
);

-- shortcuts used on plans
-- 1=male, 2=female
-- a=teen, b=young_adult, c=adult
-- x=underweight, y=normal, z=overweight

insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('male', 'teen', 'underweight', 'exercise_plan_1ax', 'diet_plan_1ax');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('male', 'teen', 'normal', 'exercise_plan_1ay', 'diet_plan_1ay');
insert into fitness_plan(gender, Mage_bracket, health_bracket, exercise_plan, diet_plan)
   values ('male', 'teen', 'overweight', 'exercise_plan_1az', 'diet_plan_1az');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('female', 'teen', 'underweight', 'exercise_plan_2ax', 'diet_plan_2ax');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('female', 'teen', 'normal', 'exercise_plan_2ay', 'diet_plan_2ay');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('female', 'teen', 'overweight', 'exercise_plan_2az', 'diet_plan_2az');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('male', 'young_adult', 'underweight', 'exercise_plan_1bx', 'diet_plan_1bx');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('male', 'young_adult', 'normal', 'exercise_plan_1by', 'diet_plan_1bz');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('male', 'young_adult', 'overweight', 'exercise_plan_1bz', 'diet_plan_1bz');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('female', 'young_adult', 'underweight', 'exercise_plan_2bx', 'diet_plan_2bx');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('female', 'young_adult', 'normal', 'exercise_plan_2by', 'diet_plan_2by');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('female', 'young_adult', 'overweight', 'exercise_plan_2bz', 'diet_plan_2bz');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('male', 'adult', 'underweight', 'exercise_plan_1cx', 'diet_plan_1cx');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('male', 'adult', 'normal', 'exercise_plan_1cy', 'diet_plan_1cy');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('male', 'adult', 'overweight', 'exercise_plan_1cz', 'diet_plan_1cz');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('female', 'adult', 'underweight', 'exercise_plan_2cx', 'diet_plan_2cx');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('female', 'adult', 'normal', 'exercise_plan_2cy', 'diet_plan_2cy');
insert into fitness_plan(gender, age_bracket, health_bracket, exercise_plan, diet_plan)
   values ('female', 'adult', 'overweight', 'exercise_plan_2cz', 'diet_plan_2cz');

  
-- function for getting plans from the table using primary key
create or replace function get_fitness_plan(in text, in text, in text, out text, out text)
    returns setof record as
$$
       select exercise_plan, diet_plan from fitness_plan
       where gender = $1 and age_bracket = $2 and health_bracket = $3;
$$
   language 'sql';

-- for showing a list/s of plan using the function get_fitness_plan
select * from get_fitness_plan('male','young_adult','overweight')
-- returns
-- exercise_plan_1az diet_plan_1az