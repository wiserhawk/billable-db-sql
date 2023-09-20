CREATE TABLE USERS (
    userid serial PRIMARY KEY,
    username VARCHAR UNIQUE NOT NULL,
    name VARCHAR NOT NULL,
    surname VARCHAR,
    password TEXT NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    createdon TIMESTAMP NOT NULL,
    lastlogin TIMESTAMP,
    active boolean NOT NULL DEFAULT TRUE,
    sso boolean NOT NULL DEFAULT false,
    orgid INT NOT NULL DEFAULT -1
);
