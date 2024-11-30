library(tidyverse)
library(survivoR)
library(ggplot2)

contestant_data <- read_csv("derived_data/contestant_data.csv")

figure_demographics <- contestant_data %>%
  group_by(num_season) %>%
  summarise(
    BIPOC = mean(race != "White", na.rm = TRUE) * 100,
    Queer = mean(lgbt == 1, na.rm = TRUE) * 100
  ) %>%
  pivot_longer(cols = c(BIPOC, Queer), names_to = "Group", values_to = "Percentage") %>%
  ggplot(aes(x = num_season, y = Percentage, color = Group)) +
  geom_line(size = 1) +
  labs(title = "Diversity Representation Over Seasons", x = "Season", y = "Percentage", color = "Group")

ggsave("figures/demographics.png", figure_demographics)