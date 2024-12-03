library(tidyverse)
library(survivoR)

contestant_data <- read_csv("derived_data/contestant_data.csv")

figure_gender_race_finish <- contestant_data %>%
  mutate(
    gender_race = paste(gender, race, sep = " + ")  # Create a combined variable
  ) %>%
  ggplot(aes(x = fct_reorder(gender_race, normalized_finish, .fun = median), y = normalized_finish, fill = gender)) +
  geom_boxplot(alpha = 0.8) +  # Use bar plot with calculated means
  geom_hline(yintercept = mean(contestant_data$normalized_finish, na.rm = TRUE), 
             color = "red", size = 1) +  # Add overall mean line
  labs(
    title = "Survivor Placement Percentile by Gender and Race",
    x = "Gender + Race",
    y = "Placement Percentile",
    fill = "Gender"
  ) +
  theme_minimal() +
  coord_flip() +  # Flip the axes for better readability
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)  # Rotate x-axis labels
  )

ggsave("figures/gender_race_finish.png", figure_gender_race_finish)