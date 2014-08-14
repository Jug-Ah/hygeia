create table useraccount (     
     ID int primary key,
     Username text
     Password text
);

create or replace 
	function setusername(p_id int, p_user text, p_pass text)
	returns text as
	
$$
   declare
      v_id int;
   begin
      select into v_id ID from useraccount
	     where ID = p_id;
      if v_id isnull then
	     insert into useraccount(ID, Username, Password) values
		    (p_id, p_user, p_pass);
      end if;
      return 'success!';
   end;
   
$$
   language 'plpgsql';