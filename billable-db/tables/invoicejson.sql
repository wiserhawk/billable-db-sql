CREATE TABLE INVOICEJSON (
    invoiceid serial PRIMARY KEY,
    invoicenumber VARCHAR,
    name VARCHAR,
    version INT NOT NULL,
    createddate TIMESTAMP NOT NULL,
    orgid INT NOT NULL,
    json JSONB,
    customerid INT,
    lastupdate TIMESTAMP NOT NULL,
    deleted boolean NOT NULL DEFAULT FALSE,
    status VARCHAR(50) NOT NULL
);