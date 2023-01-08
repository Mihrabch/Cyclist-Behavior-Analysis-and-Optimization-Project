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


COPY Initial_202112
FROM 'C:\Users\Public\Google Data Analytics\Capstone\Track 1\XSL_file\2021\202112.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM cyclistic_2021

COPY cyclistic_2021 TO 'C:\Users\Public\Google Data Analytics\Capstone\Track 1\XSL_file\2021\cyclistic_2021.csv' DELIMITER ',' CSV HEADER;
COPY cyclistic_2022 TO 'C:\Users\Public\Google Data Analytics\Capstone\Track 1\XSL_file\2022\cyclistic_2022.csv' DELIMITER ',' CSV HEADER;