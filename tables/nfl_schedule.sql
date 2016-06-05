create table nfl_schedule (
  eid varchar(10) not null
  ,gsis int not null
  ,season int not null
  ,season_type char(4) not null
  ,week_num int not null
  ,game_time varchar(5) not null
  ,game_datetime timestamp not null
  ,home_team char(3) not null
  ,home_score int not null
  ,away_team char(3) not null
  ,away_score int not null
  ,last_updated_datetime timestamp not null default now()
  ,FOREIGN KEY  (season_type) references season_type (season_type)
  ,FOREIGN KEY  (home_team) references team (team_id)
  ,FOREIGN KEY  (away_team) references team (team_id)
  ,constraint ck1_nfl_schedule CHECK (home_team <> away_team)
  ,constraint un1_nfl_schedule unique  (eid)
  ,constraint un2_nfl_schedule unique  (gsis)
  ,primary key (season, season_type, week_num, home_team, away_team)
);

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public to nfl_api;

grant usage, select ON ALL SEQUENCES IN SCHEMA public to nfl_api;

