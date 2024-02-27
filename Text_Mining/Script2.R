# Load necessary libraries
library(rvest)       # For web scraping
library(tidyverse)   # For data manipulation and visualization
library(tidytext)    # For text mining with tidy data
library(wordcloud)   # For creating word clouds

# Step 1: Fetch all text from the Wikipedia page
url <- "https://en.wikipedia.org/wiki/Olympic_Games"
page <- read_html(url)
text <- page %>% html_nodes("p") %>% html_text() %>% paste(collapse = " ")

# Step 2: Convert text to lowercase and remove punctuation
text <- tolower(text)
text <- removePunctuation(text)

# Step 3: Remove stop words using tidytext
stop_words <- tidytext::stop_words
text <- tibble(text) %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words)

# Step 4: Compute the frequency of bigrams
bigram_freq <- text %>%
  mutate(prev_word = lag(word)) %>%
  filter(!is.na(prev_word)) %>%
  unite(bigram, prev_word, word, sep = " ") %>%
  count(bigram, sort = TRUE)

# Step 5: Plot a word cloud
set.seed(1234)  # For reproducibility
wordcloud(words = bigram_freq$bigram, freq = bigram_freq$n,
          max.words = 100, random.order = FALSE, colors = brewer.pal(8, "Dark2"))
