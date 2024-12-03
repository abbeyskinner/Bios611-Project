library(tidyverse)
library(survivoR)

contestant_data <- read_csv("derived_data/contestant_data.csv")


figure_job_finish <- ggplot(contestant_data, aes(x = fct_reorder(job_category, normalized_finish, .fun = median), 
                            y = normalized_finish)) +
  geom_boxplot( alpha = 0.8, fill = "skyblue") +
  coord_flip() +
  labs(title = "Survivor Placement Percentile by Job Category",
       x = "Job Category",
       y = "Placement Percentile") +
  theme_minimal() +
  geom_hline(yintercept = mean(contestant_data$normalized_finish), 
             color = "red", size = 1) +  # Add  line at overall mean
  theme(legend.position = "none") # Hide legend for cleaner visualization



ggsave("figures/job_finish.png", figure_job_finish)