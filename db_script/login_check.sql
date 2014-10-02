CREATE OR REPLACE FUNCTION login_check(text, text)
  RETURNS boolean AS
  
$func$
declare 
ret boolean;
curr text;
BEGIN
   SELECT password FROM useraccount WHERE username = $1 INTO curr;
   SELECT password = crypt($2, curr) FROM useraccount where username = $1 INTO ret;   
   return ret;
END
$func$ LANGUAGE plpgsql;