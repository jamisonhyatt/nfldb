FROM postgres:9.5
MAINTAINER Jamison Hyatt

#Shell Scripts (100)
copy ./create_users.sh  /docker-entrypoint-initdb.d/120-create_user.sh

#SQL Scripts (200)
copy ./create_nfl_db.sql   	/docker-entrypoint-initdb.d/200-createdb.sql
copy ./season_type.sh  /docker-entrypoint-initdb.d/210-season_type.sh
copy ./teams.sh 	/docker-entrypoint-initdb.d/220-teams.sh
copy ./nfl_schedule.sh	/docker-entrypoint-initdb.d/230-nfl_schedule.sh

