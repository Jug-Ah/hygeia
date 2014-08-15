create table personalfitnessplan (
    userID int primary key,
    personaldietplan text,
    personalexerciseplan text
);

create or replace 
    function setpersonalfitnessplan(p_id int, p_personaldietplan text, p_personalexerciseplan text)
    returns text as
$$
  declare
    v_id int;
  begin
      select into v_id userID from personalfitnessplan
        where userID = p_id;

      if v_id isnull then
          insert into personalfitnessplan(userID, personaldietplan, personalexerciseplan) values
              (p_id, p_personaldietplan, p_personalexerciseplan);
      else
          update personalfitnessplan
            set personaldietplan = p_personaldietplan, personalexerciseplan = p_personalexerciseplan
            where userID = p_id;
      end if;

      return 'OK';
  end;
$$
  language 'plpgsql';
--how to use:


create or replace function
    get_personalfitnessplan_perid(in text, out text, in text, out text)
    returns setof record as
$$
     select userID, personaldietplan, personalexerciseplan from personalfitnessplan
     where userID = $1;
$$
  language 'sql';
--how to use:
