CREATE OR REPLACE FUNCTION GetUsersByOrg(
    org_id INT
)
RETURNS SETOF USERS
LANGUAGE plpgsql
AS $$
BEGIN

RETURN QUERY
SELECT userid, username, name, surname, password, email, createdon, lastlogin, sso, active, orgid
FROM USERS
WHERE orgid = org_id;

END $$;