CREATE OR REPLACE FUNCTION GetUser(
    user_id INT
)
RETURNS SETOF USERS
LANGUAGE plpgsql
AS $$
BEGIN

IF (user_id IS NULL ) THEN
    RETURN QUERY
    SELECT userid, username, name, surname, password, email, createdon, lastlogin, sso, active, orgid
    FROM USERS;

ELSE
	RETURN QUERY
    SELECT userid, username, name, surname, password, email, createdon, lastlogin, sso, active, orgid
    FROM USERS
    WHERE userid = user_id;

END IF;
END $$;