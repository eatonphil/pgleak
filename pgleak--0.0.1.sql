CREATE SCHEMA pgleak;
CREATE OR REPLACE FUNCTION pgleak.leak_sum(INT, INT)
RETURNS INT AS 'pgleak', 'pgleak_leak_sum'
LANGUAGE C STRICT;
GRANT EXECUTE ON FUNCTION pgleak.leak_sum(INT, INT) TO PUBLIC;

CREATE OR REPLACE FUNCTION pgleak.leak_sum_malloc(INT, INT)
RETURNS INT AS 'pgleak', 'pgleak_leak_sum_malloc'
LANGUAGE C STRICT;
GRANT EXECUTE ON FUNCTION pgleak.leak_sum_malloc(INT, INT) TO PUBLIC;
