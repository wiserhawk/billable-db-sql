CREATE TABLE TAXCATEGORIES (
    taxcategoryid serial PRIMARY KEY,
    orgid INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    hsncode VARCHAR(8),
    sgst INT NOT NULL DEFAULT 0,
    cgst INT NOT NULL DEFAULT 0,
    igst INT NOT NULL DEFAULT 0,
    gst INT NOT NULL DEFAULT 0,
    cess INT NOT NULL DEFAULT 0
)