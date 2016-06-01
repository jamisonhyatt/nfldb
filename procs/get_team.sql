CREATE or replace function GetTeam_p (teamId char(3) ) returns setof team as $$
	select
    t.team_id,
    t.city,
    t.nickname,
    t.division,
    t.conference
  from team t
  where (teamId is null or t.team_id = teamId);
$$ language 'sql'
SECURITY DEFINER;

REVOKE ALL ON FUNCTION GetTeam_p (teamId char(3) ) FROM nfl_api;

GRANT EXECUTE ON FUNCTION GetTeam_p (teamId char(3) ) TO nfl_api;