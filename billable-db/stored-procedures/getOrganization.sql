CREATE OR REPLACE FUNCTION GetOrganization(
    org_id INT
)
RETURNS SETOF ORGANIZATIONS
LANGUAGE plpgsql
AS $$
BEGIN

IF (org_id IS NULL ) THEN
    RETURN QUERY
    SELECT orgid, orgname, gstin, logo, address, createdon
    FROM ORGANIZATIONS;

ELSE
	RETURN QUERY
    SELECT orgid, orgname, gstin, logo, address, createdon
    FROM ORGANIZATIONS
    WHERE orgid = org_id;

END IF;
END $$;