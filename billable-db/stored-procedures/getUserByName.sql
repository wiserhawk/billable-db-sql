CREATE OR REPLACE FUNCTION GetUserByName(
    user_name VARCHAR
)
RETURNS SETOF USERS
LANGUAGE plpgsql
AS $$
BEGIN

RETURN QUERY
SELECT userid, username, name, surname, password, email, createdon, lastlogin, sso, active, orgid
FROM USERS
WHERE username = user_name;

END $$;