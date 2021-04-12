
install.packages('hflights')
library(hflights)
library(dplyr)
?hflights

flights <- as_tibble(hflights)
View(flights)

# resumindo os dados
str(hflights)
glimpse(hflights)

# visualizando com dataframe
data.frame(head(hflights))

# filtrando os dados com slice

flights[flights$Month == 1 & flights$DayofMonth ==1, ]

# Aplicando filter
filter(flights, Month == 1, DayofMonth ==1 )
filter(flights, UniqueCarrier =="AA"| UniqueCarrier == "UA")
filter(flights, UniqueCarrier %in% c("AA", "UA"))

# Select 

select(flights, Year:DayofMonth, contains("Taxi"), contains("Delay"))

# Organizando dados

flights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(DepDelay)

flights %>%
  select(Distance, AirTime) %>%
  mutate(Speed = Distance / AirTime*60)


head(with(flights, tapply(ArrDelay, Dest, mean, na.rm = TRUE)))
head(aggregate(ArrDelay ~ Dest, flights, mean))

flights %>%
  group_by(Month, DayofMonth)%>%
  tally(sort = TRUE)

View(flights)





















