library(tidyverse)
library(survivoR)

challenge_data <- challenge_results %>%
  filter(version =="US",
         season <= 43)  %>%
  mutate(
    result = case_when(
      result == "Won" ~ 1,
      result == "Lost" ~ 0,
      result == "Won (immunity only)" ~ 1,
      result == "Won (reward only)" ~ 1,
      result == "Draw" ~ 0 ## treating ties as losses
    )) %>% 
  group_by(castaway_id, season) %>%
  summarise(
    total_challenges_competed = n(),
    total_won = sum(result)
  ) %>%
  mutate(
    win_percentage = total_won/(total_challenges_competed)
  ) %>%
  arrange(season)

write_csv(challenge_data, "derived_data/challenge_data.csv");


