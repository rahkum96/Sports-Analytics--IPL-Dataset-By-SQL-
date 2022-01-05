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


