CREATE OR REPLACE FUNCTION GetLatestInvoiceId(
    org_id INT
)
RETURNS SETOF BIGINT
LANGUAGE plpgsql
AS $$
BEGIN
RETURN QUERY
SELECT invoiceid FROM invoicejson WHERE orgid = org_id ORDER BY invoiceid DESC LIMIT 1;

END $$;