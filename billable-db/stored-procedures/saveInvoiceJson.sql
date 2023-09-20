CREATE OR REPLACE PROCEDURE SaveInvoiceJson(
    invoice_id BIGINT,
    invoice_num VARCHAR,
    version_num INT,
    invoice_name VARCHAR,
    org_id INT,
    invoice_status VARCHAR,
    invoice_json JSONB,
    customer_id BIGINT,
    is_deleted boolean,
    last_update TIMESTAMP
)
LANGUAGE plpgsql
AS $$
BEGIN

IF (SELECT 1 FROM INVOICEJSON WHERE invoiceid = invoice_id) THEN
UPDATE INVOICEJSON
SET invoicenumber = invoice_num,
    name = invoice_name,
    version = version_num,
    status = invoice_status,
    json = invoice_json,
    customerid = customer_id,
    deleted = is_deleted,
    lastupdate = last_update
WHERE invoiceid = invoice_id
  AND version = version_num;

ELSE
    INSERT INTO INVOICEJSON (
        invoicenumber,
        name,
        version,
        createddate,
        orgid,
        status,
        json,
        customerid,
        lastupdate
    )
    VALUES (
        invoice_num,
        invoice_name,
        version_num,
        now(),
        org_id,
        invoice_status,
        invoice_json,
        customer_id,
        last_update
    );

END IF;
COMMIT;
END $$;