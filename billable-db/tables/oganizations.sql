CREATE TABLE ORGANIZATIONS (
     orgid serial PRIMARY KEY,
     orgname VARCHAR(100) NOT NULL,
     gstin VARCHAR(100) NOT NULL,
     logo VARCHAR(255) NOT NULL,
     address JSONB NOT NULL,
     createdon TIMESTAMP NOT NULL
);
