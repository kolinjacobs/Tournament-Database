-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;
\c tournament;

CREATE TABLE players
(
id SERIAL PRIMARY KEY,
player_name varchar(255),
matches int
);

CREATE TABLE matches
(
id SERIAL PRIMARY KEY,
loser int,
winner int
);

CREATE VIEW wincounter
AS
  SELECT players.id,
         players.player_name,
         COUNT(matches.winner) AS wins,
         players.matches
  FROM players
         LEFT JOIN matches
                ON players.id = matches.winner
  GROUP BY players.id;


