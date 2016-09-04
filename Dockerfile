FROM postgres:9.5
MAINTAINER Jamison Hyatt

#Shell Scripts (100)
copy ./init.sh  /docker-entrypoint-initdb.d/110-init.sh

#Table SQL Scripts (200)
copy ./tables/season_type.sql  /docker-entrypoint-initdb.d/210-season_type.sql
copy ./tables/teams.sql 	/docker-entrypoint-initdb.d/220-teams.sql
copy ./tables/nfl_schedule.sql	/docker-entrypoint-initdb.d/230-nfl_schedule.sql

