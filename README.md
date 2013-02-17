boppl-customer-server
=====================

initdb -D /usr/local/var/postgres

pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log

pg_dump --schema-only --no-owner boppl > boppl.sql

brew install geos
