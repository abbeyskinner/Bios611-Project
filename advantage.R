library(tidyverse)
library(survivoR)

## found advantage -- add number of advantages and boolean
advantages <- advantage_movement %>%
  filter(version == "US",
         season <= 43) %>%
  filter(event %in% c("Found", "Found (beware)", "Received", "Recieved")) %>%
  mutate(num_season=season) %>%
  group_by(castaway_id, num_season) %>%
  summarise(
    num_advantages = n()
  ) %>% arrange(num_season)


## played advantaged successfully
advantages_success <-  advantage_movement %>%
  filter(version == "US",
         season <= 43) %>%
  filter(event == "Played", success == "Yes") %>%
  mutate(num_season=season) %>%
  group_by(castaway_id, num_season) %>%
  summarise(
    num_success=n()
  ) %>% arrange(num_season)


write_csv(advantages, "derived_data/advantages.csv")
write_csv(advantages_success, "derived_data/advantages_success.csv")


