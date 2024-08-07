# Cyclist Behavior Analysis and Optimization Project for a Company

About the company
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are tracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system at a time.
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.
Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign targeting all-new customers, Moreno believes there is a good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.
Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to understand better how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.
Cyclistic’s historical trip data to analyze and identify trends. 
The previous 24 months of Cyclistic trip data is downloaded from : 
https://divvytripdata.s3.amazonaws.com/index.html.
(Note: The datasets have a different name because Cyclistic is a fictional company. Motivate International Inc. has made the data available under this license.) 
This is public data you can use to explore how different customer types use Cyclistic bikes. But note that data privacy issues prohibit you from using riders’ personally identifiable information. This means that you won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

## Project : Cyclist Behavior Analysis and Optimization Project


## Steps :
### SQL :
1. Due to the dataset's size (over 1 million records), using Microsoft Excel and Google Sheets was impractical. I used SQL to create a master dataset containing cyclist data for 2021 and 2022, imported it as a CSV file, and performed data wrangling and initial visualization in R.

### R - Programming:
2.. Utilized R for data wrangling, including cleaning NAs, transforming data, and performing necessary mathematical operations for insights.
3. Initially visualized the data using ggplot on filtered data in R.
4. Exported the top 30 cyclists' data by duration for both casual and organization members for further exploration in Tableau.

### Tableau : 

5. Analyzed the most and least used stations for both casual users and members to target future members using Tableau.
6. Examined changes in ride duration and length based on seasonality and weekdays using Tableau.

## Key Findings : 

1. Members use the service for daily commuting, while casual cyclists use it for recreation.
2. From 2021 to 2022, the number of casual cyclists increased.
3. There was a decrease in the average riding distance in 2022 compared to 2021.
4. Casual cyclists tend to ride for longer durations and distances compared to members.
5. Classic bikes are preferred by both types of cyclists, while dockers are rarely used.

## Recommendation : 


1. Remove docker bikes, as no one uses them, to reduce maintenance costs.
2. Investigate the reduced average cycling duration among members with a survey to identify reasons and boost usage.
3. Target marketing campaigns during summer to convert casual riders into annual members.
4. Despite the positive trend in membership from 2021 to 2022, some stations are losing members; run weekend promotions highlighting the benefits of membership and daily commuting to attract more casual cyclists.




