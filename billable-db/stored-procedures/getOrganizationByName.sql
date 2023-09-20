CREATE OR REPLACE FUNCTION GetOrganizationByName(
    org_name VARCHAR
)
RETURNS SETOF ORGANIZATIONS
LANGUAGE plpgsql
AS $$
BEGIN

RETURN QUERY
SELECT orgid, orgname, gstin, logo, address, createdon
FROM ORGANIZATIONS
WHERE orgname = org_name
ORDER BY orgid DESC
LIMIT 1;

END $$;