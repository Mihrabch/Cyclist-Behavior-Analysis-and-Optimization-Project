-- Repeat the process of creating and uploading multiple tables for the number of months consider for analysis --
-- Here the command is shown for year 2022 and month November --

CREATE TABLE Initial_202211
(ride_id varchar(255),	
 rideable_type varchar(255),	
 started_at varchar(255),
 ended_at varchar(255),
 start_station_name	varchar(255),
 start_station_id	varchar(255),
 end_station_name	varchar(255),
 end_station_id	varchar(255),
 start_lat	varchar(255),
 start_lng	varchar(255),
 end_lat	varchar(255),
 end_lng	varchar(255),
 member_casual varchar(255));
 


COPY Initial_202211
FROM 'C:\Users\Public\Google Data Analytics\Capstone\Track 1\XSL_file\2022\202211.csv'
DELIMITER ','
CSV HEADER;


-- Creating Maser Dataset for aggregating the separate tables in one table for anaylysis --

CREATE TABLE Cyclistic_2022
(ride_id varchar(255),	
 rideable_type varchar(255),	
 started_at varchar(255),
 ended_at varchar(255),
 start_station_name	varchar(255),
 start_station_id	varchar(255),
 end_station_name	varchar(255),
 end_station_id	varchar(255),
 start_lat	varchar(255),
 start_lng	varchar(255),
 end_lat	varchar(255),
 end_lng	varchar(255),
 member_casual varchar(255));
 
Insert into Cyclistic_2022
SELECT * FROM Initial_202201
union all
SELECT * FROM Initial_202202
union all
SELECT * FROM Initial_202203
union all
SELECT * FROM Initial_202204
union all
SELECT * FROM Initial_202205
union all
SELECT * FROM Initial_202206
union all
SELECT * FROM Initial_202207
union all
SELECT * FROM Initial_202208
union all
SELECT * FROM Initial_202209
union all
SELECT * FROM Initial_202210
union all
SELECT * FROM Initial_202211

-- checking the master table --

SELECT * FROM cyclistic_2022

-- Exporting the master table --

COPY cyclistic_2022 TO 'C:\Users\Public\Google Data Analytics\Capstone\Track 1\XSL_file\2022\cyclistic_2022.csv' DELIMITER ',' CSV HEADER;