
#script for the datascience capstone project to load the data into the r workspace
#and tokenize it




readText <- function(data, nlines){
    
    # set file paths
    if (data == blogs){
        path = '~/coursera/data_science_coursera/capstone/final/en_US/en_US.blogs.txt'
    }
    else if (data == news){
        path = '~/coursera/data_science_coursera/capstone/final/en_US/en_US.news.txt'
    }
    else if (data == twitter){
        path = '~/coursera/data_science_coursera/capstone/final/en_US/en_US.twitter.txt'
    }
    else (stop("not a valid data source"))
    
    
    con <- file(path, "r") 
    readLines(con, 1) 
    ## Read the first line of text 
    readLines(con, 1) 
    ## Read the next line of text 
    readLines(con, 5) 
    ## Read in the next 5 lines of text 
    close(con) 
}

