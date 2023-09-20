CREATE OR REPLACE PROCEDURE SaveTaxCategory(
    tax_category_id INT,
    org_id INT,
    category_name VARCHAR,
    hsn_code VARCHAR,
    sgst_rate INT,
    cgst_rate INT,
    igst_rate INT,
    gst_rate INT,
    cess_rate INT
)
LANGUAGE plpgsql
AS $$
BEGIN

IF (SELECT 1 FROM TAXCATEGORIES WHERE taxcategoryid = tax_category_id) THEN
UPDATE TAXCATEGORIES
SET orgid  = org_id,
    name  = category_name,
    hsncode = hsn_code,
    sgst = sgst_rate,
    cgst = cgst_rate,
    igst = igst_rate,
    gst = gst_rate,
    cess = cess_rate
WHERE taxcategoryid = tax_category_id;

ELSE
    INSERT INTO TAXCATEGORIES (
        orgid,
        name,
        hsncode,
        sgst,
        cgst,
        igst,
        gst,
        cess
    )
    VALUES (
        org_id,
        category_name,
        hsn_code,
        sgst_rate,
        cgst_rate,
        igst_rate,
        gst_rate,
        cess_rate
    );

END IF;
COMMIT;
END $$;