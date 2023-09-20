CREATE OR REPLACE PROCEDURE SaveUserRoles(
    user_id INT,
    role_names TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN

IF (SELECT 1 FROM USERROLES WHERE userid = user_id) THEN
    UPDATE USERROLES
    SET roles = role_names
    WHERE userid = user_id;

ELSE
    INSERT INTO USERROLES (userid, roles)
    VALUES (user_id, role_names);

END IF;
COMMIT;
END $$;