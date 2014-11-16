
#this script will read in blogs, news, and twitter and create a random subsample
#of lines from these sources. this will be output into subsamp.txt


#set fraction of full data you want here
fraction = 0.001


paths = c('~/coursera/data_science_coursera/capstone/final/en_US/en_US.blogs.txt',
          '~/coursera/data_science_coursera/capstone/final/en_US/en_US.news.txt',
          '~/coursera/data_science_coursera/capstone/final/en_US/en_US.twitter.txt')

for (path in paths){
    con <- file(path, "r") 
    full_data = scan(path, what = 'character', sep = '\n')
    for (line in full_data){if (runif(1)<fraction){
        write(line,file="subsamp001.txt",append=TRUE)
        }
    }
    close(con)
    rm(full_data)
}

