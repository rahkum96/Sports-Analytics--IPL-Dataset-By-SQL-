create database project;
use project;

create table players (
Player_Name varchar(100),
DOB date,
Batting_Hand varchar(100),
Bowling_Skill varchar(100),
Country varchar(100)
);

create table matches (
id int,
Season char(50),
city char(50),
date_ char(20),
team1 varchar(59),
team2 varchar(59),
toss_winner varchar(59),
toss_decision varchar(100),
result varchar(100),
dl_applied int,
winner varchar(100),
win_by_runs int,
win_by_wickets int,
player_of_match varchar(100),
venue varchar(100),
umpire1 varchar(100),
umpire2 varchar(100)
);

create table deliveries_all(
match_id int,
inning int,
batting_team char(50),
bowling_team  char(50),
overs int,
ball int,
batsman char(100),
non_striker char(100),
bowler char(100),
is_super_over int,
wide_runs int,
bye_runs int,
legbye_runs int,
noball_runs int,
penalty_runs int,
batsman_runs int,
extra_runs int,
total_runs int,
player_dismissed char(50),
dismissal_kind char(50),
fielder char(50)
);

select * from  deliveries_all limit 5;

create table teams(
teams char(50)
);

select * from matches limit 5;
select * from teams;

/* chnaging the dat format in table matches */
alter table matches
add column dates date;
/* updating new column dates in table matches in sql format */ 
update matches
set dates= str_to_date(date_,'%d-%m-%Y');
/* delete the column date_ */
alter table matches
drop column date_;
/* enable safe mode */
SET sql_safe_updates=0;
/* diseable safe mode */
SET sql_safe_updates=1;


/*Problem Statement :
Perform Exploratory Data Analysis on 'Indian Premiere League'.
As a sports analysts, find out the most successful teams, players and factors contributing win or loss of a team.
Suggest teams or players a company should endorse for its products.*/

/* write a querey to find Number of Matches played in each IPL season*/
select season, count(*) as NoOfMatches
from matches
group by season 
order by season;

/*Number of teams participated each season */
select season, count(distinct(teams))
from matches, teams
where matches.team1=teams.teams
group by season;
/*In the year of 2011, 2012, 2013, there were 10,9,9 teams participated while in other seasons participated teams were 8. */

/*Numbers of matches won by each team */
select  winner, count(winner) as NoOFwinMacthes
from matches , teams 
where matches.winner=teams.teams
group by winner
order by 2 desc;
/*Mumbai Indians has maximum number of winning matches followed by Chennai Super Kings. */

/* Top 10 Venue which has hosted most number of IPL matches */
select distinct venue, count(*) as played_matches
from matches
group by venue
order by 2 desc
limit 10;

/* Does teams choose to bat or field first, after winning toss ?*/
select toss_decision, count(toss_decision) as TossDecision
from matches
group by toss_decision
order by 2 desc;
/*Usually after winning the toss, team choose to field first. */

/*How toss decision affects match results ? */




/* Number of Toss won by individual team */
select toss_winner,count(toss_winner)
from matches
group by toss_winner
order by 2 desc;

/* Which top 10 player's performance has mostly led team's win  */
select player_of_match,count(player_of_match) as MoM
from matches
group by player_of_match
order by 2 desc
limit 10;
/*CH Gayle is the most lead run scorer for the team followed by AB de Villiers. */

/*Teams total scoring runs over the years means total runs scored by season wise */
select season,count(batsman_runs) as Total_runsBy_yrs
from matches, deliveries_all
where matches.id= deliveries_all.match_id
group by season
order by 2 desc;
/* Ipl 2013 has more runs scored folowed by ipl 2012 */


/*Finding the individual batsman: total runs, no of balls palyed, no of matches played, No. of times outs, average_runs and strikeRate*/
select  batsman, count(ball) as NoOfBalls
from deliveries_all
group by batsman
order by  count(ball) desc;

select  batsman, sum(batsman_runs) as TotalRuns
from deliveries_all
group by batsman
order by sum(batsman_runs) desc;

select  batsman, count(distinct(match_id)) as NoOfMatches
from deliveries_all
group by batsman
order by  count(distinct(match_id)) desc;

select  batsman, count(player_dismissed) as outs
from deliveries_all
where player_dismissed <> "NA"
group by batsman
order by count(player_dismissed)  desc;


select  batsman, sum(batsman_runs) as TotalRuns,
count(ball) as TotalBalls, count(distinct(match_id)) as NoOfMatches,
sum(batsman_runs)/count(distinct(match_id)) as avgRuns,
(sum(batsman_runs)/count(ball))*100 as Strike_Rate
from deliveries_all
group by batsman
order by sum(batsman_runs) desc;

/*Batsmen with the best strike rates over the years */
select batsman
from most_runs_average_strikerate
where total_runs > 3000
order by 2 desc;

/* Bowler Analysis */

/* Top Wicket Takers of IPL */
select bowler,count(player_dismissed) 
from  deliveries_all
where player_dismissed not in ("NA")
group by bowler
order by 2 desc;
/* most no of wickets taken by SL Malinga followed by DJ Bravo and A mishra */

/* Most dot ball balled by bowlers */
select bowler,count(total_runs) as DotBall
from  deliveries_all
where total_runs = 0
group by bowler
order by 2 desc;
/* Most no of dots balled balled by Harbhajan singh, folowed by SL Malinga and B.kumar */







/* Q-1: As a sports analysts, find out the most successful teams, players and factors contributing win or loss of a team.
1.Mumbai Indians is the most successful team in IPL and has won the most number of toss.
2.There were more matches won by chasing the total(419 matches) than defending(350 matches).
3.When defending a total, the biggest victory was by 146 runs(Mumbai Indians defeated Delhi Daredevils by 146 runs on 06 May 2017 at Feroz Shah Kotla stadium, Delhi).
4.When chasing a target, the biggest victory was by 10 wickets(without losing any wickets) and there were 11 such instances.
5.The Mumbai city has hosted the most number of IPL matches.
6.Chris Gayle has won the maximum number of player of the match title.
7.Eden Gardens has hosted the maximum number of IPL matches.
8.If a team wins a toss choose to field first as it has highest probablity of winning */

/*Q-2: Suggest teams or players a company should endorse for its products.

1.If the franchise is looking for a consistant batsman who needs to score good amount of runs then go for V Kohli, S Raina, Rohit Sharma , David Warner...
2.If the franchise is looking for a game changing batsman then go for Chris Gayle, AB deVillers, R Sharma , MS Dhoni...
3.If the franchise is looking for a batsman who could score good amount of runs every match the go for DA Warner, CH Gayle, V Kohli,AB de Villiers,S Dhawan
4.If the franchise needs the best finisher in lower order having good strike rate then go for CH Gayle,KA Pollard, DA Warner,SR Watson,BB McCullum
5.If the franchise need a experienced bowler then go for Harbhajan Singh ,A Mishra,PP Chawla ,R Ashwin,SL Malinga,DJ Bravo
6.If the franchise need a wicket taking bowler then go for SL Malinga,DJ Bravo,A Mishra ,Harbhajan Singh, PP Chawla
7.If the franchise need a bowler bowling most number of dot balls then go for Harbhajan Singh,SL Malinga,B Kumar,A Mishra,PP Chawla
8.If the franchise need a bowler with good economy then go for DW Steyn ,M Muralitharan ,R Ashwin,SP Narine ,Harbhajan Singh. */



