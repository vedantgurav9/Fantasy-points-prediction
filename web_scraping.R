library(rvest)
library(dplyr)

# URL of the page you want to scrape
url <- 'https://www.bcci.tv/stats?platform=international&type=men'

# Read the HTML content
webpage <- read_html(url)

# Extract all tables from the webpage
tables <- html_nodes(webpage, "table")

# Check the number of tables found
cat("Number of tables found:", length(tables), "\n")

# Extract Table 2 if it exists
if (length(tables) >= 2) {
  table_2 <- html_table(tables[[2]], fill = TRUE)
  
  # Display the structure of the extracted table
  print(table_2)
  
  # Save Table 2 to a CSV file
  write.csv(table_2, "table_2_data.csv", row.names = FALSE)
  cat("Table 2 has been saved to 'table_2_data.csv'.\n")
} else {
  cat("Table 2 is not available.\n")
}
getwd()
