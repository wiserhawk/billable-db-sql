CREATE OR REPLACE FUNCTION GetFileByOrgId(
    org_id INT
)
RETURNS SETOF FILES
LANGUAGE plpgsql
AS $$
BEGIN

IF (org_id IS NULL ) THEN
    RETURN QUERY
    SELECT fileid, name, type, bytes, orgid
    FROM FILES;

ELSE
	RETURN QUERY
    SELECT fileid, name, type, bytes, orgid
    FROM FILES
    WHERE orgid = org_id;

END IF;
END $$;