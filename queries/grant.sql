CREATE USER ly_dev WITH PASSWORD 'ly_dev';

GRANT ALL PRIVILEGES ON SCHEMA lyschema TO ly_dev;


SELECT version();