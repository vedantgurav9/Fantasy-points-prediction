stats<-read.csv(file.choose(),stringsAsFactors = FALSE)
View(stats)
ncol(stats)
colnames(stats) <- c("Rank", "Player", "Matches", "Innings", "Average", "Strike_Rate", "High Score", "X4s", "X6s", "X50s", "X100s", "Runs")
View(stats)

stats <- stats %>%
  mutate(
    Runs = as.numeric(Runs),
    Average = as.numeric(Average),
    Strike_Rate = as.numeric(Strike_Rate),
    X100s = as.numeric(X100s),
    X50s = as.numeric(X50s),
    X4s = as.numeric(X4s),
    X6s = as.numeric(X6s)
  )

# Step 4: Handle any potential NA values after coercion
stats[is.na(stats)] <- 0  # Replace NAs with 0
write.csv(stats, "cleaned_stats.csv", row.names = FALSE)
