-- @author Evan Arroyo
-- @author Joshua Sims
-- @version 03 March 2017

CREATE TABLE player(
    
    pname       varchar(20),
    college     varchar(20),
    position    varchar(15),
    height      int,
    primary key(pname)

);

CREATE TABLE team(
    
    tname       varchar(20),
    city        varchar(20),
    primary key(tname)

);

CREATE TABLE hasPlayedFor(

    pname       varchar(20),
    tname       varchar(20),
    primary key(pname,tname),
    foreign key(pname) references player,
    foreign key(tname) references team
    
);   
