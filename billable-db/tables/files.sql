CREATE TABLE FILES (
    fileid serial PRIMARY KEY,
    name VARCHAR NOT NULL,
    type VARCHAR NOT NULL,
    bytes BYTEA NOT NULL,
    orgid INT NOT NULL
);
