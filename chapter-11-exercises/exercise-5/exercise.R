# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
View(flights)

var <- flights %>% group_by(month) %>% summarize(Mean = mean(dep_delay, na.rm=TRUE))

# Which month had the greatest average departure delay?

max(var$Mean)

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function

plot(var)


# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows

varDestination <- flights %>% group_by(dest) %>% summarize(Mean = mean(dep_delay, na.rm=TRUE)) %>% arrange(-Mean) %>% head()

# You can look up these airports in the `airports` data frame!
varDestination <- flights %>% group_by(dest) %>% summarize(Mean = mean(dep_delay, na.rm=TRUE)) %>% arrange(-Mean) %>% rename(faa = dest) %>%
  left_join(airports, by=c("dest" = "faa"))

# Which city was flown to with the highest average speed?

value <- flights %>% mutate(speed = distance/air_time) %>% group_by(dest) %>% summarise(avg_speed = mean(speed,na.rm = T)) %>% rename(faa = dest) %>% left_join(airports,by = "faa") %>% arrange(avg_speed)
