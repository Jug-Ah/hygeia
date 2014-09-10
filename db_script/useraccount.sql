create table useraccount (     
     userId serial primary key,
     username text,
     userpass text
);

create or replace 
	function set_useraccount(p_username text, p_userpass text)
	returns text as
	
$$
   begin
	     insert into useraccount(username, userpass) values
		    (p_username, p_userpass);
      return 'success!';
   end;
   
$$
   language 'plpgsql';