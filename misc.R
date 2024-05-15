aggregate(X2023_divvy_tripdata$ride_length ~ X2023_divvy_tripdata$member_casual +
            X2023_divvy_tripdata$day_of_week, FUN = mean)

X2023_divvy_tripdata %>%
  mutate(weekday = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, day_of_week) %>%
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>%
  arrange(member_casual, day_of_week) %>%
  ggplot(aes(x = day_of_week, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")

write.csv(X2023_divvy_tripdata, file = 'X2023_divvy_tripdata.csv')


start_date <- ymd("2023-12-01")
end_date <- ymd("2024-01-01")

# Filter for trips between start and end date (inclusive)
export_df <- X2023_divvy_tripdata %>% 
  filter(between(started_at, start_date, end_date))

View(export_df)

write.csv(export_df, file = '12_23_Cleaned.csv')


start_date <- ymd("2023-11-01")
end_date <- ymd("2023-12-01")
export_df <- X2023_divvy_tripdata %>% 
filter(between(started_at, start_date, end_date))
write.csv(export_df, file = '11_23_Cleaned.csv')