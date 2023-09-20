CREATE OR REPLACE FUNCTION GetUserRoles(
    user_id INT
)
RETURNS SETOF USERROLES
LANGUAGE plpgsql
AS $$
BEGIN

RETURN QUERY
SELECT userid, roles
FROM USERROLES
WHERE userid = user_id;

END $$;