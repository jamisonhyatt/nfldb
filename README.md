# nfldb

Database to hold data for the nflapi.

More information on the inherited postgres portion of this is here:

## Instructions

clone this repo
`git clone https://github.com/jamisonhyatt/nfldb.git`
switch into the cloned directory directory
`cd nfldb`
build the image
`docker build -t nfldb .`
run the image.  Make sure to pass in the required passwords (postgres, api user, sa user)
`docker run -p 5432:5432 --name nfl_db -e POSTGRES_PASSWORD=root -e SA_PASS=sa -e API_PASS=nfl_api -d  nfldb`

Nfl DB should be exposed via 5432 to external clients with the postgres, sa and nfl_api users. To login directly to the nfl db from the docker host, run:
`docker exec -it nfl_db psql --username postgres nfl`
