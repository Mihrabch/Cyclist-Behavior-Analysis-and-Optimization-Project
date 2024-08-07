#### Install Packages and Library

install.packages("tidyverse") #Collection of R packages designed for data analysis
install.packages("DataExplorer") # To Explore data
install.packages("janitor") #Simple Tool for Examining and Cleaning Dirty Data 
install.packages("lubridate") #To work with dates and times
install.packages("geosphere") #For Measuring Length using geo data

library(tidyverse)
library(DataExplorer)
library(janitor)
library(lubridate)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(geosphere)

#### Import Data

path <- "C:/Users/Public/Google Data Analytics/Capstone/Track 1/XSL_file"

cyclistic_2021<-read.csv(paste(path,"/2021/cyclistic_2021.csv",sep=''))
cyclistic_2022<-read.csv(paste(path,"/2022/cyclistic_2022.csv",sep=''))

#### Initial Visualization
#For 2021 and 2022

summary(cyclistic_2021) #statistical summary of data
summary(cyclistic_2022) #statistical summary of data

#### Cleaning and Preparing Data

#Checking for NA

sum(is.na(cyclistic_2021))
sum(is.na(cyclistic_2022))

cyclistic_2021<- na.omit(cyclistic_2021)
cyclistic_2022<- na.omit(cyclistic_2022)

#### Transform DataTime as follows: date, month and weekday

cyclistic_2021$date <- as.Date(cyclistic_2021$started_at) 
cyclistic_2021$month <- format(as.Date(cyclistic_2021$date), "%m")
cyclistic_2021$weekday <- format(as.Date(cyclistic_2021$date), "%A")

cyclistic_2022$date <- as.Date(cyclistic_2022$started_at) 
cyclistic_2022$month <- format(as.Date(cyclistic_2022$date), "%m")
cyclistic_2022$weekday <- format(as.Date(cyclistic_2022$date), "%A")

cyclistic_2021$season <- ifelse (cyclistic_2021$month %in% c('06','07','08'), "Summer",
                                 ifelse (cyclistic_2021$month %in% c('09','10','11'), "Fall",
                                         ifelse (cyclistic_2021$month %in% c('12','01','02'), "Winter",
                                                 ifelse (cyclistic_2021$month %in% c('03','04','05'), "Spring", NA))))

cyclistic_2022$season <- ifelse (cyclistic_2022$month %in% c('06','07','08'), "Summer",
                                 ifelse (cyclistic_2022$month %in% c('09','10','11'), "Fall",
                                         ifelse (cyclistic_2022$month %in% c('12','01','02'), "Winter",
                                                 ifelse (cyclistic_2022$month %in% c('03','04','05'), "Spring", NA))))


#### Checking the newly created column and its summary

head(cyclistic_2021)
summary(cyclistic_2021)

head(cyclistic_2022)
summary(cyclistic_2022)

#### Checking for Date Consistency

IsDate <- function(mydate,date.format = "%m/%d/%y") {
  tryCatch(!is.na(as.Date(mydate,date.format)),  
           error = function(err) {FALSE})  
}

z_2021<-IsDate(cyclistic_2021$date)
table(z_2021)["FALSE"]

z_2022<-IsDate(cyclistic_2022$date)
table(z_2022)["FALSE"]

# Can count both true and false from  table(z) command

#### Measuring Ride length and Ride Duration

cyclistic_2021$ride_duration <- as.numeric(difftime(cyclistic_2021$ended_at, cyclistic_2021$started_at)) 
cyclistic_2021$ride_length <- distHaversine(cbind(cyclistic_2021$start_lng,cyclistic_2021$start_lat),cbind(cyclistic_2021$end_lng,cyclistic_2021$end_lat))

cyclistic_2022$ride_duration <- as.numeric(difftime(cyclistic_2022$ended_at, cyclistic_2022$started_at)) 
cyclistic_2022$ride_length <- distHaversine(cbind(cyclistic_2022$start_lng,cyclistic_2022$start_lat),cbind(cyclistic_2022$end_lng,cyclistic_2022$end_lat))


#### Removing negative values for ride length and ride duration.(As time and length can not be negative)
#### Addressing missing start and end station names to ensure complete and reliable data

neg_length<-sign(cyclistic_2021$ride_length)
sum(neg_length<0)
neg_duration<-sign(cyclistic_2021$ride_duration)
sum(neg_duration<0)
sum(!is.na(cyclistic_2021$end_station_name)==TRUE)
sum(!is.na(cyclistic_2021$end_station_name)==TRUE)
sum(cyclistic_2021$end_station_name=="")


neg_length<-sign(cyclistic_2022$ride_length)
sum(neg_length<0)
neg_duration<-sign(cyclistic_2022$ride_duration)
sum(neg_duration<0)
sum(!is.na(cyclistic_2022$end_station_name)==TRUE)
sum(!is.na(cyclistic_2022$end_station_name)==TRUE)
sum(cyclistic_2022$end_station_name=="")

preparing_cyclistic_2021<-cyclistic_2021%>% 
  filter(ride_duration>0)%>% 
  filter(ride_length>0)%>% 
  filter(!is.na(start_station_name))%>%
  filter(!is.na(end_station_name))%>%
  filter(!start_station_name == "")


preparing_cyclistic_2022<-cyclistic_2022%>% 
  filter(ride_duration>0)%>% 
  filter(ride_length>0)%>% 
  filter(!is.na(start_station_name))%>%
  filter(!is.na(end_station_name))%>%
  filter(!start_station_name == "")


#### Visual Analysis and Comparison of Cyclist Data


preparing_cyclistic_2021$weekday <- ordered(preparing_cyclistic_2021$weekday, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

preparing_cyclistic_2022$weekday <- ordered(preparing_cyclistic_2022$weekday, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
         
     
## Comparing members and casual cyclists

number_of_cyclists_2021<- preparing_cyclistic_2021%>% 
  group_by(member_casual)%>% 
  summarise(n=n())%>%
  mutate(percent = n*100/sum(n))
  
ggplot(data = number_of_cyclists_2021,mapping= aes(x= member_casual, y = percent, fill = member_casual)) +geom_col() + 
  labs(title="Percent of Member and Casual Cyclists 2021")+ 
  scale_fill_manual(values = c("Blue", "Purple"))+
  theme(legend.position = "none",panel.grid = element_blank(),axis.title.x = element_blank(),axis.title.y = element_blank())


number_of_cyclists_2022<-preparing_cyclistic_2022%>% 
  group_by(member_casual)%>% 
  summarise(n=n())%>%
  mutate(percent = n*100/sum(n))
ggplot(data = number_of_cyclists_2022,mapping= aes(x= member_casual, y = percent,fill = member_casual)) +geom_col() + 
      labs(title="Percent of Member and Casual Cyclists 2022")+ 
      scale_fill_manual(values = c("Blue", "Purple"))+
      theme(legend.position = "none",panel.grid = element_blank(),axis.title.x = element_blank(),axis.title.y = element_blank())
         
         
         
## Riding characteristics of members and casual riders
         
Avg_Distance_2021<-preparing_cyclistic_2021%>%
  group_by(member_casual)%>% 
  summarise(avg_ride_length=mean(ride_length))

ggplot(Avg_Distance_2021, aes(x = member_casual,
      y = avg_ride_length, fill =member_casual))+
     geom_col()+ scale_fill_manual(values = c("Blue", "Purple"))+
     labs(title="Average Ride Distance 2021")+  theme(legend.position = "none",panel.grid = element_blank(),axis.title.x = element_blank(),axis.title.y = element_blank())
      

Avg_Distance_2022<-preparing_cyclistic_2022%>%
  group_by(member_casual)%>% 
  summarise(avg_ride_length=mean(ride_length))

ggplot(Avg_Distance_2022, aes(x = member_casual,
                              y = avg_ride_length, fill =member_casual))+
  geom_col()+ scale_fill_manual(values = c("Blue", "Purple"))+
  labs(title="Average Ride Distance 2022")+  theme(legend.position = "none",panel.grid = element_blank(),axis.title.x = element_blank(),axis.title.y = element_blank())

## Comparing Bikes

Bike_preference_2021 <- preparing_cyclistic_2021%>%
  group_by(member_casual,rideable_type) %>% 
  summarise(n=n())%>% 
  mutate(percent = n*100/sum(n))

ggplot(data = Bike_preference_2021,mapping= aes(x= member_casual, y = percent, fill=rideable_type)) +
  geom_col() +labs(title="Bike Preference 2021 in Percent") +  theme(legend.position = "none",panel.grid = element_blank(),axis.title.x = element_blank(),axis.title.y = element_blank())

         
Bike_preference_2022 <- preparing_cyclistic_2022%>%
  group_by(member_casual,rideable_type) %>% 
  summarise(n=n())%>% 
  mutate(percent = n*100/sum(n))
         
ggplot(data =Bike_preference_2022,mapping= aes(x= member_casual, y = percent, fill=rideable_type)) +
  geom_col()+ labs(title="Bike Preference 2022 in Percent") + 
  theme(legend.position = "none",panel.grid = element_blank(),axis.title.x = element_blank(),axis.title.y = element_blank())


#### Short Summary based on Riding characteristics : 

# Classic Bike is the most popular.
# Approximately no one uses Docked Bike.
         
#### Weekday Rides (Usage on different days)
         
weekly_rides_2021<- preparing_cyclistic_2021%>% 
  group_by(member_casual, weekday)%>% 
  summarise(n=n())%>% 
  mutate(percent = n*100/sum(n))
ggplot(data = weekly_rides_2021,mapping= aes(x= weekday, y = percent,fill = member_casual))+geom_col()+
  labs(title="Percent of Riding per Day 2021") +theme(axis.text.x = element_text(angle = 90, hjust =1),panel.grid = element_blank(),axis.title.x = element_blank(),axis.title.y = element_blank())


weekly_rides_2022<- preparing_cyclistic_2022%>% 
  group_by(member_casual, weekday)%>% 
  summarise(n=n())%>% 
  mutate(percent = n*100/sum(n))


ggplot(data = weekly_rides_2022,mapping= aes(x= weekday, y = percent,fill = member_casual))+geom_col()+
  labs(title="Percent of Riding per Day 2022") +theme(axis.text.x = element_text(angle = 90, hjust =1),panel.grid = element_blank(),axis.title.x = element_blank(),axis.title.y = element_blank())

         
         
         
#### Daily rides of members and casual riders

ggplot(data = weekly_rides_2021,mapping= aes(x = weekday,y = percent,  fill = member_casual)) +
  geom_col() +labs(title="Daily Rides of Members and Casual Cyclists 2021 in Percent") +facet_wrap(~member_casual)+theme(axis.text.x = element_text(angle = 90, hjust =1),legend.position = "none",panel.grid = element_blank(),axis.title.x = element_blank(),axis.title.y = element_blank())

        
ggplot(data = weekly_rides_2022,mapping= aes(x = weekday,y = percent,  fill = member_casual)) +
  geom_col() +labs(title="Daily Rides of Members and Casual Cyclists 2022 in Percent") +facet_wrap(~member_casual)+theme(axis.text.x = element_text(angle = 90, hjust =1),legend.position = "none",panel.grid = element_blank(),axis.title.x = element_blank(),axis.title.y = element_blank())


## Short Summary: 

# Members use the service for daily commuting, while casual cyclists use it for recreation during weekend.

# Exporting CSV File for In-Depth Analysis and Further Visualization in Tableau


write_csv(preparing_cyclistic_2021,"C:\\Users\\Public\\Google Data Analytics\\Capstone\\Track 1\\processed_cyclistic_2021.csv")
write_csv(preparing_cyclistic_2022,"C:\\Users\\Public\\Google Data Analytics\\Capstone\\Track 1\\processed_cyclistic_2022.csv")


#Sorting CSV File and exporting top 30 based on cycling duration

sorting_casual_2021<-preparing_cyclistic_2021[order(-preparing_cyclistic_2021$ride_duration),]%>% #descending -
  filter(member_casual == "casual")

sorting_member_2021<-preparing_cyclistic_2021[order(-preparing_cyclistic_2021$ride_duration),]%>% #descending -
  filter(member_casual == "member")

top30_casual_by_duration2021<-head(sorting_casual_2021, 30)
  
top30_member_by_duration2021<-head(sorting_member_2021, 30)

sorting_casual_2022<-preparing_cyclistic_2022[order(-preparing_cyclistic_2022$ride_duration),]%>% #descending -
  filter(member_casual == "casual")

sorting_member_2022<-preparing_cyclistic_2022[order(-preparing_cyclistic_2022$ride_duration),]%>% #descending -
  filter(member_casual == "member")

top30_casual_by_duration2022<-head(sorting_casual_2022, 30)

top30_member_by_duration2022<-head(sorting_member_2022, 30)

write_csv(top30_casual_by_duration2021,"C:\\Users\\Public\\Google Data Analytics\\Capstone\\Track 1\\top30_casual_by_duration2021.csv")
write_csv(top30_member_by_duration2021,"C:\\Users\\Public\\Google Data Analytics\\Capstone\\Track 1\\top30_member_by_duration2021.csv")

write_csv(top30_casual_by_duration2022,"C:\\Users\\Public\\Google Data Analytics\\Capstone\\Track 1\\top30_casual_by_duration2022.csv")
write_csv(top30_member_by_duration2022,"C:\\Users\\Public\\Google Data Analytics\\Capstone\\Track 1\\top30_member_by_duration2022.csv")
