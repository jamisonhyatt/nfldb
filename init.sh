#!/bin/bash
set -e

POSTGRES="psql --username ${POSTGRES_USER}"

echo "Creating database role: sa"

$POSTGRES <<-EOSQL
CREATE USER sa WITH PASSWORD '${SA_PASS}' SUPERUSER CREATEDB CREATEROLE INHERIT LOGIN;;
EOSQL


echo "Creating database role: nfl_api"

$POSTGRES <<-EOSQL
CREATE USER nfl_api WITH PASSWORD '${API_PASS}';
grant connect on database nfl to nfl_api;
GRANT USAGE ON SCHEMA public TO nfl_api;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public to nfl_api;
EOSQL
