### merging the contestant datas to have all 46 seasons

library(tidyverse)
library(survivoR)

contestant_table <- read_csv("/home/rstudio/work/data/survivor/contestant_table.csv")

# clean seasons 44-46 data to match contestant_table
seasons_44_46 <- castaways %>% 
  filter(version == "US", castaway_id > "US0644") %>%
  mutate(
    num_appearance = case_when(
      castaway_id == "US0657" & season == 45 ~ 2,
      TRUE ~ 1
    ),
    jury = as.numeric(jury),
    finalist = as.numeric(finalist),
    normalized_finish = (18-result_number)/18
  ) %>%
  rename(contestant_name = full_name,
         num_season = season,
         finish = result_number,
         ftc = finalist,
         num_boot = order,
         tribe1 = original_tribe)

seasons_44_46_info <- castaway_details %>% 
  filter(substr(castaway_id, 1, 2) == "US") %>% 
  rename(
    profession = occupation, 
    contestant_name = full_name,
    african_american = african,
    asian_american = asian,
    poc = bipoc,
    birthdate = date_of_birth
  ) %>%
  mutate(
    gender = case_when(
      gender == "Female" ~ "F",
      gender == "Male" ~ "M",
      TRUE ~ "F"
    ),
    african_american = as.numeric(african_american),
    asian_american = as.numeric(asian_american),
    latin_american = as.numeric(latin_american),
    poc = as.numeric(poc),
    lgbt = as.numeric(lgbt)
  )

# merge tables to have data on seasons 44-46 in one table
contestant_data_44_46 <- seasons_44_46 %>%
  inner_join(seasons_44_46_info, by = "castaway_id") %>% 
  select(castaway_id, num_season, contestant_name.x, age, state, num_boot,
         tribe1, jury, ftc, finish, num_appearance, normalized_finish, birthdate,
         gender, african_american, asian_american, latin_american, poc, lgbt,
         profession) %>%
  rename(contestant_name = contestant_name.x)

# merge tables together so data from all seasons is together
contestants_all_seasons <- bind_rows(contestant_table, contestant_data_44_46)

write_csv(contestants_all_seasons, "derived_data/contestants_all_seasons.csv")




