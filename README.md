Grab Postgres:

```bash
$ git clone https://github.com/postgres/postgres
$ cd postgres
$ git checkout REL_17_STABLE
$ ./configure --prefix=$(pwd)/build --libdir=$(pwd)/build/lib --enable-cassert --enable-debug --without-icu
$ make -j16
$ make install
$ export PATH="$PATH:$(pwd)/build/bin"
```

Make and install this extension:

```bash
$ git clone https://github.com/eatonphil/pgleak
$ cd pgleak
$ make && make install
```

Create and start a new Postgres database:

```bash
$ initdb testdb
$ pg_ctl -D testdb -l logfile start
```

Run the `setup.sql` script:

```bash
$ psql postgres -e -f setup.sql
DROP EXTENSION IF EXISTS pgleak;
DROP EXTENSION
CREATE EXTENSION pgleak;
CREATE EXTENSION
DROP TABLE IF EXISTS users;
DROP TABLE
CREATE TABLE users (id BIGSERIAL, age INT);
CREATE TABLE
INSERT INTO users (age) SELECT random() * 100 + 1 FROM generate_series(1, 100000000);
INSERT 0 100000000
```

Now start a `psql` session. Record the backend PID. And trigger the memory leaking method.

```bash
$ psql postgres
psql (17.4)
Type "help" for help.

postgres=# SELECT pg_backend_pid();
 pg_backend_pid
----------------
           5019
(1 row)

postgres=# SELECT sum(pgleak.leak_sum(age, 1)) FROM users;
    sum
------------
 5200120363
(1 row)
```
