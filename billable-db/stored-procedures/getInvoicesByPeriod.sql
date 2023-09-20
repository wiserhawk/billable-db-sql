CREATE OR REPLACE FUNCTION GetInvoicesByPeriod(
    org_id INT,
    from_date TIMESTAMP,
    to_date TIMESTAMP
)
RETURNS SETOF INVOICEJSON
LANGUAGE plpgsql
AS $$
BEGIN
RETURN QUERY
SELECT
    invoiceid,
    invoicenumber,
    name,
    version,
    createddate,
    orgid,
    json,
    customerid,
    lastupdate,
    deleted,
    status
FROM invoicejson
WHERE orgid = org_id
AND createddate >= from_date and createddate <= to_date;
END $$;