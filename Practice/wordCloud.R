# Goal - create word cloud and use R Shiny 

# Reading material 
browseURL("chrome-extension://oemmndcbldboiebfnladdacbdfmadadm/https://cran.r-project.org/web/packages/tm/vignettes/tm.pdf")

# Copy cating 
browseURL("http://shiny.rstudio.com/gallery/word-cloud.html")

# install packages 
install.packages("tm")
install.packages("wordcloud")
install.packages("memoise")

# Access libraries 
??tm
??wordcloud
library(wordcloud)
library(tm)
library(memoise)

# List of valid books 
books <- list("A Mid Summer Night's Dream" = "summer",
              "The Merchant of Venice" = "merchant",
               "Romeo and Juliet" = "romeo")

books[1]

# Using "memoise" to automatically cache the results 
# Hmm worked despite the issue of the one ghost parenth in the begging 
getTermMatrix <- memoise(function(book) {
  # Careful not to let just any name slip in here; a
  # malicious user could manipulate this value.
  if (!(book %in% books))
    stop("Unknown book")
  
  
  text <- readLines(sprintf("./%s.txt.gz", book), 
                    encoding = "UTF-8")
  
  myCorpus = Corpus(VectorSource(text))
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  myCorpus = tm_map(myCorpus, removeNumbers)
  myCorpus = tm_map(myCorpus, removeWords, 
            c(stopwords("SMART"), "thy", "thou", "thee", "the", "and", "but"))
  
  myDTM = TermDocumentMatrix(myCorpus,
                             control = list(minWordLength = 1))
  
  m = as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
}) 

?Corpus() 
