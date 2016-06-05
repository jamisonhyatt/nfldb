create table conference (
  conference char(3) not null primary key
  ,name varchar(30) not null
);

insert into conference 
select 'NFC', 'National Football Conference'
union
select 'AFC', 'American Football Conference';

create table division (
  division char(5) not null
  ,conference char(3) not null references conference (conference)
  ,primary key (division, conference)
);

insert into division (division, conference) values
('North','NFC'),
('South','NFC'),
('East','NFC'),
('West','NFC'),
('North','AFC'),
('South','AFC'),
('East','AFC'),
('West','AFC');

create table team (
  team_id char(3) not null primary key,
  city varchar(25) not null,
  nickname varchar(25) not null,
  division char(5) not null,
  conference char(3) not null,
  FOREIGN KEY (division, conference) references division (division, conference),
  constraint ck_teams CHECk (team_id = upper(team_id))
);


insert into team (team_id, city, nickname, division, conference) values 
('NYJ','New York','Jets','East','AFC')
,('BUF','Buffalo','Bills','East','AFC')
,('NE','New England','Patriots','East','AFC')
,('MIA','Miami','Dolphins','East','AFC')
,('CIN','Cincinnati','Bengals','North','AFC')
,('BAL','Baltimore','Ravens','North','AFC')
,('PIT','Pittsburgh','Steelers','North','AFC')
,('CLE','Cleveland','Browns','North','AFC')
,('TEN','Tennessee','Titans','South','AFC')
,('JAX','Jacksonville','Jaguars','South','AFC')
,('HOU','Houston','Texans','South','AFC')
,('IND','Indianapolis','Colts','South','AFC')
,('DEN','Denver','Broncos','West','AFC')
,('KC','Kansas','Chiefs','West','AFC')
,('SD','San Diego','Chargers','West','AFC')
,('OAK','Oakland','Raiders','West','AFC')
,('DAL','Dallas','Cowboys','East','NFC')
,('WAS','Washington','Redskins','East','NFC')
,('PHI','Philadelphia','Eagles','East','NFC')
,('NYG','New York','Giants','East','NFC')
,('GB','Green Bay','Packers','North','NFC')
,('DET','Detroit','Lions','North','NFC')
,('MIN','Minnesota','Vikings','North','NFC')
,('CHI','Chicago','Bears','North','NFC')
,('ATL','Atlanta','Falcons','South','NFC')
,('CAR','Carolina','Panthers','South','NFC')
,('TB','Tampa','Buccaneers','South','NFC')
,('NO','New Orleans','Saints','South','NFC')
,('ARI','Arizona','Cardinals','West','NFC')
,('SF','San Francisco','49ers','West','NFC')
,('SEA','Seattle','Seahawks','West','NFC')
,('LA','Los Angeles','Rams','West','NFC');
