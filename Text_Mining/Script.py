import requests
from bs4 import BeautifulSoup
from collections import Counter
from wordcloud import WordCloud
import matplotlib.pyplot as plt
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.util import ngrams
# Step 1: Fetch all text from the Wikipedia page
url = "https://en.wikipedia.org/wiki/Olympic_Games"
response = requests.get(url)
soup = BeautifulSoup(response.text, "html.parser")
text = ' '.join([p.get_text() for p in soup.find_all("p")])

# Step 2: Tokenize the text
tokens = word_tokenize(text.lower())

# Step 3: Remove stop words
stop_words = set(stopwords.words("english"))
filtered_tokens = [word for word in tokens if word.isalnum() and word not in stop_words]

# Step 4: Compute the frequency of bigrams
bigrams = [filtered_tokens[i] + " " + filtered_tokens[i+1] for i in range(len(filtered_tokens)-1)]
bigram_freq = Counter(bigrams)

# Step 5: Plot a word cloud
wordcloud = WordCloud(width=800, height=400, background_color="white").generate_from_frequencies(bigram_freq)
plt.figure(figsize=(10, 5))
plt.imshow(wordcloud, interpolation="bilinear")
plt.axis("off")
plt.show()

