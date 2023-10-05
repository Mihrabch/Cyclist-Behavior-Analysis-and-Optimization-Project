# Cyclistic
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

Project : 

Steps :
SQL :
1. Due to the size of the dataset, Microsoft Excel would fail, and uploading it will take a huge time, and Google Excel will eventually be time-consuming because of the size.

Therefore, to create a master dataset containing the cyclist's data for the years 2021 and 2022, respectively, I used SQL and imported the data as a CSV file for wrangling and initial visualization in R.

R - Programming:
2. Used R for wrangling the data. Cleaning the NAs, transforming them, and doing necessary mathematical operations  on the existing ones to get the insight. 
3. Visualize the data initially using ggplot on filtered data in R.
4. Exported top 30 cyclists' data by duration for both casual and members of the organization for further exploration in Tableau.

Tableau : 

5. Finding the most used stations for both types of users and the lowest. It would be helpful for targeting future members using Tableau.
6. The change in ride duration and length depends on seasonality and weekday using Tableau.

Key Findings : 

1. Members use the service for daily use, and casual cyclists use it for recreation.
2. From 2021 to 2022, the number of casual cyclists increased.
3. There is a decrease in average riding distance in 2022 compared to 2021.
4. Among both types of cyclists, casual cyclists use for long duration and long distances.
5. Preferred bike is classic bikes, and docker is not used much by either type of cyclist. 

Recommendation : 


1. Remove the docker bikes, as no one uses them. This will reduce the maintenance cost.
2. Look into the fact that the average duration of cycling of members is reduced. Need to have a survey among members to find out the reason and increase the usage.
3. Target marketing campaigns towards summer to convert casual riders into annual members
4. Although a positive trend exists of increased membership from 2021 to 2022, some stations are losing members. Need to run a promotion on weekends on the usefulness of being a member and the benefit of using the cycle on the daily commute to reach the maximum number of casual cyclists. 




