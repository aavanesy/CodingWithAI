
# load packages for mysql
library(DBI)
library(RMySQL)

# create connection
con <- dbConnect(RMySQL::MySQL(),
                 username = "user_one",
                 password = "1122",
                 host = "localhost",
                 dbname = "mydata",
                 port = 3306)

#connection valid/
dbIsValid(con)

# load data
library(tibble)
data = iris %>% as_tibble()

#upload data to sql
dbWriteTable(con, "iris", data, overwrite = TRUE, row.names = FALSE)

# lets select all data from iris on sql
df = dbGetQuery(con, "SELECT * FROM iris")

# pull colnames from iris table on the sql server
colnames = dbGetQuery(con, "SELECT * FROM iris LIMIT 1")

# select only species setosa 
df2 = dbGetQuery(con, "SELECT * FROM iris WHERE Species = 'setosa'")

# Sepal.Length must be over 5
df3 = dbGetQuery(con, "SELECT * FROM iris WHERE `Sepal.Length` > 5")

# Sepal.Length must be over 5 and species must be setosa
df4 = dbGetQuery(con, "SELECT * FROM iris WHERE `Sepal.Length` > 5 AND Species = 'setosa'")

# add extra rows to iris
#generate dummy data first
dummydata = data.frame(Sepal.Length = c(5.1, 4.9, 4.7),
                  Sepal.Width = c(3.5, 3.0, 3.2),
                  Petal.Length = c(1.4, 1.4, 1.3),
                  Petal.Width = c(0.2, 0.2, 0.2),
                  Species = c("dummy", "dummy", "dummy"))

# add extra rows
dbWriteTable(con, "iris", dummydata, append = TRUE, row.names = FALSE)

# pull from table iris dummy data
df5 = dbGetQuery(con, "SELECT * FROM iris WHERE Species = 'dummy'")

# close connection
dbDisconnect(con)
