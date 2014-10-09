create extension pgcrypto schema public version '1.0';

create table useraccount (     
  userid serial NOT NULL primary key,
  username text,
  password text,
  email text
);

create or replace 
  function set_useraccount(p_username text, p_userpass text, p_useremail text)
  returns int as
  
$$
   declare
   id int;
   begin
      insert into useraccount(username, password, email) values
        (p_username, crypt(p_userpass, gen_salt('bf')), p_useremail) returning userid into id;
    return id;
   end;
$$
   language 'plpgsql';
   
 create table personalinfo(
   userId int references useraccount(userid),
   infoID serial primary key,
   fullname text,
   birthday text,
   gender text
);


create or replace
    function set_personalinfo(userId int,  fullname text,  birthday text,  gender text) 
    returns text as 
$$
    begin
      insert into personalinfo(userId, fullname, birthday,gender) values
        ( userId,  fullname,  birthday, gender);
    return 'OK';
    end;
$$
  language  'plpgsql';


create or replace function
     get_personalinfo(in int, out text, out text, out text)
     returns setof record as
$$
     select fullname, birthday, gender from personalinfo
     where userId = $1;   
$$
  language  'sql';


create table progressrecord  (
  progrecID serial primary key,
  userID int references useraccount(userid),
  height decimal(5,2),
  weight decimal(5,2),
  bmi decimal(4,2),
  healthStatus text,
  age int,
  ageBracket text,
  changePercentage decimal(4,2) 
);


create or replace
  function set_progressrecord(p_userID int, p_height decimal(5,2), p_weight decimal(5,2), p_bmi decimal(4,2), p_healthStatus text, p_age int, p_ageBracket text, p_changePercentage decimal(4,2))
  returns text as

$$
  begin
   insert into progressrecord(userID, height, weight, bmi, healthStatus, age, ageBracket, changePercentage) values
   (p_userID, p_height, p_weight, p_bmi, p_healthStatus, p_age, p_ageBracket, p_changePercentage);
     return 'OK';
  end;  
$$
  language 'plpgsql';

  
create or replace function
  get_progressrecord(in int, out decimal(5,2), out decimal(5,2), out decimal(4,2), out text, out int, out text, out decimal(4,2))
  returns setof record as

$$
    select height, weight, bmi, healthStatus, age, ageBracket, changePercentage from progressrecord
    where userID = $1;
$$
language 'sql';

create table fitnessplan(
  gender text,
  ageBracket text,
  healthStatus text,
  exercisePlan text,
  dietPlan text,
  constraint fitnessPlanPk primary key(gender, ageBracket, healthStatus)
);

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

create or replace function login_check(text, text)
  returns boolean as
  
$$
  declare 
  ret boolean;
  curr text;
  begin
     select password from useraccount where username = $1 INTO curr;
     select password = crypt($2, curr) from useraccount where username = $1 INTO ret;   
     return ret;
  end
$$ 
  language 'plpgsql';
