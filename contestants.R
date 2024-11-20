library(tidyverse)
library(survivoR)

contestant_table <- read_csv("/home/rstudio/work/data/survivor/contestant_table.csv")
challenge_data <- read_csv("derived_data/challenge_data.csv")
advantages <- read_csv("derived_data/advantages.csv")
advantages_success <- read_csv("derived_data/advantages_success.csv")
source("/home/rstudio/work/job_category.R")

contestant_data <- contestant_table %>%
  
  ## adding win percentage
  mutate(
    win_percentage = challenge_data$win_percentage,
    castaway_id = challenge_data$castaway_id
  ) %>%
  
  ## adding advantage info
  left_join(advantages , by = c("castaway_id", "num_season")) %>%
  mutate(num_advantages = replace_na(num_advantages, 0),
         advantage = case_when( # boolean for advantage
           num_advantages > 0 ~ 1,
           num_advantages == 0 ~ 0
         )) %>%
  left_join(advantages_success, by = c("castaway_id", "num_season")) %>%
  mutate(num_success = replace_na(num_success, 0),
         advantage_success_rate = num_success/num_advantages, # success rate
         success = case_when( # boolean for successfully playing advantage
           num_success > 0 ~ 1,
           num_success == 0 ~ 0
         ),
         advantage_success_rate = replace_na(advantage_success_rate, 0)) %>%
  
  ## adding job categories
  mutate(job_category = profession) %>%
  
  # grouping Evvie into the female category and creating race var
  mutate(
    gender = case_when(
      gender == "F" ~ "F",
      gender == "N" ~ "F",
      gender == "M" ~ "M"
    ),
    race = case_when(
      poc == 0 ~ "White",
      african_american == 1 ~ "Black",
      asian_american == 1 ~ "Asian",
      latin_american == 1 ~ "Latin American"
    )
  ) %>%
  
  # adding region
  mutate(
    region = case_when(
      state %in% c("Connecticut", "D.C.", "Delaware", "District of Columbia", 
                   "Maryland", "Massachusetts", "New Jersey", "New York", "Rhode Island",
                   "New Hampshire", "Vermont", "Maine", "Pennsylvania", "Washington DC",
                   "Ontario", "Quebec") ~ "Northeast",
      
      state %in% c("Illinois", "Indiana", "Iowa", "Kansas", "Michigan", "Minnesota", 
                   "Missouri", "Nebraska", "North Dakota", "Ohio", "South Dakota", 
                   "Wisconsin") ~ "Midwest",
      
      state %in% c("Alabama", "Arkansas", "Kentucky", "Louisiana", "Mississippi", 
                   "Oklahoma", "Tennessee", "Texas", "Florida", "Georgia", 
                   "North Carolina", "South Carolina", "Virginia", "West Virginia") ~ "South",
      
      state %in% c("Arizona", "California", "Colorado", "Hawaii", "Idaho", "Montana", 
                   "Nevada", "New Mexico", "Oregon", "Utah", "Washington", "Wyoming") ~ "West"
    )
  )


# Apply the categorization function to the 'profession' column
contestant_data$job_category <- sapply(contestant_data$job_category, categorize_profession)

write_csv(contestant_data, "derived_data/contestant_data.csv")



