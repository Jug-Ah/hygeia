create table useraccount (     
	userid serial NOT NULL,
	username text,
	password text,
	email text,
	CONSTRAINT useraccount_pkey PRIMARY KEY (userid )
);

create or replace 
	function set_useraccount(p_username text, p_userpass text, p_useremail text)
	returns text as
	
$$
   begin
	     insert into useraccount(username, password, email) values
		    (p_username, p_userpass, p_useremail);
      return 'success!';
   end;
   
$$
   language 'plpgsql';