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