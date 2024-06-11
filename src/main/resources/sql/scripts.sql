CREATE DATABASE SPRINGSECURITY;

CREATE TABLE users ( 
    username VARCHAR(50) NOT NULL PRIMARY KEY, 
    password VARCHAR(500) NOT NULL, 
    enabled BOOLEAN NOT NULL 
); 
 
CREATE TABLE authorities ( 
    username VARCHAR(50) NOT NULL, 
    authority VARCHAR(50) NOT NULL, 
    CONSTRAINT fk_authorities_users FOREIGN KEY (username) REFERENCES users (username)     
); 
 
CREATE UNIQUE INDEX ix_auth_username 
    ON authorities (username, authority);
 
 
INSERT INTO users (username, password, enabled)
VALUES ('happy', '12345', true)
ON CONFLICT (username) DO NOTHING;
 
INSERT INTO authorities (username, authority)
VALUES ('happy', 'write')
ON CONFLICT (username, authority) DO NOTHING;