CREATE OR REPLACE PROCEDURE SaveOrganization(
    org_id BIGINT,
    org_name VARCHAR,
    gstin_no VARCHAR,
    org_logo VARCHAR,
    address_json JSONB
)
LANGUAGE plpgsql
AS $$
BEGIN

IF (SELECT 1 FROM ORGANIZATIONS WHERE orgid = org_id) THEN
UPDATE ORGANIZATIONS
SET orgname     = org_name,
    gstin       = gstin_no,
    logo        = org_logo,
    address     = address_json
WHERE orgid = org_id;

ELSE
    INSERT INTO ORGANIZATIONS (
        orgname,
        gstin,
        logo,
        address,
        createdon
    )
    VALUES (
        org_name,
        gstin_no,
        org_logo,
        address_json,
        now()
    );

END IF;
COMMIT;
END $$;