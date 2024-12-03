library(tidyverse)
library(survivoR)

contestant_data <- read_csv("derived_data/contestant_data.csv")

figure_personality <- 
  ggplot(contestant_data %>% drop_na(personality_type), 
         aes(x = fct_reorder(personality_type, normalized_finish, .fun = median), 
             y = normalized_finish, fill = mb_ei)) +
  geom_boxplot(outlier.color = "red", alpha = 0.8) +
  coord_flip() +
  labs(title = "Survivor Placement Percentile by Personality Type",
       x = "Personality Type",
       y = "Placement Percentile",
       fill = "Personality") +
  theme_minimal() +
  geom_hline(yintercept = mean(contestant_data$normalized_finish), 
             color = "red", size = 1) #+  # Add  line at overall mean

ggsave("figures/personality.png", figure_personality)