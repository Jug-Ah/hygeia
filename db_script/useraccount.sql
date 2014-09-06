create table useraccount (     
     userId int primary key,
     username text
     password text
);

create or replace 
	function set_useraccount(p_userId int, p_username text, p_password text)
	returns text as
	
$$
   declare
      v_id int;
   begin
      select into v_id ID from useraccount
	     where ID = p_id;
      if v_id isnull then
	     insert into useraccount(userId, username, password) values
		    (p_userId, p_username, p_password);
      end if;
      return 'success!';
   end;
   
$$
   language 'plpgsql';