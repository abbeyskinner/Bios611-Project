library(tidyverse)
library(survivoR)

contestant_data <- read_csv("derived_data/contestant_data.csv")


figure_win_perc <- contestant_data %>%
  group_by(finish) %>%
  summarise(
    mean_win_percentage = sum(win_percentage)/n()
  ) %>%
  ggplot(aes(x = finish, y = mean_win_percentage, fill = finish)) +
  geom_bar(stat = "identity", show.legend = FALSE) +  # Use stat = "identity" for pre-calculated values
  geom_hline(yintercept = mean(contestant_data$win_percentage), color = "red", size = 1) +  # Add  line at overall mean
  # geom_text(aes(label = round(mean_finish, 2)), vjust = -0.3) + # Add labels with rounded mean values
  labs(
    x = "Finish",
    y = "Mean Win Percentage",
    title = "Mean Win Percentage by Finish"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  # Rotate x-axis labels for readability
  theme_minimal() # Clean theme

ggsave("figures/win_perc.png", figure_win_perc)