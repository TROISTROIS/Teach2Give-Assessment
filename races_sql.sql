-- Write a query that will display the results below (Note: some columns might be renamed
-- but use the column names above). It should only show 2020 data and order by driver
-- points.


-- DROP SCHEMA IF EXISTS F1 CASCADE;
-- create schema
CREATE SCHEMA IF NOT EXISTS F1;

-- create circuits table
CREATE TABLE IF NOT EXISTS F1.circuits 
(
circuitId INTEGER CONSTRAINT circuits_pkey PRIMARY KEY, 
circuitRef VARCHAR(255), 
name VARCHAR(255), 
location VARCHAR(255), 
country VARCHAR(255), 
lat DECIMAL, 
lng DECIMAL, 
alt INTEGER,
url VARCHAR(255)
);

-- create drivers table
CREATE TABLE IF NOT EXISTS F1.drivers 
(
driverId INTEGER CONSTRAINT drivers_pkey PRIMARY KEY, 
driverRef VARCHAR(255), 
number NUMERIC, 
code VARCHAR(3), 
forename VARCHAR(255), 
surname VARCHAR(255), 
dob DATE, 
nationality VARCHAR(255), 
url VARCHAR(255)
);

-- create constructors table
CREATE TABLE IF NOT EXISTS F1.constructors 
(
constructorId INTEGER CONSTRAINT constructors_pkey PRIMARY KEY, 
constructorRef VARCHAR(255), 
name VARCHAR(255), 
nationality VARCHAR(255), 
url VARCHAR(255)
);

-- create seasons table
CREATE TABLE IF NOT EXISTS F1.seasons (
year INTEGER CONSTRAINT seasons_pkey PRIMARY KEY, 
url VARCHAR(255)
);

-- create races table
CREATE TABLE IF NOT EXISTS F1.races (
raceId INTEGER CONSTRAINT races_pkey PRIMARY KEY, 
year INTEGER REFERENCES F1.seasons (year), 
round INTEGER, 
circuitId INTEGER REFERENCES F1.circuits (circuitId), 
name VARCHAR(255), 
date DATE, 
time TIME, 
url VARCHAR(255)
);

-- create pitstops table
CREATE TABLE IF NOT EXISTS F1.pitstops 
(
raceId INTEGER REFERENCES F1.races (raceId), 
driverId INTEGER REFERENCES F1.drivers (driverId), 
stop INTEGER, 
lap INTEGER, 
time TIME, 
duration VARCHAR(255), 
milliseconds INTEGER
);

-- create laptimes table
CREATE TABLE IF NOT EXISTS F1.laptimes 
(
raceId INTEGER REFERENCES F1.races (raceId), 
driverId INTEGER REFERENCES F1.drivers (driverId), 
lap INTEGER, 
position INTEGER, 
time VARCHAR(255),
milliseconds INTEGER
);

-- create qualifying table
CREATE TABLE IF NOT EXISTS F1.qualifying 
(
qualifyId INTEGER CONSTRAINT qualifying_pkey PRIMARY KEY,
raceId INTEGER REFERENCES F1.races (raceId),
driverId INTEGER REFERENCES F1.drivers (driverId),
constructorId INTEGER REFERENCES F1.constructors (constructorId), 
number INTEGER,
position INTEGER,
q1 VARCHAR(255),
q2 VARCHAR(255),
q3 VARCHAR(255)
);

-- create results table
CREATE TABLE IF NOT EXISTS F1.results 
(
resultId INTEGER CONSTRAINT results_pkey PRIMARY KEY, 
raceId INTEGER REFERENCES F1.races (raceId),
driverId INTEGER REFERENCES F1.drivers (driverId),
constructorId INTEGER REFERENCES F1.constructors (constructorId), 
number INTEGER, 
grid INTEGER, 
position INTEGER, 
positionText VARCHAR(255), 
positionOrder INTEGER, 
points DECIMAL, 
laps INTEGER, 
time VARCHAR(255), 
milliseconds INTEGER, 
fastestLap INTEGER, 
rank INTEGER, 
fastestLapTime VARCHAR(255), 
fastestLapSpeed VARCHAR(255),
statusId INTEGER
);

-- create driverStandings table
CREATE TABLE IF NOT EXISTS F1.driverStandings 
(
driverStandingsId INTEGER CONSTRAINT driverStandings_pkey PRIMARY KEY,
raceId INTEGER REFERENCES F1.races (raceId), 
driverId INTEGER REFERENCES F1.drivers (driverId),
points DECIMAL, 
position INTEGER, 
positionText VARCHAR(255), 
wins INTEGER
);

-- create constructorStandings table
CREATE TABLE IF NOT EXISTS F1.constructorStandings 
(
constructorStandingsId INTEGER CONSTRAINT constructorStandings_pkey PRIMARY KEY, 
raceId INTEGER REFERENCES F1.races (raceId),
constructorId INTEGER REFERENCES F1.constructors (constructorId),
points DECIMAL,
position INTEGER,
positionText VARCHAR(255),
wins INTEGER
);

-- create constructorResults table
CREATE TABLE IF NOT EXISTS F1.constructorResults 
(
constructorResultsId INTEGER CONSTRAINT constructorResults_pkey PRIMARY KEY, 
raceId INTEGER REFERENCES F1.races (raceId), 
constructorId INTEGER REFERENCES F1.constructors (constructorId), 
points DECIMAL, 
status VARCHAR(255)
);

-- create table status
CREATE TABLE IF NOT EXISTS F1.status 
(
statusId INTEGER CONSTRAINT status_pkey PRIMARY KEY, 
status VARCHAR(255)
);

-- insert into circuits
COPY F1.circuits (circuitId,circuitRef,name,location,country,lat,lng,alt,url)
FROM 'D:\teach2give\circuits.csv' WITH DELIMITER ',' CSV;

-- psql insert into
-- SET client_encoding to 'UTF-8';
-- \copy F1.drivers (driverId,driverRef,number,code,forename,surname,dob,nationality,url)
-- FROM 'D:\\teach2give\\drivers.csv' WITH DELIMITER ',' CSV;
-- SELECT * FROM F1.drivers LIMIT 5;

insert into constructors
COPY F1.constructors (constructorId,constructorRef,name,nationality,url)
FROM 'D:\teach2give\constructors.csv' WITH DELIMITER ',' CSV;
SELECT * FROM F1.constructors LIMIT 5;

insert into seasons
COPY F1.seasons (year,url)
FROM 'D:\teach2give\seasons.csv' WITH DELIMITER ',' CSV;
SELECT * FROM F1.seasons LIMIT 5;

insert into races
COPY F1.races (raceId,year,round,circuitId,name,date,time,url)
FROM 'D:\teach2give\races.csv' WITH DELIMITER ',' CSV;
SELECT * FROM F1.races LIMIT 5;

insert into pitstops
COPY F1.pitstops (raceId,driverId,stop,lap,time,duration,milliseconds)
FROM 'D:\teach2give\pitstops.csv' WITH DELIMITER ',' CSV;
SELECT * FROM F1.pitstops LIMIT 5;

insert into laptimes
COPY F1.laptimes (raceId,driverId,lap,position,time,milliseconds)
FROM 'D:\teach2give\laptimes.csv' WITH DELIMITER ',' CSV;
SELECT * FROM F1.laptimes LIMIT 5;

insert into qualifying
COPY F1.qualifying (qualifyId,raceId,driverId,constructorId,number,position,q1,q2,q3)
FROM 'D:\teach2give\qualifying.csv' WITH DELIMITER ',' CSV;
SELECT * FROM F1.qualifying LIMIT 5;

insert into results
COPY F1.results (resultId,raceId,driverId,constructorId,number,grid,position,positionText,positionOrder,points,
laps,time,milliseconds,fastestLap,rank,fastestLapTime,fastestLapSpeed,statusId)
FROM 'D:\teach2give\results.csv' WITH DELIMITER ',' CSV;
SELECT * FROM F1.results LIMIT 5;

insert into driverStandings
COPY F1.driverStandings (driverStandingsId,raceId,driverId,points,position,positionText,wins)
FROM 'D:\teach2give\driverStandings.csv' WITH DELIMITER ',' CSV;
SELECT * FROM F1.driverStandings LIMIT 5;

-- insert into constructorStandings
COPY F1.constructorStandings (constructorStandingsId,raceId,constructorId,points,position,positionText,wins)
FROM 'D:\teach2give\constructorStandings.csv' WITH DELIMITER ',' CSV;
SELECT * FROM F1.constructorStandings LIMIT 5;

-- insert into constructorResults
COPY F1.constructorResults (constructorResultsId,raceId,constructorId,points,status)
FROM 'D:\teach2give\constructorResults.csv' WITH DELIMITER ',' CSV;
SELECT * FROM F1.constructorResults LIMIT 5;

-- insert into status
COPY F1.status (statusId,status)
FROM 'D:\teach2give\status.csv' WITH DELIMITER ',' CSV;
SELECT * FROM F1.status LIMIT 5;

WITH 
results AS
( SELECT CURRENT_TIMESTAMP curr),
t1 AS
(SELECT *
FROM F1.circuits 
INNER JOIN F1.races ON F1.circuits.circuitId = F1.races.circuitId
),
t2 AS 
(SELECT *
FROM F1.drivers
INNER JOIN F1.lapTimes ON F1.drivers.driverId = F1.lapTimes.driverId),
t3 AS
(SELECT *
FROM F1.constructors
INNER JOIN F1.qualifying ON F1.constructors.constructorId = F1.qualifying.constructorId
INNER JOIN F1.results ON F1.results.constructorId = F1.lapTimes.constructorId
INNER JOIN F1.constructorStandings ON F1.constructorStandings.constructorId = F1.constructorResults.constructorId),
t4 AS
(SELECT *
FROM F1.races
INNER JOIN F1.pitStops ON F1.pitStops.raceId = F1.lapTimes.raceId
INNER JOIN F1.qualifying ON F1.qualifying.raceId = F1.results.raceId
INNER JOIN F1.driverStandings ON F1.driverStandings.raceId = F1.constructorStandings.raceId
INNER JOIN F1.constructorResults ON F1.constructorResults.raceId = F1.driverStandings.raceId
),
t5 AS
(SELECT *
FROM F1.results
INNER JOIN F1.pitStops ON F1.pitStops.raceId = F1.results.raceId
INNER JOIN F1.lapTimes ON F1.lapTimes.raceId = F1.results.raceId
INNER JOIN F1.qualifying ON F1.qualifying.raceId = F1.results.raceId
INNER JOIN F1.driverStandings ON F1.driverStandings.raceId = F1.results.raceId
INNER JOIN F1.constructorResults ON F1.constructorResults.raceId = F1.results.raceId
INNER JOIN F1.constructorStandings ON F1.constructorStandings.constructorId = F1.constructorResults.constructorId
INNER JOIN F1.drivers ON F1.drivers.driverId = F1.lapTimes.driverId
INNER JOIN F1.constructors ON F1.constructors.constructorId = F1.qualifying.constructorId
)

SELECT
t1.location AS circuit_location, 
t2.number AS driver_number,
CONCAT(t2.forename, ' ', t2.surname) AS driver_name,
t2.nationality AS driver_nationality, 
t3.name AS team, 
t4.year AS race_year,
t4.name AS race_name,
t4.date AS race_date, 
t5.grid,
t5.fastestLap AS fastest_lap,
t5.time AS race_time,
t5.points,
curr FROM F1.Results;
