library(RMySQL)

# Connect to MySQL
con <- dbConnect(RMySQL::MySQL(), 
                 user = "user_one", 
                 password = "1122", 
                 dbname = "mydata")

# Check if connection is valid
if (dbIsValid(con)) {
  cat("Connection is valid.\n")
} else {
  cat("Connection is not valid.\n")
}

# Create a dummy table with 100 rows
dummy_data <- data.frame(
  id = 1:100,
  value = rnorm(100)
)

# Upload the dummy table to MySQL
dbWriteTable(con, "dummy_table", dummy_data, row.names = FALSE)

# Create another 10 dummy values
additional_data <- data.frame(
  id = 101:110,
  value = rnorm(10)
)

# Append the additional data to the table
dbWriteTable(con, "dummy_table", additional_data, row.names = FALSE, append = TRUE)

# Pull a subset of the data from the SQL database
subset_data <- dbGetQuery(con, "SELECT * FROM dummy_table WHERE id <= 10")

# Print subset of data
print(subset_data)

# Disconnect from MySQL
dbDisconnect(con)


library(dplyr)
# Create a dbplyr connection
mydata_db <- tbl(con, "dummy_table")

# Perform SQL queries using dplyr syntax
# Pull a subset of the data from the SQL database
subset_data <- mydata_db %>%
  filter(id <= 10) %>%
  collect()

iris_db <- tbl(con, "iris")
df4 <- iris_db %>%
  filter(`Sepal.Length` > 5, Species == 'setosa') %>%
  collect()
