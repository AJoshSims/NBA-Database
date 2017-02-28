-- @author Evan Arroyo
-- @author Joshua Sims
-- @version 03 March 2017

CREATE TABLE player(
    
    pname       varchar(50),
    college     varchar(50),
    position    varchar(50),
    height      int,
    primary key(pname)

);

CREATE TABLE team(
    
    tname       varchar(50),
    city        varchar(50),
    primary key(tname)

);

CREATE TABLE hasPlayedFor(

    pname       varchar(50),
    tname       varchar(50),
    primary key(pname,tname),
    foreign key(pname) references player,
    foreign key(tname) references team
    
);   
