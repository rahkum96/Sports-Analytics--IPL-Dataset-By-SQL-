# Sports-Analytics--IPL-Dataset-By-SQL-
Analysis on past years' IPL data with help of complex SQL queries, visualized the outcome in tableau and drawn meaningful conclusion on outcome.

## Perform Data Analysis on 'Indian Premiere League' by using SQL
## Objective:: 
- Perform ‘Data Analysis by SQL’ on dataset ‘Indian Premier League’
- As a sports analysts, find out the most successful teams, players and factors contributing win or loss of a team.
- Suggest teams or players a company should endorse for its products.

## Data set link:
https://bit.ly/34SRn3b

## Loading dataset to SQL Database:
- There are two method we can upload the data 1) from table wizard 2) from cmd prompt 
- Here I have used cmd prompt to upload the data, because the data set was huge it would take more than an hour if we would have imported data from "import table wizard"

## Step to follow to import data from cmd prompt:
**1. change directory**
 - cd C:\Program Files\MySQL\MySQL Server 8.0\bin

**2. mysql -u root -p**
 - enter password- *******

**3. configure with databse and quit the server** 
   - SET GLOBAL local_infile=1;
 - quit

**4. configure with clinet server** 
 - mysql --local-infile=1 -u root -p

**5. Show Databases;**
 - USE project;

**6. Load the file**
- LOAD DATA LOCAL INFILE 'C:\\Users\\Rohit Kumar (Prince)\\OneDrive\\Desktop\\Ivy_Data_science\\SQL\\project\\Research_project\\deliveries_all.csv'
INTO TABLE deliveries_all
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

## Analysis result by SQL Queries:
### Q-1: As a sports analysts, find out the most successful teams, players and factors contributing win or loss of a team.
1. Mumbai Indians is the most successful team in IPL and has won the most number of toss.
2. There were more matches won by chasing the total(419 matches) than defending(350 matches).
3. When defending a total, the biggest victory was by 146 runs(Mumbai Indians defeated Delhi Daredevils by 146 runs on 06 May 2017 at Feroz Shah Kotla stadium, Delhi).
4. When chasing a target, the biggest victory was by 10 wickets(without losing any wickets) and there were 11 such instances.
5. The Mumbai city has hosted the most number of IPL matches.
6. Chris Gayle has won the maximum number of player of the match title.
7. Eden Gardens has hosted the maximum number of IPL matches.
8. If a team wins a toss choose to field first as it has highest probablity of winning.

### Q-2: Suggest teams or players a company should endorse for its products.

1. If the franchise is looking for a consistant batsman who needs to score good amount of runs then go for V Kohli, S Raina, Rohit Sharma , David Warner...
2. If the franchise is looking for a game changing batsman then go for Chris Gayle, AB deVillers, R Sharma , MS Dhoni...
3. If the franchise is looking for a batsman who could score good amount of runs every match the go for DA Warner, CH Gayle, V Kohli,AB de Villiers,S Dhawan
4. If the franchise needs the best finisher in lower order having good strike rate then go for CH Gayle,KA Pollard, DA Warner,SR Watson,BB McCullum
5. If the franchise need a experienced bowler then go for Harbhajan Singh ,A Mishra,PP Chawla ,R Ashwin,SL Malinga,DJ Bravo
6. If the franchise need a wicket taking bowler then go for SL Malinga,DJ Bravo,A Mishra ,Harbhajan Singh, PP Chawla
7. If the franchise need a bowler bowling most number of dot balls then go for Harbhajan Singh,SL Malinga,B Kumar,A Mishra,PP Chawla
8. If the franchise need a bowler with good economy then go for DW Steyn ,M Muralitharan ,R Ashwin,SP Narine ,Harbhajan Singh.

