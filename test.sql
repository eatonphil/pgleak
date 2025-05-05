DROP EXTENSION IF EXISTS pgleak;
CREATE EXTENSION pgleak;
DROP TABLE IF EXISTS users;
CREATE TABLE users (id BIGSERIAL, age INT);
INSERT INTO users (age) SELECT random() * 100 + 1 FROM generate_series(1, 100000000);
-- SELECT pgleak.leak_sum(age, 10) FROM users;
