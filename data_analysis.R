final_stats<-read.csv(file.choose(),stringsAsFactors = FALSE)
View(final_stats)
str(final_stats)
final_stats_clean <- final_stats %>%
  filter(!is.na(Average) & !is.na(Runs))
View(final_stats_clean)

# Load necessary libraries
library(dplyr)
library(ggplot2)

# Bar Plot for Total Runs by Player
barplot(final_stats$Runs, 
        names.arg = final_stats$Player, 
        main = "Total Runs by Player", 
        xlab = "Player", 
        ylab = "Runs", 
        col = "lightblue",
        las = 2) # las = 2 makes the player names vertical

