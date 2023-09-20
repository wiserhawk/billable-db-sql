CREATE OR REPLACE FUNCTION GetTaxCategory(
    org_id INT,
    tax_category_id INT
)
RETURNS SETOF TAXCATEGORIES
LANGUAGE plpgsql
AS $$
BEGIN

IF (tax_category_id IS NULL ) THEN
    RETURN QUERY
    SELECT taxcategoryid, orgid, name, hsncode, sgst, cgst, igst, gst, cess
    FROM TAXCATEGORIES
    WHERE orgid = org_id;

ELSE
	RETURN QUERY
    SELECT taxcategoryid, orgid, name, hsncode, sgst, cgst, igst, gst, cess
    FROM TAXCATEGORIES
    WHERE orgid = org_id AND taxcategoryid = tax_category_id;

END IF;
END $$;