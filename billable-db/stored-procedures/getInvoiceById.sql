CREATE OR REPLACE FUNCTION GetInvoiceById(
    invoice_id BIGINT,
    org_id INT
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
WHERE invoiceId = invoice_id AND orgid = org_id
ORDER BY version DESC LIMIT 1;

END $$;