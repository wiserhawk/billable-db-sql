CREATE OR REPLACE PROCEDURE SaveUser(
    user_name VARCHAR,
    name VARCHAR,
    surname VARCHAR,
    pwd TEXT,
    emailId VARCHAR,
    isActive boolean,
    singleSignOn boolean,
    org_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN

IF (SELECT 1 FROM USERS WHERE username = user_name) THEN
    UPDATE USERS
    SET name = name,
        surname = surname,
        password = pwd,
        email = emailId,
        sso = singleSignOn,
        active = isActive,
        orgid = org_id
    WHERE username = user_name;

ELSE
    INSERT INTO USERS (name, surname, username, email, password, createdon, lastlogin, active, sso, orgid)
    VALUES (name, surname, user_name, emailId, pwd, now(), now(), isActive, singleSignOn, org_id);

END IF;
COMMIT;
END $$;