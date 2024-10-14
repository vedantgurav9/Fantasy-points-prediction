View(stats)
# Load necessary library
library(dplyr)

# Step 3: Calculate Fantasy Points (Basic Formula)
stats$FantasyPoints <- (stats$Runs * 1) + 
  (stats$X100s * 50) + 
  (stats$X50s * 25) + 
  (stats$X4s * 1) + 
  (stats$X6s * 2)

# Step 4: Build the Linear Regression Model
model <- lm(FantasyPoints ~ Runs + Average + Strike_Rate + X100s + X50s + X4s + X6s, 
            data = stats)

# View the model summary
summary(model)

# Step 5: Create Testing Data (Dummy Data for Prediction)
test_data <- data.frame(
  Runs = c(5000, 8000, 3000),  # Example Runs
  Average = c(40.5, 50.2, 35.7),  # Example Averages
  Strike_Rate = c(75.3, 90.1, 70.8),  # Example Strike Rates
  X100s = c(5, 10, 2),  # Example 100s
  X50s = c(15, 25, 8),  # Example 50s
  X4s = c(500, 800, 300),  # Example 4s
  X6s = c(50, 80, 30)  # Example 6s
)

# Step 6: Predict Fantasy Points on the Test Data
predicted_points <- predict(model, newdata = test_data)

# Step 7: Print the Predictions
print(data.frame(Test_Data = 1:nrow(test_data), Predicted_FantasyPoints = predicted_points))
