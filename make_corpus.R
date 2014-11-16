library(tm)
library(RWeka)

options(mc.cores=1)

blogs = file('~/coursera/data_science_coursera/capstone/final/en_US/en_US.blogs.txt', 'r')
news = file('~/coursera/data_science_coursera/capstone/final/en_US/en_US.news.txt', 'r')
twitter = file('~/coursera/data_science_coursera/capstone/final/en_US/en_US.twitter.txt', 'r')

#docs <- c(blogs, news, twitter)
subsamp = file('~/coursera/data_science_coursera/capstone/final/en_US/subsamp.txt', 'r')
subsamp_df = scan(subsamp, what = 'character', sep = '\n')
close(subsamp)

char = readChar('subsamp001.txt', file.info('subsamp001.txt')$size)
char = readChar('~/coursera/data_science_coursera/capstone/final/en_US/subsamp.txt', file.info('~/coursera/data_science_coursera/capstone/final/en_US/subsamp.txt')$size)

corpus <- Corpus(VectorSource(char))

#corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, content_transformer(tolower))
#corpus <- tm_map(corpus, removeWords, stopwords("english"))
#corpus <- tm_map(corpus, stemDocument)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
#corpus <- tm_map(corpus, function(x) gsub('[])(;:#%$^*\\~{}[&+=@/"`|<>_]+', "", x))

dtm <- DocumentTermMatrix(corpus, control = list(minWordLength = 1))
findFreqTerms(dtm, 500)

tdm <- TermDocumentMatrix(corpus, control = list(minWordLength = 1))
m <- as.matrix(tdm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)

inspect(removeSparseTerms(dtm, 0.4))
#findAssocs(dtm, 'rat', 0.30)
tokens2 <- NGramTokenizer(corpus, Weka_control(min = 2, max = 2, delimiters = " \\r\\n\\t"))
tokens3 <- NGramTokenizer(corpus, Weka_control(min = 3, max = 3, delimiters = " \\r\\n\\t"))


