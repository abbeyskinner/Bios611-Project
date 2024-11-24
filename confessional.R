library(tidyverse)
library(survivoR)

## confessionals

confessional_data <- confessionals %>% 
  filter(version == "US") %>%
  group_by(season, castaway_id) %>%
  summarise(
    num_confessionals = sum(confessional_count),
    num_episodes = n(),
    confessionals_per_episode = num_confessionals/num_episodes
  )

write_csv(confessional_data, "derived_data/confessional_data.csv")
