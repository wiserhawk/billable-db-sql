CREATE OR REPLACE PROCEDURE SaveFile(
    file_name VARCHAR,
    file_type VARCHAR,
    file_bytes BYTEA,
    org_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN

IF (SELECT 1 FROM FILES WHERE ordid = org_id) THEN
    UPDATE FILES
    SET name = file_name,
        type = file_type,
        bytes = file_bytes
    WHERE orgid = org_id;

ELSE
    INSERT INTO FILES (name, type, bytes, orgid)
    VALUES (file_name, file_type, file_bytes, org_id);

END IF;
COMMIT;
END $$;