# Load necessary libraries
library(rvest)       # For web scraping
library(tidyverse)   # For data manipulation and visualization
library(tm)          # For text mining
library(wordcloud)   # For creating word clouds

# Step 1: Fetch all text from the Wikipedia page
url <- "https://en.wikipedia.org/wiki/Olympic_Games"
page <- read_html(url)
text <- page %>% html_nodes("p") %>% html_text() %>% paste(collapse = " ")

# Step 2: Convert text to lowercase and remove punctuation
text <- tolower(text)
text <- removePunctuation(text)

# Step 3: Remove stop words
stop_words <- stopwords("en")
text <- removeWords(text, stop_words)

# Step 4: Compute the frequency of bigrams
corpus <- Corpus(VectorSource(text))
tdm <- TermDocumentMatrix(corpus, control = list(wordLengths = c(1, Inf)))
matrix <- as.matrix(tdm)
bigram_freq <- sort(rowSums(matrix), decreasing = TRUE)
bigram_df <- data.frame(bigram = names(bigram_freq), frequency = bigram_freq)

# Step 5: Plot a word cloud
set.seed(1234)  # For reproducibility
wordcloud(words = bigram_df$bigram, freq = bigram_df$frequency,
          max.words = 100, random.order = FALSE, colors = brewer.pal(8, "Dark2"))
