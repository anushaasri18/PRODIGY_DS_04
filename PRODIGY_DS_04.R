

library(tidyverse)
library(sentimentr)

# Load the dataset
library(readxl)
data <- read_excel("twitter_entity_sentiment.xlsx")
View(data)

# View the first few rows of the dataset
head(data)

# Check the column names
colnames(data)

# Select relevant columns (assuming 'text' is the column with tweet text)
data <- data %>% select(`im getting on borderlands and i will murder you all ,`)

# Perform sentiment analysis
sentiment_results <- sentiment(data$`im getting on borderlands and i will murder you all ,`)

# View the sentiment results
head(sentiment_results)

# Summarize sentiment scores
summary_sentiment <- sentiment_results %>%
  group_by(sentiment) %>%
  summarize(count = n())

print(summary_sentiment)

# Plot sentiment distribution
sentiment_results %>%
  ggplot(aes(x = sentiment)) +
  geom_histogram(binwidth = 0.1) +
  labs(title = "Sentiment Distribution", x = "Sentiment Score", y = "Frequency")


