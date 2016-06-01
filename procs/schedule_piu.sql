CREATE or replace function InsertUpdateSchedule_p
(  in_eid varchar(10)
  , in_gsis int
  , in_season_type char(4)
  , in_week_num   int
  , in_game_time  varchar(5)
  , in_game_datetime timestamp
  , in_home_team char(30)
  , in_home_score int
  , in_away_team char(3)
  , in_away_score int
)
returns void as $$
DECLARE
  up_eid varchar default null;
  up_pk int default 0;
  up_time varchar default null;
  up_datetime timestamp default null;
  up_home_score int default 0;
  up_away_score int default 0;
BEGIN

  select
        eid, 
        id,
        game_time,
        game_datetime,
        home_score,
        away_score
        INTO 
          up_eid, 
          up_pk,
          up_time,
          up_datetime,
          up_home_score,
          up_away_score
      from nfl_schedule s
      where season_type = in_season_type 
      and week_num = in_week_num
      and home_team = in_home_team
      and away_team = in_away_team;

      IF (up_eid is not null)
      THEN
        IF (up_eid <> in_eid) THEN
          RAISE EXCEPTION  'existing game (%) eid does not match input eid (%) ', up_eid, in_eid;
        END IF;
        IF (up_time <> in_game_time OR
            up_datetime  <>  in_game_datetime  OR
            up_home_score  <>  in_home_score  OR
            up_away_score  <>  in_away_score    ) THEN

          update nfl_schedule 
            set   game_time = in_game_time,
                  game_datetime = in_game_datetime,
                  home_score = in_home_score,
                  away_score = in_away_score,
                  last_updated_datetime = now()
          where id = up_pk;
        END IF;

      ELSE
        insert into nfl_schedule (eid, gsis, season_type, week_num, game_time, game_datetime, home_team, home_score, away_team, away_score, last_updated_datetime)
        values ( in_eid, in_gsis, in_season_type, in_week_num, in_game_time, in_game_datetime, in_home_team, in_home_score, in_away_team, in_away_score, now());
      END IF;
END;
$$ LANGUAGE plpgsql;
