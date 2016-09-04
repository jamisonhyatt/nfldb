create table season_type (
  season_type char(4) not null primary key,
  description varchar(256) not null,
  weekNumStart int not null,
  weekNumEnd int not null
);

GRANT SELECT, INSERT, UPDATE, DELETE ON table season_type to read_write;
insert into season_type
select
  'PRE', 'Preaseason', 0, 4
union select
  'REG', 'Regular Season',1, 17
union select
  'POST', 'Postseas',18, 22;