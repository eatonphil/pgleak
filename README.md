Grab Postgres:

```
$ git clone https://github.com/postgres/postgres
$ cd postgres
$ git checkout REL_17_STABLE
$ ./configure --prefix=$(pwd)/build --libdir=$(pwd)/build/lib --enable-cassert --enable-debug --without-icu
$ make -j16
$ make install
$ export PATH="$PATH:$(pwd)/build/bin"
```

Make and install this extension:

```
$ git clone https://github.com/eatonphil/pgleak
$ cd pgleak
$ make && make install
```

Create and start a new Postgres database:

```
$ initdb testdb
$ pg_ctl -D testdb -l logfile start
```

Run the `setup.sql` script:

```
$ psql postgres -e -f setup.sql
```
