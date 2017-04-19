use cards;

create table cards
  (
      no int(20) not null auto_increment
    , attribute int(1) default 0
    , name varchar(32)
    , image varchar(256)
    , description tinytext
    , parent_no int(20) default 0
    , primary key (no)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into cards
  (
      attribute
    , name
    , image
    , description
    , parent_no
  ) values (
      0
    , 'マスターカード'
    , '0.jpg'
    , 'マスターカード'
    , 0
  );
