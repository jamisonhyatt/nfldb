#!/bin/bash
set -e

POSTGRES="psql --username ${POSTGRES_USER} nfl"

echo "Creating database role: sa"

$POSTGRES <<-EOSQL
create table season_type (
  season_type char(4) not null primary key,
  description varchar(256) not null,
  weekNumStart int not null,
  weekNumEnd int not null
);
insert into season_type
select
  'PRE', 'Preaseason', 0, 4
union select
  'REG', 'Regular Season',1, 17
union select
  'POST', 'Postseas',18, 22;
EOSQL
