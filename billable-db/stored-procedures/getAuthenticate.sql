CREATE OR REPLACE FUNCTION GetAuthenticate(
    user_name VARCHAR,
    email_id VARCHAR
)
RETURNS SETOF USERS
LANGUAGE plpgsql
AS $$
BEGIN

RETURN QUERY

SELECT userid, username, name, surname, password, email, createdon, lastlogin, sso, active, orgid
FROM USERS
WHERE (username = user_name OR email = email_id);

END $$;